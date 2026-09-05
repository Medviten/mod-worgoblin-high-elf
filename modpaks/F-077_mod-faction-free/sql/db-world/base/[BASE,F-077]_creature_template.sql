/*This will modify Horde Factions that were still attacking Alliance players despite being friendly in the FactionTemplate.dbc file.*/
UPDATE `creature_template` SET faction = 85 WHERE faction IN (83, 1734, 106, 1735, 1495, 1637);

/*This will modify Alliance Factions that were still attacking Horde players despite being friendly in the FactionTemplate.dbc file.*/
UPDATE `creature_template` SET faction = 11 WHERE faction IN (53, 56, 84, 1733, 210, 1732);

/*This will modify the faction of all Enemy NPC created during the airship fight in ICC to ensure Players of both factions can attack the enemy and progress the raid.*/
UPDATE `creature_template` SET faction = 14 WHERE entry IN (36950,38406,38685,38686,36957,38404,38679,38680,36960,38262,38683,38684,36961,38261,38691,38692,36968,38403,38675,38676,36969,38408,38689,38690,36978,38407,38687,38688,36982,38405,38681,38682,37116,38256,38693,38694,37117,38257,38677,38678);

/*This will modify the faction of the two NPCs, Sunreaver and Silver Covenant Agents, required to be killed for the WOTLK "The Battered Hilt" quest chains by the opposing faction*/
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` IN (36776, 36774);
