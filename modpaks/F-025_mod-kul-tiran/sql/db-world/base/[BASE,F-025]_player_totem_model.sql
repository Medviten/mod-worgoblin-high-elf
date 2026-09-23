-- Alliance Default
DELETE FROM `player_totem_model` WHERE `RaceID` = @KulTiran;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @KulTiran, @AllianceFireTotem),
(2, @KulTiran, @AllianceEarthTotem),
(3, @KulTiran, @AllianceWaterTotem),
(4, @KulTiran, @AllianceAirTotem);
