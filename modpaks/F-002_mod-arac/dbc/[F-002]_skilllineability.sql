-- [F-002] mod-arac: skilllineability: 9 inserts, 45 updates, 0 deletes

-- New entries (Blood Elf and Draenei ARAC racials)
DELETE FROM `skilllineability` WHERE `id` IN (
    @ArcaneTorrentFeralSkillLineAbility,    @ArcaneTorrentDruidManaSkillLineAbility, @ArcaneTorrentRageSkillLineAbility,
    @GiftoftheNaaruDruidSkillLineAbility,   @GiftoftheNaaruRogueSkillLineAbility,    @GiftoftheNaaruWarlockSkillLineAbility,
    @ShadowResistanceDruidSkillLineAbility, @ShadowResistanceRogueSkillLineAbility,  @ShadowResistanceWarlockSkillLineAbility
);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
--    (@ArcaneTorrentFeralSkillLineAbility,      @BloodElfRacials, @BloodElfRacial1, @BloodElfMask, @DruidMask,   0, 0, 1, 0, 2, 0, 0, 0, 0), -- Arcane Torrent (Druid Feral)
    (@ArcaneTorrentDruidManaSkillLineAbility,  @BloodElfRacials, @BloodElfRacial2, @BloodElfMask, @DruidMask,   0, 0, 1, 0, 2, 0, 0, 0, 0), -- Arcane Torrent (Druid Mana)
    (@ArcaneTorrentRageSkillLineAbility,       @BloodElfRacials, @BloodElfRacial3, @BloodElfMask, @WarriorMask, 0, 0, 1, 0, 2, 0, 0, 0, 0), -- Arcane Torrent (Rage)
    (@GiftoftheNaaruDruidSkillLineAbility,     @DraeneiRacials,  @DraeneiRacial1,  @DraeneiMask,  @DruidMask,   0, 0, 1, 0, 2, 0, 0, 0, 0), -- Gift of the Naaru (Druid)
    (@GiftoftheNaaruRogueSkillLineAbility,     @DraeneiRacials,  @DraeneiRacial2,  @DraeneiMask,  @RogueMask,   0, 0, 1, 0, 2, 0, 0, 0, 0), -- Gift of the Naaru (Rogue)
    (@GiftoftheNaaruWarlockSkillLineAbility,   @DraeneiRacials,  @DraeneiRacial3,  @DraeneiMask,  @WarlockMask, 0, 0, 1, 0, 2, 0, 0, 0, 0), -- Gift of the Naaru (Warlock)
    (@ShadowResistanceDruidSkillLineAbility,   @DraeneiRacials,  @DraeneiRacial4,  @DraeneiMask,  @DruidMask,   0, 0, 1, 0, 2, 0, 0, 0, 0), -- Shadow Resistance (Druid)
    (@ShadowResistanceRogueSkillLineAbility,   @DraeneiRacials,  @DraeneiRacial5,  @DraeneiMask,  @RogueMask,   0, 0, 1, 0, 2, 0, 0, 0, 0), -- Shadow Resistance (Rogue)
    (@ShadowResistanceWarlockSkillLineAbility, @DraeneiRacials,  @DraeneiRacial6,  @DraeneiMask,  @WarlockMask, 0, 0, 1, 0, 2, 0, 0, 0, 0); -- Shadow Resistance (Warlock)

