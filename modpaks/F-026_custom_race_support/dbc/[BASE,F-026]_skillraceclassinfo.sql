-- skillraceclassinfo: 0 inserts, 104 updates, 0 deletes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @GunsHunterStartSkillRaceClass; -- Skill 46: Guns

-- Changed values
-- Alliance
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @CommonSkillRaceClassAlliance; -- Skill 98: Language: Common [Alliance]
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @OrcishSkillRaceClassAlliance; -- Skill 109: Language: Orcish [Alliance]

-- Horde
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordeMask    WHERE `id` = @OrcishSkillRaceClassHorde; -- Skill 109: Language: Orcish [Horde]
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordeMask    WHERE `id` = @CommonSkillRaceClassHorde; -- Skill 98: Language: Common [Horde]

-- Everyone
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @LeatherworkingSkillRaceClass; -- Skill 165: Leatherworking
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @PlateMailSkillRaceClass; -- Skill 293: Plate Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @PlateMailDKSkillRaceClass; -- Skill 293: Plate Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @FishingSkillRaceClass; -- Skill 356: Fishing
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @HerbalismSkillRaceClass; -- Skill 182: Herbalism
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @MiningSkillRaceClass; -- Skill 186: Mining
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @SkinningSkillRaceClass; -- Skill 393: Skinning
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @DemonTongueSkillRaceClass; -- Skill 139: Language: Demon Tongue
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @DraconicSkillRaceClass; -- Skill 138: Language: Draconic
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @OldTongueSkillRaceClass; -- Skill 141: Language: Old Tongue
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @TitanSkillRaceClass; -- Skill 140: Language: Titan
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = @GunsNonHunterSkillRaceClass; -- Skill 46: Guns
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @Mail40SkillRaceClass; -- Skill 413: Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @MailSkillRaceClass; -- Skill 413: Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @LeatherSkillRaceClass; -- Skill 414: Leather
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @ClothSkillRaceClass; -- Skill 415: Cloth
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @AlchemySkillRaceClass; -- Skill 171: Alchemy
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @BlacksmithingSkillRaceClass; -- Skill 164: Blacksmithing
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @EngineeringSkillRaceClass; -- Skill 202: Engineering
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @ShieldSkillRaceClass; -- Skill 433: Shield
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @EnchantingSkillRaceClass; -- Skill 333: Enchanting
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @CookingSkillRaceClass; -- Skill 185: Cooking
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @TailoringSkillRaceClass; -- Skill 197: Tailoring
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @FistWeaponsSkillRaceClass; -- Skill 473: Fist Weapons

UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @UndeadHorsemanshipSkillRaceClass; -- Skill 554: Undead Horsemanship
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @2HAxeWarriorSkillRaceClass; -- Skill 172: Two-Handed Axes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @AxesHunterSkillRaceClass; -- Skill 44: Axes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @AxesWarriorSkillRaceClass; -- Skill 44: Axes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @DaggersHunterSkillRaceClass; -- Skill 173: Daggers
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @DaggersWarriorSkillRaceClass; -- Skill 173: Daggers
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @GunsHunterStartSkillRaceClass; -- Skill 46: Guns
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @MacesWarriorSkillRaceClass; -- Skill 54: Maces
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @DaggersDruidSkillRaceClass; -- Skill 173: Daggers
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @MacesDruidSkillRaceClass; -- Skill 54: Maces
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @SurvivalSkillRaceClass; -- Skill 142: Survival
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @JewelcraftingSkillRaceClass; -- Skill 755: Jewelcrafting
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = @SwordsPaladinSkillRaceClass; -- Skill 43: Swords

-- Almost every race
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask & ~(@DwarfMask | @TaurenMask | @TrollMask) WHERE `id` = @SwordsWarriorSkillRaceClass; -- Skill 43: Swords (the exempt are in 638 for some reason)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask & ~@DraeneiMask                            WHERE `id` = @SwordsHunterSkillRaceClass; -- Skill 43: Swords (Draenei hunters get this skill in 880 for some reason)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask & ~@Undead                                 WHERE `id` = @GutterspeakSkillRaceClass; -- Skill 673: Language: Gutterspeak

