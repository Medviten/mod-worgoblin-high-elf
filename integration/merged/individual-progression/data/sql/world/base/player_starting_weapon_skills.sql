/* Corrects the starting weapon skills for each race and class to match pre-3.3 */

/* Two-handed swords */
SET @2HSWORDS := 55;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @2HSWORDS;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 55, 0, 'Death Knight - Two-Handed Swords');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1040|2048|1|4096, 1, 55, 0, 'Warrior - Two-Handed Swords');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (512, 2, 55, 0, 'Paladin - Two-Handed Swords');

/* One-handed swords */
SET @SWORDS := 43;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @SWORDS;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 43, 0, 'Death Knight - Swords');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1627|2048|4096, 1, 43, 0, 'Warrior - Swords');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1024, 4, 43, 0, 'Hunter - Swords');

/* Daggers */
SET @DAGGERS := 173;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @DAGGERS;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (200, 1, 173, 0, 'Warrior - Daggers');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (8|2048, 1024, 173, 0, 'Druid - Daggers');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (520|2048|4096, 4, 173, 0, 'Hunter - Daggers');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 8, 173, 0, 'Rogue - Daggers');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 256, 173, 0, 'Warlock - Daggers');

/* Staves */
SET @STAVES := 136;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @STAVES;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 1216, 136, 0, 'Staves');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (2304, 16, 136, 0, 'Priest - Staves');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (2304, 256, 136, 0, 'Warlock - Staves');

/* Thrown */
SET @THROWN := 176;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @THROWN;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 8, 176, 0, 'Rogue - Thrown');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (128, 1, 176, 0, 'Warrior - Thrown');


/* One-handed maces */
SET @MACES := 54;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @MACES;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (32, 1024, 54, 0, 'Druid - Maces');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 2, 54, 0, 'Paladin - Maces');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 16, 54, 0, 'Priest - Maces');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 64, 54, 0, 'Shaman - Maces');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1645, 1, 54, 0, 'Warrior - Maces');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (256, 8, 54, 0, 'Rogue - Maces');

/* Two-handed maces */
SET @2HMACES := 160;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @2HMACES;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 2, 160, 0, 'Paladin - Two-Handed Maces');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (32|256, 1, 160, 0, 'Warrior - Two-Handed Maces');

/* One-handed axes */
SET @AXES := 44;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @AXES;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 44, 0, 'Death Knight - Axes');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (166|256|2048|4096, 4, 44, 0, 'Hunter - Axes');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1207|256|4096, 1, 44, 0, 'Warrior - Axes');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (2048, 8, 44, 0, 'Rogue - Axes');

/* Two-handed axes */
SET @2HAXES := 172;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @2HAXES;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 172, 0, 'Death Knight - Two-Handed Axes');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (6|256, 1, 172, 0, 'Warrior - Two-Handed Axes');
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (2048, 4, 172, 0, 'Hunter - Two-Handed Axes');
