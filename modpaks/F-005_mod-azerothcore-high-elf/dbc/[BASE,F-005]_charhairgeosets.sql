-- [F-031] mod-azerothcore-high-elf: charhairgeosets: 123 inserts, 6 updates, 0 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @HighElf; 
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    0,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  1,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  2,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    2,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    1,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    3,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    4,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    5,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    6,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    7,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    8, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,    9, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,   10, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  3,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  4,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  5,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  6,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  7,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  8, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  9, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 10, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 11, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 12, 14, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 13, 15, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 14, 16, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female,  0,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 15, 17, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 16, 18, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 17, 19, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 18, 20, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Female, 19, 21, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,   11, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,   12, 14, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,   13, 15, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,   14, 16, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @HighElf, @Male,   15, 17, 0);
