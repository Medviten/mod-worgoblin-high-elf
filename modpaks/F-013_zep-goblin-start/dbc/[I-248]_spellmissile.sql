-- I-248 — custom SpellMissile for Throw Footbomb (69992).
--
-- The client computes the vehicle aim arc's REACH from the missile ballistics:
-- it solves a trajectory (pitch within [min,max], speed <= default_speed_max,
-- gravity) to the aimed dest, and dests it cannot solve are unreachable. The
-- KTC goal bunny is 160yd downfield and ~95yd up on the roof: with gravity 30
-- that needs launch speed >= ~92 — stock siege missiles cap at 60-65 (642
-- boulder / 1402 pyrite barrel), hence "range limited, can't reach the stacks".
--
-- 90642 = clone of 1402 (Hurl Pyrite Barrel — the missile our visual kit 13175
-- was authored against: flags 17, lobbed pitch band 30..90deg, gravity 30)
-- with FIXED speed 125 (flat-max ~520yd; covers the far spotting building at
-- X -9059 / Z 178 — 273yd out and 136yd up needs v >= ~116). Speed MUST be fixed: the client's arc solver uses
-- default_speed_MIN as the speed, so the v16 range 40..115 capped reach at
-- ~53yd ("range very low", v22). The close-shot flat-arc problem is attacked
-- via default_pitch_min 30deg -> 45deg instead — forbidding the low-branch
-- solution so near dests solve on the steep lob. ID free: stock
-- SpellMissile.dbc tops out at 2706. Ships in PATCH-Z.
DELETE FROM spellmissile WHERE id = 90642;
INSERT INTO spellmissile SET
  id = 90642,
  flags = 17,
  default_pitch_min = 0.7853981852531433,
  default_pitch_max = 1.5707999467849731,
  default_speed_min = 125,
  default_speed_max = 125,
  randomize_facing_min = 0,
  randomize_facing_max = 0,
  randomize_pitch_min = 0,
  randomize_pitch_max = 0,
  randomize_speed_min = 0,
  randomize_speed_max = 0,
  gravity = 30,
  max_duration = 0,
  collision_radius = 0;
