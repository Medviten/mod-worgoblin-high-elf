-- [F-031] mod-azerothcore-high-elf: characterfacialhairstyles: 19 inserts, 43 updates, 0 deletes

-- New entries
DELETE FROM `characterfacialhairstyles` WHERE `race` = @HighElf;
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@HighElf, @Male,    1,  2,  0, 0, 0, 2),
(@HighElf, @Male,    2,  3,  0, 0, 0, 2),
(@HighElf, @Male,    3,  4,  0, 0, 0, 2),
(@HighElf, @Male,    4,  5,  0, 0, 0, 2),
(@HighElf, @Male,    5,  6,  0, 0, 0, 2),
(@HighElf, @Male,    6,  7,  0, 0, 0, 2),
(@HighElf, @Male,    7,  8,  0, 0, 0, 2),
(@HighElf, @Male,    8,  9,  0, 0, 0, 2),
(@HighElf, @Male,    9, 10,  0, 0, 0, 2),
(@HighElf, @Female,  1,  0,  2, 0, 0, 2),
(@HighElf, @Female,  2,  0,  3, 0, 0, 2),
(@HighElf, @Female,  3,  0,  4, 0, 0, 2),
(@HighElf, @Female,  4,  0,  5, 0, 0, 2),
(@HighElf, @Female,  5,  0,  6, 0, 0, 2),
(@HighElf, @Female,  6,  0,  7, 0, 0, 2),
(@HighElf, @Female,  7,  0,  8, 0, 0, 2),
(@HighElf, @Female,  8,  0,  9, 0, 0, 2),
(@HighElf, @Female,  9,  0, 10, 0, 0, 2),
(@HighElf, @Female, 10,  0, 11, 0, 0, 2);
