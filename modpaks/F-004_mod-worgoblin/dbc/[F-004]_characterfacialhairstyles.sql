-- Gilnean race support

DELETE FROM `characterfacialhairstyles` WHERE `race` = @Gilnean;
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@Gilnean, @Male,   0, 1, 1, 1, 0, 0),
(@Gilnean, @Male,   1, 1, 2, 1, 0, 0),
(@Gilnean, @Male,   2, 1, 2, 1, 0, 0),
(@Gilnean, @Male,   3, 2, 1, 2, 0, 0),
(@Gilnean, @Male,   4, 2, 2, 2, 0, 0),
(@Gilnean, @Male,   5, 1, 2, 2, 0, 0),
(@Gilnean, @Male,   6, 2, 2, 1, 0, 0),
(@Gilnean, @Male,   7, 1, 2, 1, 0, 0),
(@Gilnean, @Male,   8, 1, 1, 1, 0, 0),
(@Gilnean, @Female, 0, 0, 0, 0, 0, 0),
(@Gilnean, @Female, 1, 0, 2, 0, 0, 0),
(@Gilnean, @Female, 2, 0, 3, 0, 0, 0),
(@Gilnean, @Female, 3, 0, 4, 0, 0, 0),
(@Gilnean, @Female, 4, 0, 5, 0, 0, 0),
(@Gilnean, @Female, 5, 0, 6, 0, 0, 0),
(@Gilnean, @Female, 6, 0, 7, 0, 0, 0);
