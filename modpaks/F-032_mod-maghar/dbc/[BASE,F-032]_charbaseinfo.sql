-- [F-032] mod-maghar: charbaseinfo: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Warrior;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Warrior); -- warrior
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Hunter;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Hunter); -- hunter
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Rogue;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Rogue); -- rogue
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Priest;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Priest); -- priest
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @DeathKnight;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @DeathKnight); -- death knight
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Shaman;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Shaman); -- shaman
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Mage;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Mage); -- mage
DELETE FROM `charbaseinfo` WHERE `race` = @MagharOrc AND `class` = @Warlock;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@MagharOrc, @Warlock); -- warlock
