-- skilllineability: 10 inserts, 33 updates, 0 deletes

-- New entries
DELETE FROM `skilllineability` WHERE `id` BETWEEN 21985 AND 21989; -- Goblin racials
DELETE FROM `skilllineability` WHERE `id` = 31448; -- Rocket Jump
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(21985, @GoblinRacials, @GoblinRacial1, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21986, @GoblinRacials, @GoblinRacial2, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21987, @GoblinRacials, @GoblinRacial3, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21988, @GoblinRacials, @GoblinRacial4, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(21989, @GoblinRacials, @GoblinRacial5, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(31448, @GoblinRacials, @GoblinRacial6, @GoblinMask, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0); -- Spell: Rocket Jump

-- Changed values
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @OrcishSkillLineAbilityHorde; -- Spell: 669 (Language: Orcish)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @TeleportOrgrimmarSkillLineAbility; -- Spell: 3567 (Teleport: Orgrimmar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @TeleportThunderBluffSkillLineAbility; -- Spell: 3566 (Teleport: Thunder Bluff)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @TeleportUndercitySkillLineAbility; -- Spell: 3563 (Teleport: Undercity)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @PortalOrgrimmarSkillLineAbility; -- Spell: 11417 (Portal: Orgrimmar)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @PortalThunderBluffSkillLineAbility; -- Spell: 11420 (Portal: Thunder Bluff)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @PortalUndercitySkillLineAbility; -- Spell: 11418 (Portal: Undercity)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @BloodlustSkillLineAbility; -- Spell: 2825 (Bloodlust)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @TeleportSilvermoonSkillLineAbility; -- Spell: 32272 (Teleport: Silvermoon)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @PortalSilvermoonSkillLineAbility; -- Spell: 32267 (Portal: Silvermoon)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @TeleportShattrathSkillLineAbility; -- Spell: 35715 (Teleport: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @PortalShattrathSkillLineAbility; -- Spell: 35717 (Portal: Shattrath)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @TeleportStonardSkillLineAbility; -- Spell: 49358 (Teleport: Stonard)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @PortalStonardSkillLineAbility; -- Spell: 49361 (Portal: Stonard)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @MechanoHogSkillLineAbility1; -- Spell: 55531 (Mechano-hog)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @MechanoHogSkillLineAbility2; -- Spell: 60866 (Mechano-hog)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = 21723; -- Spell: 75460 (N/A?)
UPDATE `skilllineability` SET `required_races` = `required_races` | @GoblinMask WHERE `id` = @FlameShockPassiveSkillLineAbility; -- Spell: 75461 (Flame Shock Passive)
