-- Gilnean race support

SET @CharHairTexturesID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`charhairtextures`);

DELETE FROM `charhairtextures` WHERE `id` BETWEEN 140 AND 152;
INSERT INTO `charhairtextures` (`id`, `race`, `gender`, `unk_1`, `unk_2`, `unk_3`, `unk_4`, `unk_5`) VALUES
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Female, 0, 0, -1747320832, 0, 0),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Female, 0, 0, 1747189760, 65551, 0),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 0, 449052672, 131072, 131072),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 0, 524288, 131072, 65536),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 65536, 0, 0),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 131072, 0, 65536),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 262144, 0, 131072),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 524288, 0, 196608),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 1048576, 0, 262144),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 2097152, 0, 327680),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 4194304, 0, 393216),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 8388608, 0, 458752),
(@CharHairTexturesID := @CharHairTexturesID +1, @Gilnean, @Male, 0, 65536, 16777216, 0, 524288);
