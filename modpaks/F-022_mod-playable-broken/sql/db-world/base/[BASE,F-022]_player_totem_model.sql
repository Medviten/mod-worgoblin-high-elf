-- Alliance default totems is the Dwarf ones
SET @BrokenFireTotem := 30754;
SET @BrokenEarthTotem := 30753;
SET @BrokenWaterTotem := 30755;
SET @BrokenAirTotem := 30736;

-- High Elf
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@Broken);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @Broken, @BrokenFireTotem),
(2, @Broken, @BrokenEarthTotem),
(3, @Broken, @BrokenWaterTotem),
(4, @Broken, @BrokenAirTotem);
