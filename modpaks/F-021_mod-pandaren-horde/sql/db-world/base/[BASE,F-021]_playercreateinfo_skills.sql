/*Updates existing starting skills to include Horde Pandaren where relevant*/
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @HordePandarenMask WHERE `skill` = 45; -- Bows
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @HordePandarenMask WHERE `skill` = 46; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @HordePandarenMask WHERE `skill` = 226; -- Crossbows
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @HordePandarenMask WHERE `skill` = 173; -- Daggers
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @HordePandarenMask WHERE `skill` = 160; -- 2H-maces

/* Add appropriate faction language to Horde Pandaren */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @HordePandarenMask WHERE `skill` = 109; -- Orcish language

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (@HordePandarenMask) AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@HordePandarenMask, 0, @HordePandarenRacials, 0, 'Pandaren - Racial');
