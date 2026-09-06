#!/usr/bin/env bash

set -Eeuo pipefail

###############################################################################
# Configuration
###############################################################################

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/build-dbc.conf"

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "ERROR: Configuration file not found:"
    echo "       $CONFIG_FILE"
    echo
    echo "Copy build-dbc.conf.example to build-dbc.conf and edit it."
    exit 1
fi

# shellcheck disable=SC1090
source "$CONFIG_FILE"

###############################################################################
# Command-line arguments
###############################################################################

# Config-file default; --skip-dbc on the command line overrides this to
# true for a one-off run without editing build-dbc.conf.
SKIP_DBC_BUILD="${SKIP_DBC_BUILD:-false}"

for arg in "$@"; do
    case "$arg" in
        --skip-dbc)
            SKIP_DBC_BUILD=true
            ;;
        -h|--help)
            cat << USAGE
Usage: $(basename "$0") [--skip-dbc]

  --skip-dbc   Skip the DBC build entirely (no database recreate, dump
               load, table detection, export, or deploy) and go straight
               to the extra SQL targets (e.g. worldserver). Useful for
               quickly testing world-only changes. Same effect as setting
               SKIP_DBC_BUILD=true in $CONFIG_FILE.
USAGE
            exit 0
            ;;
        *)
            echo "ERROR: Unknown argument: $arg" >&2
            echo "       Run with --help for usage." >&2
            exit 1
            ;;
    esac
done

###############################################################################
# Derived configuration
###############################################################################

EXPORT_DIR="$DBCTOOL/export"

# Optional override for the SQL dump to load instead of running dbctool
# import. If unset, the script looks for a single *.sql file directly
# inside $ORIGINAL_DBC.
DBC_DUMP="${DBC_DUMP:-}"

# Optional override for the blacklist file. If unset, defaults to
# build-dbc.blacklist next to this script. Missing file = empty blacklist.
BLACKLIST_FILE="${BLACKLIST_FILE:-$SCRIPT_DIR/build-dbc.blacklist}"

# Optional file of session variables (e.g. SET @Goblin = ...), expected
# directly inside $MODPAKS (not inside any modpak folder). If present,
# it's run first, in the same connection as everything else, so its
# variables stay available across every SQL file.
MODPAK_VARIABLES_FILE="${MODPAK_VARIABLES_FILE:-$MODPAKS/config.sql}"

# Optional: apply extra per-modpak SQL to additional databases (e.g. your
# worldserver DB), using the same single-connection + config.sql approach
# as the DBC build. EXTRA_SQL_DATABASES and EXTRA_SQL_PATTERNS are
# parallel arrays -- entry N of one pairs with entry N of the other:
#
#   EXTRA_SQL_DATABASES=("acore_world")
#   EXTRA_SQL_PATTERNS=("sql/db_world/base/*.sql")
#
# The pattern is relative to each modpak's own directory and follows the
# same syntax as the "dbc/*.sql" lookup below (a find -path glob, not a
# shell glob), so wildcards can only replace one path segment at a time --
# no recursive "**". Add more entries to apply to more databases. Leave
# both arrays empty/unset in build-dbc.conf to disable this entirely.
#
# EXTRA_SQL_DUMPS is a third, OPTIONAL parallel array. If entry N is a
# non-empty path to a dump file, that target's database is DROPPED and
# RECREATED from that dump before its SQL is applied -- same as DBC_DUMP
# does for the DBC database. Leave an entry empty (or leave the whole
# array shorter than the others, or unset) to apply on top of the
# database as-is, with no reset.
#
#   EXTRA_SQL_DUMPS=("/home/youruser/dbsnapshots/ac-worldserver.sql")
#
# WARNING: this is destructive. Only point it at a dump for a database
# you're happy to have wiped and rebuilt -- e.g. a disposable test copy of
# your world DB, not a live/production one -- unless that's really what
# you want on every run.
if ! declare -p EXTRA_SQL_DATABASES &>/dev/null; then
    EXTRA_SQL_DATABASES=()
fi
if ! declare -p EXTRA_SQL_PATTERNS &>/dev/null; then
    EXTRA_SQL_PATTERNS=()
fi
if ! declare -p EXTRA_SQL_DUMPS &>/dev/null; then
    EXTRA_SQL_DUMPS=()
