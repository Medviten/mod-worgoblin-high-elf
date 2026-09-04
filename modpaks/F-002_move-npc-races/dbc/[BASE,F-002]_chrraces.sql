-- [F-030] move_npc_races: chrraces: 0 inserts, 10 updates, 0 deletes

DELETE FROM `chrraces` WHERE `id` IN (@FelOrc, @Naga, @Broken, @Skeleton, @Vrykul, @Tuskarr, @ForestTroll, @Taunka, @NorthrendSkeleton, @IceTroll);
UPDATE `chrraces` SET `id` = @FelOrc            WHERE `id` = 12;
UPDATE `chrraces` SET `id` = @Naga              WHERE `id` = 13;
UPDATE `chrraces` SET `id` = @Skeleton          WHERE `id` = 14;
UPDATE `chrraces` SET `id` = @Vrykul            WHERE `id` = 15;
UPDATE `chrraces` SET `id` = @Tuskarr           WHERE `id` = 16;
UPDATE `chrraces` SET `id` = @ForestTroll       WHERE `id` = 17;
UPDATE `chrraces` SET `id` = @Tuskarr           WHERE `id` = 18;
UPDATE `chrraces` SET `id` = @Taunka            WHERE `id` = 19;
UPDATE `chrraces` SET `id` = @NorthrendSkeleton WHERE `id` = 20;
UPDATE `chrraces` SET `id` = @IceTroll          WHERE `id` = 21;
