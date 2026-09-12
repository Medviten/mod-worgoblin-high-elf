SET @TaxiPathID = (SELECT COALESCE(MAX(id), 0) FROM dbc.taxipathnode);
@TaxiAuberdineExodar := @TaxiPathNodeID := @TaxiPathNodeID +1
@TaxiExodarAuberdine := @TaxiPathNodeID := @TaxiPathNodeID +1

DELETE FROM `taxi_path` WHERE `id` IN (@TaxiAuberdineExodar, @TaxiExodarAuberdine);
INSERT INTO `taxi_path` (`id`, `fromtaxinode`, `totaxinode`, `cost`) VALUES
(@TaxiAuberdineExodar, @TaxiNodeAuberdine, @TaxiNodeExodar, 250), -- Auberdine – Exodar
(@TaxiExodarAuberdine, @TaxiNodeExodar, @TaxiNodeAuberdine, 250); -- Exodar – Auberdine
