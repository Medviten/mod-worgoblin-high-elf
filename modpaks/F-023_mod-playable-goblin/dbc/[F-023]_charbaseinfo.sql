-- ARAC additions

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` IN (@Paladin, @Druid);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Goblin, @Paladin),
(@Goblin, @Druid);
