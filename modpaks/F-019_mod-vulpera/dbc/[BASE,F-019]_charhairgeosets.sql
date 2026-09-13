-- charhairgeosets: 2 inserts, 0 updates, 0 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @Vulpera;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 0, 1, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 1, 2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 2, 3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 3, 4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 4, 5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 5, 6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 6, 7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Male, 7, 8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 0, 1, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 1, 2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 2, 3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 3, 4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 4, 5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 5, 6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 6, 7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 7, 8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 8, 9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @Vulpera, @Female, 10, 11, 0);
