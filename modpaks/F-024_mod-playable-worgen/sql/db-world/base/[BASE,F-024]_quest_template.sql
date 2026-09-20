/* Ensures that faction-restricted quests include Worgen */
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `AllowableRaces` & @HumanMask; -- AND `AllowableRaces` != -1 AND `AllowableRaces` != 2147483647 AND `AllowableRaces` != 2047 AND `AllowableRaces` != 4095 AND `AllowableRaces` != 8191 AND `AllowableRaces` != 16383 AND `AllowableRaces` != 32767 AND `AllowableRaces` != 65535 AND `AllowableRaces` != 131071 AND `AllowableRaces` != 262143 AND `AllowableRaces` != 524287 AND `AllowableRaces` != 1048575 AND `AllowableRaces` != 2097151;
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` & ~@WorgenMask WHERE `id` = 12742;

/* Allows worgen and goblins to complete any class-specific quest (ARAC, sweeping approach) */
UPDATE `quest_template` INNER JOIN `quest_template_addon`
	ON `quest_template_addon`.`id` = `quest_template`.`id`
		SET `AllowableRaces` = `AllowableRaces` | @WorgenMask
			WHERE `quest_template_addon`.`allowableclasses` != 0 AND `AllowableRaces` != 0;

/* Allows Worgen to complete race-restricted class quests (non-ARAC, surgical approach) */
/*
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `id` IN (1703, 1710, 3106, 3116); -- Allow worgen warriors to complete night elf warrior quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `id` IN (3117, 6063, 6071, 6072, 6073, 6101, 6102, 6103, 6721, 6722, 9591, 9592, 9593, 9675); -- Allow worgen hunters to complete night elf hunter quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `id` IN (3118, 2259); -- Allow worgen rogues to complete night elf rogue quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `id` IN (3119, 5621, 5622, 5627, 5628, 5629, 5630, 5631, 5632, 5633, 5672, 5673, 5674, 5675); -- Allow worgen priests to complete night elf priest quests (including the night elf priest racial quests)
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `id` IN (26, 29, 272, 3120, 5061, 5921, 5923, 5924, 5925, 5929, 5931, 6001, 6121, 6122, 6123, 6124, 6125); -- Allow worgen dru`id`s to complete night elf dru`id` quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @WorgenMask WHERE `id` IN (1598, 1599, 1685, 1688, 1689, 1715, 1716, 1717, 1738, 1739, 1758, 1798, 1802, 1804, 3105, 4487, 4488, 4736, 4738, 4965, 4968); -- Allow worgen warlocks to complete human warlock quests
*/
