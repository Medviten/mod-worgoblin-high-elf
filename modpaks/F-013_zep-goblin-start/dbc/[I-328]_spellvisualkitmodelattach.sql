-- I-328 Mechashark X-Steam appearance — SpellVisualKit 14016 attachments.
-- Effectnames and the full six-attachment inventory: [I-328]_spellvisualeffectname.sql.
--
-- ROUND 3. The donor's attachment geometry is authored against the STOCK 3.3.5a
-- hammerhead, and our client does not run it: `patch-hd-everything` (ON, priority 500)
-- replaces `Creature\Shark\HammerHead.m2` in place — same DBC path, different mesh, so
-- creaturemodeldata 230 gives no hint that the model was swapped. Both meshes were
-- parsed; the HD one is a different animal:
--
--                       stock 3.3.5a          patch-hd-everything
--   vertices            464                   1000
--   length (x)          -3.671 .. 2.250       -4.237 .. 2.435
--   width (y)           -1.650 .. 1.644       -1.214 .. 1.214     <- 26% narrower
--   attachment 17       (2.208, 0, 1.111)     (1.733, 0, 0.776)   <- moved back and down
--   attachment 21/22    (-0.236, ±1.208, .056) same                  (bones 27/28 now)
--   attachment 18       (-0.077, 0, 2.849)    same
--
-- That explains both reports exactly:
--   * Rockets in the wrong place — attachments 21/22 are the pectoral fin TIPS, and on
--     the narrower HD fins the donor's +0.5/-0.6 y offsets push them past the mesh edge
--     (1.208 + 0.5 = 1.708 against a 1.214 half-width) so they hang in open water.
--   * No sign of the pipe — attachment 17 moved 0.475 back and 0.335 down, so the
--     donor's (-3.5, 0.3, 0.5) lands the periscope at (-1.767, 0.3, 1.276): mid-body,
--     buried INSIDE the shark, where the body is only 0.296 half-wide and 2.4 tall.
--     The asset and the DBC row were fine all along (verified present in PATCH-O and in
--     the built SpellVisualEffectName.dbc) — it was hidden in the mesh.
--
-- ROUND 4. Round 3 mounted all four models on **attachment 18** to get them off the
-- animated fin chains. That over-corrected: attachment 18 is bone 12, and bone 12 has
-- `parent = -1` with a single animation block — a static model-space marker that nothing
-- drives at all. The parts held still in world space while the shark swam through them.
--
-- The bone table sorts the ten attachments into three groups:
--
--   bones 0-11    14 translation + 14 rotation blocks   the actual rig
--   bones 12/13/14 (att 18/19/20)  parent -1            static markers - do not track
--   bones 16/17/22/26/27/28/29     children of the rig  track, via their parent
--
-- What we want is a mount that rides the body without riding a flapping fin, and the HD
-- author left exactly one: **attachment 0**, bone 16, pivot (0.518, 0.002, 1.447) — on
-- the back, and a direct child of bone 0, the animated root (14/14 blocks). It inherits
-- the whole-body swim motion but not the spine undulation of the 2->7->10->11 chain or
-- the fin stroke of 6/8, which is right for parts bolted to a hull.
--
-- Attachment 0 confirmed tracking in game.
--
-- ROUND 5, from the same test: periscope moved back behind the dorsal fin, rockets moved
-- back and pitched nose-down 20 degrees (they read as pointing skyward). Rest positions:
--
--   rocket L  (-0.800,  0.500, 1.600) pitch 0.349   periscope (-1.350, 0, 1.790)
--   rocket R  (-0.800, -0.500, 1.600) pitch 0.349   smoke     (-1.350, 0, 2.130)
--   eye L     ( 1.630,  1.000, 1.110) pitch 1.5708  eye R     ( 1.630, -1.000, 1.110)
--
-- The dorsal fin occupies x -1.05..-0.20 (midline top z > 2.1, peaking 2.415 at x -1.0);
-- behind it the back drops to 1.546 at x -1.30 and 1.342 at x -1.45, so the periscope
-- base sits at x -1.35 on a 1.45 surface. Pitching a 1.96-long rocket nose-down about an
-- origin near its own tail drops the nose 0.42 and lifts the tail 0.12, so z goes up 0.30
-- to keep the nose out of the mesh: it now runs from (0.35, ±0.5, 1.18) at the tip to
-- (-1.13, ±0.5, 1.72) at the tail, tucked against the shoulder and alongside the fin.
--
-- Pitch sign: positive pitch rotates +Z toward +X (that is what the donor's 1.5708 does to
-- the upright light discs), so on a +X-aligned rocket it rotates the nose toward -Z, down.
--
-- Caveat: attachment 0 exists on the HD mesh only — the stock hammerhead has 15-22 and
-- 34, no 0. That is fine while `patch-hd-everything` ships the model, and it is the same
-- dependency the offsets themselves already carry.
--
-- Measurements behind the rest positions, against the HD mesh:
--
--   back surface, midline      x 0.4 -> z 1.60,  x 0.2 -> z 1.86  (dorsal fin from x -0.4)
--   back surface, |y| 0.3-0.5  z 1.276 flat from x -0.2 to 0.8    (the shoulder)
--   rocket model               1.96 long x 0.86 wide at scale 1.25, origin near its tail
--   pipe model                 0.68 tall at scale 0.1, origin at its centre

