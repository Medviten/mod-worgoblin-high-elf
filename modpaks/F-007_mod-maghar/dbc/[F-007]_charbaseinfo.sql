/* ARAC additions */

DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND (`class` = @Paladin OR `class` = @Druid);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@MagharOrc, @Paladin),
(@MagharOrc, @Druid);
