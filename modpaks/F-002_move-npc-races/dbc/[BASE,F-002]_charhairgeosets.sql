-- [F-30] mod-worgoblin: charhairgeosets

DELETE FROM `charhairgeosets` WHERE `race` IN (@FelOrc, @Naga, @Broken, @Skeleton, @Vrykul, @Tuskarr, @ForestTroll, @Taunka, @NorthrendSkeleton, @IceTroll);
UPDATE `charhairgeosets` SET `race` = @FelOrc            WHERE `race` = 12;
UPDATE `charhairgeosets` SET `race` = @Naga              WHERE `race` = 13;
UPDATE `charhairgeosets` SET `race` = @Broken            WHERE `race` = 14;
UPDATE `charhairgeosets` SET `race` = @Skeleton          WHERE `race` = 15;
UPDATE `charhairgeosets` SET `race` = @Vrykul            WHERE `race` = 16;
UPDATE `charhairgeosets` SET `race` = @Tuskarr           WHERE `race` = 17;
UPDATE `charhairgeosets` SET `race` = @ForestTroll       WHERE `race` = 18;
UPDATE `charhairgeosets` SET `race` = @Taunka            WHERE `race` = 19;
UPDATE `charhairgeosets` SET `race` = @NorthrendSkeleton WHERE `race` = 20;
UPDATE `charhairgeosets` SET `race` = @IceTroll          WHERE `race` = 21;

/*
Original range:
247
264–265
294–295
297–299
301–302
304–307
314–325
327–334
435–436
438–444
*/
