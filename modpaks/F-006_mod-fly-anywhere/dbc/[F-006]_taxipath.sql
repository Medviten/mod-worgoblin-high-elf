DELETE FROM `taxipath` WHERE `id` IN (@TaxiAuberdineExodar, @TaxiExodarAuberdine);
INSERT INTO `taxipath` (`id`, `from_taxi_node`, `to_taxi_node`, `cost`) VALUES
(@TaxiAuberdineExodar, @TaxiNodeAuberdine, @TaxiNodeExodar, 250), -- Auberdine – Exodar
(@TaxiExodarAuberdine, @TaxiNodeExodar, @TaxiNodeAuberdine, 250); -- Exodar – Auberdine
