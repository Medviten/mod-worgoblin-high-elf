-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 gameobject_questitem (one file per table; rows carry final state)

DELETE FROM gameobject_questitem WHERE GameObjectEntry = 195201;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 195492;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 201974;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202351;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202552;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202553;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202554;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202607;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202608;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 195489;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 195515;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 195516;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 195518;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 201603;
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 202865;

INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
  (195201, 0, 84300, 0),
  (195489, 0, 84467, 0),
  (195492, 0, 84467, 0),
  (195515, 0, 84469, 0),
  (195516, 0, 84470, 0),
  (195518, 0, 84471, 0),
  (201603, 0, 84472, 0),
  (201974, 0, 84312, 0),
  (202351, 0, 84321, 0),
  (202552, 0, 84331, 0),
  (202552, 1, 84332, 0),
  (202553, 0, 84331, 0),
  (202553, 1, 84332, 0),
  (202554, 0, 84331, 0),
  (202554, 1, 84332, 0),
  (202607, 0, 84333, 0),
  (202608, 0, 84333, 0),
  (202865, 0, 84492, 0);

