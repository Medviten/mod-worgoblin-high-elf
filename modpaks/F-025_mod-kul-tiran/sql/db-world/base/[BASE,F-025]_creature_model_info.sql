/* Add model info for mounts and other NPCs */
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (@KulTiranMaleDisplay, @KulTiranFemaleDisplay);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(@KulTiranMaleDisplay,          0.406, 1.5, 0, 0),
(@KulTiranFemaleDisplay,        0.406, 1.5, 1, 0);
