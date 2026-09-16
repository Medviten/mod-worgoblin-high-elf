-- charbaseinfo: 3 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @AlliancePandaren AND `class` IN (@Paladin, @Warlock, @Druid);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@AlliancePandaren, @Paladin),
(@AlliancePandaren, @Warlock),
(@AlliancePandaren, @Druid);
