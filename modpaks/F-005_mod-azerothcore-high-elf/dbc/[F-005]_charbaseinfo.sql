/* ARAC additions */

DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Shaman;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Shaman); -- high elf shaman
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Druid;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Druid); -- high elf druid
