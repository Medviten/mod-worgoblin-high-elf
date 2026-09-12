/*Updates existing starting skills to include Worgen and Goblins where relevant*/
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask | @WorgenMask WHERE `skill` = 45; -- Bows
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask | @WorgenMask WHERE `skill` = 46; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask | @WorgenMask WHERE `skill` = 173; -- Daggers
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask | @WorgenMask WHERE `skill` = 160; -- 2H-maces

/* Add appropriate faction language to Worgen and Goblins */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = 109; -- Orcish language
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @WorgenMask WHERE `skill` = 98; -- Common language

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (@GoblinMask, @WorgenMask) AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@GoblinMask, 0, 790, 0, 'Goblin - Racial'),
(@WorgenMask, 0, 789, 0, 'Worgen - Racial');