-- Some races (probably redundant)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | (@BaseAllianceMask & ~(@HumanMask | @DraeneiMask)) | (@BaseHordeMask & ~(@TaurenMask | @BloodElfMask)) WHERE `id` = @HorseRidingGeneralSkillRaceClass; -- Skill 148: Horse Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | (@BaseAllianceMask & ~@DraeneiMask) | (@BaseHordeMask & ~@OrcMask) | @GoblinMask                       WHERE `id` = @WolfRidingGeneralSkillRaceClass; -- Skill 149: Wolf Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | (@BaseAllianceMask & ~(@DwarfMask | @DraeneiMask)) | (@BaseHordeMask & ~(@TaurenMask | @BloodElfMask)) WHERE `id` = @RamRidingGeneralSkillRaceClass; -- Skill 152: Ram Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | (@BaseAllianceMask & ~(@NightElfMask | @DraeneiMask)) | @OrcMask | @UndeadMask | @TrollMask            WHERE `id` = @TigerRidingGeneralSkillRaceClass; -- Skill 150: Tiger Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | (@BaseAllianceMask & ~@DraeneiMask) | @OrcMask | @UndeadMask                                           WHERE `id` = @RaptorRidingGeneralSkillRaceClass; -- Skill 533: Raptor Riding

-- Only one race (probably redundant)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HumanMask     WHERE `id` = @HorseRidingHumanSkillRaceClass; -- Skill 148: Horse Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @OrcMask       WHERE `id` = @WolfRidingOrcSkillRaceClass; -- Skill 149: Wolf Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DwarfMask     WHERE `id` = @RamRidingDwarfSkillRaceClass; -- Skill 152: Ram Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @NightElfMask  WHERE `id` = @TigerRidingNightElfSkillRaceClass; -- Skill 150: Tiger Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GnomeMask     WHERE `id` = @MechanostriderPilotingGnomeSkillRaceClass; -- Skill 553: Mechanostrider Piloting
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DwarfMask     WHERE `id` = @MechanostriderPilotingDwarfSkillRaceClass; -- Skill 553: Mechanostrider Piloting

/* Removed skills?
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 24; -- Skill 272: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 26; -- Skill 247: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 34; -- Skill 273: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 35; -- Skill 262: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 36; -- Skill 263: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 37; -- Skill 264: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 38; -- Skill 260: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 54; -- Skill 130: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 59; -- Skill 96: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 62; -- Skill 268: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 64; -- Skill 269: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 65; -- Skill 198: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 66; -- Skill 246: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 73; -- Skill 254: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 76; -- Skill 241: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 79; -- Skill 238: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 81; -- Skill 239: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 83; -- Skill 252: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 97; -- Skill 199: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 104; -- Skill 353: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 105; -- Skill 120: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 106; -- Skill 245: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 108; -- Skill 255: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 111; -- Skill 244: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 112; -- Skill 243: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 113; -- Skill 258: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 137; -- Skill 227: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 149; -- Skill 242: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 151; -- Skill 416: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 155; -- Skill 416: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 158; -- Skill 416: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 159; -- Skill 416: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 175; -- Skill 418: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 178; -- Skill 418: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 183; -- Skill 418: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 186; -- Skill 418: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 189; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 191; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 193; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 198; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 200; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 203; -- Skill 420: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 204; -- Skill 420: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 205; -- Skill 420: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 265; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 266; -- Skill 419: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 268; -- Skill 420: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 269; -- Skill 420: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 270; -- Skill 418: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 271; -- Skill 416: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 272; -- Skill 453: N/A
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @AllianceMask WHERE `id` = 403; -- Skill 515: N/A
*/