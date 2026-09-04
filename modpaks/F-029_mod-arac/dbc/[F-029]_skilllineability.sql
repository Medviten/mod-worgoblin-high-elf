-- [F-029] mod-arac: skilllineability: 0 inserts, 38 updates, 0 deletes

CREATE TEMPORARY TABLE `excluded_race_masks` (
    `race_mask` BIGINT UNSIGNED PRIMARY KEY
);

INSERT INTO `excluded_race_masks` (`race_mask`) VALUES
    (4294967295),
    (2047),
    (4095),
    (16383),
    (32767),
    (65535),
    (131071),
    (262143),
    (524287),
    (1048575),
    (2097151);

-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 7594 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 12518 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 13151 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @BloodElfMask, `required_classes` = `required_classes` | @ManaClassMask & ~@DruidMask WHERE `id` = 14013 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @WarriorMask | @PaladinMask | @HunterMask | @RogueMask | @DeathKnightMask WHERE `id` = 14022 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @PriestMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask WHERE `id` = 14023 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 14779 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 14784 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 14787 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 14788 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 14795 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @PriestMask | @MageMask | @WarlockMask WHERE `id` = 15034 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @PaladinMask | @ShamanMask | @DruidMask WHERE `id` = 15035 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 15252 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 15253 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @BloodElfMask WHERE `id` = 17510 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 18299 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 18308 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 18311 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 18314 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 20089 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 20090 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = 20091 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask  WHERE `id` = 20092 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = `required_races` | @Draenei WHERE `id` = 20171 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_classes` = 0 WHERE `id` = 20665 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 756, `spell_id` = 80865, `required_races` = @BloodElfMask, `acquire_method` = 2 WHERE `id` = 20684 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 756, `spell_id` = 80866, `required_races` = @BloodElfMask, `required_classes` = @DruidMask, `acquire_method` = 2 WHERE `id` = 20685 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 756, `spell_id` = 80867, `required_races` = @BloodElfMask, `required_classes` = @DruidMask, `acquire_method` = 2 WHERE `id` = 20686 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 756, `spell_id` = 80868, `required_races` = @BloodElfMask, `required_classes` = @WarriorMask, `acquire_method` = 2 WHERE `id` = 20687 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 760, `spell_id` = 80869, `required_races` = @DraeneiMask, `required_classes` = @DruidMask, `acquire_method` = 2 WHERE `id` = 20688 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 760, `spell_id` = 80870, `required_races` = @DraeneiMask, `required_classes` = @RogueMask, `acquire_method` = 2 WHERE `id` = 20689 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 760, `spell_id` = 80871, `required_races` = @DraeneiMask, `required_classes` = @WarlockMask, `acquire_method` = 2 WHERE `id` = 20690 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 760, `spell_id` = 80872, `required_races` = @DraeneiMask, `required_classes` = @DruidMask, `acquire_method` = 2 WHERE `id` = 20691 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 760, `spell_id` = 80873, `required_races` = @DraeneiMask, `required_classes` = @RogueMask, `acquire_method` = 2 WHERE `id` = 20692 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `skill_line` = 760, `spell_id` = 80874, `required_races` = @DraeneiMask, `required_classes` = @WarlockMask, `acquire_method` = 2 WHERE `id` = 20693 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = 0 WHERE `id` = 20867 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
UPDATE `skilllineability` SET `required_races` = 0 WHERE `id` = 20868 AND `required_races` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`);
