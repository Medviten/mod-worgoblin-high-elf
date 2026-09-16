-- charbaseinfo: 3 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @HordePandaren AND `class` IN (@Paladin, @Warlock, @Druid);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@HordePandaren, @Paladin),
(@HordePandaren, @Warlock),
(@HordePandaren, @Druid);
