-- skilllineability: 10 inserts, 33 updates, 0 deletes

-- New entries
DELETE FROM `skilllineability` WHERE `id` = 21981;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21981, @WorgenRacials, @WorgenRacial1, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21982;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21982, @WorgenRacials, @WorgenRacial2, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21983;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21983, @WorgenRacials, @WorgenRacial3, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21984;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21984, @WorgenRacials, @WorgenRacial4, @WorgenMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21985;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21985, @GoblinRacials, @GoblinRacial1, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21986;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21986, @GoblinRacials, @GoblinRacial2, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21987;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21987, @GoblinRacials, @GoblinRacial3, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21988;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21988, @GoblinRacials, @GoblinRacial4, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 21989;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (21989, @GoblinRacials, @GoblinRacial5, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 31448;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (31448, @GoblinRacials, @GoblinRacial6, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0);

-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 590;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 592;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 3269;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 3270;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 3271;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 3272;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 3273;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 3274;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 5989;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 5990;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 5991;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 5992;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 5993;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 5994;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 13151;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 14815;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 14816;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 14817;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 14818;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 15040;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 15041;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 15606;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 15607;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 16999;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 17000;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 17003;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 17004;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 20110;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 20283;
UPDATE `skilllineability` SET `required_races` = `required_races` | @WorgenMask WHERE `id` = 20289;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 20290;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask | @WorgenMask WHERE `id` = 21723;
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask | @WorgenMask WHERE `id` = 21724;
