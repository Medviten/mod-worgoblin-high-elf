-- charbaseinfo: 16 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Warrior;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Warrior);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Hunter;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Hunter);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Rogue;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Rogue);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Priest;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Priest);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @DeathKnight;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @DeathKnight);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Shaman;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Shaman);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Mage;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Mage);
DELETE FROM `charbaseinfo` WHERE `race` = @Goblin AND `class` = @Warlock;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Goblin, @Warlock);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Warrior;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Warrior);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Hunter;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Hunter);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Rogue;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Rogue);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Priest;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Priest);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @DeathKnight;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @DeathKnight);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Mage;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Mage);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Warlock;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Warlock);
DELETE FROM `charbaseinfo` WHERE `race` = @Worgen AND `class` = @Druid;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Worgen, @Druid);
