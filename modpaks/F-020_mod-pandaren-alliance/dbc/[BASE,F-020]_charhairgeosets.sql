-- charhairgeosets: 62 inserts, 0 updates, 6 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @AlliancePandaren;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    0,  0, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,    9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   12, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   13, 14, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   14, 15, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   15, 16, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   16, 17, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   17, 18, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   18, 19, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   19, 20, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   20, 21, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Male,   21, 22, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  0,  0, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female,  9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female, 10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female, 11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female, 12, 13, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female, 13, 14, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @AlliancePandaren, @Female, 14, 15, 0);
