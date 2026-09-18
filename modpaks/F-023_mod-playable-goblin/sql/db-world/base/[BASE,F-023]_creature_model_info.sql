/* Add model info for mounts and other NPCs */
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (32385, 35249, 35250, 36446);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(32385, 0.2325, 1.5, 0, 0), -- Gobber
(35249, 0.35, 1.5, 2, 0), -- Trike
(35250, 0.35, 1.5, 2, 0), -- Quik-trike
(36446, 0.306, 1.5, 0, 0); -- Gally Lumpstain
