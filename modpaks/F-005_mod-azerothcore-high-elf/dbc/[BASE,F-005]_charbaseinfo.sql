-- [F-031] mod-azerothcore-high-elf: charbaseinfo: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @HighElf;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@HighElf, @Warrior),
(@HighElf, @Paladin),
(@HighElf, @Hunter),
(@HighElf, @Rogue),
(@HighElf, @Priest),
(@HighElf, @DeathKnight),
(@HighElf, @Mage),
(@HighElf, @Warlock);
