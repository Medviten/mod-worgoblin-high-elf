-- ============================================================
-- F-199  Kezan gathering: Linen Cloth on the Kezan humanoids
-- ============================================================
-- The Kezan humanoid loot tables came straight from the Cata sniff, where the
-- interesting rows are all sub-1% (Rebellious Troll already carried Linen Cloth
-- 2589 -- at 0.011%). With no cloth in practice, Tailoring and First Aid had
-- nothing to start on before leaving the island.
--
-- Adds Linen Cloth at a normal low-level humanoid rate to the four hostile
-- humanoid types that actually spawn in Kezan in numbers:
--   35234 Hired Looter          lvl 3-4   85 spawns  (KTC HQ / streets)
--   35200 Pirate Party Crasher  lvl 3-4   68 spawns  (the villa party)
--   35609 Villa Mook            lvl 3-4   19 spawns  (Gallywix's villa)
--   35294 Rebellious Troll      lvl 3-4   16 spawns  (the Kaja'mine)
--
-- Deliberately NOT included: 34830 Defiant Troll is a whip/spellclick quest
-- target (npc_spellclick_spells 66306, unit_flags 33024), not a kill mob; the
-- friendly-faction Villa Mook/Citizen/Partygoer duplicates are non-hostile.
--
-- Item-scoped DELETE + INSERT: `zep goblin gen` owns these Entry rows in
-- zz_[AUTO,F-011]_50_creature_loot_template.sql (DELETE-by-entry + re-insert),
-- so this override must only claim its own Item row. It sorts after the AUTO
-- file and re-applies with it through the I-244 cascade.

DELETE FROM `creature_loot_template` WHERE `Entry` IN (35234, 35200, 35609, 35294) AND `Item` = 2589;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
  (35234, 2589, 0, 25, 0, 1, 0, 1, 2, 'F-199 Hired Looter - Linen Cloth'),
  (35200, 2589, 0, 25, 0, 1, 0, 1, 2, 'F-199 Pirate Party Crasher - Linen Cloth'),
  (35609, 2589, 0, 25, 0, 1, 0, 1, 2, 'F-199 Villa Mook - Linen Cloth'),
  (35294, 2589, 0, 25, 0, 1, 0, 1, 2, 'F-199 Rebellious Troll - Linen Cloth');
