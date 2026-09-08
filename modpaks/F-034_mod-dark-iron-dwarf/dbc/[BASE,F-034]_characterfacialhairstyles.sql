-- characterfacialhairstyles: 16 inserts, 0 updates, 0 deletes

-- Insertions
DELETE FROM `characterfacialhairstyles` WHERE `race` IN (@DarkIronDwarf, @DarkIronDwarf);
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@DarkIronDwarf, @Male, 0, 0, 0, 0, 0, 0),
(@DarkIronDwarf, @Male, 1, 2, 0, 1, 0, 0),
(@DarkIronDwarf, @Male, 2, 3, 0, 2, 0, 0),
(@DarkIronDwarf, @Male, 3, 4, 0, 3, 0, 0),
(@DarkIronDwarf, @Male, 4, 5, 0, 4, 0, 0),
(@DarkIronDwarf, @Male, 5, 6, 0, 5, 0, 0),
(@DarkIronDwarf, @Male, 6, 7, 0, 0, 0, 0),
(@DarkIronDwarf, @Male, 7, 8, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 0, 0, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 1, 1, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 2, 2, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 3, 3, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 4, 4, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 5, 5, 0, 0, 0, 0),
(@DarkIronDwarf, @Female, 6, 6, 0, 0, 0, 0);
