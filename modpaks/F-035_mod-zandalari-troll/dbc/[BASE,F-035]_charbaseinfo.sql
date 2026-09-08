-- charbaseinfo: 10 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @ZandalariTroll;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@ZandalariTroll, @Warrior),
(@ZandalariTroll, @Paladin),
(@ZandalariTroll, @Hunter),
(@ZandalariTroll, @Rogue),
(@ZandalariTroll, @Priest),
(@ZandalariTroll, @DeathKnight),
(@ZandalariTroll, @Shaman),
(@ZandalariTroll, @Mage),
(@ZandalariTroll, @Warlock),
(@ZandalariTroll, @Druid);

-- No ARAC-specific classes at all. ^^