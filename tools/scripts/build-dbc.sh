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

# When true, the script does nothing except generate the core patch(es)
# and exit -- no DBC build, no extra SQL targets, no mysql/dbctool needed.
CORE_PATCH_MODE=false

for arg in "$@"; do
    case "$arg" in
        --skip-dbc)
            SKIP_DBC_BUILD=true
            ;;
        --core-patch)
            CORE_PATCH_MODE=true
            ;;
        -h|--help)
            cat << USAGE
Usage: $(basename "$0") [--skip-dbc] [--core-patch]

  --skip-dbc    Skip the DBC build entirely (no database recreate, dump
                load, table detection, export, or deploy) and go straight
                to the extra SQL targets (e.g. worldserver). Useful for
                quickly testing world-only changes. Same effect as
                setting SKIP_DBC_BUILD=true in $CONFIG_FILE.

  --core-patch  For each name in CORE_PATCH_TARGETS, diff
                integration/originals/<name>/ against
                integration/merged/<name>/ and write
                combined-core-<name>.patch, ready to apply with
                `git apply` or `patch -p1` from that target's own repo
                root. Does nothing else -- no database work, no modpak
                scanning, no dbctool/mysql required.
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

# Definitive whitelist AND processing order for modpaks. One modpak
# folder name per line (exact match against the folder's basename, not a
# substring), in the exact order they should be applied. Comments (#)
# and blank lines are ignored. Only modpaks listed here are used at all
# -- anything else under $MODPAKS is left alone and just noted as
# skipped.
MANIFEST_FILE="${MANIFEST_FILE:-$SCRIPT_DIR/build-dbc.manifest}"

# Optional: cd here and run `git pull` before anything else, to make
# iterating on SQL changes in a git-tracked modpaks/integration repo
# easier -- no need to pull by hand before every test run. Leave
# empty/unset to skip entirely.
GIT_PULL_DIR="${GIT_PULL_DIR:-}"

# --core-patch: relative find -path glob (same syntax as EXTRA_SQL_PATTERNS)
# for locating core-patch files inside each modpak, and where to write the
# combined result.
# --core-patch: integration/ is expected as a sister folder to $MODPAKS,
# containing originals/<target>/ (pristine copies of only the files that
# get edited, at their real relative path) and merged/<target>/ (the
# edited versions, same relative paths). Every file under
# originals/<target>/ is diffed against merged/<target>/, using a/ and b/
# path prefixes (not the integration/originals/... prefix), so the result
# applies with `patch -p1` or `git apply` from that target's own repo
# root. One patch file is written per target (they're typically separate
# repos with different roots, e.g. azerothcore-wotlk vs mod-playerbots),
# named combined-core-<target>.patch next to this script.
#
# Empty by default (disabled) -- list the target subdirectory names you
# actually have, e.g.:
#
#   CORE_PATCH_TARGETS=("azerothcore-wotlk")
#
INTEGRATION_DIR="${INTEGRATION_DIR:-$(dirname "$MODPAKS")/integration}"
if ! declare -p CORE_PATCH_TARGETS &>/dev/null; then
    CORE_PATCH_TARGETS=()
fi

# Optional file of session variables (e.g. SET @Goblin = ...), expected
# directly inside $MODPAKS (not inside any modpak folder). If present,
# it's run first, in the same connection as everything else, so its
# variables stay available across every SQL file.
MODPAK_VARIABLES_FILE="${MODPAK_VARIABLES_FILE:-$MODPAKS/config.sql}"

# Per-modpak variables filename (relative to each modpak's own dir),
# looked for inside every modpak listed in the manifest. Run once per target,
# right before that modpak's own SQL files for that target -- so a
# modpak can define its own named variables and/or increment shared
# counters (e.g. SET @WorgenFactionRepIndex = @ReputationIndex :=
# @ReputationIndex + 1;) that carry forward into every modpak after it,
# for that target's run.
MODPAK_LOCAL_VARIABLES_FILENAME="${MODPAK_LOCAL_VARIABLES_FILENAME:-variables.sql}"

