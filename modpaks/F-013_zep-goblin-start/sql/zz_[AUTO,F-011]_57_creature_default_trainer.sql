-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 creature_default_trainer (one file per table; rows carry final state)

DELETE FROM creature_default_trainer WHERE CreatureId IN (35758,35778,35780,35786,35805,35806,35807,36518,36519,36520,36521,36523,36524,36525,36615,38122,38513,38514,38515,38516,38517,38518,45286,366150);
DELETE FROM creature_default_trainer WHERE CreatureId IN (34673,34689,34692,34693,34695,34696,34697);

INSERT INTO creature_default_trainer (`CreatureId`, `TrainerId`) VALUES
  (35758, 7),
  (35778, 31),
  (35780, 16),
  (35786, 14),
  (35805, 11),
  (35806, 9),
  (35807, 1),
  (36518, 7),
  (36519, 31),
  (36520, 16),
  (36521, 14),
  (36523, 11),
  (36524, 9),
  (36525, 1),
  (36615, 645),
  (38122, 7),
  (38513, 31),
  (38514, 16),
  (38515, 14),
  (38516, 11),
  (38517, 9),
  (38518, 1),
  (45286, 6623),
  (366150, 645),
  (34673, 7),
  (34689, 16),
  (34692, 11),
  (34693, 9),
  (34695, 14),
  (34696, 31),
  (34697, 1);

