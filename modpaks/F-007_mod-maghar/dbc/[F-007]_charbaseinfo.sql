/* ARAC additions */

DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Paladin;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Paladin); -- mag'har orc paladin
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Druid;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Druid); -- mag'har orc druid
