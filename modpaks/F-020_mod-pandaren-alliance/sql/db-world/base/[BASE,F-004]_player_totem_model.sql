/* Worgoblin default is also fine

DELETE FROM `player_totem_model` WHERE `TotemID` IN (1, 2, 3, 4) AND `RaceID` IN (@Goblin, @Worgen);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES
-- Worgen (Race ID 12) - Use nature-themed totems
(1, @Worgen, 30762), -- Fire (borrowing from Troll style for nature theme)
(2, @Worgen, 30761), -- Earth (borrowing from Troll style for nature theme)
(3, @Worgen, 30763), -- Water (borrowing from Troll style for nature theme)
(4, @Worgen, 30760), -- Air (borrowing from Troll style for nature theme)

-- Goblin (Race ID 9) - Use mechanical/technological totems
(1, @Goblin, 30754), -- Fire (borrowing from Dwarf style - similar culture)
(2, @Goblin, 30753), -- Earth (borrowing from Dwarf style - similar culture)
(3, @Goblin, 30755), -- Water (borrowing from Dwarf style - similar culture)
(4, @Goblin, 30736); -- Air (borrowing from Dwarf style - similar culture)

-- Use upstream totems instead
(1, @Goblin, 4589),
(2, @Goblin, 4588),
(3, @Goblin, 4587),
(4, @Goblin, 4590); */

-- Goblin and Worgen
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@Goblin, @Worgen);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @Goblin, @HordeFireTotem),
(2, @Goblin, @HordeEarthTotem),
(3, @Goblin, @HordeWaterTotem),
(4, @Goblin, @HordeAirTotem),

(1, @Worgen, @AllianceFireTotem),
(2, @Worgen, @AllianceEarthTotem),
(3, @Worgen, @AllianceWaterTotem),
(4, @Worgen, @AllianceAirTotem);
