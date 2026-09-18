-- ARAC additions

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` IN (@Paladin, @Druid);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` IN (@Paladin, @Shaman);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Goblin, @Paladin),
(@Goblin, @Druid),
(@Worgen, @Paladin),
(@Worgen, @Shaman);
