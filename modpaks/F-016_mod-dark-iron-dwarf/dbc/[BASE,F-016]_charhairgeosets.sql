-- charhairgeosets: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charhairgeosets` WHERE `race` = @DarkIronDwarf;
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `charhairgeosets`);
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    0,  1, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Male,    7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  0,  1, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female,  9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @DarkIronDwarf, @Female, 10, 11, 0);
