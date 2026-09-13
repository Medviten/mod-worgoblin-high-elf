-- ARAC additions

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND (`class` = @Paladin OR `class` = @Druid);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND (`class` = @Paladin OR @Shaman);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Goblin, @Paladin),
(@Goblin, @Druid),
(@Worgen, @Paladin),
(@Worgen, @Shaman);
