#!/usr/bin/env python3
"""
dbc_diff.py — generate clean per-table SQL diffs between two DBCTool-imported
MySQL databases (e.g. dbc_original -> dbc_worgoblin).

For every table that exists in both databases, this produces one .sql file
containing:
  1) DELETE statements for rows whose identity only exists in the base DB
  2) INSERT statements (paired with a guard DELETE) for rows whose identity
     only exists in the target DB -- so re-applying the file twice is a
     no-op instead of a duplicate-key error
  3) UPDATE statements for rows that exist in both but differ — touching
     only the columns that actually changed, not a full-column rewrite.
     Bitmask columns (anything ending in "_mask", plus --mask-columns) are
     written as a self-referencing `col = col | <added>` / `col = col &
     ~<removed>` instead of a literal replacement, so a layer that only
     adds/removes one race/class bit stays a one-line, independently-
     editable diff.

Tables with zero differences are skipped (no file is written).

Large/wide tables are streamed rather than fully materialized: only the
base DB's rows are held in memory (as an identity -> row-tuple index);
target rows are read and diffed one at a time, and every generated SQL
line is written straight to disk instead of being accumulated into Python
lists first. This is what keeps memory bounded on tables like Item.dbc
(dozens of columns, tens of thousands of rows) instead of getting OOM-killed.

Requirements:
    pip install mysql-connector-python --break-system-packages

Usage:
    python3 dbc_diff.py \
        --host 127.0.0.1 --port 3306 --user root --password secret \
        --base-db dbc_original --target-db dbc_worgoblin \
        --output-dir ./worgoblin_diffs

    # Restrict to specific tables:
    python3 dbc_diff.py ... --tables spell,vehicle,vehicleseat

    # Only report what would change, without writing files:
    python3 dbc_diff.py ... --dry-run
"""

import argparse
import os
import sys
import tempfile

try:
    import mysql.connector
except ImportError:
    sys.exit("Missing dependency. Install it with:\n"
              "  pip install mysql-connector-python --break-system-packages")


def sql_literal(value):
    """Render a Python value as a safe SQL literal."""
    if value is None:
        return "NULL"
    if isinstance(value, bool):
        return "1" if value else "0"
    if isinstance(value, int):
        return str(value)
    if isinstance(value, float):
        return repr(value)
    if isinstance(value, (bytes, bytearray)):
        value = value.decode("utf-8", errors="replace")
    escaped = str(value).replace("\\", "\\\\").replace("'", "\\'")
    return f"'{escaped}'"


def decode_mask_bits(value):
    """Return the individual power-of-two bits set in an integer bitmask,
    ascending order, e.g. 4097 -> [1, 4096]."""
    bits = []
    v, bit = int(value), 1
    while v:
        if v & 1:
            bits.append(bit)
        v >>= 1
        bit <<= 1
    return bits


def get_common_tables(cursor, base_db, target_db, restrict=None):
    cursor.execute(
        "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = %s",
        (base_db,),
    )
    base_tables = {r[0] for r in cursor.fetchall()}
    cursor.execute(
        "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = %s",
        (target_db,),
    )
    target_tables = {r[0] for r in cursor.fetchall()}

    only_base = base_tables - target_tables
    only_target = target_tables - base_tables
    if only_base:
        print(f"  (skipping, missing from {target_db}): {', '.join(sorted(only_base))}", file=sys.stderr)
    if only_target:
        print(f"  (skipping, missing from {base_db}): {', '.join(sorted(only_target))}", file=sys.stderr)

    common = base_tables & target_tables
    if restrict:
        common &= set(restrict)
    return sorted(common)


def get_primary_key(cursor, db, table):
    cursor.execute(
        """SELECT COLUMN_NAME FROM information_schema.KEY_COLUMN_USAGE
           WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s AND CONSTRAINT_NAME = 'PRIMARY'
           ORDER BY ORDINAL_POSITION""",
        (db, table),
    )
    return [r[0] for r in cursor.fetchall()]


def get_first_unique_key(cursor, db, table):
    """Return columns of the first non-PRIMARY UNIQUE index, or None."""
    cursor.execute(
        """SELECT INDEX_NAME, COLUMN_NAME FROM information_schema.STATISTICS
           WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s
             AND NON_UNIQUE = 0 AND INDEX_NAME <> 'PRIMARY'
           ORDER BY INDEX_NAME, SEQ_IN_INDEX""",
        (db, table),
    )
    rows = cursor.fetchall()
    if not rows:
        return None
    first_index = rows[0][0]
    return [c for idx, c in rows if idx == first_index]


