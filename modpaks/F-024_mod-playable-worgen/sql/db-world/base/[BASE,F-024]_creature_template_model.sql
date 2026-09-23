/* Add models for racial mounts */
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (@MountainHorseCreatureID, @SwiMountainHorseCreatureID);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@MountainHorseCreatureID,    0, @MountainHorseDisplay,      1, 1, 12340), -- Mountain Horse
(@SwiftMountainHorseCreatureID, 0, @SwiftMountainHorseDisplay, 1, 1, 12340); -- Swift Mountain Horse
