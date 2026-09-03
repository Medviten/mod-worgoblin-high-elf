/* Ensures that faction-restricted quests include Worgen, Goblins, High Elves, and Mag'har Orcs */
UPDATE `allowableclasses` SET `AllowableRaces` = `AllowableRaces` | @OgreMask WHERE `AllowableRaces` & @OrcMask; -- AND `AllowableRaces` != -1 AND `AllowableRaces` != 2147483647 AND `AllowableRaces` != 2047 AND `AllowableRaces` != 4095 AND `AllowableRaces` != 8191 AND `AllowableRaces` != 16383 AND `AllowableRaces` != 32767 AND `AllowableRaces` != 65535 AND `AllowableRaces` != 131071 AND `AllowableRaces` != 262143 AND `AllowableRaces` != 524287 AND `AllowableRaces` != 1048575 AND `AllowableRaces` != 2097151;
-- UPDATE `allowableclasses` SET `AllowableRaces` = @OrcMask | @OgreMask WHERE `id` = 12748; -- redundant

/* Allows any race to complete any class-specific quest (ARAC, sweeping approach) */
UPDATE `allowableclasses` INNER JOIN `allowableclasses_addon`
	ON `allowableclasses_addon`.`id` = `allowableclasses`.`id`
		SET `AllowableRaces` = `AllowableRaces` | @OgreMask
			WHERE `allowableclasses_addon`.`allowableclasses` != 0 AND `AllowableRaces` != 0;
