-- charbaseinfo: 10 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Broken;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Broken, @Warrior),
(@Broken, @Paladin),
(@Broken, @Hunter),
(@Broken, @Rogue), -- ARAC
(@Broken, @Priest),
(@Broken, @DeathKnight),
(@Broken, @Shaman),
(@Broken, @Mage),
(@Broken, @Warlock), -- ARAC
(@Broken, @Druid); -- ARAC
