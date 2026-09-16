-- Horde default totems
DELETE FROM `player_totem_model` WHERE `RaceID` = @MagharOrc;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @MagharOrc, @HordeFireTotem),
(2, @MagharOrc, @HordeEarthTotem),
(3, @MagharOrc, @HordeWaterTotem),
(4, @MagharOrc, @HordeAirTotem);
