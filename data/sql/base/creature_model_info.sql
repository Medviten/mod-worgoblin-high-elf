/* Add model info for mounts and other NPCs */
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (29422, 29423, 33000, 33001, 32385, 35249, 35250, 36445, 36446, 39095, 39096);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(29422, 0.406, 1.5, 0, 0), -- Worgen
(29423, 0.406, 1.5, 1, 0), -- Worgenette
(32385, 0.2325, 1.5, 0, 0), -- Gobber
(35249, 0.35, 1.5, 2, 0), -- Trike
(35250, 0.35, 1.5, 2, 0), -- Quik-trike
(36445, 0.406, 1.5, 0, 0), -- Lord Harford
(36446, 0.306, 1.5, 0, 0), -- Gally Lumpstain
(39095, 1, 1.5, 2, 0), -- Horse
(39096, 1, 1.5, 2, 0); -- Quik-horse