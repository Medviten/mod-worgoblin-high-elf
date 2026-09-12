-- charbaseinfo: 5 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Warrior;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Warrior); -- ogre warrior
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Hunter;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Hunter); -- ogre hunter
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Shaman;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Shaman); -- ogre shaman
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Mage;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Mage); -- ogre mage
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Warlock;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Warlock); -- ogre warlock