def get_columns(cursor, db, table):
    cursor.execute(
        """SELECT COLUMN_NAME FROM information_schema.COLUMNS
           WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s
           ORDER BY ORDINAL_POSITION""",
        (db, table),
    )
    # auto_id is DBCTool's own surrogate key for tables with no real/natural
    # id field. It's assigned purely by insertion order at import time, so
    # it isn't stable across two independent imports and carries no real
    # DBC data -- exclude it everywhere (comparisons, INSERT column lists).
    return [r[0] for r in cursor.fetchall() if r[0] != "auto_id"]


def get_identity(cursor, db, table):
    """
    Work out how to identify a row for diffing purposes.
    Returns (identity_cols, mode):
      mode == "key":     identity_cols uniquely determines a row (real PK
                          or a declared UNIQUE key) -- inserts/updates/deletes
                          all possible.
      mode == "fullrow":  no real identity exists (duplicates are legal, e.g.
                          CharacterFacialHairStyles) -- diff by full-row value
                          as a multiset; only inserts/deletes are meaningful.
    """
    pk_cols = get_primary_key(cursor, db, table)
    if pk_cols and pk_cols != ["auto_id"]:
        return pk_cols, "key"

    unique_cols = get_first_unique_key(cursor, db, table)
    if unique_cols:
        return unique_cols, "key"

    return None, "fullrow"


def is_mask_column(col, mask_columns):
    return col in mask_columns or col.endswith("_mask")


