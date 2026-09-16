-- charhairgeosets: 2 inserts, 0 updates, 0 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @Ogre;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Ogre, @Male,   0, 0, 1),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Ogre, @Female, 0, 0, 1);