fi

if (( ${#EXTRA_SQL_DATABASES[@]} != ${#EXTRA_SQL_PATTERNS[@]} )); then
    echo "ERROR: EXTRA_SQL_DATABASES and EXTRA_SQL_PATTERNS must have the" >&2
    echo "       same number of entries in $CONFIG_FILE." >&2
    exit 1
fi

if (( ${#EXTRA_SQL_DUMPS[@]} > ${#EXTRA_SQL_DATABASES[@]} )); then
    echo "ERROR: EXTRA_SQL_DUMPS has more entries than EXTRA_SQL_DATABASES" >&2
    echo "       in $CONFIG_FILE." >&2
    exit 1
fi

# Temporary file used for the list of affected tables.
AFFECTED_TABLES_FILE="$(mktemp)"

# Temporary directory for bookkeeping.
TMP_DIR="$(mktemp -d)"

# Points at whichever small per-file SQL is currently being applied
# (config.sql + one file), so cleanup() can preserve it on failure.
# Declared empty here so cleanup() can safely check it even if the build
# fails before that point.
CURRENT_SQL_FILE=""

###############################################################################
# Cleanup
###############################################################################

cleanup() {
    local exit_code=$?

    # On failure, preserve the SQL that was running when it failed
    # (config.sql + the one file currently being applied) somewhere
    # durable, instead of letting it vanish with the rest of TMP_DIR --
    # otherwise there's no way to inspect what actually ran.
    if [[ -n "$CURRENT_SQL_FILE" && -f "$CURRENT_SQL_FILE" && "$exit_code" -ne 0 ]]; then
        local preserved
        preserved="/tmp/build-dbc-failed-$(date +%Y%m%d-%H%M%S)-$(basename "$CURRENT_SQL_FILE")"
        cp -- "$CURRENT_SQL_FILE" "$preserved"
        echo >&2
        echo "The failing SQL file is preserved for debugging at:" >&2
        echo "  $preserved" >&2
    fi

    rm -f "$AFFECTED_TABLES_FILE"
    rm -rf "$TMP_DIR"
}

trap cleanup EXIT

###############################################################################
# Error handling
###############################################################################

on_error() {
    local exit_code=$?
    local line_number=$1

    echo
    echo "ERROR: build failed on line $line_number (exit code $exit_code)." >&2
    echo "No further deployment was attempted." >&2
    exit "$exit_code"
}

trap 'on_error $LINENO' ERR

###############################################################################
# Helpers
###############################################################################

mysql_cmd() {
    MYSQL_PWD="$MYSQL_PASSWORD" mysql \
        -h "$MYSQL_HOST" \
        -P "$MYSQL_PORT" \
        -u "$MYSQL_USER" \
        "$@"
}

# Convert a DBC filename or table name into a normalized comparison string.
#
# Examples:
#
#   AchievementCriteria.dbc -> achievementcriteria
#   achievement_criteria    -> achievementcriteria
#   AreaTable.dbc           -> areatable
#   areatable               -> areatable
#
normalize_name() {
    local name="$1"

    name="${name##*/}"
    name="${name%.dbc}"
    name="${name,,}"
    name="${name//_/}"

    printf '%s' "$name"
}

# Find the original DBC corresponding to a database table name.
#
# We deliberately do not attempt to reconstruct CamelCase from the SQL table
# name because names such as "areatable" -> "AreaTable" cannot be reliably
# reconstructed from the lowercase DB name alone.
#
# Instead, normalize both sides and compare:
#
#   achievement_criteria -> achievementcriteria
#   AchievementCriteria.dbc -> achievementcriteria
#
find_original_dbc() {
    local table="$1"
    local normalized_table
    local file
    local normalized_file

    normalized_table="$(normalize_name "$table")"

    while IFS= read -r -d '' file; do
        normalized_file="$(normalize_name "$file")"

        if [[ "$normalized_file" == "$normalized_table" ]]; then
            printf '%s\n' "$file"
            return 0
        fi
    done < <(find "$ORIGINAL_DBC" -maxdepth 1 -type f -name '*.dbc' -print0)

    echo "ERROR: Could not find original DBC for table '$table'." >&2
    echo "       Normalized name: '$normalized_table'" >&2
    return 1
}

# Extract table names affected by a SQL file, by scanning its contents for
# DELETE FROM `x`, INSERT INTO `y`, and UPDATE `z` statements (case
# insensitive). Handles an optional `schema`.`table` qualifier by always
# taking the last backtick-quoted identifier in the match.
extract_tables_from_sql() {
    local file="$1"

    # A file with none of these statements is normal (e.g. comment-only or
    # schema-only files), not an error, so grep finding zero matches must
    # not be treated as a failure.
    grep -aoiE '(DELETE[[:space:]]+FROM|INSERT[[:space:]]+INTO|UPDATE)[[:space:]]+(`[^`]+`\.)?`[^`]+`' "$file" \
        | sed -E 's/.*`([^`]+)`[[:space:]]*$/\1/' \
        || true
}

# Locate the SQL dump to load in place of dbctool import. Uses DBC_DUMP if
# set; otherwise expects exactly one *.sql file directly inside
# $ORIGINAL_DBC.
find_dbc_dump() {
    if [[ -n "$DBC_DUMP" ]]; then
        if [[ ! -f "$DBC_DUMP" ]]; then
            echo "ERROR: DBC_DUMP is set but the file does not exist:" >&2
            echo "       $DBC_DUMP" >&2
            return 1
        fi
        printf '%s\n' "$DBC_DUMP"
        return 0
    fi

    local matches=()
    while IFS= read -r -d '' f; do
        matches+=("$f")
    done < <(find "$ORIGINAL_DBC" -maxdepth 1 -type f -name '*.sql' -print0)

    case "${#matches[@]}" in
        0)
            echo "ERROR: No SQL dump (*.sql) found in $ORIGINAL_DBC." >&2
            echo "       Place the dump there, or set DBC_DUMP in $CONFIG_FILE." >&2
            return 1
            ;;
        1)
            printf '%s\n' "${matches[0]}"
            return 0
            ;;
        *)
            echo "ERROR: Multiple *.sql files found in $ORIGINAL_DBC:" >&2
            printf '       %s\n' "${matches[@]}" >&2
            echo "       Set DBC_DUMP in $CONFIG_FILE to disambiguate." >&2
            return 1
            ;;
    esac
}

# Load blacklist patterns from $BLACKLIST_FILE into the global
# BLACKLIST_PATTERNS array. Blank lines and lines starting with # (after
# trimming whitespace) are ignored. A missing file just means no patterns.
#
# Patterns are matched as literal substrings, not shell globs, against
# modpak directory names (e.g. "F-001_localization") -- a whole modpak is
# skipped if its name matches any pattern.
load_blacklist() {
    BLACKLIST_PATTERNS=()

    [[ -f "$BLACKLIST_FILE" ]] || return 0

    local line
    while IFS= read -r line || [[ -n "$line" ]]; do
        line="${line%%#*}"                                  # strip comments
        line="${line#"${line%%[![:space:]]*}"}"              # trim leading ws
        line="${line%"${line##*[![:space:]]}"}"               # trim trailing ws
        [[ -n "$line" ]] || continue
        BLACKLIST_PATTERNS+=("$line")
    done < "$BLACKLIST_FILE"
}

# Returns success (0) if $1 (a modpak directory name) matches any
# blacklist pattern.
is_blacklisted() {
    local filename="$1"
    local pattern

    for pattern in "${BLACKLIST_PATTERNS[@]:-}"; do
        [[ -n "$pattern" ]] || continue
        if [[ "$filename" == *"$pattern"* ]]; then
            return 0
        fi
    done

    return 1
}

# Applies one extra SQL target: finds every file matching $2 (a find -path
# glob, relative to each modpak dir) across the already-blacklist-filtered
# $MODPAK_DIRS, and applies each one individually, in its own mysql
# connection, prefixed with $MODPAK_VARIABLES_FILE (same as the DBC
# build) so its variables are available within that file. Each small temp
# file is deleted right after a successful apply. No matching files is
# not an error -- it just means this target has nothing to do this run.
#
# If $3 is a non-empty dump path, database $1 is dropped, recreated, and
# loaded from that dump before the SQL is applied (same as DBC_DUMP does
# for the DBC database).
apply_extra_sql_target() {
    local db="$1"
    local pattern="$2"
    local dump_file="${3:-}"

    echo
    echo "============================================================"
    echo "Extra SQL target: $db ($pattern)"
    echo "============================================================"

    if [[ -n "$dump_file" ]]; then
        if [[ ! -f "$dump_file" ]]; then
            echo "ERROR: dump file for '$db' not found: $dump_file" >&2
            return 1
        fi

        echo "  Resetting database '$db' from dump: $dump_file"

        mysql_cmd <<SQL
DROP DATABASE IF EXISTS \`$db\`;
CREATE DATABASE \`$db\`;
SQL

        mysql_cmd "$db" < "$dump_file"
    fi

    local files=()
    local dir file
    for dir in "${MODPAK_DIRS[@]}"; do
        while IFS= read -r -d '' file; do
            files+=("$file")
        done < <(find "$dir" -type f -path "*/$pattern" -print0 | sort -z)
    done

    if (( ${#files[@]} == 0 )); then
        echo "  No files matching '$pattern' found. Nothing to do."
        return 0
    fi

    echo "  Found ${#files[@]} file(s)."

    if [[ -f "$MODPAK_VARIABLES_FILE" ]]; then
        echo "  Using variables file: $MODPAK_VARIABLES_FILE"
    fi

    local index=0
    for file in "${files[@]}"; do
        index=$((index + 1))
        echo "  $file"

        CURRENT_SQL_FILE="$TMP_DIR/extra-$db-$(printf '%03d' "$index")-$(basename "$file")"
        : > "$CURRENT_SQL_FILE"

        if [[ -f "$MODPAK_VARIABLES_FILE" ]]; then
            {
                printf -- '-- ==== %s ====\n' "$MODPAK_VARIABLES_FILE"
                cat "$MODPAK_VARIABLES_FILE"
                echo
            } >> "$CURRENT_SQL_FILE"
        fi

        {
            printf -- '-- ==== %s ====\n' "$file"
            cat "$file"
        } >> "$CURRENT_SQL_FILE"

        mysql_cmd "$db" < "$CURRENT_SQL_FILE"

        rm -f "$CURRENT_SQL_FILE"
    done
    CURRENT_SQL_FILE=""
}

###############################################################################
# Sanity checks
###############################################################################

echo "Checking configuration..."

[[ -d "$MODPAKS" ]] \
    || { echo "ERROR: MODPAKS does not exist: $MODPAKS" >&2; exit 1; }

if [[ "$SKIP_DBC_BUILD" != true ]]; then
    [[ -d "$DBCTOOL" ]] \
        || { echo "ERROR: DBCTOOL does not exist: $DBCTOOL" >&2; exit 1; }

    [[ -x "$DBCTOOL/dbctool" ]] \
        || { echo "ERROR: dbctool executable not found: $DBCTOOL/dbctool" >&2; exit 1; }

    [[ -d "$ORIGINAL_DBC" ]] \
        || { echo "ERROR: ORIGINAL_DBC does not exist: $ORIGINAL_DBC" >&2; exit 1; }

    [[ -d "$SERVER_DBC" ]] \
        || { echo "ERROR: SERVER_DBC does not exist: $SERVER_DBC" >&2; exit 1; }

    command -v rsync >/dev/null \
        || { echo "ERROR: rsync command not found." >&2; exit 1; }
fi

command -v mysql >/dev/null \
    || { echo "ERROR: mysql command not found." >&2; exit 1; }

###############################################################################
# Find modpaks
###############################################################################

echo
echo "Scanning modpaks..."

mapfile -d '' MODPAK_DIRS < <(
    find "$MODPAKS" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z
)

if (( ${#MODPAK_DIRS[@]} == 0 )); then
    echo "No modpaks found."
    exit 0
fi

echo "Found ${#MODPAK_DIRS[@]} modpaks."

###############################################################################
# Apply blacklist
###############################################################################

load_blacklist

if (( ${#BLACKLIST_PATTERNS[@]} > 0 )); then
    echo
    echo "Blacklist ($BLACKLIST_FILE):"
    printf '  %s\n' "${BLACKLIST_PATTERNS[@]}"
    echo

    KEPT_MODPAKS=()
    for dir in "${MODPAK_DIRS[@]}"; do
        modpak="$(basename "$dir")"
        if is_blacklisted "$modpak"; then
            echo "  Skipping modpak (blacklisted): $modpak"
        else
            KEPT_MODPAKS+=("$dir")
        fi
    done

    MODPAK_DIRS=("${KEPT_MODPAKS[@]}")

    if (( ${#MODPAK_DIRS[@]} == 0 )); then
        echo
        echo "All modpaks were blacklisted; nothing to do."
        exit 0
    fi

    echo
    echo "${#MODPAK_DIRS[@]} modpaks remain after the blacklist."
fi

###############################################################################
# Find DBC SQL files
###############################################################################

echo
echo "Scanning DBC SQL files..."

if [[ "$SKIP_DBC_BUILD" == true ]]; then
    echo "Skipping (--skip-dbc / SKIP_DBC_BUILD=true)."
    SQL_FILES=()
else
    SQL_FILES=()
    for dir in "${MODPAK_DIRS[@]}"; do
        while IFS= read -r -d '' file; do
            SQL_FILES+=("$file")
        done < <(find "$dir" -type f -path '*/dbc/*.sql' -print0 | sort -z)
    done

    if (( ${#SQL_FILES[@]} == 0 )); then
        echo "No DBC SQL files found."
    else
        echo "Found ${#SQL_FILES[@]} DBC SQL files."
    fi
fi

###############################################################################
# DBC build (skipped entirely if --skip-dbc was passed, or if there are no
# DBC SQL files this run -- extra SQL targets below are independent and
# still run either way)
###############################################################################

if (( ${#SQL_FILES[@]} > 0 )); then

###############################################################################
# Determine affected tables
###############################################################################

echo
echo "Determining affected tables..."

declare -A AFFECTED_TABLES=()
for file in "${SQL_FILES[@]}"; do
    while IFS= read -r table; do
        [[ -n "$table" ]] || continue
        AFFECTED_TABLES["$table"]=1
    done < <(extract_tables_from_sql "$file")
done

if (( ${#AFFECTED_TABLES[@]} == 0 )); then
    echo
    echo "ERROR: No DELETE FROM / INSERT INTO / UPDATE statements with"
    echo "       backtick-quoted table names were found in any DBC SQL file."
    exit 1
fi

# Sort the table list for predictable output.
printf '%s\n' "${!AFFECTED_TABLES[@]}" | sort > "$AFFECTED_TABLES_FILE"

echo
echo "Affected tables:"
sed 's/^/  /' "$AFFECTED_TABLES_FILE"

# Not every affected table corresponds to an actual DBC (the dump can
# contain auxiliary tables). Split the list so only real DBC tables are
# exported later; auxiliary tables are just reported and skipped.
DBC_TABLES_FILE="$TMP_DIR/dbc_tables"
AUX_TABLES_FILE="$TMP_DIR/aux_tables"
: > "$DBC_TABLES_FILE"
: > "$AUX_TABLES_FILE"

while IFS= read -r table; do
    if original_dbc="$(find_original_dbc "$table" 2>/dev/null)"; then
        printf '%s\n' "$table" >> "$DBC_TABLES_FILE"
    else
        printf '%s\n' "$table" >> "$AUX_TABLES_FILE"
    fi
done < "$AFFECTED_TABLES_FILE"

if [[ -s "$AUX_TABLES_FILE" ]]; then
    echo
    echo "Auxiliary tables (no matching DBC, will not be exported):"
    sed 's/^/  /' "$AUX_TABLES_FILE"
fi

###############################################################################
# Empty DBCTool export directory
###############################################################################

echo
echo "Cleaning DBCTool export directory..."

find "$EXPORT_DIR" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +

###############################################################################
# Recreate DBC database and load dump
###############################################################################

echo
echo "Recreating database '$DBC_DATABASE'..."

mysql_cmd <<SQL
DROP DATABASE IF EXISTS \`$DBC_DATABASE\`;
CREATE DATABASE \`$DBC_DATABASE\`;
SQL

echo
echo "Loading SQL dump..."

DUMP_FILE="$(find_dbc_dump)"
echo "  Using dump: $DUMP_FILE"

mysql_cmd "$DBC_DATABASE" < "$DUMP_FILE"

###############################################################################
# Apply all DBC SQL files
###############################################################################

echo
echo "Applying DBC SQL files..."

# Each file runs in its own mysql connection (like before), but is first
# prefixed with config.sql in a small temp file, so @variables defined
# there (e.g. @Goblin) are available within that file. The temp file is
# deleted immediately after a successful apply, so nothing large or
# long-lived accumulates on disk -- only the one currently running is
# ever kept around, and only survives if it fails (see cleanup()).
if [[ -f "$MODPAK_VARIABLES_FILE" ]]; then
    echo "  Using variables file: $MODPAK_VARIABLES_FILE"
else
    echo "  No variables file found at $MODPAK_VARIABLES_FILE (skipping)."
fi

file_index=0
for file in "${SQL_FILES[@]}"; do
    file_index=$((file_index + 1))

    echo
    echo "------------------------------------------------------------"
    echo "$file"
    echo "------------------------------------------------------------"

    CURRENT_SQL_FILE="$TMP_DIR/apply-$(printf '%03d' "$file_index")-$(basename "$file")"
    : > "$CURRENT_SQL_FILE"

    if [[ -f "$MODPAK_VARIABLES_FILE" ]]; then
        {
            printf -- '-- ==== %s ====\n' "$MODPAK_VARIABLES_FILE"
            cat "$MODPAK_VARIABLES_FILE"
            echo
        } >> "$CURRENT_SQL_FILE"
    fi

    {
        printf -- '-- ==== %s ====\n' "$file"
        cat "$file"
    } >> "$CURRENT_SQL_FILE"

    mysql_cmd "$DBC_DATABASE" < "$CURRENT_SQL_FILE"

    rm -f "$CURRENT_SQL_FILE"
done
CURRENT_SQL_FILE=""

###############################################################################
# Export affected DBCs
###############################################################################

echo
echo "Exporting affected DBCs..."

cd "$DBCTOOL"

while IFS= read -r table; do
    echo
    echo "Exporting: $table"

    ./dbctool export --name "$table"
done < "$DBC_TABLES_FILE"

###############################################################################
# Verify expected output
###############################################################################

echo
echo "Checking exported DBCs..."

while IFS= read -r table; do
    original_dbc="$(find_original_dbc "$table")"
    expected_filename="$(basename "$original_dbc")"
    exported="$EXPORT_DIR/$expected_filename"

    if [[ ! -f "$exported" ]]; then
        echo
        echo "ERROR: Expected exported DBC was not produced:"
        echo "       $exported"
        exit 1
    fi
done < "$DBC_TABLES_FILE"

###############################################################################
# Deploy DBCs
###############################################################################

echo
echo "Deploying DBCs..."

for dbc in "$EXPORT_DIR"/*.dbc; do
    [[ -e "$dbc" ]] || continue

    filename="$(basename "$dbc")"
    server_file="$SERVER_DBC/$filename"

    echo
    echo "DBC: $filename"

    # Spell.dbc is the expensive transfer, so avoid rsync if the contents
    # are identical to the currently deployed server version.
    if [[ "$filename" == "Spell.dbc" ]]; then
        if [[ -f "$server_file" ]] && cmp -s "$dbc" "$server_file"; then
            echo "  Spell.dbc is unchanged; skipping client transfer."
            echo "  Keeping existing server copy."

            rm -f -- "$dbc"
            continue
        fi

        echo "  Spell.dbc changed; transferring."
    fi

    # Update the server copy only after the client transfer succeeded.
    cp -- "$dbc" "$server_file"

    echo "  Deployed: $filename"
done

fi # end DBC build (skipped if no DBC SQL files this run)

###############################################################################
# Apply extra SQL targets (optional, independent of the DBC build above)
###############################################################################

if (( ${#EXTRA_SQL_DATABASES[@]} > 0 )); then
    for i in "${!EXTRA_SQL_DATABASES[@]}"; do
        apply_extra_sql_target \
            "${EXTRA_SQL_DATABASES[$i]}" \
            "${EXTRA_SQL_PATTERNS[$i]}" \
            "${EXTRA_SQL_DUMPS[$i]:-}"
    done
fi

###############################################################################
# Done
###############################################################################

echo
echo "============================================================"
echo "DBC build completed successfully."
echo "============================================================"
