-- [I-236] F-011 goblin loot items collide with F-013/F-179 AUTO ranges -- override for generated loot.
-- Creature loot referenced Cata items 62328/62512/62514/62525 (F-013 Outland-Heroic range
-- 62200-63199) and 67252/67256/67257 (F-179 Azeroth-Heroic-Scaled range 66300-69299) that are
-- MISSING from the Neltharion source item_template, so the goblin-port loot remap had nothing to
-- relocate and left the raw refs -- which the F-013/F-179 AUTO generators later claimed, making
-- ~35 low-level goblin mobs drop ilvl-66/130 epics. Items (grey vendor-trash) recovered from
-- retail/Whitemane ItemSparse into F-011's block; the generated loot refs are repointed here.
-- Icons resolved from client data (IconFileDataID -> client listfile -> ItemDisplayInfo, via
-- cli/lib/icon_resolver.py), not hand-picked. This file loads AFTER zz_[F-011]_*_loot_creatures.sql
-- (I > F) and overrides it. Sibling of zz_[I-236]_quest_item_f013_conflict_fix.sql.
--
-- PREFERRED long-term fix (retires this override): add 62328/62512/62514/62525/67252/67256/67257
-- to migrate_items' missing-set so they are ported from ItemSparse and migrate_loot's remap
-- repoints the refs automatically. Override is required only while the items cannot be sourced
-- from a regen (source scratch data unavailable here).

-- 62328 -> 84507  Shed Fur (junk; was "Knuckles of Contesting Place" F-013 epic)
DELETE FROM item_template WHERE entry = 84507;
INSERT INTO item_template SET
  `entry` = 84507,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Shed Fur',
  `displayid` = 18092,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 4,
  `SellPrice` = 1,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 8,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 62512 -> 84508  Small Animal Bone (junk; was "Cuffs of Official Catch" F-013 epic)
DELETE FROM item_template WHERE entry = 84508;
INSERT INTO item_template SET
  `entry` = 84508,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Small Animal Bone',
  `displayid` = 1515,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 4,
  `SellPrice` = 1,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 4,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 62514 -> 84509  Cracked Pincer (junk; was "Naturalistic Necklace of Town" F-013 epic)
DELETE FROM item_template WHERE entry = 84509;
INSERT INTO item_template SET
  `entry` = 84509,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Cracked Pincer',
  `displayid` = 2627,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 4,
  `SellPrice` = 1,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 3,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 62525 -> 84510  Cloudy Crocolisk Eye (junk; was "Chestguard of Contest" F-013 epic)
DELETE FROM item_template WHERE entry = 84510;
INSERT INTO item_template SET
  `entry` = 84510,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Cloudy Crocolisk Eye',
  `displayid` = 920,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 4,
  `SellPrice` = 1,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 4,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- ---- Second wave: same bug against the F-179 AUTO range (67200-68199 Azeroth Heroic
-- ---- Scaled Dungeon Loot). Raw Cata 67252/67256/67257 (Kaja'mite grey junk) shipped
-- ---- unremapped and F-179 AUTO later minted epics on them. 63 loot rows repointed. (I-236)

-- 67252 -> 84511  Kaja'mite Flakes (junk; was "Cloak of the Coming Night" F-179 epic)
DELETE FROM item_template WHERE entry = 84511;
INSERT INTO item_template SET
  `entry` = 84511,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Kaja''mite Flakes',
  `displayid` = 26571,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 396,
  `SellPrice` = 99,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 3,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 67256 -> 84512  Kaja'mite Dust (junk; was "Battle-mace of the High Priestess" F-179 epic)
DELETE FROM item_template WHERE entry = 84512;
INSERT INTO item_template SET
  `entry` = 84512,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Kaja''mite Dust',
  `displayid` = 20611,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 396,
  `SellPrice` = 99,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 3,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 67257 -> 84513  Kaja'mite Powder (junk; was "Gauntlets of the Tranquil Waves" F-179 epic)
DELETE FROM item_template WHERE entry = 84513;
INSERT INTO item_template SET
  `entry` = 84513,
  `class` = 15,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Kaja''mite Powder',
  `displayid` = 34578,
  `Quality` = 0,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 396,
  `SellPrice` = 99,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 0,
  `stackable` = 20,
  `bonding` = 0,
  `Material` = 3,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- repoint the generated loot refs (override the raw ids emitted by migrate_loot.py),
-- scoped to F-011 creature loot tables so F-013/F-179's own rows are untouched.
UPDATE creature_loot_template SET Item=84507 WHERE Item=62328 AND Entry IN (34865,35294,35812,36103,36149,38360);
UPDATE creature_loot_template SET Item=84508 WHERE Item=62512 AND Entry IN (38187);
UPDATE creature_loot_template SET Item=84509 WHERE Item=62514 AND Entry IN (38811,39193);
UPDATE creature_loot_template SET Item=84510 WHERE Item=62525 AND Entry IN (35200);
UPDATE creature_loot_template SET Item=84511 WHERE Item=67252 AND Entry IN (34699,35812,35904,36092,36103,36149,36719,36732,36740,38187,38359,38360,38574,38575,38809,38810,38811,38850,39193,39354,40064);
UPDATE creature_loot_template SET Item=84512 WHERE Item=67256 AND Entry IN (34699,35812,35838,35904,36092,36103,36129,36149,36719,36740,38187,38359,38360,38574,38575,38696,38809,38811,39193,39354,39449,40064);
UPDATE creature_loot_template SET Item=84513 WHERE Item=67257 AND Entry IN (34699,35812,35904,36092,36103,36149,36719,36740,38187,38359,38360,38574,38575,38696,38808,38811,38845,39193,39354,40064);
