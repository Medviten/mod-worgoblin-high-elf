-- skilllineability: 1 inserts, 27 updates, 0 deletes

-- New entries (racials will go here)
-- DELETE FROM `skilllineability` WHERE `id` = 31463;
-- INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (31463, @OgreRacials, spellID, @OgreMask, @AllClassMask, 0, 0, 1, 0, 2, 0, 0, 0, 0);

-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 592;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 3271;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 3273;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 3274;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 5991;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 5993;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 5994;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 13151;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 14784;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 14787;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 14816;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 14818;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 15252;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 15253;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 15606;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 15607;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 17000;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 17003;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 18308;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 18311;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 18314;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 20110;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 20290;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 20867;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 20868;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 21723;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 21724;
