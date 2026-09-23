-- charhairgeosets: 24 inserts, 0 updates, 6 deletes

-- New entries
DELETE FROM `charhairgeosets` WHERE `race` = @KulTiran;
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `charhairgeosets`);
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  0,  1, 1),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female,  9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female, 10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Female, 11, 12, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    0,  1, 1),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    1,  2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    2,  3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    3,  4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    4,  5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    5,  6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    6,  7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    7,  8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    8,  9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,    9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,   10, 11, 0),
(@CharHairGeosetsID := @CharHairGeosetsID +1, @KulTiran, @Male,   11, 12, 0);
