-- charhairgeosets: 62 inserts, 0 updates, 6 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @HordePandaren;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    0,  0, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,    9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   12, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   13, 14, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   14, 15, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   15, 16, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   16, 17, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   17, 18, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   18, 19, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   19, 20, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   20, 21, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Male,   21, 22, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  0,  0, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female,  9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female, 10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female, 11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female, 12, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female, 13, 14, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @HordePandaren, @Female, 14, 15, 0);
