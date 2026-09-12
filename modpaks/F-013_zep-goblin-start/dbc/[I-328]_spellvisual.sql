-- I-328 spell 71658 "Egg-splosive Barrage" — the Mechashark's volley fired projectiles
-- with no model.
--
-- Identical defect to I-323's 71657 "Deadly Egg Barrage", one spell over: the emitter
-- zeroed `missile_model` because Cata effectname 6246 has no 3.3.5a row pointing at its
-- .mdx, and `has_missile` = 1 with `missile_model` = 0 is a missile the client cannot
-- draw. I-323 already created the effectname for that mesh (90101,
-- `world\generic\passivedoodads\eastereggs\easteregg05.mdx`) — the two barrages throw
-- the same giant Easter egg, so this reuses it rather than minting a second row.
--
-- Restored from the 4.3.4 SpellVisual.dbc row for 15156, which the emitter also zeroed:
--   missile_sound   14336 — our stock `RocketMultipleMissilesLoop.wav` (donor 23820
--                   `.ogg`; the .wav/.ogg stem trap, resolved the same way in I-323)
--   flags           1
--   impact_area_kit 11162 — present in our spellvisualkit already, just unreferenced
-- `missile_motion` is left 0: the donor's 20 is a Cata SpellMissileMotion id with no
-- 3.3.5a counterpart, and 0 (straight line) is the safe default.
--
-- AUTO-owned row -> one consolidated UPDATE.
UPDATE spellvisual SET
  `missile_model` = 90101,
  `missile_sound` = 14336,
  `impact_area_kit` = 11162,
  `flags` = 1
WHERE id = 15156;
