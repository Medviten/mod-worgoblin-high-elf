SET @TaxiPathNodeID = (SELECT COALESCE(MAX(id), 0) FROM dbc.taxipathnode);

-- DELETE FROM `taxipath` WHERE `id` BETWEEN 46875 AND 46900; -- default

SET @NodeIndex = 0; -- Auberdine – Exodar
INSERT INTO `taxipathnode`(`id`, `path_id`, `node_index`, `map`, `x`, `y`, `z`, `flags`, `delay`, `arrival_event_id`, `departure_event_id`) VALUES
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Kalimdor, 6342.436, 559.1641, 17.87325, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Kalimdor, 6347.235, 566.6008, 18.52698, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Kalimdor, 6377.733, 1228.554, 131.8082, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -3687.711, -14363.81, 279.6602, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -3895.251, -13990.1, 279.6602, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -3982.676, -13905.07, 133.3909, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4116.737, -13856.11, 91.56405, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4223.725, -13749.79, 186.148, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4197.061, -13230.17, 210.6717, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4187.608, -12630.18, 103.9801, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4048.615, -12026.81, 103.851, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4003.116, -11931.13, 38.47455, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiAuberdineExodar, @NodeIndex := @NodeIndex +1, @Outland, -4054.752, -11793.4, 11.11395, 0, 0, 0, 0);

SET @NodeIndex = 0; -- Exodar – Auberdine
INSERT INTO `taxipathnode`(`id`, `path_id`, `node_index`, `map`, `x`, `y`, `z`, `flags`, `delay`, `arrival_event_id`, `departure_event_id`) VALUES
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4053.573, -11789.13, 9.947286, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4003.116, -11931.13, 38.47455, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4048.615, -12026.81, 103.851, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4187.608, -11931.13, 103.9801, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4197.061, -13230.17, 210.6717, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4223.725, -13749.79, 186.148, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -4116.737, -13856.11, 91.56405, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -3982.676, -13905.07, 133.3909, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -3895.251, -13990.1, 279.6602, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Outland, -3687.711, -14363.81, 131.8082, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Kalimdor, 6377.733, 1228.554, 131.8082, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Kalimdor, 6346.604, 575.5976, 29.46167, 0, 0, 0, 0),
(@TaxiPathNodeID := @TaxiPathNodeID +1, @TaxiExodarAuberdine, @NodeIndex := @NodeIndex +1, @Kalimdor, 6340.384, 557.595, 17.74062, 0, 0, 0, 0);