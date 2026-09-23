-- characterfacialhairstyles: 25 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `characterfacialhairstyles` WHERE `race` = @KulTiran;
INSERT INTO `characterfacialhairstyles` (`race`, `gender`, `variation_id`, `geoset_1`, `geoset_2`, `geoset_3`, `geoset_4`, `geoset_5`) VALUES
(@KulTiran, @Male,    0, 0, 0, 0, 0, 0),
(@KulTiran, @Male,    1, 1, 0, 0, 0, 0),
(@KulTiran, @Male,    2, 1, 1, 0, 0, 0),
(@KulTiran, @Male,    3, 1, 2, 0, 0, 0),
(@KulTiran, @Male,    4, 1, 3, 0, 0, 0),
(@KulTiran, @Male,    5, 2, 0, 0, 0, 0),
(@KulTiran, @Male,    6, 2, 1, 0, 0, 0),
(@KulTiran, @Male,    7, 2, 2, 0, 0, 0),
(@KulTiran, @Male,    8, 2, 3, 0, 0, 0),
(@KulTiran, @Male,    9, 3, 0, 0, 0, 0),
(@KulTiran, @Male,   10, 3, 1, 0, 0, 0),
(@KulTiran, @Male,   11, 3, 2, 0, 0, 0),
(@KulTiran, @Male,   12, 3, 3, 0, 0, 0),
(@KulTiran, @Male,   13, 4, 0, 0, 0, 0),
(@KulTiran, @Male,   14, 4, 1, 0, 0, 0),
(@KulTiran, @Male,   15, 4, 2, 0, 0, 0),
(@KulTiran, @Male,   16, 4, 3, 0, 0, 0),
(@KulTiran, @Male,   17, 5, 0, 0, 0, 0),
(@KulTiran, @Male,   18, 5, 1, 0, 0, 0),
(@KulTiran, @Male,   19, 5, 2, 0, 0, 0),
(@KulTiran, @Male,   20, 5, 3, 0, 0, 0),
(@KulTiran, @Female,  0, 1, 0, 0, 0, 0),
(@KulTiran, @Female,  1, 2, 0, 0, 0, 2),
(@KulTiran, @Female,  2, 3, 0, 0, 0, 2),
(@KulTiran, @Female,  3, 4, 0, 0, 0, 2);
