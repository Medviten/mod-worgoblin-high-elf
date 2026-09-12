-- ============================================================
-- F-202  Lost Isles gathering: Kaja'mite Cavern copper + arrival-section herbs
-- ============================================================
-- The gen-ported Lost Isles nodes (39 Copper Veins + 48 herbs, guid 6000000+)
-- leave the whole level 5-7 arrival stack empty. That stack is TRIPLE-DECKED
-- at x 0-220, y -9750..-10050:
--   * z -14..+2  Kaja'mite Cavern (area 4778) -- the I-285 mining cave: ore
--     chunks, Mining Spots, Frightened Miners, Smart Mining Monkeys.
--   * z 7-33    monkey jungle / crate salvage strip / Shipwreck Shore.
--   * z 83-100  The Vicious Vale (area 4780) -- the I-307 Weed Whacker
--     plateau: Poison Spitters, Deadly Jungle Plants.
-- None of the three layers had a single gathering node; the first node a new
-- goblin could meet was at the Wild Clucker flats (y ~ -10420). NOT to be
-- confused with the second island's Gallywix Labor Mine / Slave Pits deposit
-- cave (x 1220-1500) -- that one already has 5 gen-ported veins nearby.
--
-- This adds 4 Copper Veins (GO 1731) to the Kaja'mite Cavern, 6 herbs to the
-- monkey/crate jungle (Peacebloom 1618 / Silverleaf 1617, both skill 1),
-- 4 herbs to the Vicious Vale plateau, and sprinkles 3 more herbs through the
-- Spiny Raptor grounds. One Earthroot (1619, skill 15) each on the Vale and
-- the volcano-slope raptor pack.
--
-- Placement method (F-199 pipeline, self-calibrated per area):
--   * Ground truth per area: the 6 Kaja'mite Ore chunks + 18 cave-floor
--     creature spawns (cavern), the 25 Bomb-Throwing Monkey + 33 Crate of
--     Tools spawns (jungle), the Poison Spitter / Deadly Jungle Plant spawns
--     (vale), the 38 Spiny Raptor spawns (grounds). Probing those through
--     cli/lib/navmesh_checker/mmap_query gives the navmesh-vs-floor bias
--     per area (cavern -0.381y n=21, jungle -0.316y n=58, raptors -0.373y
--     n=35, vale measured at derivation time).
--   * Grid sample (3yd cavern / 4yd open), probed at an IDW Z from the area's
--     ground-truth points, on-mesh within 1yd. The arrival stack is
--     triple-decked, so each layer's probes are Z-gated: cavern accepts only
--     meshZ < 3 (rejects the layers above), the vale only 80 < meshZ < 105
--     (rejects the jungle below), the jungle rejects meshZ < 1 (waterline).
--   * 8-probe wall ring at 3yd: cavern keeps wall-adjacent spots (2-7 walkable)
--     so veins hug the tunnel walls; herb areas keep open spots (4-8).
--   * Clearance: >=8yd from every ore chunk / mining spot (cavern), >=10yd
--     from every crate/existing node (jungle), >=8yd from the vale plants,
--     >=20yd from existing nodes (raptors); then greedy max-min spread
--     (>=22yd cavern, >=30yd vale, >=35/40yd open areas).
--   * Z = meshZ + area bias + 0.1 (F-170 gameobject lift).
--
-- phaseMask 65535 matches the gen-ported nodes: harvestable in every F-194
-- Lost Isles stage. Guid block: 6950018-6950035 (6950022 retired with the
-- mislocated Labor Mine veins) in the shared hand-authored 6950000+ range
-- (F-199 owns ..6950003; 6950010-6950015 burned by the I-286 goober
-- tombstone; each file DELETEs only its own range).

