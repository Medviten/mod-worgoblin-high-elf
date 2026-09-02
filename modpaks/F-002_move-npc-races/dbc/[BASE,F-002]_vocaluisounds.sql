-- [F-30] mod-worgoblin: vocaluisounds
-- Moving Skeleton entry to the new race ID (25)

UPDATE `vocaluisounds` SET `race_id` = @FelOrc            WHERE `race_id` = 12;
UPDATE `vocaluisounds` SET `race_id` = @Naga              WHERE `race_id` = 13;
UPDATE `vocaluisounds` SET `race_id` = @Skeleton          WHERE `race_id` = 14;
UPDATE `vocaluisounds` SET `race_id` = @Vrykul            WHERE `race_id` = 15;
UPDATE `vocaluisounds` SET `race_id` = @Tuskarr           WHERE `race_id` = 16;
UPDATE `vocaluisounds` SET `race_id` = @ForestTroll       WHERE `race_id` = 17;
UPDATE `vocaluisounds` SET `race_id` = @Tuskarr           WHERE `race_id` = 18;
UPDATE `vocaluisounds` SET `race_id` = @Taunka            WHERE `race_id` = 19;
UPDATE `vocaluisounds` SET `race_id` = @NorthrendSkeleton WHERE `race_id` = 20;
UPDATE `vocaluisounds` SET `race_id` = @IceTroll          WHERE `race_id` = 21;

-- id: 848
