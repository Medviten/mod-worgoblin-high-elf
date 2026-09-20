/* Worgoblin default is also fine

DELETE FROM `player_totem_model` WHERE `TotemID` IN (1, 2, 3, 4) AND `RaceID` IN (@Goblin, @Worgen);
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES
-- Worgen (Race ID 12) - Use nature-themed totems
(1, @Worgen, 30762), -- Fire (borrowing from Troll style for nature theme)
(2, @Worgen, 30761), -- Earth (borrowing from Troll style for nature theme)
(3, @Worgen, 30763), -- Water (borrowing from Troll style for nature theme)
(4, @Worgen, 30760), -- Air (borrowing from Troll style for nature theme)
*/

DELETE FROM `player_totem_model` WHERE `RaceID` = @Worgen;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) VALUES 
(1, @Worgen, @AllianceFireTotem),
(2, @Worgen, @AllianceEarthTotem),
(3, @Worgen, @AllianceWaterTotem),
(4, @Worgen, @AllianceAirTotem);
