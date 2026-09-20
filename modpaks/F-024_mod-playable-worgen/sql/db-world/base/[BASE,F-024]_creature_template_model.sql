/* Add models for racial mounts and goblin racial bank NPC */
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (@GobberCreatureID, @GoblinTrikeCreatureID, @GoblinTurboTrikeCreatureID, @MountainHorseCreatureID, @SwiMountainHorseCreatureID);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@GobberCreatureID,           0, @HobgoblinDisplay,          1, 1, 12340), -- Gobber
(@GoblinTrikeCreatureID,      0, @GoblinTrikeDisplay,        1, 1, 12340), -- Goblin Trike
(@GoblinTurboTrikeCreatureID, 0, @GoblinTurboTrikeDisplay,   1, 1, 12340), -- Goblin Turbo-Trike
(@MountainHorseCreatureID,    0, @MountainHorseDisplay,      1, 1, 12340), -- Mountain Horse
(@SwiMountainHorseCreatureID, 0, @SwiftMountainHorseDisplay, 1, 1, 12340); -- Swift Mountain Horse
