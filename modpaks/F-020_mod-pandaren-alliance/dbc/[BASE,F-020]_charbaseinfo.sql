-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` IN (@HordePandaren, @AlliancePandaren);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@HordePandaren,    @Warrior),
(@HordePandaren,    @Hunter),
(@HordePandaren,    @Rogue),
(@HordePandaren,    @Priest),
(@HordePandaren,    @DeathKnight),
(@HordePandaren,    @Shaman),
(@HordePandaren,    @Mage),
(@HordePandaren,    @Warlock),
(@AlliancePandaren, @Warrior),
(@AlliancePandaren, @Hunter),
(@AlliancePandaren, @Rogue),
(@AlliancePandaren, @Priest),
(@AlliancePandaren, @DeathKnight),
(@AlliancePandaren, @Mage),
(@AlliancePandaren, @Warlock),
(@AlliancePandaren, @Druid);
