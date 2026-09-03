-- Mirroring blood elf, it looks like this bit should include high elf
UPDATE `helmetgeosetvisdata` SET `hide_geoset_6` = `hide_geoset_6` | @HighElfHelmetMask WHERE `id` = 376; -- +high elf