class TableDiffer:
    """Diffs a table via three server-side JOIN queries instead of pulling
    either table into Python memory. MySQL does the row comparison and only
    ships back rows that are actually new, deleted, or changed -- for a mod
    pack that's typically a small fraction of a big table like Spell.dbc
    (200+ columns), so this is what actually keeps memory bounded on wide
    tables, not just avoiding double-buffering client-side."""

    def __init__(self, table, columns, identity_cols, mask_columns, pure_insert):
        self.table = table
        self.columns = columns
        self.identity_cols = identity_cols
        self.non_id_cols = [c for c in columns if c not in identity_cols]
        self.mask_columns = mask_columns
        self.pure_insert = pure_insert
        self.col_list_sql = ", ".join(f"`{c}`" for c in columns)

        self.insert_count = 0
        self.update_count = 0
        self.delete_count = 0

        self._tmp_delete = tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", delete=False, suffix=".sql")
        self._tmp_insert = tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", delete=False, suffix=".sql")
        self._tmp_update = tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", delete=False, suffix=".sql")

    def _is_mask(self, col):
        return is_mask_column(col, self.mask_columns)

    def _literal_row(self, row):
        return ", ".join(sql_literal(v) for v in row)

    def _mask_notes(self, row):
        notes = []
        for i, c in enumerate(self.columns):
            v = row[i]
            if self._is_mask(c) and isinstance(v, int) and v:
                notes.append(f"{c}={v} ({'+'.join(str(b) for b in decode_mask_bits(v))})")
        return ("  -- " + "; ".join(notes)) if notes else ""

    def _where_from_row(self, row):
        return " AND ".join(f"`{c}` = {sql_literal(v)}" for c, v in zip(self.identity_cols, row))

    def _write_insert_pair(self, fh, row):
        where = self._where_from_row([row[self.columns.index(c)] for c in self.identity_cols])
        fh.write(f"DELETE FROM `{self.table}` WHERE {where};\n")
        fh.write(f"INSERT INTO `{self.table}` ({self.col_list_sql}) VALUES "
                  f"({self._literal_row(row)});{self._mask_notes(row)}\n")

    def _paginated(self, cursor, sql_template, order_cols_sql, chunk_size):
        """Run sql_template repeatedly with keyset pagination, yielding rows
        in bounded chunk_size batches instead of issuing one query that
        could hand back the whole (potentially huge) result at once.

        order_cols_sql: the qualified column expressions (e.g. "t.`id`")
        that sql_template both ORDERs BY and SELECTs as its trailing
        columns -- qualified with a table alias because the pagination
        WHERE clause and ORDER BY are otherwise ambiguous whenever both
        joined tables have a column of that name (which they always do
        here, since base/target share a schema).

        sql_template must contain '{cursor_clause}' where the continuation
        condition gets spliced in, and '{limit}' for the LIMIT value.
        """
        last_key = None
        while True:
            if last_key is None:
                cursor_clause, params = "", ()
            else:
                lhs = "(" + ", ".join(order_cols_sql) + ")"
                placeholders = "(" + ", ".join(["%s"] * len(order_cols_sql)) + ")"
                cursor_clause, params = f"AND {lhs} > {placeholders}", tuple(last_key)
            sql = sql_template.format(cursor_clause=cursor_clause, limit=chunk_size)
            cursor.execute(sql, params)
            batch = list(cursor)  # bounded to `chunk_size` rows -- safe to materialize
            if not batch:
                return
            yield from batch
            last_row = batch[-1]
            last_key = last_row[-len(order_cols_sql):]

    def run(self, cursor, base_db, target_db, chunk_size=2000):
        join_on = " AND ".join(f"b.`{c}` = t.`{c}`" for c in self.identity_cols)
        first_id = self.identity_cols[0]  # NULL after a failed LEFT JOIN => no match

        # 1) New rows: exist in target, not in base. `t` is the driving
        #    table here, so every identity-column reference (ORDER BY, the
        #    trailing pagination copy, the keyset WHERE) must be qualified
        #    t.`col` -- both t and b have a same-named column, so leaving
        #    it unqualified is an ambiguous-column error, not just sloppy.
        order_t = [f"t.`{c}`" for c in self.identity_cols]
        cols_t = ", ".join(f"t.`{c}`" for c in self.columns)
        sql_new = f"""
            SELECT {cols_t}, {", ".join(order_t)}
            FROM `{target_db}`.`{self.table}` t
            LEFT JOIN `{base_db}`.`{self.table}` b ON {join_on}
            WHERE b.`{first_id}` IS NULL {{cursor_clause}}
            ORDER BY {", ".join(order_t)}
            LIMIT {{limit}}
        """
        n = len(self.columns)
        for full_row in self._paginated(cursor, sql_new, order_t, chunk_size):
            self._write_insert_pair(self._tmp_insert, full_row[:n])
            self.insert_count += 1

        # 2) Deleted rows: exist in base, not in target. `b` is the driving
        #    table -- only need identity columns, no reason to ship the
        #    rest of a row we're deleting.
        order_b = [f"b.`{c}`" for c in self.identity_cols]
        sql_del = f"""
            SELECT {", ".join(order_b)}
            FROM `{base_db}`.`{self.table}` b
            LEFT JOIN `{target_db}`.`{self.table}` t ON {join_on}
            WHERE t.`{first_id}` IS NULL {{cursor_clause}}
            ORDER BY {", ".join(order_b)}
            LIMIT {{limit}}
        """
        for row in self._paginated(cursor, sql_del, order_b, chunk_size):
            self._tmp_delete.write(f"DELETE FROM `{self.table}` WHERE {self._where_from_row(row)};\n")
            self.delete_count += 1

        # 3) Changed rows: exist in both, differ in at least one non-identity
        #    column. <=> is MySQL's NULL-safe equality, so NULL vs NULL
        #    correctly counts as "unchanged" rather than "unknown". `b` is
        #    the driving table again.
        if self.non_id_cols:
            diff_cond = " AND ".join(f"t.`{c}` <=> b.`{c}`" for c in self.non_id_cols)
            cols_b = ", ".join(f"b.`{c}`" for c in self.columns)
            cols_t = ", ".join(f"t.`{c}`" for c in self.columns)
            sql_chg = f"""
                SELECT {cols_b}, {cols_t}, {", ".join(order_b)}
                FROM `{base_db}`.`{self.table}` b
                JOIN `{target_db}`.`{self.table}` t ON {join_on}
                WHERE NOT ({diff_cond}) {{cursor_clause}}
                ORDER BY {", ".join(order_b)}
                LIMIT {{limit}}
            """
            for full_row in self._paginated(cursor, sql_chg, order_b, chunk_size):
                base_row, target_row = full_row[:n], full_row[n:2 * n]
                changed_idx = [
                    i for i, c in enumerate(self.columns)
                    if c not in self.identity_cols and base_row[i] != target_row[i]
                ]
                if not changed_idx:
                    continue  # shouldn't happen given the WHERE clause, but stay safe

                changed_cols = [self.columns[i] for i in changed_idx]
                all_mask = all(self._is_mask(c) for c in changed_cols)

                if all_mask or not self.pure_insert:
                    set_parts = []
                    for i in changed_idx:
                        c = self.columns[i]
                        bv, tv = base_row[i], target_row[i]
                        if self._is_mask(c) and isinstance(bv, int) and isinstance(tv, int):
                            added, removed = tv & ~bv, bv & ~tv
                            if added and not removed:
                                set_parts.append(f"`{c}` = `{c}` | {added}")
                            elif removed and not added:
                                set_parts.append(f"`{c}` = `{c}` & ~{removed}")
                            elif added and removed:
                                set_parts.append(f"`{c}` = (`{c}` | {added}) & ~{removed}")
                            else:
                                set_parts.append(f"`{c}` = {sql_literal(tv)}")
                        else:
                            set_parts.append(f"`{c}` = {sql_literal(tv)}")
                    where = self._where_from_row([target_row[self.columns.index(c)] for c in self.identity_cols])
                    self._tmp_update.write(f"UPDATE `{self.table}` SET {', '.join(set_parts)} WHERE {where};\n")
                else:
                    self._write_insert_pair(self._tmp_update, target_row)
                self.update_count += 1

    def total(self):
        return self.insert_count + self.update_count + self.delete_count

    def finalize(self, output_dir):
        """Close temp files, stitch them into the final <table>.sql, and
        clean up. Returns the output path."""
        for fh in (self._tmp_delete, self._tmp_insert, self._tmp_update):
            fh.close()

        path = os.path.join(output_dir, f"{self.table}.sql")
        with open(path, "w", encoding="utf-8") as out:
            out.write(f"-- {self.table}: {self.insert_count} inserts, "
                      f"{self.update_count} updates, {self.delete_count} deletes\n")
            for label, count, tmp_path in (
                ("Deletions", self.delete_count, self._tmp_delete.name),
                ("New entries", self.insert_count, self._tmp_insert.name),
                ("Changed values", self.update_count, self._tmp_update.name),
            ):
                if count:
                    out.write(f"\n-- {label}\n")
                    with open(tmp_path, "r", encoding="utf-8") as tmp:
                        # Copy in chunks rather than tmp.read() in one go,
                        # to avoid re-introducing a memory spike here.
                        while True:
                            chunk = tmp.read(1024 * 1024)
                            if not chunk:
                                break
                            out.write(chunk)

        self.cleanup()
        return path

    def cleanup(self):
        for fh in (self._tmp_delete, self._tmp_insert, self._tmp_update):
            try:
                os.unlink(fh.name)
            except OSError:
                pass


