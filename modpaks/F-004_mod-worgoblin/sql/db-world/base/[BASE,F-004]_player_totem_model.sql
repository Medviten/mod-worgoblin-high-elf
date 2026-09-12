/* Add totem models for races that don't currently have shaman class
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

-- Alliance default totems is the Dwarf ones
SET @WorgenFireTotem := 30754;
SET @WorgenEarthTotem := 30753;
SET @WorgenWaterTotem := 30755;
SET @WorgenAirTotem := 30736;

-- Horde default totems is the Orc ones.
SET @GoblinFireTotem := 30758;
SET @GoblinEarthTotem := 30757;
SET @GoblinWaterTotem := 30759;
SET @GoblinAirTotem := 30756;

-- Goblin and Worgen
DELETE FROM player_totem_model WHERE RaceID IN (@Goblin, @Worgen);
INSERT INTO player_totem_model (TotemID, RaceID, ModelID) VALUES 
(1, @Goblin, @GoblinFireTotem),
(2, @Goblin, @GoblinEarthTotem),
(3, @Goblin, @GoblinWaterTotem),
(4, @Goblin, @GoblinAirTotem),

(1, @Worgen, @WorgenFireTotem),
(2, @Worgen, @WorgenEarthTotem),
(3, @Worgen, @WorgenWaterTotem),
(4, @Worgen, @WorgenAirTotem);
