-- charbaseinfo: 5 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @Ogre;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@Ogre, @Warrior),
(@Ogre, @Hunter),
(@Ogre, @Shaman),
(@Ogre, @Mage),
(@Ogre, @Warlock); 
