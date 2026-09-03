/*Updates existing starting skills to include Ogres where relevant*/
/* I have commented out Guns because other Hunters in WotLK start with only one ranged weapon skill. */
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @OgreMask WHERE `skill` = 46; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @OgreMask WHERE `skill` = 45; -- Bows
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @OgreMask WHERE `skill` = 173; -- Daggers

/* Special cases */ 
INSERT IGNORE INTO `playercreateinfo_skills` (`racemask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(0, @Paladin, 160, 0, '2H-Maces - Paladins'); -- 2H-Maces

/* Add appropriate faction language to Ogres */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @OgreMask WHERE `skill` = 109; -- Orcish language

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (16384) AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@OgreMask, 0, 793, 0, 'Ogre - Racial');
