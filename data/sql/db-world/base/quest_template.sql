/* Ensures that faction-restricted quests include Worgen, Goblins, and High Elves */
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE AllowableRaces & 2 AND AllowableRaces != -1 AND AllowableRaces != 2147483647 AND AllowableRaces != 2047 AND AllowableRaces != 4095 AND AllowableRaces != 8191 AND AllowableRaces != 16383 AND AllowableRaces != 32767 AND AllowableRaces != 65535 AND AllowableRaces != 131071 AND AllowableRaces != 262143 AND AllowableRaces != 524287 AND AllowableRaces != 1048575 AND AllowableRaces != 2097151;
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048|4096 WHERE AllowableRaces & 1 AND AllowableRaces != -1 AND AllowableRaces != 2147483647 AND AllowableRaces != 2047 AND AllowableRaces != 4095 AND AllowableRaces != 8191 AND AllowableRaces != 16383 AND AllowableRaces != 32767 AND AllowableRaces != 65535 AND AllowableRaces != 131071 AND AllowableRaces != 262143 AND AllowableRaces != 524287 AND AllowableRaces != 1048575 AND AllowableRaces != 2097151;
UPDATE quest_template SET AllowableRaces = 4097 WHERE ID = 12742;
UPDATE quest_template SET AllowableRaces = 2 WHERE ID = 12748;

/* Allows worgen and goblin to complete race-restricted class quests */
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (2383); -- Allow goblin warriors to complete orc warrior quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (3087, 3092, 6061, 6062, 6068, 6069, 6070, 6081, 6082, 6083, 6087, 6088); -- Allow goblin hunters to complete orc hunter quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (1858, 1859, 1963, 2000, 2379, 3088, 9392); -- Allow goblin rogues to complete orc rogue quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (3085, 5642, 5643, 5648, 5649, 5652, 5654, 5655, 5656, 5657, 5680); -- Allow goblin priests to complete troll priest quests (including the troll priest racial quests)
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (63, 96, 100, 220, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1532, 1534, 1535, 1536, 2983, 2984, 3089, 7667); -- Allow goblin shaman to complete orc shaman quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (1881, 1882, 1883, 1884, 1943, 1944, 1945, 1959, 1960, 1961, 3086, 9403); -- Allow goblin mages to complete troll mage quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|256 WHERE ID IN (1470, 1471, 1472, 1473, 1474, 1476, 1478, 1485, 1499, 1501, 1504, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1515, 3090, 10790); -- Allow goblin warlocks to complete orc warlock quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048 WHERE ID IN (1703, 1710, 3106, 3116); -- Allow worgen warriors to complete night elf warrior quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048 WHERE ID IN (3117, 6063, 6071, 6072, 6073, 6101, 6102, 6103, 6721, 6722, 9591, 9592, 9593, 9675); -- Allow worgen hunters to complete night elf hunter quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048 WHERE ID IN (3118, 2259); -- Allow worgen rogues to complete night elf rogue quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048 WHERE ID IN (3119, 5621, 5622, 5627, 5628, 5629, 5630, 5631, 5632, 5633, 5672, 5673, 5674, 5675); -- Allow worgen priests to complete night elf priest quests (including the night elf priest racial quests)
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048 WHERE ID IN (26, 29, 272, 3120, 5061, 5921, 5923, 5924, 5925, 5929, 5931, 6001, 6121, 6122, 6123, 6124, 6125); -- Allow worgen druids to complete night elf druid quests
UPDATE quest_template SET AllowableRaces = AllowableRaces|2048 WHERE ID IN (1598, 1599, 1685, 1688, 1689, 1715, 1716, 1717, 1738, 1739, 1758, 1798, 1802, 1804, 3105, 4487, 4488, 4736, 4738, 4965, 4968); -- Allow worgen warlocks to complete human warlock quests

UPDATE `quest_template` INNER JOIN `quest_template_addon` 
	ON `quest_template_addon`.id = `quest_template`.id
		SET AllowableRaces = 8191
			WHERE `quest_template_addon`.allowableclasses != 0 AND AllowableRaces != 0;