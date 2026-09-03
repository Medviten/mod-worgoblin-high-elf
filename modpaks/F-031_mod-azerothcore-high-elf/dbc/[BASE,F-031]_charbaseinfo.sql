-- [F-031] mod-azerothcore-high-elf: charbaseinfo: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Warrior;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Warrior);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Paladin;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Paladin);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Hunter;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Hunter);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Rogue;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Rogue);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Priest;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Priest);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @DeathKnight;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @DeathKnight);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Mage;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Mage);
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf AND `class` = @Warlock;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@HighElf, @Warlock);
