-- Alliance default totems is the Dwarf ones
SET @DarkIronDwarfFireTotem := 30754;
SET @DarkIronDwarfEarthTotem := 30753;
SET @DarkIronDwarfWaterTotem := 30755;
SET @DarkIronDwarfAirTotem := 30736;

-- High Elf
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@DarkIronDwarf);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @DarkIronDwarf, @DarkIronDwarfFireTotem),
(2, @DarkIronDwarf, @DarkIronDwarfEarthTotem),
(3, @DarkIronDwarf, @DarkIronDwarfWaterTotem),
(4, @DarkIronDwarf, @DarkIronDwarfAirTotem);