def diff_table_fullrow(cursor, base_db, target_db, table, columns):
    """No stable identity exists for this table (duplicates are legal), so
    diff as a multiset of whole rows. Only inserts/deletes are meaningful --
    there's no way to say a specific row 'changed' without an identity.
    These tables are expected to be small (no DBC-native ID/unique key at
    all), so a plain in-memory Counter is fine here.
    Note: re-applying this file's output twice is NOT guaranteed idempotent,
    since there's nothing unique to key a guard DELETE off of."""
    from collections import Counter

    col_list = ", ".join(f"`{c}`" for c in columns)

    cursor.execute(f"SELECT {col_list} FROM `{base_db}`.`{table}`")
    base_counter = Counter(cursor)  # rows are already tuples
    cursor.execute(f"SELECT {col_list} FROM `{target_db}`.`{table}`")
    target_counter = Counter(cursor)

    inserts, deletes = [], []

    for row_vals in sorted(target_counter, key=lambda t: [str(v) for v in t]):
        extra = target_counter[row_vals] - base_counter.get(row_vals, 0)
        if extra > 0:
            vals = ", ".join(sql_literal(v) for v in row_vals)
            inserts.extend([f"INSERT INTO `{table}` ({col_list}) VALUES ({vals});"] * extra)

    for row_vals in sorted(base_counter, key=lambda t: [str(v) for v in t]):
        extra = base_counter[row_vals] - target_counter.get(row_vals, 0)
        if extra > 0:
            where = " AND ".join(f"`{c}` = {sql_literal(v)}" for c, v in zip(columns, row_vals))
            deletes.extend([f"DELETE FROM `{table}` WHERE {where} LIMIT 1;"] * extra)

    return inserts, deletes


