/* Ensures that faction-restricted quests include Goblins */
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `AllowableRaces` & @OrcMask; -- AND `AllowableRaces` != -1 AND `AllowableRaces` != 2147483647 AND `AllowableRaces` != 2047 AND `AllowableRaces` != 4095 AND `AllowableRaces` != 8191 AND `AllowableRaces` != 16383 AND `AllowableRaces` != 32767 AND `AllowableRaces` != 65535 AND `AllowableRaces` != 131071 AND `AllowableRaces` != 262143 AND `AllowableRaces` != 524287 AND `AllowableRaces` != 1048575 AND `AllowableRaces` != 2097151;
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` & ~@GoblinMask WHERE `id` = 12748;

/* Allows goblins to complete any class-specific quest (ARAC, sweeping approach) */
UPDATE `quest_template` INNER JOIN `quest_template_addon`
	ON `quest_template_addon`.`id` = `quest_template`.`id`
		SET `AllowableRaces` = `AllowableRaces` | @GoblinMask
			WHERE `quest_template_addon`.`allowableclasses` != 0 AND `AllowableRaces` != 0;

/* Allows Goblins to complete race-restricted class quests (non-ARAC, surgical approach) */
/*
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (2383); -- Allow goblin warriors to complete orc warrior quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (3087, 3092, 6061, 6062, 6068, 6069, 6070, 6081, 6082, 6083, 6087, 6088); -- Allow goblin hunters to complete orc hunter quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (1858, 1859, 1963, 2000, 2379, 3088, 9392); -- Allow goblin rogues to complete orc rogue quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (3085, 5642, 5643, 5648, 5649, 5652, 5654, 5655, 5656, 5657, 5680); -- Allow goblin priests to complete troll priest quests (including the troll priest racial quests)
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (63, 96, 100, 220, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1532, 1534, 1535, 1536, 2983, 2984, 3089, 7667); -- Allow goblin shaman to complete orc shaman quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (1881, 1882, 1883, 1884, 1943, 1944, 1945, 1959, 1960, 1961, 3086, 9403); -- Allow goblin mages to complete troll mage quests
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | @GoblinMask WHERE `id` IN (1470, 1471, 1472, 1473, 1474, 1476, 1478, 1485, 1499, 1501, 1504, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1515, 3090, 10790); -- Allow goblin warlocks to complete orc warlock quests
*/
