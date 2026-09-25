-- Ranged weapons (Hunters)
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @GunHunters      WHERE `skill` = @GunSkill;
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @BowHunters      WHERE `skill` = @BowSkill;
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @CrossbowHunters WHERE `skill` = @CrossbowSkill;

-- Daggers
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | (@PlayableRaceMask & ~@DaggersRogueOnly) WHERE `skill` = @DaggerSkill;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@DaggersRogueOnly, @RogueMask, @DaggerSkill, 0, 'Daggers (Tauren & Draenei Rogues)');

/* Special cases */ 
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(0, @PaladinMask, 160, 0, '2H-Maces - Paladins'); -- 2H-Maces

/* Add appropriate languages to High Elves */
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @HighElfMask WHERE `skill` = 98; -- Common language
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @HighElfMask WHERE `skill` = 137; -- Thalassian language

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (@HighElfMask) AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@HighElfMask, 0, @HighElfRacials, 0, 'High Elf - Racial');
