-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` IN (@AlliancePandaren);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@AlliancePandaren, @Warrior),
(@AlliancePandaren, @Hunter),
(@AlliancePandaren, @Rogue),
(@AlliancePandaren, @Priest),
(@AlliancePandaren, @DeathKnight),
(@AlliancePandaren, @Shaman),
(@AlliancePandaren, @Mage),
(@AlliancePandaren, @Warlock);
