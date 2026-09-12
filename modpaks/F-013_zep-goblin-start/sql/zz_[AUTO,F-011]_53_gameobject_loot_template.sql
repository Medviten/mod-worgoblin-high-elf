-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 gameobject_loot_template (one file per table; rows carry final state)

DELETE FROM gameobject_loot_template WHERE Entry IN (195201,201974,202351,202552,202553,202554,202607,202608);
DELETE FROM gameobject_loot_template WHERE Entry=195492;
DELETE FROM gameobject_loot_template WHERE Entry IN (195515,195516,195518,201603,201798,202865);

INSERT INTO gameobject_loot_template (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
  (195201, 84300, 0, 100, 1, 1, 0, 1, 1),
  (201974, 84312, 0, 100, 1, 1, 0, 1, 1),
  (202351, 84321, 0, 99.999, 1, 1, 0, 1, 1),
  (202552, 84331, 0, 7.3, 1, 1, 0, 1, 1),
  (202552, 84332, 0, 100, 1, 1, 0, 1, 1),
  (202553, 84331, 0, 100, 1, 1, 0, 1, 1),
  (202554, 84331, 0, 100, 1, 1, 0, 1, 1),
  (202607, 84333, 0, 100, 1, 1, 0, 1, 1),
  (202608, 84333, 0, 100, 1, 1, 0, 1, 1),
  (195492, 84467, 0, 100, 1, 1, 0, 1, 1),
  (195515, 84469, 0, 100, 1, 1, 0, 1, 1),
  (195516, 84470, 0, 100, 1, 1, 0, 1, 1),
  (195518, 84471, 0, 100, 1, 1, 0, 1, 1),
  (201603, 84472, 0, 100, 1, 1, 0, 1, 1),
  (201798, 84474, 0, 99.954, 0, 1, 0, 1, 3),
  (202865, 84492, 0, 100, 1, 1, 0, 1, 1);

