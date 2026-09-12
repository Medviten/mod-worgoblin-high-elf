-- characterfacialhairstyles: 21 inserts, 3 updates, 39 deletes

-- Insertions
DELETE FROM `characterfacialhairstyles` WHERE `race` = @Ogre;
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@Ogre, @Male, 0, 0, 0, 0, 0, 0);