def write_fullrow_diff(output_dir, table, inserts, deletes):
    path = os.path.join(output_dir, f"{table}.sql")
    with open(path, "w", encoding="utf-8") as f:
        f.write(f"-- {table}: {len(inserts)} inserts, 0 updates, {len(deletes)} deletes\n")
        f.write("-- NOTE: this table has no primary/unique key (duplicates are legal in the\n"
                 "-- source data), so rows are matched by full value only. There is no way to\n"
                 "-- express an UPDATE, and re-applying this file twice is not guaranteed to be\n"
                 "-- a no-op.\n")
        if deletes:
            f.write("\n-- Deletions\n" + "\n".join(deletes) + "\n")
        if inserts:
            f.write("\n-- New entries\n" + "\n".join(inserts) + "\n")
    return path


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=3306)
    ap.add_argument("--user", required=True)
    ap.add_argument("--password", required=True)
    ap.add_argument("--base-db", required=True, help="e.g. dbc_original")
    ap.add_argument("--target-db", required=True, help="e.g. dbc_worgoblin")
    ap.add_argument("--output-dir", default="./dbc_diffs")
    ap.add_argument("--tables", help="Comma-separated list to restrict to (default: all common tables)")
    ap.add_argument("--dry-run", action="store_true", help="Only print summary, don't write files")
    ap.add_argument("--chunk-size", type=int, default=2000,
                     help="Rows fetched per page when diffing a table (default: 2000). Lower this if "
                          "a very wide table (e.g. Spell.dbc) still runs out of memory -- each page's "
                          "full-width rows are the only thing ever held in memory at once, so a smaller "
                          "chunk size trades query round-trips for a lower, harder memory ceiling.")
    ap.add_argument("--pure-insert", action="store_true",
                     help="Emit changed rows as DELETE+INSERT instead of UPDATE (more self-healing, "
                          "but full-row rewrites even for single-column changes)")
    ap.add_argument("--mask-columns", default="",
                     help="Comma-separated extra column names to treat as bitmasks, on top of any "
                          "column already ending in '_mask' (auto-detected). Changed values in these "
                          "columns render as `col = col | <bits>` / `col = col & ~<bits>` instead of a "
                          "literal replacement, so a layer that adds/removes one race/class bit stays "
                          "a one-line, independently-editable diff. Applies even under --pure-insert "
                          "when every changed column on a row is a mask column, since OR/AND-NOT is "
                          "already idempotent; a brand-new row still gets a literal value regardless.")
    args = ap.parse_args()

    restrict = [t.strip() for t in args.tables.split(",")] if args.tables else None
    mask_columns = {c.strip() for c in args.mask_columns.split(",") if c.strip()}

    # buffered=False (the default) streams rows from the server as we
    # iterate the cursor, instead of loading the whole result set into
    # memory the moment execute() runs -- important for the big tables.
    conn = mysql.connector.connect(host=args.host, port=args.port, user=args.user, password=args.password)
    cursor = conn.cursor(buffered=False)

    print(f"Comparing `{args.base_db}` -> `{args.target_db}` ...", file=sys.stderr)
    tables = get_common_tables(cursor, args.base_db, args.target_db, restrict)

    if not args.dry_run:
        os.makedirs(args.output_dir, exist_ok=True)

    total_changed_tables = 0
    for table in tables:
        base_cols = get_columns(cursor, args.base_db, table)
        target_cols = get_columns(cursor, args.target_db, table)
        if base_cols != target_cols:
            print(f"  [skip] `{table}`: column mismatch (schemas differ)", file=sys.stderr)
            continue
        columns = base_cols

        identity_cols, mode = get_identity(cursor, args.base_db, table)
        target_identity_cols, target_mode = get_identity(cursor, args.target_db, table)
        if mode != target_mode or identity_cols != target_identity_cols:
            print(f"  [skip] `{table}`: identity strategy differs between DBs", file=sys.stderr)
            continue

        if mode == "key":
            differ = TableDiffer(table, columns, identity_cols, mask_columns, args.pure_insert)
            try:
                differ.run(cursor, args.base_db, args.target_db, chunk_size=args.chunk_size)
                if differ.total() == 0:
                    differ.cleanup()
                    continue
                total_changed_tables += 1
                print(f"  `{table}`: {differ.insert_count} inserts, "
                      f"{differ.update_count} updates, {differ.delete_count} deletes")
                if not args.dry_run:
                    path = differ.finalize(args.output_dir)
                    print(f"    -> {path}")
                else:
                    differ.cleanup()
            except Exception:
                differ.cleanup()
                raise
        else:
            inserts, deletes = diff_table_fullrow(cursor, args.base_db, args.target_db, table, columns)
            if not (inserts or deletes):
                continue
            total_changed_tables += 1
            print(f"  `{table}` [fullrow, no unique key]: {len(inserts)} inserts, 0 updates, {len(deletes)} deletes")
            if not args.dry_run:
                path = write_fullrow_diff(args.output_dir, table, inserts, deletes)
                print(f"    -> {path}")

    print(f"\nDone. {total_changed_tables} table(s) had differences.", file=sys.stderr)
    cursor.close()
    conn.close()


if __name__ == "__main__":
    main()
