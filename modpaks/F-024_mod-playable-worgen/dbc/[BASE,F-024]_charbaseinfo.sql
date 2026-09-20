-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Worgen, @Warrior),
(@Worgen, @Hunter),
(@Worgen, @Rogue),
(@Worgen, @Priest),
(@Worgen, @DeathKnight),
(@Worgen, @Mage),
(@Worgen, @Warlock),
(@Worgen, @Druid);
