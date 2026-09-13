-- characterfacialhairstyles: 16 inserts, 0 updates, 0 deletes

-- Insertions
DELETE FROM `characterfacialhairstyles` WHERE `race` = (@Vulpera);
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@Vulpera, @Male, 0, 0, 0, 0, 0, 0),
(@Vulpera, @Male, 1, 2, 0, 1, 0, 0),
(@Vulpera, @Male, 2, 3, 0, 2, 0, 0),
(@Vulpera, @Male, 3, 4, 0, 3, 0, 0),
(@Vulpera, @Male, 4, 5, 0, 4, 0, 0),
(@Vulpera, @Male, 5, 6, 0, 5, 0, 0),
(@Vulpera, @Male, 6, 7, 0, 0, 0, 0),
(@Vulpera, @Male, 7, 8, 0, 0, 0, 0),
(@Vulpera, @Female, 0, 0, 0, 0, 0, 0),
(@Vulpera, @Female, 1, 1, 0, 0, 0, 0),
(@Vulpera, @Female, 2, 2, 0, 0, 0, 0),
(@Vulpera, @Female, 3, 3, 0, 0, 0, 0),
(@Vulpera, @Female, 4, 4, 0, 0, 0, 0),
(@Vulpera, @Female, 5, 5, 0, 0, 0, 0),
(@Vulpera, @Female, 6, 6, 0, 0, 0, 0);
