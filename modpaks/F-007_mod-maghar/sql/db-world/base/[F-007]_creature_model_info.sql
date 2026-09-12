DELETE FROM `creature_model_info` WHERE `DisplayID` IN (94226, 94227);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(94226, 0.306, 1.5, 0, 0), -- Mag'har Male
(94227, 0.306, 1.5, 1, 0); -- Mag'har Female
