-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` IN (@Goblin, @Worgen);
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Goblin, @Warrior),
(@Goblin, @Hunter),
(@Goblin, @Rogue),
(@Goblin, @Priest),
(@Goblin, @DeathKnight),
(@Goblin, @Shaman),
(@Goblin, @Mage),
(@Goblin, @Warlock),
(@Worgen, @Warrior),
(@Worgen, @Hunter),
(@Worgen, @Rogue),
(@Worgen, @Priest),
(@Worgen, @DeathKnight),
(@Worgen, @Mage),
(@Worgen, @Warlock),
(@Worgen, @Druid);
