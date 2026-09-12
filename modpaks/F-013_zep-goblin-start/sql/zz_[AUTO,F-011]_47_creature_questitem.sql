-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 creature_questitem (one file per table; rows carry final state)

DELETE FROM creature_questitem WHERE CreatureEntry = 36103;
DELETE FROM creature_questitem WHERE CreatureEntry = 36129;
DELETE FROM creature_questitem WHERE CreatureEntry = 36348;
DELETE FROM creature_questitem WHERE CreatureEntry = 36681;
DELETE FROM creature_questitem WHERE CreatureEntry = 38359;
DELETE FROM creature_questitem WHERE CreatureEntry = 38360;
DELETE FROM creature_questitem WHERE CreatureEntry = 38813;
DELETE FROM creature_questitem WHERE CreatureEntry = 38845;
DELETE FROM creature_questitem WHERE CreatureEntry = 39141;
DELETE FROM creature_questitem WHERE CreatureEntry = 39142;
DELETE FROM creature_questitem WHERE CreatureEntry = 39143;
DELETE FROM creature_questitem WHERE CreatureEntry = 39193;
DELETE FROM creature_questitem WHERE CreatureEntry = 39354;
DELETE FROM creature_questitem WHERE CreatureEntry = 39363;
DELETE FROM creature_questitem WHERE CreatureEntry = 39376;
DELETE FROM creature_questitem WHERE CreatureEntry = 39426;
DELETE FROM creature_questitem WHERE CreatureEntry = 35126;
DELETE FROM creature_questitem WHERE CreatureEntry = 35128;
DELETE FROM creature_questitem WHERE CreatureEntry = 35130;
DELETE FROM creature_questitem WHERE CreatureEntry = 35234;

INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
  (35126, 0, 84463, 0),
  (35128, 0, 84464, 0),
  (35130, 0, 84465, 0),
  (35234, 0, 84466, 0),
  (36103, 0, 84304, 0),
  (36129, 0, 84304, 0),
  (36348, 0, 84304, 0),
  (36681, 0, 84314, 0),
  (38359, 0, 84315, 0),
  (38360, 0, 84315, 0),
  (38813, 0, 84321, 0),
  (38845, 0, 84323, 0),
  (39141, 0, 84327, 0),
  (39142, 0, 84328, 0),
  (39143, 0, 84329, 0),
  (39193, 0, 84331, 0),
  (39193, 1, 84332, 0),
  (39354, 0, 84333, 0),
  (39363, 0, 84334, 0),
  (39376, 0, 84336, 0),
  (39426, 0, 84335, 0);

