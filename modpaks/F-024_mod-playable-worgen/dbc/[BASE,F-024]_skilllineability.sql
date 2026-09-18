-- skilllineability: 10 inserts, 33 updates, 0 deletes

-- New entries
DELETE FROM `skilllineability` WHERE `id` BETWEEN 21981 AND 21989; -- Worgen and Goblin racials
DELETE FROM `skilllineability` WHERE `id` = 31448; -- Rocket Jump
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(21981, @WorgenRacials, @WorgenRacial1, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21982, @WorgenRacials, @WorgenRacial2, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21983, @WorgenRacials, @WorgenRacial3, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21984, @WorgenRacials, @WorgenRacial4, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21985, @GoblinRacials, @GoblinRacial1, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21986, @GoblinRacials, @GoblinRacial2, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21987, @GoblinRacials, @GoblinRacial3, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21988, @GoblinRacials, @GoblinRacial4, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21989, @GoblinRacials, @GoblinRacial5, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(31448, @GoblinRacials, @GoblinRacial6, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0); -- Spell: Rocket Jump

-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 590; -- Spell: 668 (Language: Common)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 592; -- Spell: 669 (Language: Orcish)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 3269; -- Spell: 3565 (Teleport: Darnassus)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 3270; -- Spell: 3562 (Teleport: Ironforge)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 3271; -- Spell: 3567 (Teleport: Orgrimmar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 3272; -- Spell: 3561 (Teleport: Stormwind)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 3273; -- Spell: 3566 (Teleport: Thunder Bluff)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 3274; -- Spell: 3563 (Teleport: Undercity)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 5989; -- Spell: 11419 (Portal: Darnassus)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 5990; -- Spell: 11416 (Portal: Ironforge)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 5991; -- Spell: 11417 (Portal: Orgrimmar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 5992; -- Spell: 10059 (Portal: Stormwind)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 5993; -- Spell: 11420 (Portal: Thunder Bluff)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 5994; -- Spell: 11418 (Portal: Undercity)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 13151; -- Spell: 2825 (Bloodlust)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 14815; -- Spell: 32271 (Teleport: Exodar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 14816; -- Spell: 32272 (Teleport: Silvermoon)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 14817; -- Spell: 32266 (Portal: Exodar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 14818; -- Spell: 32267 (Portal: Silvermoon)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 15040; -- Spell: 33690 (Teleport: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 15041; -- Spell: 33691 (Portal: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 15606; -- Spell: 35715 (Teleport: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 15607; -- Spell: 35717 (Portal: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 16999; -- Spell: 49359 (Teleport: Theramore)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 17000; -- Spell: 49358 (Teleport: Stonard)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 17003; -- Spell: 49361 (Portal: Stonard)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 17004; -- Spell: 49360 (Portal: Theramore)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 20110; -- Spell: 55531 (Mechano-hog)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 20283; -- Spell: 60424 (Mekgineer's Chopper)
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 20289; -- Spell: 60867 (Mekgineer's Chopper)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 20290; -- Spell: 60866 (Mechano-hog)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask | @WorgenMask WHERE `id` = 21723; -- Spell: 75460 (N/A?)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask | @WorgenMask WHERE `id` = 21724; -- Spell: 75461 (Flame Shock Passive)
