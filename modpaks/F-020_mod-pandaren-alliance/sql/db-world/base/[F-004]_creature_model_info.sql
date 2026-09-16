/* Add model info for mounts and other NPCs */
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (@WorgenWildMaleDisplay, @WorgenWildFemaleDisplay, @GilneanMaleDisplay, @GilneanFemaleDisplay);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(@WorgenWildMaleDisplay,   0.406, 1.5, 0, 0), -- Running Wild Male
(@WorgenWildFemaleDisplay, 0.406, 1.5, 1, 0), -- Running Wild Female
(@GilneanMaleDisplay,      0.306, 1.5, 0, 0), -- Gilnean Male
(@GilneanFemaleDisplay,    0.306, 1.5, 1, 0); -- Gilnean Female
