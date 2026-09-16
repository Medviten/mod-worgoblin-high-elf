-- Dwarf totems for Alliance Pandaren
DELETE FROM `player_totem_model` WHERE `RaceID` IN (@AlliancePandaren);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @AlliancePandaren, @AllianceFireTotem),
(2, @AlliancePandaren, @AllianceEarthTotem),
(3, @AlliancePandaren, @AllianceWaterTotem),
(4, @AlliancePandaren, @AllianceAirTotem);
