-- [F-032] mod-maghar: charhairgeosets: 25 inserts, 0 updates, 0 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @MagharOrc;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    0,  0, 1),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  0,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  1,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  2,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  3,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  4,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  5,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  6,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  7,  0, 1),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female, 10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female, 11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female, 12, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,    9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,   10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Male,   11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @MagharOrc, @Female,  8,  9, 0);
