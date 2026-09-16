-- skilllineability: 10 inserts, 33 updates, 0 deletes

-- New entries
/*
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(1221981, @AlliancePandarenRacials, @AlliancePandarenRacial1, @AlliancePandarenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(1221982, @AlliancePandarenRacials, @AlliancePandarenRacial2, @AlliancePandarenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(1221983, @AlliancePandarenRacials, @AlliancePandarenRacial3, @AlliancePandarenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(1221984, @AlliancePandarenRacials, @AlliancePandarenRacial4, @AlliancePandarenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
Bouncy: You take half falling damage.
Epicurean: Your love of food allows you to receive double the stats from Well Fed effects.
Gourmand: Your Cooking skill is increased by 5.
Inner Peace: Your rested experience bonus lasts twice as long as normal.
Quaking Palm: Strikes the target with lightning speed, incapacitating them for 4 sec, and turns off your attack.
*/
-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 590; -- Spell: 668 (Language: Common)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 3269; -- Spell: 3565 (Teleport: Darnassus)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 3270; -- Spell: 3562 (Teleport: Ironforge)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 3272; -- Spell: 3561 (Teleport: Stormwind)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 5989; -- Spell: 11419 (Portal: Darnassus)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 5990; -- Spell: 11416 (Portal: Ironforge)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 5992; -- Spell: 10059 (Portal: Stormwind)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 14815; -- Spell: 32271 (Teleport: Exodar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 14817; -- Spell: 32266 (Portal: Exodar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 15040; -- Spell: 33690 (Teleport: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 15041; -- Spell: 33691 (Portal: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 16999; -- Spell: 49359 (Teleport: Theramore)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 17004; -- Spell: 49360 (Portal: Theramore)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 20283; -- Spell: 60424 (Mekgineer's Chopper)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 20289; -- Spell: 60867 (Mekgineer's Chopper)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 21723; -- Spell: 75460 (N/A?)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AlliancePandarenMask WHERE `id` = 21724; -- Spell: 75461 (Flame Shock Passive)
