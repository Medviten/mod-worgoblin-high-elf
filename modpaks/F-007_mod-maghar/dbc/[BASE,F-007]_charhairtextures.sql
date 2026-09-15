-- [F-032] mod-maghar: charhairtextures: 24 inserts, 2 updates, 0 deletes

-- New entries
SET @CharHairTexturesID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`charhairtextures`);

DELETE FROM `charhairtextures` WHERE `race` = @MagharOrc;
INSERT INTO `charhairtextures` (`id`, `race`, `gender`, `unk_1`, `unk_2`, `unk_3`, `unk_4`, `unk_5`) VALUES
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   0,   70, 0,  0,  0),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   0,    8, 0,  1,  1),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   0,   16, 0,  2,  2),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   0,   32, 0,  3,  3),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   1,    4, 0,  2,  2),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   1,    2, 0,  0,  0),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   1,   24, 0,  1,  1),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   1,  352, 0,  5,  5),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   1, 1152, 0,  3,  3),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   1,  512, 0,  4,  4),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,    2, 0,  0,  0),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,    4, 0,  4,  4),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,  136, 0,  1,  1),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,   16, 0,  5,  5),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,   32, 0,  6,  6),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,   64, 0,  7,  7),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Male,   0,    1, 0, -1, -1),
(@CharHairTexturesID := @CharHairTexturesID +1, @MagharOrc, @Female, 0,    1, 0, -1, -1);
