-- charhairtextures: 6 inserts, 0 updates, 0 deletes

SET @CharHairTexturesID = (SELECT COALESCE(MAX(id), 0) FROM `charhairtextures`);

-- New entries
DELETE FROM `charhairtextures` WHERE `race` = @Vulpera;
INSERT INTO `charhairtextures` (`id`, `race`, `gender`, `unk_1`, `unk_2`, `unk_3`, `unk_4`, `unk_5`) VALUES
(@CharHairTexturesID := @CharHairTexturesID +1, @Vulpera, 0, 0, 0, 16711680, 0, 65536),
(@CharHairTexturesID := @CharHairTexturesID +1, @Vulpera, 1, 0, 0, 16711680, 0, 65536),
(@CharHairTexturesID := @CharHairTexturesID +1, @Vulpera, 0, 0, 0, 16711680, 0, 65536),
(@CharHairTexturesID := @CharHairTexturesID +1, @Vulpera, 1, 0, 0, 16711680, 0, 65536);