-- Rockets: on the shoulders, straddling the dorsal fin, nose forward (+x, yaw 0).
-- Origin (-0.30, ±0.50, 1.30) -> body from x -0.70 to 0.87, bottom edge just sunk into
-- the 1.276 shoulder surface. AUTO-owned rows -> UPDATE, one per id.
UPDATE spellvisualkitmodelattach SET
  `spell_vis_effect_name_id` = 90102,
  `attachment_id` = 0,
  `offset_x` = -1.318,
  `offset_y` = 0.498,
  `offset_z` = 0.153,
  `yaw` = 0,
  `pitch` = 0.349,
  `roll` = 0
WHERE id = 90008;

UPDATE spellvisualkitmodelattach SET
  `spell_vis_effect_name_id` = 90102,
  `attachment_id` = 0,
  `offset_x` = -1.318,
  `offset_y` = -0.502,
  `offset_z` = 0.153,
  `yaw` = 0,
  `pitch` = 0.349,
  `roll` = 0
WHERE id = 90009;

-- ROUND 7. Attachment ids are not free-form slots, they are AttachmentType enum values
-- with fixed semantics, and reading them that way explains the last two reports:
--
--   0  Shield/MountMain  ( 0.518,  0.002, 1.447)  bone 16 <- root 0
--   15 ChestBloodFront   ( 1.548, -0.012, 0.547)  bone 22 <- 4
--   16 ChestBloodBack    (-1.743, -0.029, 1.226)  bone 29 <- 10, the REAR SPINE
--   17 Breath (mouth)    ( 1.733,  0.000, 0.776)  bone 26 <- 9, the head chain
--   18 PlayerName        (-0.077,  0.000, 2.849)  parent -1, static  (round 4's mistake)
--   19 Base / 20 Head    also parent -1, static
--   21/22 Shoulders      the pectoral fins
--
-- The periscope was still on attachment 0, whose bone hangs off the ROOT — fine for the
-- rockets at x -0.80, wrong for a part at x -1.35 that should follow the rear body. It
-- sat 1.87 behind its own pivot and lagged the segment it visually belongs to. Moved to
-- attachment 16, whose bone 29 is parented into the 0->2->7->10 spine chain and pivots at
-- x -1.743, only 0.39 from the pipe. Rest position unchanged.
UPDATE spellvisualkitmodelattach SET
  `attachment_id` = 16,
  `offset_x` = -0.108,
  `offset_y` = 0.655,
  `offset_z` = 0.021,
  `roll` = 1.5708
WHERE id = 90007;

-- The periscope: behind the head, ahead of the dorsal fin, on the midline. Origin
-- (0.45, 0, 1.92) puts its base on the 1.58 back surface and its top at 2.26. The
-- donor's yaw/roll are kept — the pipe mesh is already a z-aligned cylinder, so yaw only
-- spins the elbow, which is what those values were for.
--
-- Id 91001, NOT the next free 90037: `[AUTO,F-011]_spellvisualkitmodelattach.sql` opens
-- with `DELETE ... WHERE id BETWEEN 90001 AND 90999`, so anything added inside that band
-- is wiped the next time the AUTO file applies.
DELETE FROM spellvisualkitmodelattach WHERE id = 91001;
INSERT INTO spellvisualkitmodelattach SET
  `id` = 91001,
  `parent_spell_vis_kit_id` = 14016,
  `spell_vis_effect_name_id` = 90103,
  `attachment_id` = 16,
  `offset_x` = -0.108,
  `offset_y` = 0.314,
  `offset_z` = 0.021,
  `yaw` = 0,
  `pitch` = -1.5708,
  `roll` = 1.5708;

-- ROUND 14/15. Lateral 0.1, and the direction wanted is -Y, not the shark's +Y left that
-- round 14 assumed. Lateral is `offset_z` under the corrected bone-29 mapping and inverts:
-- local_z = -(Wy - pivot_y) = -(-0.1 + 0.029) = +0.071, giving world y -0.100.
-- Slight overshoot at -0.1, so +0.05 back: local_z = -(-0.05 + 0.029) = +0.021,
-- world y -0.050. Rest is now (-1.851, -0.05, 1.540).

-- ROUND 13. Orientation signed off. Aft 0.5 and down 0.25 in model units, to rest
-- (-1.851, 0, 1.540): the pipe spans 1.199..1.881 and the midline back at x -1.85 runs
-- about 1.27, so the base tucks 0.07 into the hull. Offsets use the corrected round-12
-- mapping, where `offset_y` is height and `offset_x` is fore/aft.

-- ROUND 12. Every "move it up" drove the pipe DOWN, three rounds running, because the
-- local -> world mapping for bone 29 was sign-inverted. Derived from the rest quaternion
-- (-0.706, 0.030, -0.030, 0.706) it read as X -90 degrees, giving world = (x, z, -y).
-- In game it behaves as X +90: **world = (x, -z, y)**, so `offset_y` IS the vertical and
-- driving it more negative sank the pipe:
--
--   round  9  local_y -0.320 -> world z 0.906
--   round 10  local_y -0.564 -> world z 0.662
--   round 11  local_y -0.814 -> world z 0.412
--
-- which is "resolved down not up" exactly, and explains why the pipe had been sitting low
-- on the flank rather than on the back the whole time. The offsets below use the corrected
-- mapping, so local_y is simply height above the pivot: rest z 1.790, spanning 1.449..2.131
-- against a back surface of 1.546 — base 0.10 into the hull, mouth just clear of it.
--
-- The rotations are NOT touched: pitch/roll were tuned against what is on screen and the
-- orientation is confirmed correct, whatever the quaternion says the frame is. Where the
-- decode and the game disagree, the game wins.

-- ROUND 11. Orientation confirmed correct — outlet aft, standing upright. Raised 0.25 to
-- rest z 2.040, so the pipe spans 1.699..2.381 against a back surface of 1.546 at x -1.35
-- and a dorsal fin peaking at 2.415: the mouth now sits just under the top of the fin.
-- That does lift the base 0.15 clear of the hull rather than tucking it in, which is the
-- trade for the extra height — say if the gap shows and it wants a smaller lift, or the
-- pipe scaled up instead so the top rises while the base stays buried.

-- ROUND 10. Upright now, but the elbow's outlet pointed out the shark's left instead of
-- aft, and the pipe wanted to come forward and up.
--
-- Spinning it is `pitch`, which is not obvious until the bone's frame is written out.
-- Under bone 29's X -90 rest rotation:
--
--   local +X -> world +X      local +Y -> world -Z      local +Z -> world +Y
--
-- so world +Z — the pipe's own axis, now that it stands upright — is local -Y, and the
-- field that spins about local Y is `pitch`. Taking the outlet from +Y (the shark's left)
-- to -X (aft) is +90 degrees about world Z, hence -90 about local +Y: pitch = -1.5708.
-- If it lands facing forward instead, the sign is the whole fix.
--
-- Position: forward 0.489 and up 0.244, the same step size as the halved move, to rest
-- (-1.351, 0, 1.790) — just behind the dorsal fin, whose base ends at x -1.05. The midline
-- back there is z 1.546, and the pipe's centre origin sits half its 0.68 height above that,
-- so the base tucks into the hull and the mouth clears at 2.13, where the smoke follows.

-- ROUND 9. "Bone rest matrices are identity, so attachment positions are model space" —
-- asserted in round 4 and WRONG. A bone's rest pose is the first key of its rotation
-- track, and it is only identity when that key is. Parsed them:
--
--   bone 26 (att 17, mouth)  quat (0, 0, 0, 1)                  identity
--   bone 16 (att 0,  back)   quat (-0.028, -0.238, 0.042, .970)  Y -27.4 deg
--   bone 29 (att 16, rear)   quat (-0.706, 0.030, -0.030, .706)  X -90.0 deg
--
-- Bone 29's -90 degrees about X is why the periscope lies out the flank: it takes the
-- pipe's vertical +Z and puts it along Y. Round 8 zeroing `yaw` could never fix that —
-- wrong axis, as reported. Cancelled with `roll` = +1.5708 (roll is the X field; `pitch`
-- was already pinned to Y by the rocket and disc tests).
--
-- The same rotation also transforms the OFFSET, which is expressed in the bone's local
-- frame: local (x,y,z) renders at world (x, z, -y). Round 8's local (-0.586, 0.029, 0.075)
-- therefore landed at (-2.329, 0.046, 1.197), not the (-2.329, 0, 1.301) intended — the x
-- was right (an X-rotation leaves x alone), which is why "too far along the tail" was the
-- accurate part of the report. Offsets below are pre-rotated: local = (Wx, -Wz, Wy).
--
-- Position: last round's shift halved as asked — back 0.489 and down 0.244 instead of
-- 0.979/0.489 — for a rest of (-1.840, 0, 1.546), with the smoke at the mouth, z 1.887.
--
-- Footnote on the rockets: bone 16's Y -27.4 deg is why they read as "pointing skywards"
-- in round 5. It tilts a +X-aligned model nose-up by that much; the pitch 0.349 added then
-- brings the net to about 7 degrees up. Left alone — confirmed good in game, and correcting
-- it now would move something already signed off.

-- ROUND 8. The periscope was lying on its side, out the flank.
--
-- The donor's -1.5708 in the field our schema calls `yaw` is what laid it there: whatever
-- axis that column drives on this client, empirically it tips the pipe's long axis out to
-- the side rather than spinning it about itself. Zeroed, which is exactly the requested
-- 90 degrees clockwise viewed from aft, and stands it upright. The small -0.0873 roll is
-- kept — that is the donor's lean, not the problem. Do not trust the yaw/pitch/roll column
-- NAMES here; pitch was verified separately (it pitched the rockets nose-down as
-- predicted), but this one did not behave as the name implies.
--
-- Moved back half a rocket length (1.957 / 2 = 0.979) and down a quarter (0.489), to
-- rest (-2.329, 0, 1.301). The midline back there runs z 1.32 at x -2.20 and 1.39 at
-- -2.05, so the pipe now sits down into the tail rather than proud of it. The smoke flare
-- follows to the new mouth at z 1.642 (pipe half-height 0.341 at effectname scale 0.1).

-- The eye lights, the last two of kit 14016's six attachments (4.3.4 rows 3715/3716).
-- Blocked until now on the mesh: `ul_light_effect_green.mdx` is Cata-only. Retroported
-- 272 -> 264 and shipped in this zpak — recipe, hashes and preconditions in
-- `asset_recipes.json`, converter in `cli/lib/m2_retroport.py`.
--
-- These go on attachment 17, NOT attachment 0: 17 is bone 26 on the animated head chain,
-- and eyes should turn with the head. Only hull-mounted parts want the root.
--
-- The donor's offsets (y ±1.33 / -1.65) are for the stock hammerhead's wider lobes; ours
-- tip out at ±0.930 (head verts x > 1.0, outer face x 1.42..1.83, z 0.98..1.22). Placed
-- at y ±1.00, just proud of the tips so the disc is not buried in the lobe. Donor pitch
-- 1.5708 kept: the mesh is a flat 1.6-wide glow disc lying in XY, and 90 degrees stands
-- it upright facing forward.
DELETE FROM spellvisualkitmodelattach WHERE id IN (91002, 91003);
INSERT INTO spellvisualkitmodelattach
  (`id`, `parent_spell_vis_kit_id`, `spell_vis_effect_name_id`, `attachment_id`,
   `offset_x`, `offset_y`, `offset_z`, `yaw`, `pitch`, `roll`) VALUES
  (91002, 14016, 90104, 17, 0.017,  0.43, 0.105,  1.3963, 1.5708, 0),
  (91003, 14016, 90104, 17, 0.017, -0.43, 0.105, -1.3963, 1.5708, 0);

-- Eye lights sat about a yard outboard of the eyes. Not the centre — the DISC. Display
-- 21763 renders at `creature_model_scale` 2.0, so a model unit is two yards on screen,
-- and the donor's effectname scale 0.5 makes a glow 0.82 model units wide whose outer
-- edge reached y 1.409 against a lobe tip at 0.930: a 0.96-yard overhang, which is the
-- report to the decimal. The donor sized that disc for the stock hammerhead, whose lobes
-- reach 1.650 — our HD head is 56% of that width, so the same disc is proportionally
-- ~80% too big. Centre pulled 1.00 -> 0.78 here, and the effectname scaled by the same
-- head ratio, 0.5 * (0.930/1.650) = 0.28, in [I-328]_spellvisualeffectname.sql. Outer
-- edge now lands 0.16 yards past the eye instead of 0.96.
--
-- ROUND 14: 10 degrees back off the outboard turn — clockwise on the left, anticlockwise
-- on the right, which for a mirrored pair is both yaws moving 0.1745 toward zero:
-- +1.5708 -> +1.3963 and -1.5708 -> -1.3963. So they now toe forward 10 degrees rather
-- than facing straight out. Plus axially forward 0.02 (x 1.730 -> 1.750) and radially in
-- 0.02 (|y| 0.450 -> 0.430).
--
-- ROUND 13: position signed off; turned 90 degrees about Z so the discs face outboard
-- instead of forward. `yaw` is the Z field (pitch was pinned to Y and roll to X by the
-- rocket and periscope tests), and bone 26 is the one attachment bone with an identity
-- rest pose, so local == world here and no pre-rotation is needed. Anticlockwise seen
-- from above is positive about +Z, and +Y is the shark's left: left eye +1.5708, right
-- eye -1.5708, which mirrors them. If they come out facing inboard, both signs flip.
--
-- ROUND 12: forward another 0.05 MODEL units (asked in model units this time, so no
-- conversion) -> x 1.730, which puts them within 0.003 of attachment 17's own pivot.
--
-- ROUND 11: forward 0.1 YARDS. Display 21763 renders at creature_model_scale 2.0, so a
-- yard on screen is half a model unit: 0.1 yd = 0.05, x 1.630 -> 1.680. Getting that
-- conversion backwards would have moved them 0.2 yards, twice what was asked.
--
-- ROUND 10: one eye diameter was too far down, so half of it — rest z 1.110 -> 0.881.
--
-- ROUND 9: horizontal confirmed good; dropped one eye diameter vertically. The disc is
-- 1.635 model units wide at scale 1, so 0.458 at our 0.28 — rest z 1.110 -> 0.652. Bone 26
-- is the one attachment bone with an identity rest rotation, so this offset needs no
-- pre-rotation, unlike the periscope's.
--
-- ROUND 8: still outboard at 0.78, reported as 75% over-extended. Two independent
-- reports now converge on where the eyes actually are, and it is NOT the lobe tips:
--   round 7 — centre 1.00 read as "~1 yard out" = 0.5 model at scale 2.0  -> eye ~0.50
--   round 8 — centre 0.78 read as "75% over"    = 0.78 / 1.75             -> eye ~0.45
-- So the eyes sit about halfway out the hammer lobes (tips are at 0.930), and every
-- estimate anchored on the tips was wrong. Centre moved to ±0.45; the disc at scale 0.28
-- spans y 0.22..0.68, entirely on the lobe.
--
-- Untouched: "Freakin' Laser Beam" (spell 71659, visual 15153) renders through kits
-- 14540/10116/8650, which carry only a `chest_effect` — that is the stock chest
-- attachment, no SpellVisualKitModelAttach row of ours, and a separate knob if the beam
-- origin itself is wrong.
