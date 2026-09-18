/*Updates existing starting skills to include Goblins where relevant*/
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = 45; -- Bows
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = 46; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = 173; -- Daggers
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = 160; -- 2H-maces

/* Add appropriate faction language to Goblins */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = 109; -- Orcish language

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @GoblinMask AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@GoblinMask, 0, @GoblinRacials, 0, 'Goblin - Racial');
