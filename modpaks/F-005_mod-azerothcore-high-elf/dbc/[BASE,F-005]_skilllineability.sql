-- [F-031] mod-azerothcore-high-elf: skilllineability: 35 inserts, 61 updates, 0 deletes

-- New entries
DELETE FROM `skilllineability` WHERE `id` IN (31463, 31464, 31465, 31466, 31467);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(31463, @HighElfRacials, @HighElfRacial1, @HighElfMask, @NonDKMask,       0, 0, 1, 0, 2, 0, 0, 0, 0),
(31464, @HighElfRacials, @HighElfRacial2, @HighElfMask, 0,                0, 0, 1, 0, 2, 0, 0, 0, 0),
(31465, @HighElfRacials, @HighElfRacial3, @HighElfMask, @DeathKnightMask, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(31466, @HighElfRacials, @HighElfRacial4, @HighElfMask, 0,                0, 0, 1, 0, 2, 0, 0, 0, 0),
(31467, @HighElfRacials, @HighElfRacial5, @HighElfMask, 0,                0, 0, 1, 0, 2, 0, 0, 0, 0);

/*
-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @CommonSkillLineAbilityAlliance;
-- UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @OrcishSkillLineAbilityHorde; -- It worked even with this, IDK why.
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @ThalassianSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @TeleportDarnassusSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @TeleportIronforgeSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @TeleportStormwindSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @PortalDarnassusSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @PortalIronforgeSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @PortalStormwindSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @WarhorseSkillLineAbility1; -- Spell: 13819 (Warhorse)
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @ChargerSkillLineAbility1; -- Spell: 23214 (Charger)
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @HolyVengeanceSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @JudgementofVengeanceSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @HeroismSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @TeleportExodarSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @PortalExodarSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @TeleportShattrathSkillLineAbilityAlliance;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @PortalShattrathSkillLineAbilityAlliance;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @TeleportTheramoreSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @PortalTheramoreSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @JudgementoftheMartyrSkillLineAbility;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @ChargerSkillLineAbility2; -- Spell: 23214 (Charger)
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @WarhorseSkillLineAbility2; -- Spell: 13819 (Warhorse)
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @MekgineersChopperSkillLineAbility1;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @MekgineersChopperSkillLineAbility2;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @ActivatePrimarySpec;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @ActivateSecondarySpec;
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = 21723; -- Assassination, Spell: 75460 (N/A)
UPDATE `skilllineability` SET `required_races` = `required_races` | @HighElfMask WHERE `id` = @FlameShockPassiveSkillLineAbility;
*/
