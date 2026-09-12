-- [I-236] F-011 quest items collide with F-013 AUTO range -- override for generated quest_template.
-- Quests 14138 (StartItem + RequiredItemId1) and 25265 (RewardChoiceItemID3) reference Cata items
-- 60203/62335 that are MISSING from the Neltharion source item_template, so the goblin-port remap
-- had nothing to relocate and left the raw refs -- which F-013 AUTO (60200-63199) later claimed.
-- Items recovered from retail/Whitemane ItemSparse into F-011's block; the generated refs are
-- repointed here. This file loads AFTER zz_[F-011]_*_quests_01_template.sql (I > F) and overrides it.
--
-- PREFERRED long-term fix (retires this override): add 60203/62335 to migrate_items' missing-set so
-- they are ported from ItemSparse and migrate_quests' rm() remaps the refs automatically. Override is
-- required only while the items cannot be sourced from a regen (source scratch data unavailable here).

-- 60203 -> 84505  Sassy's Incentive (quest item)
DELETE FROM item_template WHERE entry = 84505;
INSERT INTO item_template SET
  `entry` = 84505,
  `class` = 12,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Sassy''s Incentive',
  `displayid` = 2533,
  `Quality` = 1,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 0,
  `SellPrice` = 0,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 1,
  `stackable` = 1,
  `bonding` = 4,
  `description` = 'It''s ticking! Sassy is ruthless!!!',
  `Material` = 0,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 62335 -> 84506  Thrall's Gift (rare leather wrist)
DELETE FROM item_template WHERE entry = 84506;
INSERT INTO item_template SET
  `entry` = 84506,
  `class` = 4,
  `subclass` = 2,
  `SoundOverrideSubclass` = -1,
  `name` = 'Thrall''s Gift',
  `displayid` = 17170,
  `Quality` = 3,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 570,
  `SellPrice` = 114,
  `InventoryType` = 9,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 12,
  `RequiredLevel` = 1,
  `maxcount` = 0,
  `stackable` = 1,
  `stat_type1` = 3,
  `stat_value1` = 3,
  `armor` = 29,
  `bonding` = 1,
  `Material` = 8,
  `sheath` = 0,
  `MaxDurability` = 30,
  -- rare (quality 3) ilvl 12 -> stock disenchant tier 41 / enchanting 25, matching
  -- what the items emitter now derives for the [AUTO,F-011] rows
  `DisenchantID` = 41,
  `RequiredDisenchantSkill` = 25,
  `VerifiedBuild` = 0;

-- repoint the generated quest refs (override the raw 60203/62335 emitted by migrate_quests.py)
UPDATE quest_template SET StartItem = 84505, RequiredItemId1 = 84505 WHERE ID = 14138;
UPDATE quest_template SET RewardChoiceItemID3 = 84506 WHERE ID = 25265;
