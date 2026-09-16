-- Dwarf totems for High Elf
DELETE FROM `player_totem_model` WHERE `RaceID` = @HighElf;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @HighElf, @AllianceFireTotem),
(2, @HighElf, @AllianceEarthTotem),
(3, @HighElf, @AllianceWaterTotem),
(4, @HighElf, @AllianceAirTotem);
