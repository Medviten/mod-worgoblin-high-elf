/* Ensures that faction-restricted items include worgen and goblins */
UPDATE item_template SET allowablerace = allowablerace|256 WHERE allowablerace & 2 AND allowablerace != -1 AND allowablerace != 2147483647 AND allowablerace != 2047 AND allowablerace != 4095 AND allowablerace != 8191 AND allowablerace != 16383 AND allowablerace != 32767 AND allowablerace != 65535 AND allowablerace != 131071 AND allowablerace != 262143 AND allowablerace != 524287 AND allowablerace != 1048575 AND allowablerace != 2097151;
UPDATE item_template SET allowablerace = allowablerace|2048 WHERE allowablerace & 1 AND allowablerace != -1 AND allowablerace != 2147483647 AND allowablerace != 2047 AND allowablerace != 4095 AND allowablerace != 8191 AND allowablerace != 16383 AND allowablerace != 32767 AND allowablerace != 65535 AND allowablerace != 131071 AND allowablerace != 262143 AND allowablerace != 524287 AND allowablerace != 1048575 AND allowablerace != 2097151;

/* Add racial mount items */
DELETE FROM `item_template` WHERE `entry` IN (62461, 62462, 73838, 73839);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(62461, 15, 5, -1, 'Goblin Trike Key', 134237, 3, 0, 0, 1, 10000, 2500, 0, -1, -1, 20, 20, 762, 75, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, -1, 0, -1, 330, 3000, 87090, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this mount. Summons and dismisses a rideable Goblin Trike.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340),
(62462, 15, 5, -1, 'Goblin Turbo-Trike Key', 134238, 4, 0, 0, 1, 100000, 25000, 0, -1, -1, 40, 40, 762, 150, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, -1, 0, -1, 330, 3000, 87091, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this mount. Summons and dismisses a rideable Goblin Turbo-Trike.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340),
(73838, 15, 5, -1, 'Mountain Horse', 132261, 3, 0, 0, 1, 10000, 2500, 0, -1, -1, 20, 20, 762, 75, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, -1, 0, -1, 330, 3000, 103195, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this mount. Summons and dismisses a rideable Mountain Horse.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340),
(73839, 15, 5, -1, 'Swift Mountain Horse', 132261, 4, 0, 0, 1, 100000, 25000, 0, -1, -1, 40, 40, 762, 150, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, -1, 0, -1, 330, 3000, 103196, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this mount. Summons and dismisses a rideable Swift Mountain Horse.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);

