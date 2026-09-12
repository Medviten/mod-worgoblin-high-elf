/* Add models for racial mounts and goblin racial bank NPC */
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (@WorgenWildMaleTemplate, @WorgenWildFemaleTemplate, @GilneanMaleTemplate, @GilneanFemaleTemplate);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
	(@WorgenWildMaleTemplate,   0, @WorgenWildMaleDisplay,   1, 1, 12340), -- Running Wild Male
	(@WorgenWildFemaleTemplate, 0, @WorgenWildFemaleDisplay, 1, 1, 12340), -- Running Wild Female
	(@GilneanMaleTemplate,      0, @GilneanMaleDisplay,      1, 1, 12340), -- Gilnean Male
	(@GilneanFemaleTemplate,    0, @GilneanFemaleDisplay,    1, 1, 12340); -- Gilnean Female
