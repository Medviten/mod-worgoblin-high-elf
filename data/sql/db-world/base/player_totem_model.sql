/* Add totem models for races that don't currently have shaman class
DELETE FROM `player_totem_model` WHERE `TotemID` IN (1, 2, 3, 4) AND `RaceID` IN (9, 12);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES
-- Worgen (Race ID 12) - Use nature-themed totems
(1, 12, 30762), -- Fire (borrowing from Troll style for nature theme)
(2, 12, 30761), -- Earth (borrowing from Troll style for nature theme)
(3, 12, 30763), -- Water (borrowing from Troll style for nature theme)
(4, 12, 30760), -- Air (borrowing from Troll style for nature theme)

-- Goblin (Race ID 9) - Use mechanical/technological totems

(1, 9, 30754), -- Fire (borrowing from Dwarf style - similar culture)
(2, 9, 30753), -- Earth (borrowing from Dwarf style - similar culture)
(3, 9, 30755), -- Water (borrowing from Dwarf style - similar culture)
(4, 9, 30736); -- Air (borrowing from Dwarf style - similar culture)

-- Use upstream totems instead
(1, 9, 4589),
(2, 9, 4588),
(3, 9, 4587),
(4, 9, 4590); */

-- Alliance default totems is the Dwarf ones
SET @HumanFireTotem := 30754;
SET @HumanEarthTotem := 30753;
SET @HumanWaterTotem := 30755;
SET @HumanAirTotem := 30736;
 
SET @NightElfFireTotem := 30754;
SET @NightElfEarthTotem := 30753;
SET @NightElfWaterTotem := 30755;
SET @NightElfAirTotem := 30736;

SET @GnomeFireTotem := 30754;
SET @GnomeEarthTotem := 30753;
SET @GnomeWaterTotem := 30755;
SET @GnomeAirTotem := 30736;

SET @WorgenFireTotem := 30754;
SET @WorgenEarthTotem := 30753;
SET @WorgenWaterTotem := 30755;
SET @WorgenAirTotem := 30736;

SET @HighElfFireTotem := 30754;
SET @HighElfEarthTotem := 30753;
SET @HighElfWaterTotem := 30755;
SET @HighElfAirTotem := 30736;

-- Horde default totems is the Orc ones.
SET @UndeadFireTotem := 30758;
SET @UndeadEarthTotem := 30757;
SET @UndeadWaterTotem := 30759;
SET @UndeadAirTotem := 30756;

SET @BloodElfFireTotem := 30758;
SET @BloodElfEarthTotem := 30757;
SET @BloodElfWaterTotem := 30759;
SET @BloodElfAirTotem := 30756;

SET @GoblinFireTotem := 30758;
SET @GoblinEarthTotem := 30757;
SET @GoblinWaterTotem := 30759;
SET @GoblinAirTotem := 30756;

-- Human, Night Elf, Undead, Gnome, Goblin, Blood Elf, Worgen, and High Elf
DELETE FROM player_totem_model WHERE RaceID IN (1,4,5,7,9,10,12,13);
INSERT INTO player_totem_model (TotemID, RaceID, ModelID) VALUES 
(1, 1, @HumanFireTotem),
(2, 1, @HumanEarthTotem),
(3, 1, @HumanWaterTotem),
(4, 1, @HumanAirTotem),

(1, 4, @NightElfFireTotem),
(2, 4, @NightElfEarthTotem),
(3, 4, @NightElfWaterTotem),
(4, 4, @NightElfAirTotem),

(1, 5, @UndeadFireTotem),
(2, 5, @UndeadEarthTotem),
(3, 5, @UndeadWaterTotem),
(4, 5, @UndeadAirTotem),

(1, 7, @GnomeFireTotem),
(2, 7, @GnomeEarthTotem),
(3, 7, @GnomeWaterTotem),
(4, 7, @GnomeAirTotem),

(1, 9, @GoblinFireTotem),
(2, 9, @GoblinEarthTotem),
(3, 9, @GoblinWaterTotem),
(4, 9, @GoblinAirTotem),

(1, 10, @BloodElfFireTotem),
(2, 10, @BloodElfEarthTotem),
(3, 10, @BloodElfWaterTotem),
(4, 10, @BloodElfAirTotem),

(1, 12, @WorgenFireTotem),
(2, 12, @WorgenEarthTotem),
(3, 12, @WorgenWaterTotem),
(4, 12, @WorgenAirTotem),

(1, 13, @HighElfFireTotem),
(2, 13, @HighElfEarthTotem),
(3, 13, @HighElfWaterTotem),
(4, 13, @HighElfAirTotem);