-- Allow high elves to obtain certain items and mounts
-- If humans can have it, high elves also can
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1029;/*name: Tablet of Serpent Totem, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1057;/*name: Tablet of Restoration III, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1122;/*name: Deprecated Amulet of the White Stallion, old mask: 415*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1123;/*name: Deprecated Amulet of the Pinto, old mask: 415*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1124;/*name: Deprecated Amulet of the Palomino, old mask: 415*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1125;/*name: Deprecated Amulet of the Nightmare, old mask: 415*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1133;/*name: Horn of the Winter Wolf, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 1134;/*name: Horn of the Gray Wolf, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2128;/*name: Scratched Claymore, old mask: 2047*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 2411;/*name: Black Stallion Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2412;/*name: Deprecated Nightmare Bridle, old mask: 415*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2413;/*name: Palomino, old mask: 415*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 2414;/*name: Pinto Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2415;/*name: White Stallion, old mask: 415*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2484;/*name: Small Knife, old mask: 2047*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2502;/*name: Scuffed Dagger, old mask: 2047*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 2556;/*name: Recipe: Elixir of Tongues, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 3144;/*name: Grimoire of Burning Spirit II, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 4143;/*name: Tome of Conjure Food II, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 4273;/*name: Codex of Heal, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 5000;/*name: Coral Band, old mask: 2047*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 5150;/*name: Book of Healing Touch III, old mask: 511*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 5655;/*name: Chestnut Mare Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 5656;/*name: Brown Horse Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 5657;/*name: Recipe: Instant Toxin, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 5660;/*name: Libram: Seal of Righteousness, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 5663;/*name: Horn of the Red Wolf, old mask: 223*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 5864;/*name: Gray Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 5872;/*name: Brown Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 5873;/*name: White Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 6516;/*name: Imp Summoning Scroll, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 6544;/*name: Voidwalker Summoning Scroll, old mask: 511*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 6623;/*name: Succubus Summoning Scroll, old mask: 511*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 8563;/*name: Red Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 8583;/*name: Horn of the Skeletal Mount, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 8589;/*name: Old Whistle of the Ivory Raptor, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 8590;/*name: Old Whistle of the Obsidian Raptor, old mask: 223*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 8595;/*name: Blue Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 8627;/*name: Reins of the Night saber, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 8628;/*name: Reins of the Spotted Nightsaber, old mask: 223*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 8629;/*name: Reins of the Striped Nightsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 8631;/*name: Reins of the Striped Frostsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 8632;/*name: Reins of the Spotted Frostsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 12302;/*name: Reins of the Ancient Frostsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 12303;/*name: Reins of the Nightsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 12353;/*name: White Stallion Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 12354;/*name: Palomino Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13086;/*name: Reins of the Winterspring Frostsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13321;/*name: Green Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13322;/*name: Unpainted Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13325;/*name: Fluorescent Green Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13326;/*name: White Mechanostrider Mod B, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13327;/*name: Icy Blue Mechanostrider Mod A, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13328;/*name: Black Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 13329;/*name: Frost Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 16338;/*name: Knight-Lieutenant's Steed, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 16339;/*name: Commander's Steed, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 16343;/*name: Blood Guard's Mount, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 16344;/*name: Lieutenant General's Mount, old mask: 223*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 17019;/*name: Arcane Dust, old mask: 2047*/
UPDATE item_template SET allowablerace = 8191 WHERE entry = 17027;/*name: Scented Candle, old mask: 2047*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18241;/*name: Black War Steed Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18242;/*name: Reins of the Black War Tiger, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18243;/*name: Black Battlestrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18244;/*name: Black War Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18766;/*name: Reins of the Swift Frostsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18767;/*name: Reins of the Swift Mistsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18772;/*name: Swift Green Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18773;/*name: Swift White Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18774;/*name: Swift Yellow Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18776;/*name: Swift Palomino, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18777;/*name: Swift Brown Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18778;/*name: Swift White Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18785;/*name: Swift White Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18786;/*name: Swift Brown Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18787;/*name: Swift Gray Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 18902;/*name: Reins of the Swift Stormsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25471;/*name: Ebon Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25472;/*name: Snowy Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25470;/*name: Golden Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25473;/*name: Swift Blue Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25527;/*name: Swift Red Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25528;/*name: Swift Green Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 25529;/*name: Swift Purple Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 28234;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 28235;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 28236;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 28237;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 28238;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 28481;/*name: Brown Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29227;/*name: Reins of the Cobalt War Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29229;/*name: Reins of the Silver War Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29230;/*name: Reins of the Tan War Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29231;/*name: Reins of the White War Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29465;/*name: Black Battlestrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29467;/*name: Black War Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29468;/*name: Black War Steed Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29471;/*name: Reins of the Black War Tiger, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29743;/*name: Purple Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29744;/*name: Gray Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29745;/*name: Great Blue Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29746;/*name: Great Green Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 29747;/*name: Great Purple Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 30348;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 30349;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 30350;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 30351;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 31830;/*name: Reins of the Cobalt Riding Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 31832;/*name: Reins of the Silver Riding Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 31834;/*name: Reins of the Tan Riding Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 31836;/*name: Reins of the White Riding Talbuk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 35906;/*name: Reins of the Black War Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 37864;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 40476;/*name: Insignia of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 42123;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 42124;/*name: Medallion of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 43956;/*name: Reins of the Black War Mammoth, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 43958;/*name: Reins of the Ice Mammoth, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 43959;/*name: Reins of the Grand Black War Mammoth, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 43961;/*name: Reins of the Grand Ice Mammoth, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44098;/*name: Inherited Insignia of the Alliance, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44223;/*name: Reins of the Black War Bear, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44225;/*name: Reins of the Armored Brown Bear, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44230;/*name: Reins of the Wooly Mammoth, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44235;/*name: Reins of the Traveler's Tundra Mammoth, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44413;/*name: Mekgineer's Chopper, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 44689;/*name: Armored Snowy Gryphon, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45125;/*name: Stormwind Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45586;/*name: Ironforge Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45589;/*name: Gnomeregan Mechanostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45590;/*name: Exodar Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45591;/*name: Darnassian Nightsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45666;/*name: Ironforge Doublet, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45667;/*name: Stormwind Doublet, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45668;/*name: Exodar Doublet, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45670;/*name: Darnassus Doublet, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 45671;/*name: Gnomeregan Doublet, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46744;/*name: Swift Moonsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46745;/*name: Great Red Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46747;/*name: Turbostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46748;/*name: Swift Violet Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46752;/*name: Swift Gray Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46756;/*name: Great Red Elekk, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46758;/*name: Swift Gray Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46759;/*name: Swift Moonsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46762;/*name: Swift Violet Ram, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46763;/*name: Turbostrider, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46815;/*name: Quel'dorei Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46970;/*name: Drape of the Untamed Predator, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 46971;/*name: Drape of the Untamed Predator, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47089;/*name: Cloak of Displacement, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47095;/*name: Cloak of Displacement, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47100;/*name: Reins of the Striped Dawnsaber, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47105;/*name: The Executioner's Malice, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47110;/*name: The Executioner's Malice, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47149;/*name: Signet of the Traitor King, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47157;/*name: Signet of the Traitor King, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47223;/*name: Ring of the Darkmender, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47224;/*name: Ring of the Darkmender, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47570;/*name: Saronite Swordbreakers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47572;/*name: Titanium Spikeguards, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47574;/*name: Sunforged Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47576;/*name: Crusader's Dragonscale Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47579;/*name: Black Chitin Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47581;/*name: Bracers of Swift Death, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47583;/*name: Moonshadow Armguards, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47585;/*name: Bejeweled Wizard's Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47587;/*name: Royal Moonshroud Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47589;/*name: Titanium Razorplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47591;/*name: Breastplate of the White Knight, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47593;/*name: Sunforged Breastplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47595;/*name: Crusader's Dragonscale Breastplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47597;/*name: Ensorcelled Nerubian Breastplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47599;/*name: Knightbane Carapace, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47602;/*name: Lunar Eclipse Robes, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47603;/*name: Merlin's Robe, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47605;/*name: Royal Moonshroud Robe, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47622;/*name: Plans: Breastplate of the White Knight, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47623;/*name: Plans: Saronite Swordbreakers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47624;/*name: Plans: Titanium Razorplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47625;/*name: Plans: Titanium Spikeguards, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47626;/*name: Plans: Sunforged Breastplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47627;/*name: Plans: Sunforged Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47628;/*name: Pattern: Ensorcelled Nerubian Breastplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47629;/*name: Pattern: Black Chitin Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47630;/*name: Pattern: Crusader's Dragonscale Breastplate, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47631;/*name: Pattern: Crusader's Dragonscale Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47632;/*name: Pattern: Lunar Eclipse Robes, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47633;/*name: Pattern: Moonshadow Armguards, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47634;/*name: Pattern: Knightbane Carapace, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47635;/*name: Pattern: Bracers of Swift Death, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47654;/*name: Pattern: Bejeweled Wizard's Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47655;/*name: Pattern: Merlin's Robe, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47656;/*name: Pattern: Royal Moonshroud Bracers, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 47657;/*name: Pattern: Royal Moonshroud Robe, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 49044;/*name: Swift Alliance Steed, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 49096;/*name: Crusader's White Warhorse, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 49289;/*name: Little White Stallion Bridle, old mask: 1101*/
UPDATE item_template SET allowablerace = 7245 WHERE entry = 51377;/*name: Medallion of the Alliance, old mask: 1101*/
