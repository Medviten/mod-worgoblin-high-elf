-- [F-30] mod-worgoblin: vocaluisounds
-- Moving Skeleton entry to the new race ID (25) – the others aren't really needed

UPDATE `vocaluisounds` SET `id` = @FelOrc            WHERE `id` = 12;
UPDATE `vocaluisounds` SET `id` = @Naga              WHERE `id` = 13;
UPDATE `vocaluisounds` SET `id` = @Broken            WHERE `id` = 14;
UPDATE `vocaluisounds` SET `id` = @Skeleton          WHERE `id` = 15;
UPDATE `vocaluisounds` SET `id` = @Vrykul            WHERE `id` = 16;
UPDATE `vocaluisounds` SET `id` = @Tuskarr           WHERE `id` = 17;
UPDATE `vocaluisounds` SET `id` = @ForestTroll       WHERE `id` = 18;
UPDATE `vocaluisounds` SET `id` = @Taunka            WHERE `id` = 19;
UPDATE `vocaluisounds` SET `id` = @NorthrendSkeleton WHERE `id` = 20;
UPDATE `vocaluisounds` SET `id` = @IceTroll          WHERE `id` = 21;

-- id: 848
