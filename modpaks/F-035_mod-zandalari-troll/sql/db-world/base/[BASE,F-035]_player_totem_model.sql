-- Troll ones
SET @ZandalariTrollFireTotem  := 30762;
SET @ZandalariTrollEarthTotem := 30761;
SET @ZandalariTrollWaterTotem := 30763;
SET @ZandalariTrollAirTotem   := 30760;

-- High Elf
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@ZandalariTroll);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @ZandalariTroll, @ZandalariTrollFireTotem),
(2, @ZandalariTroll, @ZandalariTrollEarthTotem),
(3, @ZandalariTroll, @ZandalariTrollWaterTotem),
(4, @ZandalariTroll, @ZandalariTrollAirTotem);
