-- Troll ones
SET @VulperaFireTotem  := 30762;
SET @VulperaEarthTotem := 30761;
SET @VulperaWaterTotem := 30763;
SET @VulperaAirTotem   := 30760;

-- High Elf
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@Vulpera);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @Vulpera, @VulperaFireTotem),
(2, @Vulpera, @VulperaEarthTotem),
(3, @Vulpera, @VulperaWaterTotem),
(4, @Vulpera, @VulperaAirTotem);
