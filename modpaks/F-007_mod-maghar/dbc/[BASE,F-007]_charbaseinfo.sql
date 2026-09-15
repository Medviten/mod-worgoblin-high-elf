-- [F-032] mod-maghar: charbaseinfo: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@MagharOrc, @Warrior),
(@MagharOrc, @Hunter),
(@MagharOrc, @Rogue),
(@MagharOrc, @Priest),
(@MagharOrc, @DeathKnight),
(@MagharOrc, @Shaman),
(@MagharOrc, @Mage),
(@MagharOrc, @Warlock);
