#!/usr/bin/env python3
"""Repair corrupted locomotion moveSpeed fields in this zpak's shipped M2s (I-318).

WHY THIS EXISTS
---------------
Each M2 animation sequence records the pace it was authored for as a float at
sequence-record offset 8. The client scales locomotion playback by
(actual movement speed / that authored figure), so a wrong value there cannot be
compensated for with `creature_template.speed_walk` - lowering the speed to fix the
ground covered just slows the legs by the same ratio.

`BushChicken.M2` (Wild Clucker 38111, quest 24671 Cluster Cluck) shipped with its
Walk moveSpeed rewritten from the 4.3.4 original **0.3611** to exactly **2.5000** -
`baseMoveSpeed[MOVE_WALK]`, AC's default. Run was untouched at 4.1667. 2.5/0.3611 =
6.9, so at the speed that field demanded the bird covered nearly seven times the
ground its legs were drawn for. Four rounds of speed tuning chased that lie before
the field itself was compared against the original.

The M2s are **gitignored** (`*.m2` in this zpak's .gitignore), so the binary repair
cannot live in version control - this script is the record of it. Re-run after any
asset re-extraction or a fresh clone of the zpak assets.

Repairs are byte-verbatim: the four bytes are copied out of the 4.3.4 original
rather than retyped, so no float rounding is introduced. Idempotent - a file already
carrying the original value is left alone. A `.pre-I318.bak` is written next to any
file the first time it is modified.

USAGE
    python3 repair_m2_movespeed.py            # report only
    python3 repair_m2_movespeed.py --apply    # patch source- and parsed-assets

After --apply, rebuild the client patch:  zep build patch-mpq -p Z --build
(the patch keeps the file size identical, so --parse-build would skip it).

SCOPE
`REPAIRS` is an explicit list, not a sweep. Candidates are found by comparing a
shipped M2 against its 4.3.4 twin where the two agree on animation count (same model
build) but disagree on a locomotion moveSpeed - see `--audit`. Models whose anim
counts differ are different builds and are NOT comparable; HD replacement models in
other zpaks legitimately have their own strides and must never be "repaired" this way.
"""
import argparse
import os
import shutil
import struct

ZPAK = os.path.dirname(os.path.abspath(__file__))
WHITEMANE = "/workspace/project/Zeppelin-Tools/whitemane-15595/extracted"

# filename (lowercase) -> animation ids whose moveSpeed must match the 4.3.4 original
REPAIRS = {
    "bushchicken.m2": [4],          # Walk: 2.5000 shipped vs 0.3611 original (I-318)
}

# Known-corrupt but NOT yet repaired - Walk AND Run zeroed on same-build models.
# A 0.0 authored speed is not a valid locomotion value. Lost Isles content; left out
# until someone can eyeball them in game. Add to REPAIRS above to fix.
PENDING = {
    "pygmybase.m2": [4, 5],
    "pygmyhunter.m2": [4, 5],
    "pygmywarrior.m2": [4, 5],
    "sandpygmy.m2": [4, 5],
}

LOCOMOTION = (4, 5)                 # Walk, Run


def _seq_table(data):
    base = 8 if data[:4] == b"MD21" else 0
    hdr = struct.unpack_from("<64I", data, base)
    return base, hdr[7], hdr[8]     # base, nAnimations, ofsAnimations


def _speeds(path):
    d = open(path, "rb").read()
    base, n, ofs = _seq_table(d)
    out = {}
    for i in range(n):
        rec = base + ofs + i * 64
        aid, sub = struct.unpack_from("<HH", d, rec)
        if sub == 0 and aid not in out:
            out[aid] = (struct.unpack_from("<f", d, rec + 8)[0], rec + 8)
    return d, out, n


def _index_originals():
    idx = {}
    for dirpath, _dirs, files in os.walk(WHITEMANE):
        for fn in files:
            if fn.lower().endswith(".m2"):
                idx.setdefault(fn.lower(), os.path.join(dirpath, fn))
    return idx


def _shipped(name):
    """Both copies of a shipped asset: the editable one and the packed one."""
    hits = []
    for root in ("mpq/source-assets", "mpq/parsed-assets"):
        for dirpath, _dirs, files in os.walk(os.path.join(ZPAK, root)):
            for fn in files:
                if fn.lower() == name:
                    hits.append(os.path.join(dirpath, fn))
    return hits


def audit(originals):
    """Same-build shipped M2s whose locomotion moveSpeed disagrees with 4.3.4."""
    found = []
    for dirpath, _dirs, files in os.walk(os.path.join(ZPAK, "mpq/source-assets")):
        for fn in files:
            if not fn.lower().endswith(".m2"):
                continue
            twin = originals.get(fn.lower())
            if not twin:
                continue
            try:
                _d, mine, n_mine = _speeds(os.path.join(dirpath, fn))
                _o, orig, n_orig = _speeds(twin)
            except Exception:
                continue
            if n_mine != n_orig:
                continue            # different model build - not comparable
            for aid in LOCOMOTION:
                if aid in mine and aid in orig and abs(mine[aid][0] - orig[aid][0]) > 1e-4:
                    found.append((fn, aid, mine[aid][0], orig[aid][0]))
    return found


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--apply", action="store_true", help="write the repairs")
    ap.add_argument("--audit", action="store_true", help="list same-build mismatches")
    args = ap.parse_args()

    originals = _index_originals()

    if args.audit:
        rows = audit(originals)
        print("same-build locomotion moveSpeed mismatches vs 4.3.4: %d" % len(rows))
        for fn, aid, mine, orig in rows:
            print("  %-24s anim %-2d shipped %-9.4f original %-9.4f" % (fn, aid, mine, orig))
        if PENDING:
            print("\nknown-corrupt, not in REPAIRS yet: %s" % ", ".join(sorted(PENDING)))
        return

    changed = clean = 0
    for name, anim_ids in sorted(REPAIRS.items()):
        twin = originals.get(name)
        if not twin:
            print("!! no 4.3.4 original for %s - cannot repair" % name)
            continue
        _od, orig, _n = _speeds(twin)
        for path in _shipped(name):
            data, mine, _n2 = _speeds(path)
            buf = bytearray(data)
            hits = []
            for aid in anim_ids:
                if aid not in mine or aid not in orig:
                    continue
                have, off = mine[aid]
                want = orig[aid][0]
                if abs(have - want) <= 1e-4:
                    continue
                src = open(twin, "rb").read()
                buf[off:off + 4] = src[orig[aid][1]:orig[aid][1] + 4]
                hits.append((aid, have, want))
            rel = os.path.relpath(path, ZPAK)
            if not hits:
                clean += 1
                print("   ok      %s" % rel)
                continue
            for aid, have, want in hits:
                print("   %s %s  anim %d  %.4f -> %.4f"
                      % ("PATCH  " if args.apply else "would  ", rel, aid, have, want))
            if args.apply:
                bak = path + ".pre-I318.bak"
                if not os.path.exists(bak):
                    shutil.copy2(path, bak)
                open(path, "wb").write(bytes(buf))
                changed += 1

    print("\n%d file(s) %s, %d already correct"
          % (changed, "patched" if args.apply else "would be patched", clean))
    if changed:
        print("now rebuild the client patch:  zep build patch-mpq -p Z --build")


if __name__ == "__main__":
    main()
