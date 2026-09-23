-- skilllineability: 1 inserts, 27 updates, 0 deletes

-- New entries (racials will go here)
-- DELETE FROM `skilllineability` WHERE `id` = 31463;
-- INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (31463, @OgreRacials, spellID, @OgreMask, @AllClassMask, 0, 0, 1, 0, 2, 0, 0, 0, 0);
/*
-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @OrcishSkillLineAbilityHorde;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @TeleportOrgrimmarSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @TeleportThunderBluffSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @TeleportUndercitySkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @PortalOrgrimmarSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @PortalThunderBluffSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @PortalUndercitySkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @BloodlustSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @JudgementofBloodSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @TeleportSilvermoonSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @PortalSilvermoonSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @SummonChargerSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @SummonWarhorseSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @TeleportShattrathSkillLineAbilityHorde;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @PortalShattrathSkillLineAbilityHorde;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @TeleportStonardSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @PortalStonardSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @JudgementofCorruptionSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @SealofCorruptionSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @BloodCorruptionSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @MechanoHogSkillLineAbility1;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @MechanoHogSkillLineAbility2;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @ActivatePrimarySpec;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @ActivateSecondarySpec;
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = 21723; -- Assassination SkillLine, Spell 75460 (N/A)
UPDATE `skilllineability` SET `required_races` = `required_races` | @OgreMask WHERE `id` = @FlameShockPassiveSkillLineAbility;
*/