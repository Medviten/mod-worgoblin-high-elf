-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` IN (@HordePandaren);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@HordePandaren, @Paladin),
(@HordePandaren, @Warlock),
(@HordePandaren, @Druid);