-- Changed values
UPDATE `skilllineability` SET `required_classes` =  0                                                  WHERE `id` = @ElusivenessSkillLineAbility; -- Spell: 21009 (Elusiveness)
UPDATE `skilllineability` SET `required_classes` = `required_classes` | (@ManaClassMask & ~@DruidMask) WHERE `id` = @ArcaneTorrentManaSkillLineAbility; -- Spell: 28730 (Arcane Torrent [mana])
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @CommonSkillLineAbilityAlliance; -- Spell: 668 (Language: Common)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @OrcishSkillLineAbilityHorde; -- Spell: 669 (Language: Orcish)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @TeleportDarnassusSkillLineAbility; -- Spell: 3565 (Teleport: Darnassus)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @TeleportIronforgeSkillLineAbility; -- Spell: 3562 (Teleport: Ironforge)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @TeleportStormwindSkillLineAbility; -- Spell: 3561 (Teleport: Stormwind)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @PortalDarnassusSkillLineAbility; -- Spell: 11419 (Portal: Darnassus)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @PortalIronforgeSkillLineAbility; -- Spell: 11416 (Portal: Ironforge)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @PortalStormwindSkillLineAbility; -- Spell: 10059 (Portal: Stormwind)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @WarhorseSkillLineAbility1; -- Spell: 13819 (Warhorse)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @WarhorseSkillLineAbility2; -- Spell: 13819 (Warhorse)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @ChargerSkillLineAbility1; -- Spell: 23214 (Charger)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @BloodlustSkillLineAbility; -- Spell: 2825 (Bloodlust)
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @RogueMask                     WHERE `id` = @HeroicPresenceMailClassesSkillLineAbility; -- Spell: 6562 (Heroic Presence [Warrior, Paladin, Hunter, Death Knight])
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @WarlockMask | @DruidMask      WHERE `id` = @HeroicPresenceCasterClassesSkillLineAbility; -- Spell: 28878 (Heroic Presence [Priest, Shaman, Mage])
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @SealofVengeanceSkillLineAbility; -- Spell: 31801 (Seal of Vengeance)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @JudgementofBloodSkillLineAbility; -- Spell: 31898 (Judgement of Blood)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @PlayableRaceMask              WHERE `id` = @HolyVengeanceSkillLineAbility; -- Spell: 31803 (Holy Vengeance – proc of Seal of Vengeance)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @JudgementofVengeanceSkillLineAbility; -- Spell: 31804 (Judgement of Vengeance)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @HeroismSkillLineAbility; -- Spell: 32182 (Heroism)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @TeleportExodarSkillLineAbility; -- Spell: 32271 (Teleport: Exodar)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @PortalExodarSkillLineAbility; -- Spell: 32266 (Portal: Exodar)
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @Priest | @Mage                WHERE `id` = @BloodFuryWarlockSkillLineAbility; -- Spell: 33702 (Blood Fury [Warlock])
UPDATE `skilllineability` SET `required_classes` = `required_classes` | @Paladin | @Druid              WHERE `id` = @BloodFuryShamanSkillLineAbility; -- Spell: 33697 (Blood Fury [Shaman])
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @TeleportShattrathSkillLineAbilityAlliance; -- Spell: 33690 (Teleport: Shattrath)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @PortalShattrathSkillLineAbilityAlliance; -- Spell: 33691 (Portal: Shattrath)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @SummonChargerSkillLineAbility1; -- Spell: 34767 (Summon Charger)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @SummonWarhorseSkillLineAbility1; -- Spell: 34769 (Summon Warhorse)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @SummonWarhorseSkillLineAbility2; -- Spell: 34769 (Summon Warhorse)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @TeleportTheramoreSkillLineAbility; -- Spell: 49359 (Teleport: Theramore)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @PortalTheramoreSkillLineAbility; -- Spell: 49360 (Portal: Theramore)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @JudgementoftheMartyrSkillLineAbility; -- Spell: 53726 (Judgement of the Martyr)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @JudgementofCorruptionSkillLineAbility; -- Spell: 53733 (Judgement of Corruption)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @SealofCorruptionSkillLineAbility; -- Spell: 53736 (Seal of Corruption)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @BloodCorruptionSkillLineAbility; -- Spell: 53742 (Blood Corruption)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @ChargerSkillLineAbility2; -- Spell: 23214 (Charger)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @SummonChargerSkillLineAbility2; -- Spell: 34767 (Summon Charger)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @WarhorseSkillLineAbility2; -- Spell: 13819 (Warhorse)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @SummonWarhorseSkillLineAbility2; -- Spell: 34769 (Summon Warhorse)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @MekgineersChopperSkillLineAbility1; -- Spell: 60424 (Mekgineer's Chopper)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @AllianceMask                  WHERE `id` = @MekgineersChopperSkillLineAbility2; -- Spell: 60867 (Mekgineer's Chopper)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @TeleportOrgrimmarSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @TeleportUndercitySkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @TeleportThunderBluffSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @TeleportSilvermoonSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @TeleportShattrathSkillLineAbilityHorde;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @TeleportStonardSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @PortalOrgrimmarSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @PortalUndercitySkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @PortalThunderBluffSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @PortalSilvermoonSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @PortalShattrathSkillLineAbilityHorde;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @HordeMask                     WHERE `id` = @PortalStonardSkillLineAbility;
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @PlayableRaceMask              WHERE `id` = @ActivatePrimarySpec; -- Spell: 63645 (Activate Primary Spec)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @PlayableRaceMask              WHERE `id` = @ActivateSecondarySpec; -- Spell: 63644 (Activate Secondary Spec)
-- UPDATE `skilllineability` SET `required_races`   = `required_races`   | @PlayableRaceMask              WHERE `id` = 21723; -- Spell: 75460 (N/A?)
UPDATE `skilllineability` SET `required_races`   = `required_races`   | @PlayableRaceMask              WHERE `id` = @FlameShockPassiveSkillLineAbility; -- Spell: 75461 (Flame Shock Passive)
