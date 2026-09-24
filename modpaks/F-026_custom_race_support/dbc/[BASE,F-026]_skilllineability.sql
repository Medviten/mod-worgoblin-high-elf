-- skilllineability: 0 inserts, 42 updates, 0 deletes

-- Changed values
-- Alliance
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @CommonSkillLineAbilityAlliance; -- Spell: 668 (Language: Common)
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @TeleportDarnassusSkillLineAbility; -- Spell: 3565 (Teleport: Darnassus) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @TeleportIronforgeSkillLineAbility; -- Spell: 3562 (Teleport: Ironforge) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @TeleportStormwindSkillLineAbility; -- Spell: 3561 (Teleport: Stormwind) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @PortalDarnassusSkillLineAbility; -- Spell: 11419 (Portal: Darnassus) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @PortalIronforgeSkillLineAbility; -- Spell: 11416 (Portal: Ironforge) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @PortalStormwindSkillLineAbility; -- Spell: 10059 (Portal: Stormwind) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @TeleportExodarSkillLineAbility; -- Spell: 32271 (Teleport: Exodar) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @PortalExodarSkillLineAbility; -- Spell: 32266 (Portal: Exodar) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @TeleportShattrathSkillLineAbilityAlliance; -- Spell: 33690 (Teleport: Shattrath) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @PortalShattrathSkillLineAbilityAlliance; -- Spell: 33691 (Portal: Shattrath) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @TeleportTheramoreSkillLineAbility; -- Spell: 49359 (Teleport: Theramore) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @PortalTheramoreSkillLineAbility; -- Spell: 49360 (Portal: Theramore) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @MekgineersChopperSkillLineAbility1; -- Spell: 60424 (Mekgineer's Chopper) [Engineer]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @MekgineersChopperSkillLineAbility2; -- Spell: 60867 (Mekgineer's Chopper) [Engineer]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @HolyVengeanceSkillLineAbility; -- Spell: 31803 (Holy Vengeance) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @WarhorseSkillLineAbility1; -- Spell: 13819 (Warhorse) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @WarhorseSkillLineAbility2; -- Spell: 13819 (Warhorse) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @ChargerSkillLineAbility1; -- Spell: 23214 (Charger) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @ChargerSkillLineAbility2; -- Spell: 23214 (Charger) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @JudgementoftheMartyrSkillLineAbility; -- Spell: 53726 (Judgement of the Martyr) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @JudgementofVengeanceSkillLineAbility; -- Spell: 31804 (Judgement of Vengeance) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @SealofVengeanceSkillLineAbility; -- Spell: 31801 (Seal of Vengeance) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @AllianceMask WHERE `id` = @HeroismSkillLineAbility; -- Spell: 32182 (Heroism) [Shaman]

-- Horde
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @OrcishSkillLineAbilityHorde; -- Spell: 669 (Language: Orcish)
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @TeleportOrgrimmarSkillLineAbility; -- Spell: 3567 (Teleport: Orgrimmar) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @TeleportThunderBluffSkillLineAbility; -- Spell: 3566 (Teleport: Thunder Bluff) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @TeleportUndercitySkillLineAbility; -- Spell: 3563 (Teleport: Undercity) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @PortalOrgrimmarSkillLineAbility; -- Spell: 11417 (Portal: Orgrimmar) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @PortalThunderBluffSkillLineAbility; -- Spell: 11420 (Portal: Thunder Bluff) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @PortalUndercitySkillLineAbility; -- Spell: 11418 (Portal: Undercity) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @TeleportSilvermoonSkillLineAbility; -- Spell: 32272 (Teleport: Silvermoon) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @PortalSilvermoonSkillLineAbility; -- Spell: 32267 (Portal: Silvermoon) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @TeleportShattrathSkillLineAbilityHorde; -- Spell: 35715 (Teleport: Shattrath) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @PortalShattrathSkillLineAbilityHorde; -- Spell: 35717 (Portal: Shattrath) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @TeleportStonardSkillLineAbility; -- Spell: 49358 (Teleport: Stonard) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @PortalStonardSkillLineAbility; -- Spell: 49361 (Portal: Stonard) [Mage]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @MechanoHogSkillLineAbility1; -- Spell: 55531 (Mechano-hog) [Engineer]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @MechanoHogSkillLineAbility2; -- Spell: 60866 (Mechano-hog) [Engineer]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @JudgementofBloodSkillLineAbility; -- Spell: 31898 (Judgement of Blood) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @JudgementofCorruptionSkillLineAbility; -- Spell: 53733 (Judgement of Corruption) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @SealofCorruptionSkillLineAbility; -- Spell: 53736 (Seal of Corruption) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @BloodCorruptionSkillLineAbility; -- Spell: 53742 (Blood Corruption) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @SummonChargerSkillLineAbility; -- Spell: 34767 (Summon Charger) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @SummonWarhorseSkillLineAbility; -- Spell: 34769 (Summon Warhorse) [Paladin]
UPDATE `skilllineability` SET `required_races` = `required_races` | @HordeMask WHERE `id` = @BloodlustSkillLineAbility; -- Spell: 2825 (Bloodlust) [Shaman]

-- Everyone
-- UPDATE `skilllineability` SET `required_races` = `required_races` | @PlayableRaceMask WHERE `id` = 21723; -- Spell: 75460 (N/A?)
UPDATE `skilllineability` SET `required_races` = `required_races` | @PlayableRaceMask WHERE `id` = @FlameShockPassiveSkillLineAbility; -- Spell: 75461 (Flame Shock Passive) [Shaman]
UPDATE `skilllineability` SET `required_races` = `required_races` | @PlayableRaceMask WHERE `id` = @ActivatePrimarySpec; -- Spell: 63645 (Activate Primary Spec)
UPDATE `skilllineability` SET `required_races` = `required_races` | @PlayableRaceMask WHERE `id` = @ActivateSecondarySpec; -- Spell: 63644 (Activate Secondary Spec)