# Optional text substitution for schema-qualifying database references in
# config.sql / variables.sql / SQL files, so you write a placeholder once
# instead of hardcoding (and needing to update every occurrence of) the
# real database name. Both are literal substring replacements (not
# regex), applied wherever these files get read into a combined SQL
# stream -- deliberately simple tokens you'd never otherwise write, e.g.:
#
#   SET @CharStartOutfitId = (SELECT COALESCE(MAX(`id`), 0) FROM `dbc_db`.`charstartoutfit`);
#
# becomes, before it's ever sent to mysql:
#
#   SET @CharStartOutfitId = (SELECT COALESCE(MAX(`id`), 0) FROM `acore_dbc`.`charstartoutfit`);
#
# (or whatever DBC_DATABASE actually is).
DBC_DB_PLACEHOLDER="${DBC_DB_PLACEHOLDER:-dbc_db}"

# WORLD_DATABASE is a separate, explicit setting for this purpose --
# EXTRA_SQL_DATABASES is a generic list and has no notion of which entry
# (if any) is "the" world database. Set this to whichever one is, or
# leave it empty to disable the world_db placeholder entirely.
WORLD_DATABASE="${WORLD_DATABASE:-}"
WORLD_DB_PLACEHOLDER="${WORLD_DB_PLACEHOLDER:-world_db}"

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

