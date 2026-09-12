-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 creature_template_spell (one file per table; rows carry final state)

DELETE FROM creature_template_spell WHERE CreatureID IN (34840,35486,36178,37179,38318,38526,39074,39598);
DELETE FROM creature_template_spell WHERE CreatureID IN (35999);

INSERT INTO creature_template_spell (`CreatureID`, `Index`, `Spell`, `VerifiedBuild`) VALUES
  (34840, 0, 66300, 0),
  (34840, 1, 61178, 0),
  (34840, 2, 66298, 0),
  (34840, 3, 66299, 0),
  (35486, 0, 67526, 0),
  (35486, 1, 67508, 0),
  (35486, 2, 67524, 0),
  (35486, 3, 67525, 0),
  (35486, 4, 67522, 0),
  (35999, 0, 66300, 0),
  (35999, 1, 61178, 0),
  (35999, 2, 66298, 0),
  (35999, 3, 66299, 0),
  (36178, 0, 68445, 0),
  (37179, 0, 69992, 0),
  (38318, 0, 71658, 0),
  (38318, 1, 71659, 0),
  (38318, 2, 71660, 0),
  (38526, 0, 72206, 0),
  (39074, 0, 73456, 0),
  (39074, 1, 73477, 0),
  (39598, 0, 73998, 0),
  (39598, 1, 73994, 0),
  (39598, 2, 73997, 0);

