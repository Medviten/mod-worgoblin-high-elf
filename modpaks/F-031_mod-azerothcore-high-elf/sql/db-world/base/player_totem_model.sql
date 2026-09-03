-- Alliance default totems is the Dwarf ones
SET @HighElfFireTotem := 30754;
SET @HighElfEarthTotem := 30753;
SET @HighElfWaterTotem := 30755;
SET @HighElfAirTotem := 30736;

-- High Elf
DELETE FROM player_totem_model WHERE RaceID IN (13);
INSERT INTO player_totem_model (TotemID, RaceID, ModelID) VALUES 
(1, @HighElf, @HighElfFireTotem),
(2, @HighElf, @HighElfEarthTotem),
(3, @HighElf, @HighElfWaterTotem),
(4, @HighElf, @HighElfAirTotem);