# Loads $MANIFEST_FILE into the global MODPAK_DIRS array, in the exact
# order the file lists them -- this is the definitive whitelist AND
# processing order for modpaks, replacing the old blacklist entirely.
# Blank lines and lines starting with # (after trimming whitespace) are
# ignored. Each remaining line must exactly match an existing modpak
# folder's basename under $MODPAKS; anything else is a hard error, since
# a typo here should never silently do nothing.
load_modpak_manifest() {
    if [[ ! -f "$MANIFEST_FILE" ]]; then
        echo "ERROR: Manifest file not found:" >&2
        echo "       $MANIFEST_FILE" >&2
        echo >&2
        echo "Create it with one modpak folder name per line, in the" >&2
        echo "order they should be applied. Lines starting with # are" >&2
        echo "comments; blank lines are ignored." >&2
        exit 1
    fi

    MODPAK_DIRS=()

    local line line_number=0 modpak_dir
    while IFS= read -r line || [[ -n "$line" ]]; do
        line_number=$((line_number + 1))

        line="${line%%#*}"                                  # strip comments
        line="${line#"${line%%[![:space:]]*}"}"              # trim leading ws
        line="${line%"${line##*[![:space:]]}"}"               # trim trailing ws
        [[ -n "$line" ]] || continue

        modpak_dir="$MODPAKS/$line"

        if [[ ! -d "$modpak_dir" ]]; then
            echo "ERROR: $MANIFEST_FILE line $line_number references a" >&2
            echo "       modpak that doesn't exist: $line" >&2
            echo "       Expected directory: $modpak_dir" >&2
            exit 1
        fi

        MODPAK_DIRS+=("$modpak_dir")
    done < "$MANIFEST_FILE"
}

# For one core-patch target: diffs every file under
# integration/originals/<target>/ against the file at the same relative
# path under integration/merged/<target>/, using a/<relpath> and
# b/<relpath> labels, and writes the result to
# $SCRIPT_DIR/combined-core-<target>.patch.
#
# This works by symlinking the two roots as literal "a" and "b" inside a
# scratch dir and running one recursive `diff -ruN a b` -- that's what
# produces a/<relpath> and b/<relpath> headers (rather than the
# integration/originals/... path) and gets new-file handling for free
# (via -N, a file that only exists on the merged side is diffed against
# an empty file, producing a proper "new file" hunk).
generate_core_patch_for_target() {
    local target="$1"
    local originals_root="$INTEGRATION_DIR/originals/$target"
    local merged_root="$INTEGRATION_DIR/merged/$target"
    local output="$SCRIPT_DIR/combined-core-$target.patch"

    echo
    echo "============================================================"
    echo "Core patch target: $target"
    echo "============================================================"

    if [[ ! -d "$originals_root" ]]; then
        echo "ERROR: originals dir not found: $originals_root" >&2
        return 1
    fi
    if [[ ! -d "$merged_root" ]]; then
        echo "ERROR: merged dir not found: $merged_root" >&2
        return 1
    fi

    local pair_dir="$TMP_DIR/corepatch-$target"
    mkdir -p "$pair_dir"
    ln -s "$originals_root" "$pair_dir/a"
    ln -s "$merged_root" "$pair_dir/b"

    local status
    if (cd "$pair_dir" && diff -ruN a b) > "$output"; then
        status=0
    else
        status=$?
    fi

    if (( status > 1 )); then
        echo "ERROR: diff failed for target '$target' (exit $status)." >&2
        echo "       See above for diff's own error output." >&2
        rm -f "$output"
        return 1
    fi

    if (( status == 0 )); then
        echo "No differences found between originals and merged. Nothing to do."
        rm -f "$output"
        return 0
    fi

    echo "Combined patch written to: $output"
    echo
    echo "Apply it from the $target repo root with one of:"
    echo "  git apply '$output'"
    echo "  patch -p1 < '$output'"
}

# Runs generate_core_patch_for_target for every entry in
# $CORE_PATCH_TARGETS. Empty CORE_PATCH_TARGETS is not an error -- it just
# means the feature isn't configured.
generate_core_patch() {
    if (( ${#CORE_PATCH_TARGETS[@]} == 0 )); then
        echo
        echo "CORE_PATCH_TARGETS is empty in $CONFIG_FILE -- nothing to do."
        echo "Add target names, e.g.: CORE_PATCH_TARGETS=(\"azerothcore-wotlk\")"
        return 0
    fi

    local target
    for target in "${CORE_PATCH_TARGETS[@]}"; do
        generate_core_patch_for_target "$target"
    done
}

# Prints $1's content with every occurrence of $DBC_DB_PLACEHOLDER, and
# (if WORLD_DATABASE is set) $WORLD_DB_PLACEHOLDER, replaced by their
# real database names. Plain substring replacement, not regex.
apply_db_placeholders() {
    local file="$1"
    if [[ -n "$WORLD_DATABASE" ]]; then
        sed -e "s/$DBC_DB_PLACEHOLDER/$DBC_DATABASE/g" \
            -e "s/$WORLD_DB_PLACEHOLDER/$WORLD_DATABASE/g" \
            "$file"
    else
        sed "s/$DBC_DB_PLACEHOLDER/$DBC_DATABASE/g" "$file"
    fi
}

# Extracts every variable name assigned in $1, whether via a top-level
# `SET @name = ...` or an inline `@name := ...` (the latter can appear
# anywhere in an expression, e.g. `@ReputationIndex := @ReputationIndex +
# 1`, so both forms need to be scanned for separately). Prints one name
# per line, without the leading @. A file with no matches is not an
# error -- see the note on extract_tables_from_sql for why grep finding
# nothing must not be treated as a failure here either.
extract_variable_names() {
    local file="$1"
    {
        grep -aoiE 'SET[[:space:]]+@[A-Za-z_][A-Za-z0-9_]*[[:space:]]*=' "$file" \
            | grep -aoiE '@[A-Za-z_][A-Za-z0-9_]*'
        grep -aoiE '@[A-Za-z_][A-Za-z0-9_]*[[:space:]]*:=' "$file" \
            | grep -aoiE '@[A-Za-z_][A-Za-z0-9_]*'
    } | sed 's/^@//' || true
}

# Computes every shared variable exactly once, independent of any target,
# and writes the result to $1 as literal `SET @name = 'value';`
# statements -- no formulas, no table lookups, nothing that could produce
# a different answer depending on what else has already run. This is
# what lets the DBC build and every extra SQL target see identical
# values for shared IDs, instead of each target re-deriving them
# separately and drifting apart (e.g. because an earlier target's own
# INSERT already changed the table a later target's baseline query reads
# from).
#
# Concatenates $MODPAK_VARIABLES_FILE (global, e.g. config.sql) followed
# by every manifest-listed modpak's $MODPAK_LOCAL_VARIABLES_FILENAME (in
# $MODPAK_DIRS order) into one file, runs it in a single connection
# (deliberately with no default database -- every table reference in
# these files must be fully qualified, e.g. `` `acore_dbc`.`faction` ``,
# precisely because there's no single "right" default here), then
# queries back the final value of every variable name found across all
# of them.
compute_variable_snapshot() {
    local snapshot_file="$1"

    local var_files=()
    [[ -f "$MODPAK_VARIABLES_FILE" ]] && var_files+=("$MODPAK_VARIABLES_FILE")

    local dir modpak_vars
    for dir in "${MODPAK_DIRS[@]}"; do
        modpak_vars="$dir/$MODPAK_LOCAL_VARIABLES_FILENAME"
        [[ -f "$modpak_vars" ]] && var_files+=("$modpak_vars")
    done

    : > "$snapshot_file"

    if (( ${#var_files[@]} == 0 )); then
        return 0
    fi

    local names=()
    while IFS= read -r name; do
        [[ -n "$name" ]] || continue
        names+=("$name")
    done < <(
        local f
        for f in "${var_files[@]}"; do
            extract_variable_names "$f"
        done | sort -u
    )

    if (( ${#names[@]} == 0 )); then
        return 0
    fi

    echo
    echo "Computing shared variables..."
    for f in "${var_files[@]}"; do
        echo "  $f"
    done

    local compute_file="$TMP_DIR/compute-variables.sql"
    : > "$compute_file"
    local f
    for f in "${var_files[@]}"; do
        {
            printf -- '-- ==== %s ====\n' "$f"
            apply_db_placeholders "$f"
            echo
        } >> "$compute_file"
    done

    {
        printf 'SELECT '
        local first=true
        local name
        for name in "${names[@]}"; do
            if [[ "$first" == true ]]; then
                first=false
            else
                printf ', '
            fi
            printf '@%s' "$name"
        done
        printf ';\n'
    } >> "$compute_file"

    CURRENT_SQL_FILE="$compute_file"

    local values_line
    values_line="$(mysql_cmd -N -B < "$compute_file")"

    CURRENT_SQL_FILE=""

    local values=()
    IFS=$'\t' read -r -a values <<< "$values_line"

    local i=0
    for name in "${names[@]}"; do
        local value="${values[$i]:-NULL}"
        if [[ "$value" == "NULL" ]]; then
            printf 'SET @%s = NULL;\n' "$name" >> "$snapshot_file"
        else
            printf "SET @%s = '%s';\n" "$name" "${value//\'/\\\'}" >> "$snapshot_file"
        fi
        i=$((i + 1))
    done

    echo
    echo "  Snapshot written: $snapshot_file"
    echo "  Variables:"
    sed 's/^/    /' "$snapshot_file"
}

# Finds every file matching $1 (a find -path glob, relative to each
# modpak dir) across every modpak listed in $MANIFEST_FILE, in
# modpak-then-filename order. Prints one path per line.
find_modpak_files() {
    local pattern="$1"
    local dir file
    for dir in "${MODPAK_DIRS[@]}"; do
        while IFS= read -r -d '' file; do
            printf '%s\n' "$file"
        done < <(find "$dir" -type f -path "*/$pattern" -print0 | sort -z)
    done
}

# Applies each file in "$@" (after the first three args) individually,
# each in its own mysql connection against database $2, prefixed with
# the variables snapshot at $3 (see compute_variable_snapshot). $1 is
# just a short label used in temp filenames, to tell different targets'
# debug output apart. Each small temp file is deleted right after a
# successful apply; only the one currently running is kept, and only
# survives if it fails (see cleanup()).
apply_sql_file_list() {
    local label="$1"
    local db="$2"
    local snapshot="$3"
    shift 3
    local files=("$@")

    local file_index=0
    local file
    for file in "${files[@]}"; do
        file_index=$((file_index + 1))

        echo
        echo "------------------------------------------------------------"
        echo "$file"
        echo "------------------------------------------------------------"

        CURRENT_SQL_FILE="$TMP_DIR/apply-$label-$(printf '%03d' "$file_index")-$(basename "$file")"
        : > "$CURRENT_SQL_FILE"

        if [[ -s "$snapshot" ]]; then
            {
                printf -- '-- ==== %s ====\n' "$snapshot"
                apply_db_placeholders "$snapshot"
                echo
            } >> "$CURRENT_SQL_FILE"
        fi

        {
            printf -- '-- ==== %s ====\n' "$file"
            apply_db_placeholders "$file"
        } >> "$CURRENT_SQL_FILE"

        mysql_cmd "$db" < "$CURRENT_SQL_FILE"

        rm -f "$CURRENT_SQL_FILE"
    done
    CURRENT_SQL_FILE=""
}

# Applies one extra SQL target: finds every file matching $2 (a find
# -path glob, relative to each modpak dir) and applies each individually
# via apply_sql_file_list, prefixed with $VARIABLES_SNAPSHOT. No matching
# files is not an error -- it just means this target has nothing to do
# this run.
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

    local target_files=()
    while IFS= read -r file; do
        target_files+=("$file")
    done < <(find_modpak_files "$pattern")

    if (( ${#target_files[@]} == 0 )); then
        echo "  No files matching '$pattern' found. Nothing to do."
        return 0
    fi

    echo "  Found ${#target_files[@]} file(s)."

    apply_sql_file_list "$db" "$db" "$VARIABLES_SNAPSHOT" "${target_files[@]}"
}

###############################################################################
# Sanity checks
###############################################################################

echo "Checking configuration..."

if [[ -n "$GIT_PULL_DIR" ]]; then
    command -v git >/dev/null \
        || { echo "ERROR: git command not found." >&2; exit 1; }

    [[ -d "$GIT_PULL_DIR" ]] \
        || { echo "ERROR: GIT_PULL_DIR does not exist: $GIT_PULL_DIR" >&2; exit 1; }
fi

if [[ "$CORE_PATCH_MODE" != true ]]; then
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
fi

###############################################################################
# Pull latest changes (optional)
###############################################################################

if [[ -n "$GIT_PULL_DIR" ]]; then
    echo
    echo "Pulling latest changes in $GIT_PULL_DIR..."
    (cd "$GIT_PULL_DIR" && git pull)
fi

###############################################################################
# --core-patch mode: generate the combined patch(es) and stop here. Doesn't
# touch modpaks/ or the manifest at all -- it only diffs
# integration/originals/<target>/ against integration/merged/<target>/.
###############################################################################

if [[ "$CORE_PATCH_MODE" == true ]]; then
    generate_core_patch
    exit 0
fi

###############################################################################
# Load modpak manifest (definitive whitelist + processing order)
###############################################################################

echo
echo "Loading modpak manifest..."

load_modpak_manifest

if (( ${#MODPAK_DIRS[@]} == 0 )); then
    echo "Manifest is empty. Nothing to do."
    exit 0
fi

echo "Found ${#MODPAK_DIRS[@]} modpaks in manifest ($MANIFEST_FILE):"
for dir in "${MODPAK_DIRS[@]}"; do
    echo "  $(basename "$dir")"
done

# Informational only: flag any modpak directories on disk that aren't
# listed in the manifest, so nothing sits there forgotten by accident.
declare -A MANIFEST_NAMES=()
for dir in "${MODPAK_DIRS[@]}"; do
    MANIFEST_NAMES["$(basename "$dir")"]=1
done

while IFS= read -r -d '' dir; do
    name="$(basename "$dir")"
    if [[ -z "${MANIFEST_NAMES[$name]:-}" ]]; then
        echo "  (not in manifest, skipping: $name)"
    fi
done < <(find "$MODPAKS" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

###############################################################################
# Recreate DBC database and load dump
###############################################################################

# This has to happen before variables get computed below, not just
# before the DBC files get applied -- a variable baseline that queries
# the DBC database (e.g. config.sql's MAX(reputation_index) lookup) needs
# to see a guaranteed-fresh, known state, not whatever was left over from
# a previous run.
#
# Skipped entirely with --skip-dbc, since that mode is meant to work
# without DBCTOOL/ORIGINAL_DBC configured at all. That means: if a
# variable baseline queries the DBC database while running with
# --skip-dbc, it'll see the database's current (possibly stale) state
# rather than a guaranteed-fresh one -- a known limitation of combining
# --skip-dbc with DBC-derived shared variables.
if [[ "$SKIP_DBC_BUILD" != true ]]; then
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
fi

###############################################################################
# Compute shared variables (config.sql + each modpak's variables.sql),
# once, independent of any target
###############################################################################

VARIABLES_SNAPSHOT="$TMP_DIR/variables-snapshot.sql"
compute_variable_snapshot "$VARIABLES_SNAPSHOT"

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
    while IFS= read -r file; do
        SQL_FILES+=("$file")
    done < <(find_modpak_files "dbc/*.sql")

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
# Apply all DBC SQL files
###############################################################################

echo
echo "Applying DBC SQL files..."

# Each file runs in its own mysql connection, prefixed with the shared
# variables snapshot computed earlier. The snapshot already has every
# shared ID fully resolved (including any cross-modpak increments), so
# individual files no longer need to share a live session with each
# other -- only the one-time snapshot computation does.
apply_sql_file_list "dbc" "$DBC_DATABASE" "$VARIABLES_SNAPSHOT" "${SQL_FILES[@]}"

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