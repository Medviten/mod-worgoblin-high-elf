/*Updates existing starting skills to include Mag'har Orcs where relevant*/
/* I have commented out Guns because other Hunters in WotLK start with only one ranged weapon skill. */
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`| @MagharOrcMask WHERE `skill` = 46; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @MagharOrcMask WHERE `skill` = 45; -- Bows
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @MagharOrcMask WHERE `skill` = 173; -- Daggers

/* Special cases */ 
INSERT IGNORE INTO `playercreateinfo_skills` (`racemask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(0, @PaladinMask, 160, 0, '2H-Maces - Paladins'); -- 2H-Maces for all Paladins

/* Add appropriate faction language to Mag'har Orcs */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @MagharOrcMask WHERE `skill` = 109; -- Orcish language

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (@MagharOrcMask) AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@MagharOrcMask, 0, 792, 0, 'Mag''har Orc - Racial');
