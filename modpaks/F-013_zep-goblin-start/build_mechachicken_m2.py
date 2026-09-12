#!/usr/bin/env python3
"""Build Mechachicken's private M2 with the display scale baked into its authored
locomotion speeds (I-323).

WHY THIS EXISTS
---------------
Mechachicken (38224) renders through display 30997 at `creature_model_scale` = **15.0**.
The client scales locomotion playback by (actual speed / the pace the sequence was
authored for), and that relation knows nothing about model scale, so a 15x model reads
sluggish: it takes proportionally smaller steps for its size. This is the knock-on
I-318 recorded in Defect 12 for the Wild Cluckers at 1.5x ("scaling the speed by the
same 1.5 keeps the apparent gait").

The server-side version of that fix does not work here. Per I-318 Defect 11 the ground
covered per cycle is `1000ms * authored`, invariant at every speed, so matching a 15x
model with speed alone needs `speed_walk` 15 = 37.5 yd/s - over five times player run
speed. Baking the scale into the authored field instead keeps the bird's sedate
2.5 yd/s walk AND puts its feet back on the ground:

    authored / scale  ->  playback rate (speed / authored) rises by scale
                      ->  ground per cycle falls by scale
                      ->  visual stride (scale x ground) is unchanged == ground covered

WHY A CLONE AND NOT AN IN-PLACE EDIT
------------------------------------
`Creature\\mechanicalchicken\\mechanicalchicken.mdx` (model 5044) is shipped by
**patch-hd-everything** and is shared with stock displays 6909 and 7920 - the Mechanical
Chicken companion pet at scale 3.0 and 1.0. Editing it in place would wreck their gait,
and `repair_m2_movespeed.py`'s scope rule is explicit that HD replacement models in other
zpaks legitimately have their own strides and must never be rewritten. So this ships a
private copy under this zpak at model id 900008, and only display 30997 points at it.

`CHICKENSKINROBOT.BLP` is copied alongside because the HD model's body texture is slot
type 11 with an empty embedded name: the client builds that path from the M2's OWN
directory + `texture_variation_1`, so the skin must sit next to the clone or the bird
renders untextured again (the original I-323 defect).

The other two textures are type 0 with absolute paths into
`creature/mechanicalchicken/` and resolve out of PATCH-Q unchanged - not copied.

IDEMPOTENT
Every run re-derives from the patch-hd-everything source, so re-running never compounds
the division. The M2/SKIN/BLP are gitignored in this zpak, so this script is the
version-controlled record of the binary - re-run it after any asset re-extraction.

USAGE
    python3 build_mechachicken_m2.py            # report only
    python3 build_mechachicken_m2.py --apply    # write source- and parsed-assets

After --apply, rebuild the client patch:  zep build patch-mpq -p Z --build
"""
import argparse
import os
import shutil
import struct

ZPAK = os.path.dirname(os.path.abspath(__file__))
HD = os.path.join(os.path.dirname(ZPAK), "patch-hd-everything",
                  "mpq", "parsed-assets", "CREATURE", "MECHANICALCHICKEN")

# display 30997's creature_model_scale; keep in sync with [I-323]_creaturedisplayinfo.sql
SCALE = 15.0
LOCOMOTION = (4, 5)                 # Walk, Run

SRC_M2 = os.path.join(HD, "MECHANICALCHICKEN.M2")
SRC_SKIN = os.path.join(HD, "MECHANICALCHICKEN00.SKIN")
SRC_BLP = os.path.join(HD, "CHICKENSKINROBOT.BLP")

# (root, subpath) -> the two asset trees this zpak packs from
DESTS = [
    ("mpq/source-assets", os.path.join("Creature", "Mechachicken")),
    ("mpq/parsed-assets", os.path.join("CREATURE", "MECHACHICKEN")),
]
DST_M2, DST_SKIN, DST_BLP = "MECHACHICKEN.M2", "MECHACHICKEN00.SKIN", "CHICKENSKINROBOT.BLP"


def _seq_table(data):
    base = 8 if data[:4] == b"MD21" else 0
    hdr = struct.unpack_from("<64I", data, base)
    return base, hdr[7], hdr[8]     # base, nAnimations, ofsAnimations


def _speed_fields(data):
    """every sequence record's (animId, subId, moveSpeed, offset-of-moveSpeed)."""
    base, n, ofs = _seq_table(data)
    out = []
    for i in range(n):
        rec = base + ofs + i * 64
        aid, sub = struct.unpack_from("<HH", data, rec)
        out.append((aid, sub, struct.unpack_from("<f", data, rec + 8)[0], rec + 8))
    return out


def build(apply_):
    src = open(SRC_M2, "rb").read()
    buf = bytearray(src)
    edits = []
    # Every record whose animId is Walk/Run, not just sub 0 - a sub-variant left at the
    # unscaled pace would desync the moment the client picked it.
    for aid, sub, val, off in _speed_fields(src):
        if aid in LOCOMOTION and val != 0.0:
            new = val / SCALE
            struct.pack_into("<f", buf, off, new)
            edits.append((aid, sub, val, struct.unpack_from("<f", buf, off)[0]))

    if not edits:
        print("!! no Walk/Run sequences found in %s - aborting" % SRC_M2)
        return 1
    for aid, sub, old, new in edits:
        print("   anim %-2d sub %-2d  %.6f -> %.6f   (/%.1f)" % (aid, sub, old, new, SCALE))

    for root, sub in DESTS:
        d = os.path.join(ZPAK, root, sub)
        print("   %s %s" % ("WRITE " if apply_ else "would ", os.path.relpath(d, ZPAK)))
        if not apply_:
            continue
        os.makedirs(d, exist_ok=True)
        open(os.path.join(d, DST_M2), "wb").write(bytes(buf))
        shutil.copy2(SRC_SKIN, os.path.join(d, DST_SKIN))
        shutil.copy2(SRC_BLP, os.path.join(d, DST_BLP))
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--apply", action="store_true", help="write the assets")
    args = ap.parse_args()
    for p in (SRC_M2, SRC_SKIN, SRC_BLP):
        if not os.path.exists(p):
            print("!! missing source asset: %s" % p)
            return
    rc = build(args.apply)
    if rc == 0 and args.apply:
        print("\nnow rebuild the client patch:  zep build patch-mpq -p Z --build")


if __name__ == "__main__":
    main()
