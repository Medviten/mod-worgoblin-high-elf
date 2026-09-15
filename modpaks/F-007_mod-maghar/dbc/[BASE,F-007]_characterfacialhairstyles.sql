-- [F-032] mod-maghar: characterfacialhairstyles: 17 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `characterfacialhairstyles` WHERE `race` = @MagharOrc;
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@MagharOrc, @Male,    0,  0, 0, 0, 0, 0),
(@MagharOrc, @Male,    1,  0, 0, 0, 0, 0),
(@MagharOrc, @Male,    2,  2, 0, 0, 0, 0),
(@MagharOrc, @Male,    3,  3, 0, 0, 0, 0),
(@MagharOrc, @Male,    4,  4, 0, 0, 0, 0),
(@MagharOrc, @Male,    5,  5, 0, 0, 0, 0),
(@MagharOrc, @Male,    6,  6, 0, 0, 0, 0),
(@MagharOrc, @Male,    7,  7, 0, 0, 0, 0),
(@MagharOrc, @Male,    8,  8, 0, 0, 0, 0),
(@MagharOrc, @Male,    9,  9, 0, 0, 0, 0),
(@MagharOrc, @Male,   10, 10, 0, 0, 0, 0),
(@MagharOrc, @Female,  1,  0, 2, 0, 0, 0),
(@MagharOrc, @Female,  2,  0, 3, 0, 0, 0),
(@MagharOrc, @Female,  3,  0, 4, 0, 0, 0),
(@MagharOrc, @Female,  4,  0, 5, 0, 0, 0),
(@MagharOrc, @Female,  5,  0, 6, 0, 0, 0),
(@MagharOrc, @Female,  6,  0, 7, 0, 0, 0);
