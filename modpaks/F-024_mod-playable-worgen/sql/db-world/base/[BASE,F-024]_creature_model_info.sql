/* Add model info for mounts and other NPCs */
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (@WorgenMaleDisplay, @WorgenFemaleDisplay, @LordHarfordDisplay, @GallyLumpstainDisplay, @MountainHorseDisplay, @SwiftMountainHorseDisplay);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(@WorgenMaleDisplay,          0.406, 1.5, 0, 0), -- Worgen
(@WorgenFemaleDisplay,        0.406, 1.5, 1, 0), -- Worgenette
(@LordHarfordDisplay,         0.406, 1.5, 0, 0), -- Lord Harford
(@GallyLumpstainDisplay,      0.306, 1.5, 0, 0), -- Gally Lumpstain
(@MountainHorseDisplay,           1, 1.5, 2, 0), -- Horse
(@SwiftMountainHorseDisplay,      1, 1.5, 2, 0); -- Quik-horse
