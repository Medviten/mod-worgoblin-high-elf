DROP TABLE IF EXISTS `playerbots_rpg_races`;
CREATE TABLE `playerbots_rpg_races`
(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` int(11),
  `race` int(11),
  `minl` int(11),
  `maxl` int(11),
  PRIMARY KEY (`id`),
  KEY `entry` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `playerbots_rpg_races`;

-- say

INSERT INTO `playerbots_rpg_races` VALUES
--
--       DRAENEI
--
-- Draenei Azumeryst Isle
(NULL, 16553, 11, 1, 10),
-- Draenei Bloodmyst Isle
(NULL, 17553, 11, 10, 20),
--
--       HUMANS & HIGH ELVES
--
-- Innkeeper Farley, Goldshire
(NULL, 295, 1, 1, 10), -- humans
(NULL, 295, 13, 1, 10), -- high elves
-- Innkeeper Heather, Westfall
(NULL, 8931, 1, 10, 20),
(NULL, 8931, 13, 10, 20),
--
--       DWARVES, GNOMES & DARK IRON DWARVES
--
-- Innkeeper Belm, Kharanos
(NULL, 1247, 3, 1, 10),
(NULL, 1247, 7, 1, 10),
(NULL, 1247, 16, 1, 10),
-- Innkeeper Hearthstove, Loch Modan
(NULL, 6734, 3, 10, 20),
(NULL, 6734, 7, 10, 20),
(NULL, 6734, 16, 10, 20),
--
--       NIGHT ELVES & WORGEN
--
-- Innkeeper Keldamyr, Dolanaar
(NULL, 6736, 4, 1, 10),
(NULL, 6736, 12, 1, 10),
-- Innkeeper Shaussiy, Auberdine
(NULL, 6737, 4, 10, 20),
(NULL, 6737, 12, 10, 20),
--
--       ALLIANCE CITIES
--
-- Innkeeper Saelienne, Darnassus
(NULL, 6735, 4, 10, 80), -- night elves
(NULL, 6735, 12, 10, 80), -- worgen
--
-- Innkeeper Firebrew, Ironforge
(NULL, 5111, 3, 10, 80), -- dwarves
(NULL, 5111, 7, 10, 80), -- gnomes
(NULL, 5111, 4, 10, 80), -- night elves
(NULL, 5111, 1, 10, 80), -- human
(NULL, 5111, 11, 20, 80), -- draenei
(NULL, 5111, 12, 10, 80), -- worgen
(NULL, 5111, 13, 10, 80), -- high elves
(NULL, 5111, 16, 10, 80), -- dark iron dwarves
--
-- Innkeeper Allison, Stormwind
(NULL, 6740, 1, 10, 80), -- human
(NULL, 6740, 3, 10, 80), -- dwarves
(NULL, 6740, 4, 10, 80), -- night elves
(NULL, 6740, 7, 10, 80), -- gnomes
(NULL, 6740, 11, 20, 80), -- draenei
(NULL, 6740, 12, 10, 80), -- worgen
(NULL, 6740, 13, 10, 80), -- high elves
(NULL, 6740, 16, 10, 80), -- dark iron dwarves
--
-- Caregiver Breel Exodar
(NULL, 16739, 11, 10, 80), -- draenei
(NULL, 16739, 1, 60, 80), -- human
(NULL, 16739, 3, 60, 80), -- dwarves
(NULL, 16739, 4, 60, 80), -- night elves
(NULL, 16739, 7, 60, 80), -- gnomes
(NULL, 16739, 12, 60, 80), -- worgen
(NULL, 16739, 13, 60, 80), -- high elves
(NULL, 16739, 16, 60, 80), -- dark iron dwarves
--
--       ALLIANCE CONTESTED LOCATIONS
--
-- Innkeeper Kimlya, Astranaar
--
(NULL, 6738, 4, 15, 30), -- night elves
(NULL, 6738, 11, 20, 30), -- draenei
(NULL, 6738, 12, 15, 30), -- worgen
--
-- Innkeeper Faralia, Stonetalon Peak
--
(NULL, 16458, 4, 15, 27), -- night elves
(NULL, 16458, 12, 15, 27), -- worgen
--
-- Innkeeper Lyshaerya, Desolace
--
(NULL, 11103, 4, 30, 40), -- night elves
(NULL, 11103, 12, 30, 40), -- worgen
--
-- Innkeeper Shyria, Feathermoon, Feralas
(NULL, 7736, 4, 40, 50), -- night elves
(NULL, 7736, 12, 40, 50), -- worgen
--
-- Falfindel Waywarder, Feralas elf camp
(NULL, 4048, 4, 40, 50), -- night elves
(NULL, 4048, 12, 40, 50), -- worgen
--
-- Innkeeper Helbrek, Wetlands
--
(NULL, 1464, 3, 20, 30), -- dwarves
(NULL, 1464, 7, 20, 30), -- gnomes
(NULL, 1464, 16, 20, 30), -- dark iron dwarves
--
-- Innkeeper Trelayne, Duskwood
--
(NULL, 6790, 1, 18, 30), -- human
(NULL, 6790, 3, 18, 30), -- dwarves
(NULL, 6790, 7, 18, 30), -- gnomes
(NULL, 6790, 11, 20, 30), -- draenei
(NULL, 6790, 12, 20, 30), -- worgen
(NULL, 6790, 13, 18, 30), -- high elves
(NULL, 6790, 16, 18, 30), -- dark iron dwarves
--
-- Innkeeper Brianna, Redridge Mountains
--
(NULL, 6727, 1, 15, 25), -- human
(NULL, 6727, 13, 15, 25), -- high elves
--
-- Innkeeper Anderson, Southshore, Hillsbrad
(NULL, 2352, 1, 20, 30), -- human
(NULL, 2352, 3, 20, 30), -- dwarves
(NULL, 2352, 7, 20, 30), -- gnomes
(NULL, 2352, 11, 20, 30), -- draenei
(NULL, 2352, 16, 20, 30), -- dark iron dwarves
--
-- Captain Nials, Refuge Pointe, Arathi
(NULL, 2700, 1, 30, 40), -- human
(NULL, 2700, 3, 30, 40), -- dwarves
(NULL, 2700, 7, 30, 40), -- gnomes
(NULL, 2700, 4, 30, 40), -- night elves
(NULL, 2700, 11, 30, 40), -- draenei
(NULL, 2700, 12, 30, 40), -- worgen
(NULL, 2700, 13, 30, 40), -- high elves
(NULL, 2700, 16, 30, 40), -- dark iron dwarves
--
-- Lt. Doren, Stranglethorn Vale
(NULL, 469, 1, 30, 45), -- human
(NULL, 469, 3, 30, 45), -- dwarves
(NULL, 469, 4, 30, 45), -- night elves
(NULL, 469, 7, 30, 45), -- gnomes
(NULL, 469, 11, 30, 45), -- draenei
(NULL, 469, 12, 30, 45), -- worgen
(NULL, 469, 13, 30, 45), -- high elves
(NULL, 469, 16, 30, 45), -- dark iron dwarves
--
-- Innkeeper Janene, Theramore
(NULL, 6272, 1, 35, 45), -- human
(NULL, 6272, 3, 35, 45), -- dwarves
(NULL, 6272, 7, 35, 45), -- gnomes
(NULL, 6272, 11, 35, 45), -- draenei
(NULL, 6272, 13, 35, 45), -- high elves
(NULL, 6272, 16, 35, 45), -- dark iron dwarves
--
-- Innkeeper Prospector Ryedol, Badlands Q-giver
(NULL, 2910, 3, 35, 45), -- dwarves
(NULL, 2910, 7, 35, 45), -- gnomes
(NULL, 2910, 16, 35, 45), -- dark iron dwarves
--
-- Innkeeper Thulfram, Hinterlands, Dwarven Outpost
(NULL, 7744, 3, 40, 50), -- dwarves
(NULL, 7744, 1, 40, 50), -- human
(NULL, 7744, 7, 40, 50), -- gnomes
(NULL, 7744, 13, 40, 50), -- high elves
(NULL, 7744, 16, 40, 50), -- dark iron dwarves
--
-- Loh'atu, Azshara alliance camp Q-giver 11548
(NULL, 11548, 4, 45, 55), -- night elves
(NULL, 11548, 1, 45, 55), -- human
(NULL, 11548, 11, 45, 55), -- draenei
(NULL, 11548, 12, 45, 55), -- worgen
(NULL, 11548, 13, 45, 55), -- high elves
--
-- Thadius Grimshade, Nethergarde Keep, Blasted Lands
(NULL, 8022, 1, 45, 55), -- human
(NULL, 8022, 3, 45, 55), -- dwarves
(NULL, 8022, 4, 45, 55), -- night elves
(NULL, 8022, 7, 45, 55), -- gnomes
(NULL, 8022, 11, 45, 55), -- draenei
(NULL, 8022, 12, 45, 55), -- worgen
(NULL, 8022, 13, 45, 55), -- high elves
(NULL, 8022, 16, 45, 55), -- dark iron dwarves
--
-- Gothine the Hooded, Felwood Alliance camp
(NULL, 9465, 4, 48, 55), -- night elves
(NULL, 9465, 1, 48, 55), -- human
(NULL, 9465, 3, 48, 55), -- dwarves
(NULL, 9465, 7, 48, 55), -- gnomes
(NULL, 9465, 11, 48, 55), -- draenei
(NULL, 9465, 12, 48, 55), -- worgen
(NULL, 9465, 13, 48, 55), -- high elves
(NULL, 9465, 16, 48, 55), -- dark iron dwarves
--
-- Muigin, Alliance Q-giver, Un'Goro
(NULL, 9119, 1, 48, 55), -- human
(NULL, 9119, 3, 48, 55), -- dwarves
(NULL, 9119, 4, 48, 55), -- night elves
(NULL, 9119, 7, 48, 55), -- gnomes
(NULL, 9119, 11, 48, 55), -- draenei
(NULL, 9119, 12, 48, 55), -- worgen
(NULL, 9119, 13, 48, 55), -- high elves
(NULL, 9119, 16, 48, 55), -- dark iron dwarves
--
-- Alchemist Arbington, West Plaguelands, Human
(NULL, 11056, 1, 51, 58), -- human
(NULL, 11056, 3, 51, 58), -- dwarves
(NULL, 11056, 4, 51, 58), -- night elves
(NULL, 11056, 7, 51, 58), -- gnomes
(NULL, 11056, 11, 51, 58), -- draenei
(NULL, 11056, 12, 51, 58), -- worgen
(NULL, 11056, 13, 51, 58), -- high elves
(NULL, 11056, 16, 51, 58), -- dark iron dwarves
--
-- Borgus Stourarm, Alliance Taxi, Burning Steppes
(NULL, 2299, 1, 50, 60), -- human
(NULL, 2299, 3, 50, 60), -- dwarves
(NULL, 2299, 4, 50, 60), -- night elves
(NULL, 2299, 7, 50, 60), -- gnomes
(NULL, 2299, 11, 50, 60), -- draenei
(NULL, 2299, 12, 50, 60), -- worgen
(NULL, 2299, 13, 50, 60), -- high elves
(NULL, 2299, 16, 50, 60), -- dark iron dwarves
--
-- Marshal Bluewall, Alliance camp, Silithus
(NULL, 17080, 1, 55, 60), -- human
(NULL, 17080, 3, 55, 60), -- dwarves
(NULL, 17080, 4, 55, 60), -- night elves
(NULL, 17080, 7, 55, 60), -- gnomes
(NULL, 17080, 11, 55, 60), -- draenei
(NULL, 17080, 12, 55, 60), -- worgen
(NULL, 17080, 13, 55, 60), -- high elves
(NULL, 17080, 16, 55, 60), -- dark iron dwarves
--
--           OUTLAND
--
-- Commander Duron, Dark Portal
(NULL, 19229, 1, 58, 59), -- human
(NULL, 19229, 3, 58, 59), -- dwarves
(NULL, 19229, 4, 58, 59), -- night elves
(NULL, 19229, 7, 58, 59), -- gnomes
(NULL, 19229, 11, 58, 59), -- draenei
(NULL, 19229, 12, 58, 59), -- worgen
(NULL, 19229, 13, 58, 59), -- high elves
(NULL, 19229, 16, 58, 59), -- dark iron dwarves
--
-- Sid Limbardi, Honor Hold, Hellfire
(NULL, 16826, 1, 58, 63), -- human
(NULL, 16826, 3, 58, 63), -- dwarves
(NULL, 16826, 4, 58, 63), -- night elves
(NULL, 16826, 7, 58, 63), -- gnomes
(NULL, 16826, 11, 58, 63), -- draenei
(NULL, 16826, 12, 58, 63), -- worgen
(NULL, 16826, 13, 58, 63), -- high elves
(NULL, 16826, 16, 58, 63), -- dark iron dwarves
--
-- Caregiver Ophera Windfury, Draenei, Hellfire
(NULL, 18906, 1, 60, 63), -- human
(NULL, 18906, 3, 60, 63), -- dwarves
(NULL, 18906, 4, 60, 63), -- night elves
(NULL, 18906, 7, 60, 63), -- gnomes
(NULL, 18906, 11, 60, 63), -- draenei
(NULL, 18906, 12, 60, 63), -- worgen
(NULL, 18906, 13, 60, 63), -- high elves
(NULL, 18906, 16, 60, 63), -- dark iron dwarves
--
-- Caregiver Abidaar, Telredor, Zangarmarsh
(NULL, 18251, 1, 60, 63), -- human
(NULL, 18251, 3, 60, 63), -- dwarves
(NULL, 18251, 4, 60, 63), -- night elves
(NULL, 18251, 7, 60, 63), -- gnomes
(NULL, 18251, 11, 60, 63), -- draenei
(NULL, 18251, 12, 60, 63), -- worgen
(NULL, 18251, 13, 60, 63), -- high elves
(NULL, 18251, 16, 60, 63), -- dark iron dwarves
--
-- Caregiver Kerp, Orebor, Zangarmarsh
(NULL, 18908, 1, 61, 64), -- human
(NULL, 18908, 3, 61, 64), -- dwarves
(NULL, 18908, 4, 61, 64), -- night elves
(NULL, 18908, 7, 61, 64), -- gnomes
(NULL, 18908, 11, 61, 64), -- draenei
(NULL, 18908, 12, 61, 64), -- worgen
(NULL, 18908, 13, 61, 64), -- high elves
(NULL, 18908, 16, 61, 64), -- dark iron dwarves
--
-- Innkeeper Biribi, Terrokar
(NULL, 19296, 1, 62, 65), -- human
(NULL, 19296, 3, 62, 65), -- dwarves
(NULL, 19296, 4, 62, 65), -- night elves
(NULL, 19296, 7, 62, 65), -- gnomes
(NULL, 19296, 11, 62, 65), -- draenei
(NULL, 19296, 12, 62, 65), -- worgen
(NULL, 19296, 13, 62, 65), -- high elves
(NULL, 19296, 16, 62, 65), -- dark iron dwarves
--
-- Caregiver Isel, Telaar, Nagrand
(NULL, 18914, 1, 64, 67), -- human
(NULL, 18914, 3, 64, 67), -- dwarves
(NULL, 18914, 4, 64, 67), -- night elves
(NULL, 18914, 7, 64, 67), -- gnomes
(NULL, 18914, 11, 64, 67), -- draenei
(NULL, 18914, 12, 64, 67), -- worgen
(NULL, 18914, 13, 64, 67), -- high elves
(NULL, 18914, 16, 64, 67), -- dark iron dwarves
--
-- Innkeeper Shaunessy, Sylvanaar, Blade's Edge
(NULL, 19495, 1, 65, 68), -- human
(NULL, 19495, 3, 65, 68), -- dwarves
(NULL, 19495, 4, 65, 68), -- night elves
(NULL, 19495, 7, 65, 68), -- gnomes
(NULL, 19495, 11, 65, 68), -- draenei
(NULL, 19495, 12, 65, 68), -- worgen
(NULL, 19495, 13, 65, 68), -- high elves
(NULL, 19495, 16, 65, 68), -- dark iron dwarves
--
-- Innkeeper Fizir Doc Clocktock, Blade's Edge
(NULL, 21110, 1, 65, 68), -- human
(NULL, 21110, 3, 65, 68), -- dwarves
(NULL, 21110, 4, 65, 68), -- night elves
(NULL, 21110, 7, 65, 68), -- gnomes
(NULL, 21110, 11, 65, 68), -- draenei
(NULL, 21110, 12, 65, 68), -- worgen
(NULL, 21110, 13, 65, 68), -- high elves
(NULL, 21110, 16, 65, 68), -- dark iron dwarves
--
-- Innkeeper Dreg Cloudsweeper, Shadowmoon
(NULL, 19352, 1, 67, 70), -- human
(NULL, 19352, 3, 67, 70), -- dwarves
(NULL, 19352, 4, 67, 70), -- night elves
(NULL, 19352, 7, 67, 70), -- gnomes
(NULL, 19352, 11, 67, 70), -- draenei
(NULL, 19352, 12, 67, 70), -- worgen
(NULL, 19352, 13, 67, 70), -- high elves
(NULL, 19352, 16, 67, 70), -- dark iron dwarves
--
--           NORTHREND
--
-- Isirami Fairwind, Dalaran
(NULL, 32413, 1, 72, 80), -- human
(NULL, 32413, 3, 72, 80), -- dwarves
(NULL, 32413, 4, 72, 80), -- night elves
(NULL, 32413, 7, 72, 80), -- gnomes
(NULL, 32413, 11, 72, 80), -- draenei
(NULL, 32413, 12, 72, 80), -- worgen
(NULL, 32413, 13, 72, 80), -- high elves
(NULL, 32413, 16, 72, 80), -- dark iron dwarves
--
-- James Deacon, Valiance Keep, Borean Tundra
(NULL, 25245, 1, 68, 72), -- human
(NULL, 25245, 3, 68, 72), -- dwarves
(NULL, 25245, 4, 68, 72), -- night elves
(NULL, 25245, 7, 68, 72), -- gnomes
(NULL, 25245, 11, 68, 72), -- draenei
(NULL, 25245, 12, 68, 72), -- worgen
(NULL, 25245, 13, 68, 72), -- high elves
(NULL, 25245, 16, 68, 72), -- dark iron dwarves
--
-- "Charlie" Northtop, Fizzcrank Airstrip, Borean Tundra
(NULL, 26596, 1, 69, 72), -- human
(NULL, 26596, 3, 69, 72), -- dwarves
(NULL, 26596, 4, 69, 72), -- night elves
(NULL, 26596, 7, 69, 72), -- gnomes
(NULL, 26596, 11, 69, 72), -- draenei
(NULL, 26596, 12, 69, 72), -- worgen
(NULL, 26596, 13, 69, 72), -- high elves
(NULL, 26596, 16, 69, 72), -- dark iron dwarves
--
-- Innkeeper Hazel Lagras, Valgarde, Howling Fjord
(NULL, 23731, 1, 68, 72), -- human
(NULL, 23731, 3, 68, 72), -- dwarves
(NULL, 23731, 4, 68, 72), -- night elves
(NULL, 23731, 7, 68, 72), -- gnomes
(NULL, 23731, 11, 68, 72), -- draenei
(NULL, 23731, 12, 68, 72), -- worgen
(NULL, 23731, 13, 68, 72), -- high elves
(NULL, 23731, 16, 68, 72), -- dark iron dwarves
--
-- Innkeeper Celeste Goodhutch, Westguard Keep, Howling Fjord
(NULL, 23937, 1, 69, 72), -- human
(NULL, 23937, 3, 69, 72), -- dwarves
(NULL, 23937, 4, 69, 72), -- night elves
(NULL, 23937, 7, 69, 72), -- gnomes
(NULL, 23937, 11, 69, 72), -- draenei
(NULL, 23937, 12, 69, 72), -- worgen
(NULL, 23937, 13, 69, 72), -- high elves
(NULL, 23937, 16, 69, 72), -- dark iron dwarves
--
-- Christina Daniels, Fort Wildervar, Howling Fjord
(NULL, 24057, 1, 70, 72), -- human
(NULL, 24057, 3, 70, 72), -- dwarves
(NULL, 24057, 4, 70, 72), -- night elves
(NULL, 24057, 7, 70, 72), -- gnomes
(NULL, 24057, 11, 70, 72), -- draenei
(NULL, 24057, 12, 70, 72), -- worgen
(NULL, 24057, 13, 70, 72), -- high elves
(NULL, 24057, 16, 70, 72), -- dark iron dwarves
--
-- Jennifer Bell, Amberpine Lodge, Grizzly Hills
(NULL, 27066, 1, 70, 74), -- human
(NULL, 27066, 3, 70, 74), -- dwarves
(NULL, 27066, 4, 70, 74), -- night elves
(NULL, 27066, 7, 70, 74), -- gnomes
(NULL, 27066, 11, 70, 74), -- draenei
(NULL, 27066, 12, 70, 74), -- worgen
(NULL, 27066, 13, 70, 74), -- high elves
(NULL, 27066, 16, 70, 74), -- dark iron dwarves
--
-- Quartermaster McCarty, Westfall Brigade Encampment, Grizzly Hills
(NULL, 26375, 1, 70, 74), -- human
(NULL, 26375, 3, 70, 74), -- dwarves
(NULL, 26375, 4, 70, 74), -- night elves
(NULL, 26375, 7, 70, 74), -- gnomes
(NULL, 26375, 11, 70, 74), -- draenei
(NULL, 26375, 12, 70, 74), -- worgen
(NULL, 26375, 13, 70, 74), -- high elves
(NULL, 26375, 16, 70, 74), -- dark iron dwarves
--
-- Illusia Lune, Wintergarde Keep, Dragonblight
(NULL, 27042, 1, 71, 75), -- human
(NULL, 27042, 3, 71, 75), -- dwarves
(NULL, 27042, 4, 71, 75), -- night elves
(NULL, 27042, 7, 71, 75), -- gnomes
(NULL, 27042, 11, 71, 75), -- draenei
(NULL, 27042, 12, 71, 75), -- worgen
(NULL, 27042, 13, 71, 75), -- high elves
(NULL, 27042, 16, 71, 75), -- dark iron dwarves
--
-- Naohain, Stars' Rest, Dragonblight
(NULL, 27052, 1, 71, 75), -- human
(NULL, 27052, 3, 71, 75), -- dwarves
(NULL, 27052, 4, 71, 75), -- night elves
(NULL, 27052, 7, 71, 75), -- gnomes
(NULL, 27052, 11, 71, 75), -- draenei
(NULL, 27052, 12, 71, 75), -- worgen
(NULL, 27052, 13, 71, 75), -- high elves
(NULL, 27052, 16, 71, 75), -- dark iron dwarves
--
-- Gunda Boldhammer, Frosthold, Storm Peaks
(NULL, 29926, 1, 77, 80), -- human
(NULL, 29926, 3, 77, 80), -- dwarves
(NULL, 29926, 4, 77, 80), -- night elves
(NULL, 29926, 7, 77, 80), -- gnomes
(NULL, 29926, 11, 77, 80), -- draenei
(NULL, 29926, 12, 77, 80), -- worgen
(NULL, 29926, 13, 77, 80), -- high elves
(NULL, 29926, 16, 77, 80), -- dark iron dwarves
--
-- Caris Sunlance, Argent Tournament, Icecrown
(NULL, 33970, 1, 80, 80), -- human
(NULL, 33970, 3, 80, 80), -- dwarves
(NULL, 33970, 4, 80, 80), -- night elves
(NULL, 33970, 7, 80, 80), -- gnomes
(NULL, 33970, 11, 80, 80), -- draenei
(NULL, 33970, 12, 80, 80), -- worgen
(NULL, 33970, 13, 80, 80), -- high elves
(NULL, 33970, 16, 80, 80), -- dark iron dwarves
--
--       ALLIANCE MOUNT VENDORS
--
-- Milli Featherwhistle, Gnome Mechanostrider merchant, Dun Morogh
-- (NULL, 7955, 3),
-- (NULL, 7955, 7),
--
-- Lelanai, Night Elf Night Saber vendor, Darnassus
-- (NULL, 4730, 4),
--
-- Katie Hunter, Human Horse vendor, Elwynn Forest
-- (NULL, 384, 1),
--
--       HORDE
--
--       ORCS, TROLLS, GOBLINS, MAG'HAR ORCS & OGRES
--
-- Innkeeper Grosk, Durotar
(NULL, 6928, 2, 1, 10), -- orcs
(NULL, 6928, 8, 1, 10), -- trolls
(NULL, 6928, 9, 1, 10), -- goblins
(NULL, 6928, 14, 1, 10), -- mag'har orcs
(NULL, 6928, 15, 1, 10), -- ogres
--
--       TAUREN
--
-- Innkeeper Pala, Mulgore
(NULL, 6746, 6, 1, 10),
--
--       UNDEAD
--
-- Innkeeper Renee, Brill, Tirisfal Glades
(NULL, 5688, 5, 1, 10),
-- Innkeeper Bates, The Sepulcher, Silverpine Forest
(NULL, 6739, 5, 10, 20),
--
--       BLOOD ELVES
--
-- Blood Elves, Eversong Woods
(NULL, 15397, 10, 1, 10),
-- Blood Elves, Ghostlands
(NULL, 16542, 10, 10, 20),
--
--       HORDE CITIES
--
-- Innkeeper Gryshka, Orgrimmar
(NULL, 6929, 2, 10, 80), -- orcs
(NULL, 6929, 8, 10, 80), -- trolls
(NULL, 6929, 6, 10, 80), -- tauren
(NULL, 6929, 5, 20, 80), -- undead
(NULL, 6929, 10, 20, 80), -- blood elves
(NULL, 6929, 9, 10, 80), -- goblins
(NULL, 6929, 14, 10, 80), -- mag'har orcs
(NULL, 6929, 15, 10, 80), -- ogres
--
-- Innkeeper Pala, Thunder Bluff, Mulgore
(NULL, 6746, 6, 10, 80), -- tauren
--
-- Innkeeper Norman, Undercity
(NULL, 6741, 5, 10, 80), -- undead
(NULL, 6741, 10, 20, 80), -- blood elves
--
-- Innkeeper Velandra Silvermoon
(NULL, 16618, 10, 10, 80), -- blood elves
-- Innkeeper Jovia Silvermoon
(NULL, 17630, 2, 60, 80), -- orcs
(NULL, 17630, 5, 60, 80), -- undead
(NULL, 17630, 6, 60, 80), -- tauren
(NULL, 17630, 8, 60, 80), -- trolls
(NULL, 17630, 9, 60, 80), -- goblins
(NULL, 17630, 14, 60, 80), -- mag'har orcs
(NULL, 17630, 15, 60, 80), -- ogres
-- Innkeeper Delaniel Silvermoon Entrance
(NULL, 15433, 10, 5, 7), -- blood elves
--
--       HORDE CONTESTED LOCATIONS
--
-- Innkeeper Boorand Plainswind, Crossroads, Barrens
(NULL, 3934, 2, 10, 25), -- orcs
(NULL, 3934, 6, 10, 25), -- tauren
(NULL, 3934, 8, 10, 25), -- trolls
(NULL, 3934, 10, 20, 25), -- blood elves
-- (NULL, 3934, 5, 15, 25), -- undead
(NULL, 3934, 9, 10, 25), -- goblins
(NULL, 3934, 14, 10, 25), -- mag'har orcs
(NULL, 3934, 15, 10, 25), -- ogres
--
-- Innkeeper Byula, Camp Taurajo, Barrens
(NULL, 7714, 2, 10, 25), -- orcs
(NULL, 7714, 6, 10, 25), -- tauren
(NULL, 7714, 8, 10, 25), -- trolls
(NULL, 7714, 9, 10, 25), -- goblins
(NULL, 7714, 14, 10, 25), -- mag'har orcs
(NULL, 7714, 15, 10, 25), -- ogres
--
-- Innkeeper Jayka, Stonetalon, Red Rock Retreat
(NULL, 7731, 2, 15, 27), -- orcs
(NULL, 7731, 6, 15, 27), -- tauren
(NULL, 7731, 8, 15, 27), -- trolls
(NULL, 7731, 10, 20, 27), -- blood elves
(NULL, 7731, 9, 15, 27), -- goblins
(NULL, 7731, 14, 15, 27), -- mag'har orcs
(NULL, 7731, 15, 15, 27), -- ogres
--
-- Innkeeper Abeqwa, Thousand Needles
(NULL, 11116, 2, 25, 35), -- orcs
(NULL, 11116, 6, 25, 35), -- tauren
(NULL, 11116, 8, 25, 35), -- trolls
(NULL, 11116, 10, 25, 35), -- blood elves
(NULL, 11116, 9, 25, 35), -- goblins
(NULL, 11116, 14, 25, 35), -- mag'har orcs
(NULL, 11116, 15, 25, 35), -- ogres
--
-- Innkeeper Shay, Tarren Mill, Hillsbrad
(NULL, 2388, 5, 20, 30), -- undead
(NULL, 2388, 10, 20, 30), -- blood elves
--
-- Innkeeper Greul, Feralas, Horde
(NULL, 7737, 6, 40, 50), -- tauren
--
-- Innkeeper Kaylisk, Splitertree, Ashenvale
(NULL, 12196, 2, 18, 30), -- orcs
(NULL, 12196, 8, 18, 30), -- trolls
(NULL, 12196, 10, 20, 30), -- blood elves
(NULL, 12196, 9, 18, 30), -- goblins
(NULL, 12196, 14, 18, 30), -- mag'har orcs
(NULL, 12196, 15, 18, 30), -- ogres
--
-- Marukai, Zoram'gar, Ashenvale
(NULL, 12719, 2, 18, 30), -- orcs
(NULL, 12719, 8, 18, 30), -- trolls
(NULL, 12719, 9, 18, 30), -- goblins
(NULL, 12719, 14, 18, 30), -- mag'har orcs
(NULL, 12719, 15, 18, 30), -- ogres
--
-- Innkeeper Sikewa, Desolace
(NULL, 11106, 2, 30, 40), -- orcs
(NULL, 11106, 6, 30, 40), -- tauren
(NULL, 11106, 8, 30, 40), -- trolls
(NULL, 11106, 9, 30, 40), -- goblins
(NULL, 11106, 14, 30, 40), -- mag'har orcs
(NULL, 11106, 15, 30, 40), -- ogres
--
-- Innkeeper Adegwa, Arathi, Hammerfall
(NULL, 9501, 2, 30, 40), -- orcs
(NULL, 9501, 5, 30, 40), -- undead
(NULL, 9501, 6, 30, 40), -- tauren
(NULL, 9501, 8, 30, 40), -- trolls
(NULL, 9501, 10, 30, 40), -- blood elves
(NULL, 9501, 9, 30, 40), -- goblins
(NULL, 9501, 14, 30, 40), -- mag'har orcs
(NULL, 9501, 15, 30, 40), -- ogres
--
-- Innkeeper Lard, Revantusk Village , Hinterlands
(NULL, 14731, 2, 40, 50), -- orcs
(NULL, 14731, 5, 40, 50), -- undead
(NULL, 14731, 6, 40, 50), -- tauren
(NULL, 14731, 8, 40, 50), -- trolls
(NULL, 14731, 10, 40, 50), -- blood elves
(NULL, 14731, 9, 40, 50), -- goblins
(NULL, 14731, 14, 40, 50), -- mag'har orcs
(NULL, 14731, 15, 40, 50), -- ogres
--
-- Innkeeper Shul'kar, Kargath Outpost, Badlands
(NULL, 9356, 2, 35, 45), -- orcs
(NULL, 9356, 5, 35, 45), -- undead
(NULL, 9356, 6, 35, 45), -- tauren
(NULL, 9356, 8, 35, 45), -- trolls
(NULL, 9356, 10, 35, 45), -- blood elves
(NULL, 9356, 9, 35, 45), -- goblins
(NULL, 9356, 14, 35, 45), -- mag'har orcs
(NULL, 9356, 15, 35, 45), -- ogres
--
-- Innkeeper Karakul, Swamp of Sorrows
(NULL, 6930, 2, 35, 45), -- orcs
(NULL, 6930, 5, 35, 45), -- undead
(NULL, 6930, 6, 35, 45), -- tauren
(NULL, 6930, 8, 35, 45), -- trolls
(NULL, 6930, 10, 35, 45), -- blood elves
(NULL, 6930, 9, 35, 45), -- goblins
(NULL, 6930, 14, 35, 45), -- mag'har orcs
(NULL, 6930, 15, 35, 45), -- ogres
--
-- Innkeeper Thulbek, Grom Gol, Stranglethorn Vale
(NULL, 5814, 2, 30, 45), -- orcs
(NULL, 5814, 5, 30, 45), -- undead
(NULL, 5814, 6, 30, 45), -- tauren
(NULL, 5814, 8, 30, 45), -- trolls
(NULL, 5814, 10, 30, 45), -- blood elves
(NULL, 5814, 9, 30, 45), -- goblins
(NULL, 5814, 14, 30, 45), -- mag'har orcs
(NULL, 5814, 15, 30, 45), -- ogres
--
-- Overlord Mok'Morokk, Dustwallow Marsh
(NULL, 4500, 2, 35, 45), -- orcs
(NULL, 4500, 6, 35, 45), -- tauren
(NULL, 4500, 8, 35, 45), -- trolls
(NULL, 4500, 9, 35, 45), -- goblins
(NULL, 4500, 14, 35, 45), -- mag'har orcs
(NULL, 4500, 15, 35, 45), -- ogres
--
-- Jediga, Azshara horde camp
(NULL, 8587, 2, 45, 55), -- orcs
(NULL, 8587, 8, 45, 55), -- trolls
(NULL, 8587, 6, 45, 55), -- tauren
(NULL, 8587, 10, 45, 55), -- blood elves
(NULL, 8587, 9, 45, 55), -- goblins
(NULL, 8587, 14, 45, 55), -- mag'har orcs
(NULL, 8587, 15, 45, 55), -- ogres
--
-- Winna Hazzard, Felwood horde camp
(NULL, 9996, 2, 48, 55), -- orcs
(NULL, 9996, 6, 48, 55), -- tauren
(NULL, 9996, 8, 48, 55), -- trolls
(NULL, 9996, 5, 48, 55), -- undead
(NULL, 9996, 10, 48, 55), -- blood elves
(NULL, 9996, 9, 48, 55), -- goblins
(NULL, 9996, 14, 48, 55), -- mag'har orcs
(NULL, 9996, 15, 48, 55), -- ogres
--
-- Larion, Horde Q-giver, Un'Goro
(NULL, 9118, 2, 48, 55), -- orcs
(NULL, 9118, 6, 48, 55), -- tauren
(NULL, 9118, 8, 48, 55), -- trolls
(NULL, 9118, 5, 48, 55), -- undead
(NULL, 9118, 10, 48, 55), -- blood elves
(NULL, 9118, 9, 48, 55), -- goblins
(NULL, 9118, 14, 48, 55), -- mag'har orcs
(NULL, 9118, 15, 48, 55), -- ogres
--
-- Vahgruk, Horde Taxi, Burning Steppes
(NULL, 13177, 2, 50, 60), -- orcs
(NULL, 13177, 5, 50, 60), -- undead
(NULL, 13177, 6, 50, 60), -- tauren
(NULL, 13177, 8, 50, 60), -- trolls
(NULL, 13177, 10, 50, 60), -- blood elves
(NULL, 13177, 9, 50, 60), -- goblins
(NULL, 13177, 14, 50, 60), -- mag'har orcs
(NULL, 13177, 15, 50, 60), -- ogres
--
-- General Kirika, Horde camp, Silithus
(NULL, 17079, 2, 55, 60), -- orcs
(NULL, 17079, 5, 55, 60), -- undead
(NULL, 17079, 6, 55, 60), -- tauren
(NULL, 17079, 8, 55, 60), -- trolls
(NULL, 17079, 10, 55, 60), -- blood elves
(NULL, 17079, 9, 55, 60), -- goblins
(NULL, 17079, 14, 55, 60), -- mag'har orcs
(NULL, 17079, 15, 55, 60), -- ogres
--
--        OUTLAND
--
-- Lieutenant General Orion, Dark Portal
(NULL, 19253, 2, 58, 59), -- orcs
(NULL, 19253, 5, 58, 59), -- undead
(NULL, 19253, 6, 58, 59), -- tauren
(NULL, 19253, 8, 58, 59), -- trolls
(NULL, 19253, 10, 58, 59), -- blood elves
(NULL, 19253, 9, 58, 59), -- goblins
(NULL, 19253, 14, 58, 59), -- mag'har orcs
(NULL, 19253, 15, 58, 59), -- ogres
--
-- Floyd Pinkus, Thrallmar, Hellfire
(NULL, 16602, 2, 58, 63), -- orcs
(NULL, 16602, 5, 58, 63), -- undead
(NULL, 16602, 6, 58, 63), -- tauren
(NULL, 16602, 8, 58, 63), -- trolls
(NULL, 16602, 10, 58, 63), -- blood elves
(NULL, 16602, 9, 58, 63), -- goblins
(NULL, 16602, 14, 58, 63), -- mag'har orcs
(NULL, 16602, 15, 58, 63), -- ogres
--
-- Innkeeper Bazil, Falcon Watch, Hellfire
(NULL, 18905, 2, 60, 63), -- orcs
(NULL, 18905, 5, 60, 63), -- undead
(NULL, 18905, 6, 60, 63), -- tauren
(NULL, 18905, 8, 60, 63), -- trolls
(NULL, 18905, 10, 60, 63), -- blood elves
(NULL, 18905, 9, 60, 63), -- goblins
(NULL, 18905, 14, 60, 63), -- mag'har orcs
(NULL, 18905, 15, 60, 63), -- ogres
--
-- Innkeeper Merajit, Zabra'jin, Zangarmarsh
(NULL, 18245, 2, 60, 64), -- orcs
(NULL, 18245, 5, 60, 64), -- undead
(NULL, 18245, 6, 60, 64), -- tauren
(NULL, 18245, 8, 60, 64), -- trolls
(NULL, 18245, 10, 60, 64), -- blood elves
(NULL, 18245, 9, 60, 64), -- goblins
(NULL, 18245, 14, 60, 64), -- mag'har orcs
(NULL, 18245, 15, 60, 64), -- ogres
--
-- Innkeeper Grilka, Terrokar
(NULL, 18957, 2, 62, 65), -- orcs
(NULL, 18957, 5, 62, 65), -- undead
(NULL, 18957, 6, 62, 65), -- tauren
(NULL, 18957, 8, 62, 65), -- trolls
(NULL, 18957, 10, 62, 65), -- blood elves
(NULL, 18957, 9, 62, 65), -- goblins
(NULL, 18957, 14, 62, 65), -- mag'har orcs
(NULL, 18957, 15, 62, 65), -- ogres
--
-- Matron Tikkit, Garadar, Nagrand
(NULL, 18913, 2, 62, 65), -- orcs
(NULL, 18913, 5, 62, 65), -- undead
(NULL, 18913, 6, 62, 65), -- tauren
(NULL, 18913, 8, 62, 65), -- trolls
(NULL, 18913, 10, 62, 65), -- blood elves
(NULL, 18913, 9, 62, 65), -- goblins
(NULL, 18913, 14, 62, 65), -- mag'har orcs
(NULL, 18913, 15, 62, 65), -- ogres
--
-- Innkeeper Matron Varah, Mok'Nathal, Blade's Edge
(NULL, 21088, 2, 65, 68), -- orcs
(NULL, 21088, 5, 65, 68), -- undead
(NULL, 21088, 6, 65, 68), -- tauren
(NULL, 21088, 8, 65, 68), -- trolls
(NULL, 21088, 10, 65, 68), -- blood elves
(NULL, 21088, 9, 65, 68), -- goblins
(NULL, 21088, 14, 65, 68), -- mag'har orcs
(NULL, 21088, 15, 65, 68), -- ogres
--
-- Innkeeper Gholah, Thunderlord, Blade's Edge
(NULL, 19470, 2, 65, 68), -- orcs
(NULL, 19470, 5, 65, 68), -- undead
(NULL, 19470, 6, 65, 68), -- tauren
(NULL, 19470, 8, 65, 68), -- trolls
(NULL, 19470, 10, 65, 68), -- blood elves
(NULL, 19470, 9, 65, 68), -- goblins
(NULL, 19470, 14, 65, 68), -- mag'har orcs
(NULL, 19470, 15, 65, 68), -- ogres
--
-- Innkeeper Darg Bloodclaw, Shadowmoon Village
(NULL, 19319, 2, 67, 70), -- orcs
(NULL, 19319, 5, 67, 70), -- undead
(NULL, 19319, 6, 67, 70), -- tauren
(NULL, 19319, 8, 67, 70), -- trolls
(NULL, 19319, 10, 67, 70), -- blood elves
(NULL, 19319, 9, 67, 70), -- goblins
(NULL, 19319, 14, 67, 70), -- mag'har orcs
(NULL, 19319, 15, 67, 70), -- ogres
--
--        NORTHREND
--
-- Uda the Beast, Dalaran
(NULL, 31557, 2, 72, 80), -- orcs
(NULL, 31557, 5, 72, 80), -- undead
(NULL, 31557, 6, 72, 80), -- tauren
(NULL, 31557, 8, 72, 80), -- trolls
(NULL, 31557, 10, 72, 80), -- blood elves
(NULL, 31557, 9, 72, 80), -- goblins
(NULL, 31557, 14, 72, 80), -- mag'har orcs
(NULL, 31557, 15, 72, 80), -- ogres
--
-- Williamson, Warsong Hold, Borean Tundra
(NULL, 25278, 2, 68, 72), -- orcs
(NULL, 25278, 5, 68, 72), -- undead
(NULL, 25278, 6, 68, 72), -- tauren
(NULL, 25278, 8, 68, 72), -- trolls
(NULL, 25278, 10, 68, 72), -- blood elves
(NULL, 25278, 9, 68, 72), -- goblins
(NULL, 25278, 14, 68, 72), -- mag'har orcs
(NULL, 25278, 15, 68, 72), -- ogres
--
-- Pahu Frosthoof, Taunka'le Village, Borean Tundra
(NULL, 26709, 2, 69, 72), -- orcs
(NULL, 26709, 5, 69, 72), -- undead
(NULL, 26709, 6, 69, 72), -- tauren
(NULL, 26709, 8, 69, 72), -- trolls
(NULL, 26709, 10, 69, 72), -- blood elves
(NULL, 26709, 9, 69, 72), -- goblins
(NULL, 26709, 14, 69, 72), -- mag'har orcs
(NULL, 26709, 15, 69, 72), -- ogres
--
-- Matron Magah, Bor'Gorok Outpost, Borean Tundra
(NULL, 26709, 2, 70, 72), -- orcs
(NULL, 26709, 5, 70, 72), -- undead
(NULL, 26709, 6, 70, 72), -- tauren
(NULL, 26709, 8, 70, 72), -- trolls
(NULL, 26709, 10, 70, 72), -- blood elves
(NULL, 26709, 9, 70, 72), -- goblins
(NULL, 26709, 14, 70, 72), -- mag'har orcs
(NULL, 26709, 15, 70, 72), -- ogres
--
-- Basil Osgood, New Agamand, Howling Fjord
(NULL, 24149, 2, 68, 72), -- orcs
(NULL, 24149, 5, 68, 72), -- undead
(NULL, 24149, 6, 68, 72), -- tauren
(NULL, 24149, 8, 68, 72), -- trolls
(NULL, 24149, 10, 68, 72), -- blood elves
(NULL, 24149, 9, 68, 72), -- goblins
(NULL, 24149, 14, 68, 72), -- mag'har orcs
(NULL, 24149, 15, 68, 72), -- ogres
--
-- Timothy Holland, Vengeance Landing, Howling Fjord
(NULL, 24342, 2, 69, 72), -- orcs
(NULL, 24342, 5, 69, 72), -- undead
(NULL, 24342, 6, 69, 72), -- tauren
(NULL, 24342, 8, 69, 72), -- trolls
(NULL, 24342, 10, 69, 72), -- blood elves
(NULL, 24342, 9, 69, 72), -- goblins
(NULL, 24342, 14, 69, 72), -- mag'har orcs
(NULL, 24342, 15, 69, 72), -- ogres
--
-- Bori Wintertotem, Camp Winterhoof, Howling Fjord
(NULL, 24033, 2, 70, 72), -- orcs
(NULL, 24033, 5, 70, 72), -- undead
(NULL, 24033, 6, 70, 72), -- tauren
(NULL, 24033, 8, 70, 72), -- trolls
(NULL, 24033, 10, 70, 72), -- blood elves
(NULL, 24033, 9, 70, 72), -- goblins
(NULL, 24033, 14, 70, 72), -- mag'har orcs
(NULL, 24033, 15, 70, 72), -- ogres
--
-- Barracks Master Rhekku, Conquest Hold, Grizzly Hills
(NULL, 27125, 2, 70, 74), -- orcs
(NULL, 27125, 5, 70, 74), -- undead
(NULL, 27125, 6, 70, 74), -- tauren
(NULL, 27125, 8, 70, 74), -- trolls
(NULL, 27125, 10, 70, 74), -- blood elves
(NULL, 27125, 9, 70, 74), -- goblins
(NULL, 27125, 14, 70, 74), -- mag'har orcs
(NULL, 27125, 15, 70, 74), -- ogres
--
-- Aiyan Coldwind, Capm Onequah, Grizzly Hills
(NULL, 26680, 2, 70, 74), -- orcs
(NULL, 26680, 5, 70, 74), -- undead
(NULL, 26680, 6, 70, 74), -- tauren
(NULL, 26680, 8, 70, 74), -- trolls
(NULL, 26680, 10, 70, 74), -- blood elves
(NULL, 26680, 9, 70, 74), -- goblins
(NULL, 26680, 14, 70, 74), -- mag'har orcs
(NULL, 26680, 15, 70, 74), -- ogres
--
-- Mrs. Winterby, Venomspite, Dragonblight
(NULL, 27027, 2, 71, 75), -- orcs
(NULL, 27027, 5, 71, 75), -- undead
(NULL, 27027, 6, 71, 75), -- tauren
(NULL, 27027, 8, 71, 75), -- trolls
(NULL, 27027, 10, 71, 75), -- blood elves
(NULL, 27027, 9, 71, 75), -- goblins
(NULL, 27027, 14, 71, 75), -- mag'har orcs
(NULL, 27027, 15, 71, 75), -- ogres
--
-- Barracks Master Harga, Agmar's Hammer, Dragonblight
(NULL, 26985, 2, 71, 75), -- orcs
(NULL, 26985, 5, 71, 75), -- undead
(NULL, 26985, 6, 71, 75), -- tauren
(NULL, 26985, 8, 71, 75), -- trolls
(NULL, 26985, 10, 71, 75), -- blood elves
(NULL, 26985, 9, 71, 75), -- goblins
(NULL, 26985, 14, 71, 75), -- mag'har orcs
(NULL, 26985, 15, 71, 75), -- ogres
--
-- Wabada Whiteflower, Camp Tunka'lo, Storm Peaks
(NULL, 29971, 2, 77, 80), -- orcs
(NULL, 29971, 5, 77, 80), -- undead
(NULL, 29971, 6, 77, 80), -- tauren
(NULL, 29971, 8, 77, 80), -- trolls
(NULL, 29971, 10, 77, 80), -- blood elves
(NULL, 29971, 9, 77, 80), -- goblins
(NULL, 29971, 14, 77, 80), -- mag'har orcs
(NULL, 29971, 15, 77, 80), -- ogres
--
-- Jarin Dawnglow, Argent Tournament, Icecrown
(NULL, 33971, 2, 80, 80), -- orcs
(NULL, 33971, 5, 80, 80), -- undead
(NULL, 33971, 6, 80, 80), -- tauren
(NULL, 33971, 8, 80, 80), -- trolls
(NULL, 33971, 10, 80, 80), -- blood elves
(NULL, 33971, 9, 80, 80), -- goblins
(NULL, 33971, 14, 80, 80), -- mag'har orcs
(NULL, 33971, 15, 80, 80), -- ogres
--
--        NEUTRAL AREAS
--
-- Innkeeper Skindle, Booty Bay 6807 (Neutral)
(NULL, 6807, 0, 30, 45),
-- Innkeeper Wiley, Ratchet 6791 (Neutral)
(NULL, 6791, 2, 10, 25), -- orcs
(NULL, 6791, 8, 10, 25), -- trolls
(NULL, 6791, 9, 10, 25), -- goblins
(NULL, 6791, 14, 10, 25), -- mag'har orcs
(NULL, 6791, 15, 10, 25), -- ogres
-- Innkeeper Fizzgrimble, Tanaris 7733 (Neutral)
(NULL, 7733, 0, 40, 50),
-- Master Smith Burninate, Searing Gorge
(NULL, 14624, 0, 45, 50),
-- Marin Noggenfogger 7564 (Neutral)
-- Innkeeper Vizzie, Everlook 11118 (Neutral)
(NULL, 11118, 0, 53, 60),
-- Calandrath, Silithus 15174 (Neutral)
(NULL, 15174, 0, 55, 60),
-- Jessica Chambers, East Plaguelands 16256 (Neutral)
(NULL, 16256, 0, 53, 60),
--
--           OUTLAND
--
-- Innkeeper Coryth Stoktron, Cenarion Refuge (Neutral)
(NULL, 18907, 0, 60, 64),
-- Minalei, Aldors, Shattrath
(NULL, 19046, 0, 65, 70),
-- Innkeeper Haelthol, Scryers, Shattrath
(NULL, 19232, 0, 65, 70),
-- Shaarubo, World End Tavern
(NULL, 19182, 0, 65, 70),
-- Innkeeper Aelerya, Blade's Edge (Neutral)
(NULL, 22922, 0, 65, 68),
-- Innkeeper Eyonix, Stormspire, Netherstorm
(NULL, 19531, 0, 67, 70),
-- Innkeeper Remi Dodoso, Area 52, Netherstorm
(NULL, 19571, 0, 67, 70),
-- Caregiver Inaara, Isle of Quel'Danas
(NULL, 25036, 0, 69, 70),
--
--           NORTHREND
--
-- Amisi Azuregaze, Dalaran Inn
(NULL, 28687, 0, 72, 80),
-- Afsaneh Asrar, Dalaran Underbelly
(NULL, 32411, 0, 77, 80),
-- Caregiver Poallu, Kaluak Camp, Borean Tundra
(NULL, 27187, 0, 68, 72),
-- Caregiver Iqniq, Kamagua, Howling Fjord
(NULL, 27187, 0, 68, 72),
-- Caregiver Mumik, Mo'Aki Harbor, Dragonblight
(NULL, 27174, 0, 71, 73),
-- Marissa Everwatch, The Argent Stand, Zul'Drak
(NULL, 28791, 0, 73, 75),
-- Pan'ya, Zim'Torga, Zul'Drak
(NULL, 29583, 0, 75, 77),
-- Purser Boulian, Nesingwary Base Camp, Sholazar Basin
(NULL, 29583, 0, 75, 79),
-- Smilin' Slirk Brassknob, K3, The Storm Peaks
(NULL, 29904, 0, 77, 80),
-- Magorn, Snow Drift Plains, The Storm Peaks
(NULL, 29963, 0, 77, 80),
-- Initiate Brenners, The Argent Stand, Zul'Drak
-- (NULL, 30308, 0, 77, 80),
--
--
--       UNUSED
--
--
-- Bashana Runetotem, Thunder Bluff (Tauren npc in TB)
-- (NULL, 9087, 6),
--
-- Alchemist Arbington, West Plaguelands, Human
-- (NULL, 11056, 1),
-- (NULL, 11056, 3),
-- (NULL, 11056, 4),
-- (NULL, 11056, 7),
--
-- Lokhtos Darkbargainer, Blackrock Depths, 12944
--
-- Gregan Brewspewer, Feralas, Dwarf (Some swarf Q-giver in Feralas)
-- (NULL, 7775, 3),
--
-- Augustus the Touched, East Plaguelands, Undead (Some undead vendor near stratholme)
-- (NULL, 12384, 5),
--
-- ENDING PLACEHOLDER
(NULL, 6807, 35, 90, 90)
;
