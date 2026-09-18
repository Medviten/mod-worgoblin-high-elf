-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Goblin, @Warrior),
(@Goblin, @Hunter),
(@Goblin, @Rogue),
(@Goblin, @Priest),
(@Goblin, @DeathKnight),
(@Goblin, @Shaman),
(@Goblin, @Mage),
(@Goblin, @Warlock);
