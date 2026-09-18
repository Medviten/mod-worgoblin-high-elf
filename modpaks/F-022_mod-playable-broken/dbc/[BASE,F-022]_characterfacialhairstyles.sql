-- characterfacialhairstyles: 16 inserts, 0 updates, 0 deletes

-- Insertions
DELETE FROM `characterfacialhairstyles` WHERE `race` = @Broken;
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@Broken, @Male,   0, 0, 0, 0, 0, 0),
(@Broken, @Male,   0, 1, 0, 0, 0, 0),
(@Broken, @Male,   1, 2, 0, 0, 0, 0),
(@Broken, @Male,   2, 3, 0, 2, 0, 0),
(@Broken, @Male,   3, 4, 0, 3, 0, 0),
(@Broken, @Male,   4, 5, 0, 4, 0, 0),
(@Broken, @Male,   5, 6, 0, 5, 0, 0),
(@Broken, @Male,   6, 7, 0, 6, 0, 0),
(@Broken, @Male,   7, 8, 0, 0, 0, 0),
(@Broken, @Female, 0, 2, 0, 1, 0, 0),
(@Broken, @Female, 1, 3, 0, 1, 0, 0),
(@Broken, @Female, 2, 4, 0, 1, 0, 0),
(@Broken, @Female, 3, 5, 0, 1, 0, 0),
(@Broken, @Female, 4, 6, 0, 1, 0, 0),
(@Broken, @Female, 5, 2, 0, 2, 0, 0),
(@Broken, @Female, 6, 2, 0, 3, 0, 0);
