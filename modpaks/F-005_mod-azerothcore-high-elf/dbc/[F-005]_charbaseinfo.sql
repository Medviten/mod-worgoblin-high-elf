/* ARAC additions */

DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` IN (@Shaman, @Druid);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@HighElf, @Shaman),
(@HighElf, @Druid);
