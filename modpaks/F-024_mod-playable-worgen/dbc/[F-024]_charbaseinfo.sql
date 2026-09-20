-- ARAC additions

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` IN (@Paladin, @Shaman);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Worgen, @Paladin),
(@Worgen, @Shaman);