-- DELETE spans back to 6950004: this file's rows briefly shipped at 6950004-6950017
-- before moving to 6950018+ (guids 6950010-6950015 are BURNED -- an I-286 legacy
-- cleanup tombstone-deletes them every apply, so nothing may ever live there).
DELETE FROM `gameobject` WHERE `guid` BETWEEN 6950004 AND 6950035;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
  (6950018, 1731, 1, 0, 0, 1, 65535, 124.0000, -9873.0000, 0.1473, 0.7000, 0, 0, 0.342898, 0.939373, 900, 100, 1, '', 0, 'F-202 Kaja''mite Cavern copper vein - E wall'),
  (6950019, 1731, 1, 0, 0, 1, 65535, 25.0000, -9903.0000, -7.6252, 2.4000, 0, 0, 0.932039, 0.362358, 900, 100, 1, '', 0, 'F-202 Kaja''mite Cavern copper vein - W chamber'),
  (6950020, 1731, 1, 0, 0, 1, 65535, 100.0000, -9792.0000, -13.1912, 4.1000, 0, 0, 0.887362, -0.461073, 900, 100, 1, '', 0, 'F-202 Kaja''mite Cavern copper vein - N deep floor'),
  (6950021, 1731, 1, 0, 0, 1, 65535, 94.0000, -9942.0000, -6.1819, 5.5000, 0, 0, 0.381661, -0.924302, 900, 100, 1, '', 0, 'F-202 Kaja''mite Cavern copper vein - S branch'),
  (6950023, 1618, 1, 0, 0, 1, 65535, -70.0000, -9894.0000, 12.6083, 3.1000, 0, 0, 0.999784, 0.020795, 900, 100, 1, '', 0, 'F-202 monkey jungle Peacebloom - W ridge'),
  (6950024, 1617, 1, 0, 0, 1, 65535, 194.0000, -9522.0000, 4.9569, 0.3000, 0, 0, 0.149438, 0.988771, 900, 100, 1, '', 0, 'F-202 monkey jungle Silverleaf - N beach edge'),
  (6950025, 1618, 1, 0, 0, 1, 65535, 214.0000, -9802.0000, 14.7876, 5.9000, 0, 0, 0.190423, -0.981702, 900, 100, 1, '', 0, 'F-202 monkey jungle Peacebloom - E rise'),
  (6950026, 1617, 1, 0, 0, 1, 65535, 38.0000, -9734.0000, 7.4735, 2.9000, 0, 0, 0.992713, 0.120503, 900, 100, 1, '', 0, 'F-202 monkey jungle Silverleaf - crate strip'),
  (6950027, 1618, 1, 0, 0, 1, 65535, 270.0000, -9654.0000, 13.5859, 1.2000, 0, 0, 0.564642, 0.825336, 900, 100, 1, '', 0, 'F-202 monkey jungle Peacebloom - NE edge'),
  (6950028, 1617, 1, 0, 0, 1, 65535, 154.0000, -9698.0000, 5.9190, 4.7000, 0, 0, 0.711473, -0.702713, 900, 100, 1, '', 0, 'F-202 monkey jungle Silverleaf - mid clearing'),
  (6950029, 1619, 1, 0, 0, 1, 65535, 460.0000, -11254.0000, 249.3266, 3.7000, 0, 0, 0.961275, -0.275590, 900, 100, 1, '', 0, 'F-202 raptor grounds Earthroot - volcano slope pack'),
  (6950030, 1618, 1, 0, 0, 1, 65535, 108.0000, -10506.0000, 57.0583, 0.9000, 0, 0, 0.434966, 0.900447, 900, 100, 1, '', 0, 'F-202 raptor grounds Peacebloom - W hunting run'),
  (6950031, 1617, 1, 0, 0, 1, 65535, 496.0000, -10762.0000, 160.4235, 5.2000, 0, 0, 0.515501, -0.856889, 900, 100, 1, '', 0, 'F-202 raptor grounds Silverleaf - E hillside'),
  (6950032, 1618, 1, 0, 0, 1, 65535, 205.9597, -9917.9000, 89.6561, 1.5000, 0, 0, 0.681639, 0.731689, 900, 100, 1, '', 0, 'F-202 Vicious Vale Peacebloom - central clearing'),
  (6950033, 1617, 1, 0, 0, 1, 65535, 33.9597, -9845.9000, 92.9046, 3.3000, 0, 0, 0.996865, -0.079121, 900, 100, 1, '', 0, 'F-202 Vicious Vale Silverleaf - NW edge'),
  (6950034, 1619, 1, 0, 0, 1, 65535, 329.9597, -9957.9000, 103.2914, 0.5000, 0, 0, 0.247404, 0.968912, 900, 100, 1, '', 0, 'F-202 Vicious Vale Earthroot - SE high ground'),
  (6950035, 1617, 1, 0, 0, 1, 65535, 53.9597, -9973.9000, 86.6183, 4.4000, 0, 0, 0.808496, -0.588501, 900, 100, 1, '', 0, 'F-202 Vicious Vale Silverleaf - SW slope');
