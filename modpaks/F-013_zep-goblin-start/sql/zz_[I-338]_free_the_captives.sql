-- I-338 "Free the Captives" (24925) — the summoned Oomlot Shaman 38644 drops nothing.
--
-- ROOT CAUSE: the gen's loot pass only reaches entries that have rows in `creature`, and 38644
-- has none — it is summoned by the Goblin Captive (38643) via spell 72243, never spawned. It is
-- the ONLY loot table the donor has that we do not ship: across all 345 F-011 templates the
-- donor carries 51 creature_loot_template entries and we ship 51, but ours is 38644-for-38224
-- (F-032 mechachicken). Every other Lost Isles mob with no loot has none in the donor either,
-- and none in TrinityCore's 4.3.4 dump — they are correctly empty, not missed.
-- Same failure mode as [[reference_summon_only_go_never_ported]]: summon-only = invisible to a
-- spawn-keyed collector pass.
--
-- Rows below are the donor's own table for 38644 (88 of 93 item rows, 6 of 7 pickpocket
-- rows), filtered to items that exist in our 3.3.5 item_template. Dropped as Cata-only:
-- 50438, 50381, 55983, 49626, 49627 (loot) and 50438 (pickpocket).
-- Note this is NOT 38574's table — the quest shaman has its own, headed by Linen Cloth 2589 at
-- 59.24% (1-2) against the ambient shaman's 44.04%.
--
-- mingold/maxgold stay 0. The donor has 13 copper on this creature, but `creatures.py` zeroes
-- money zone-wide for F-073 compliance (no sub-1g drops); this file does not reopen that.
--
-- creature_loot_template / pickpocketing_loot_template Entry 38644 is ours (the AUTO files
-- DELETE only the entries they ship), so DELETE + INSERT. creature_template 38644 is
-- [AUTO,F-011]-owned, so UPDATE.

DELETE FROM creature_loot_template WHERE Entry = 38644;
INSERT INTO creature_loot_template (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
  (38644, 2589, 0, 59.243, 0, 1, 0, 1, 2, ' Oomlot Shaman'),
  (38644, 117, 0, 5.341, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 159, 0, 2.366, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 774, 0, 1.455, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 118, 0, 1.353, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1412, 0, 0.676, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1416, 0, 0.572, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1414, 0, 0.549, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2138, 0, 0.549, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2773, 0, 0.54, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2774, 0, 0.522, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1417, 0, 0.509, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1411, 0, 0.503, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1419, 0, 0.464, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 818, 0, 0.456, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1413, 0, 0.453, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1422, 0, 0.435, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1431, 0, 0.433, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1415, 0, 0.43, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1418, 0, 0.422, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1423, 0, 0.417, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 3373, 0, 0.417, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1420, 0, 0.401, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1425, 0, 0.399, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1429, 0, 0.398, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 8177, 0, 0.398, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1430, 0, 0.393, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2212, 0, 0.39, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 766, 0, 0.389, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1427, 0, 0.389, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2643, 0, 0.389, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1433, 0, 0.385, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2645, 0, 0.353, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 8182, 0, 0.351, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 3190, 0, 0.342, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 3370, 0, 0.34, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2646, 0, 0.339, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2635, 0, 0.337, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2642, 0, 0.33, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2213, 0, 0.314, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 767, 0, 0.299, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 3189, 0, 0.297, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2648, 0, 0.294, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 768, 0, 0.17, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4563, 0, 0.163, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 3609, 0, 0.155, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4562, 0, 0.154, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4560, 0, 0.143, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 8181, 0, 0.143, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2598, 0, 0.136, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4565, 0, 0.136, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 8179, 0, 0.12, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 5571, 0, 0.106, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 5572, 0, 0.104, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 727, 0, 0.095, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4496, 0, 0.087, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 828, 0, 0.077, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 805, 0, 0.075, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 8178, 0, 0.071, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 8180, 0, 0.052, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4561, 0, 0.043, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2140, 0, 0.025, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2070, 0, 0.022, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2555, 0, 0.018, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4408, 0, 0.018, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 3610, 0, 0.013, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 6303, 0, 0.013, 0, 1, 0, 1, 2, ' Oomlot Shaman'),
  (38644, 7288, 0, 0.013, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 67256, 0, 0.013, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 67252, 0, 0.012, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 67257, 0, 0.012, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2407, 0, 0.01, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 6271, 0, 0.01, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2406, 0, 0.009, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1697, 0, 0.007, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 6342, 0, 0.006, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1696, 0, 0.004, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2408, 0, 0.004, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2553, 0, 0.003, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2924, 0, 0.003, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 5361, 0, 0.003, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 9745, 0, 0.003, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1210, 0, 0.001, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2287, 0, 0.001, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 4566, 0, 0.001, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 5363, 0, 0.001, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 6150, 0, 0.001, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 9752, 0, 0.001, 0, 1, 0, 1, 1, ' Oomlot Shaman');

DELETE FROM pickpocketing_loot_template WHERE Entry = 38644;
INSERT INTO pickpocketing_loot_template (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
  (38644, 5369, 0, 17.255, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2287, 0, 13.939, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 858, 0, 4.145, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 818, 0, 1.75, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 1210, 0, 1.136, 0, 1, 0, 1, 1, ' Oomlot Shaman'),
  (38644, 2589, 0, 0.307, 0, 1, 0, 1, 2, ' Oomlot Shaman');

UPDATE creature_template SET
  `lootid` = 38644,
  `pickpocketloot` = 38644
WHERE `entry` = 38644;
