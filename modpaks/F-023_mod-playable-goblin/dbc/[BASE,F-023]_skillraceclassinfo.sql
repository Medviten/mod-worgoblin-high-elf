-- skillraceclassinfo: 1 inserts, 30 updates, 0 deletes

-- New entries
DELETE FROM `skillraceclassinfo` WHERE `id` = @GoblinRacialSkillRaceClass; -- goblin racials
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`) VALUES
(@GoblinRacialSkillRaceClass, @GoblinRacials, @GoblinMask, @AllClassMask, 1170, 0, 0, 0);

-- Changed values
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @PlateMailSkillRaceClass; -- skill: 293 (plate mail)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @FishingSkillRaceClass; -- skill: 356 (fishing)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @HerbalismSkillRaceClass; -- skill: 182 (herbalism)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @MiningSkillRaceClass; -- skill: 186 (mining)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @SkinningSkillRaceClass; -- skill: 393 (skinning)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @CommonSkillRaceClassHorde; -- skill: 98 (language: common, [some of the] Horde)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @OrcishSkillRaceClassHorde; -- skill: 109 (language: orcish, Horde)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @DemonTongueSkillRaceClass; -- skill: 139 (language: demon tongue)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @DraconicSkillRaceClass; -- skill: 138 (language: draconic)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @OldTongueSkillRaceClass; -- skill: 141 (language: old tongue)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @TitanSkillRaceClass; -- skill: 140 (language: titan)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @GunsSkillRaceClass; -- skill: 46 (guns)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @Mail40SkillRaceClass; -- skill: 413 (mail, 40+)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @MailSkillRaceClass; -- skill: 413 (mail)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @LeatherSkillRaceClass; -- skill: 414 (leather)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @ClothSkillRaceClass; -- skill: 415 (cloth)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @AlchemySkillRaceClass; -- skill: 171 (alchemy)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @BlacksmithingSkillRaceClass; -- skill: 164 (blacksmithing)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @EngineeringSkillRaceClass; -- skill: 202 (engineering)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @ShieldSkillRaceClass; -- skill: 433 (shield)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @EnchantingSkillRaceClass; -- skill: 333 (enchanting)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @CookingSkillRaceClass; -- skill: 185 (cooking)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @TailoringSkillRaceClass; -- skill: 197 (tailoring)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @2HMaceSkillRaceClassDK; -- skill: 160 (two-handed maces, DK)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` & ~@GoblinMask WHERE `id` = @2HMaceSkillRaceClass; -- skill: 160 (two-handed maces)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @SurvivalSkillRaceClass; -- skill: 142 (survival)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @JewelcraftingSkillRaceClass; -- skill: 755 (jewelcrafting)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @GoblinMask WHERE `id` = @LeatherworkingSkillRaceClass; -- skill: 165 (leatherworking)
