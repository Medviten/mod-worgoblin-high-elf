/* Ensures that faction-restricted quests include Ogres */
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @OgreMask WHERE `AllowableRaces` & @OrcMask AND `AllowableRaces` != -1 AND `AllowableRaces` != 2147483647 AND `AllowableRaces` != 2047 AND `AllowableRaces` != 4095 AND `AllowableRaces` != 8191 AND `AllowableRaces` != 16383 AND `AllowableRaces` != 32767 AND `AllowableRaces` != 65535 AND `AllowableRaces` != 131071 AND `AllowableRaces` != 262143 AND `AllowableRaces` != 524287 AND `AllowableRaces` != 1048575 AND `AllowableRaces` != 2097151;

/* Allows any race to complete any class-specific quest (ARAC, sweeping approach) */
UPDATE `quest_template` INNER JOIN `quest_template_addon`
	ON `quest_template_addon`.`id` = `quest_template`.id
		SET `AllowableRaces` = `AllowableRaces` | @OgreMask
			WHERE `quest_template_addon`.`allowableclasses` != 0 AND `AllowableRaces` != 0;
