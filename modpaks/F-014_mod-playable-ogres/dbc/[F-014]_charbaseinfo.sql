-- ARAC additions

DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Paladin;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Paladin); -- ogre paladin
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Rogue;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Rogue); -- ogre rogue
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Priest;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Priest); -- ogre priest
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @DeathKnight;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @DeathKnight); -- ogre death knight
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre AND `class` = @Druid;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES (@Ogre, @Druid); -- ogre druid
