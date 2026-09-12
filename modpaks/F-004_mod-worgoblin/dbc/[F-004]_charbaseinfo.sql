-- ARAC additions

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Paladin;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Paladin); -- goblin paladin
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Druid;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Druid); -- goblin druid
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Paladin;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Paladin); -- worgen paladin
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Shaman;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Shaman); -- worgen shaman
