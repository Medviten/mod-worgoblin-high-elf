SET @TaxiPathID = (SELECT COALESCE(MAX(id), 0) FROM dbc.taxipath);
SET @TaxiAuberdineExodar := @TaxiPathID := @TaxiPathID +1;
SET @TaxiExodarAuberdine := @TaxiPathID := @TaxiPathID +1;

DELETE FROM `taxipath` WHERE `id` IN (@TaxiAuberdineExodar, @TaxiExodarAuberdine);
INSERT INTO `taxipath` (`id`, `from_taxi_node`, `to_taxi_node`, `cost`) VALUES
(@TaxiAuberdineExodar, @TaxiNodeAuberdine, @TaxiNodeExodar, 250), -- Auberdine – Exodar
(@TaxiExodarAuberdine, @TaxiNodeExodar, @TaxiNodeAuberdine, 250); -- Exodar – Auberdine
