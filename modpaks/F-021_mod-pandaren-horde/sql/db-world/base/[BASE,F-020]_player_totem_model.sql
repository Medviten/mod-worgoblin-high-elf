-- Orc totems for Horde Pandaren
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@HordePandaren);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @HordePandaren, @HordeFireTotem),
(2, @HordePandaren, @HordeEarthTotem),
(3, @HordePandaren, @HordeWaterTotem),
(4, @HordePandaren, @HordeAirTotem);
