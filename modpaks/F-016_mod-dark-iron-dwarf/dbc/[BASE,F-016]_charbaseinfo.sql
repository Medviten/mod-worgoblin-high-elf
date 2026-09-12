-- charbaseinfo: 10 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @DarkIronDwarf;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@DarkIronDwarf, @Warrior),
(@DarkIronDwarf, @Paladin),
(@DarkIronDwarf, @Hunter),
(@DarkIronDwarf, @Rogue),
(@DarkIronDwarf, @Priest),
(@DarkIronDwarf, @DeathKnight),
(@DarkIronDwarf, @Shaman),
(@DarkIronDwarf, @Mage),
(@DarkIronDwarf, @Warlock),
(@DarkIronDwarf, @Druid); -- ARAC
