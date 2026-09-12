-- [F-002] move_npc_races: characterfacialhairstyles

DELETE FROM `characterfacialhairstyles` WHERE `race` IN (@FelOrc, @Naga, @Broken, @Skeleton, @Vrykul, @Tuskarr, @ForestTroll, @Taunka, @NorthrendSkeleton, @IceTroll);
UPDATE `characterfacialhairstyles` SET `race` = @FelOrc            WHERE `race` = 12;
UPDATE `characterfacialhairstyles` SET `race` = @Naga              WHERE `race` = 13;
UPDATE `characterfacialhairstyles` SET `race` = @Broken            WHERE `race` = 14;
UPDATE `characterfacialhairstyles` SET `race` = @Skeleton          WHERE `race` = 15;
UPDATE `characterfacialhairstyles` SET `race` = @Vrykul            WHERE `race` = 16;
UPDATE `characterfacialhairstyles` SET `race` = @Tuskarr           WHERE `race` = 17;
UPDATE `characterfacialhairstyles` SET `race` = @ForestTroll       WHERE `race` = 18;
UPDATE `characterfacialhairstyles` SET `race` = @Taunka            WHERE `race` = 19;
UPDATE `characterfacialhairstyles` SET `race` = @NorthrendSkeleton WHERE `race` = 20;
UPDATE `characterfacialhairstyles` SET `race` = @IceTroll          WHERE `race` = 21;
