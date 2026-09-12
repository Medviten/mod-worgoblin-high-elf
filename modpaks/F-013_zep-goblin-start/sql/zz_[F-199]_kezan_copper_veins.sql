-- ============================================================
-- F-199  Kezan gathering: Copper Veins in the Kaja'mine
-- ============================================================
-- Kezan shipped with ZERO gathering nodes (the Lost Isles has 39 Copper Veins
-- + 48 herbs; Kezan had none), so mining/engineering could not be levelled
-- before leaving the island. This seeds the Kaja'mine tunnel network -- the
-- same cave that holds the 34 Kaja'mite Deposits (I-256) -- with stock Copper
-- Vein nodes (GO 1731, lock 38 = Mining 1, loot 1502: Copper Ore / Rough Stone
-- / gems, incl. the F-001 pick bonus references).
--
-- DENSITY: 4 nodes. The mine is a short starting-zone cave that already carries
-- 34 Kaja'mite Deposits; a full gathering-zone density (the first pass derived
-- 26 placeable spots) reads as a copper farm, not a goblin mine. These 4 are
-- the maximum-spread subset of that candidate set -- >=161yd apart, one in each
-- arm of the tunnel network (NW mouth, high middle chamber, E end, S branch) --
-- so a lap of the mine passes all four and no two are in sight of each other.
--
-- Placement method (not eyeballed):
--   * The 34 retail-sniffed Kaja'mite Deposit spawns are ground truth for this
--     cave floor; probing them through cli/lib/navmesh_checker/mmap_query gives
--     a navmesh-above-floor bias of +0.294y (median, n=31 on-mesh within 2yd).
--   * The cavern footprint was grid-sampled at 4yd, probed at a deposit-derived
--     IDW Z so the query snaps to the CAVE floor and not the Kezan surface
--     above it (parts of the mine are a roofed cut: heightmap reads up to 16y
--     high there), keeping points on-mesh within 1yd.
--   * Kept only wall-adjacent points (3-6 of 8 ring probes at 3yd still walkable)
--     so the veins hug the tunnel walls instead of blocking the walkway, then
--     thinned to >=22yd apart and >=9yd clear of every Kaja'mite Deposit.
--   * Z: heightmap + 0.1 (F-170 gameobject lift) where the heightmap agrees
--     with the navmesh floor (open cut); navmesh - 0.294 + 0.1 in the roofed
--     sections where the heightmap reads the rock above.
--   * The two nodes whose F-170 re-probe showed the largest drop below the mesh
--     (-0.74 / -0.57y) were excluded from the shortlist before picking these 4.
--
-- phaseMask 65535 matches the deposits: the mine is minable in every F-194
-- Kezan stage, not just the quest-14124 window.
-- Guids 6950000+ = the hand-authored block above `zep goblin gen`'s Kezan
-- gameobject range (base 6500000, gen DELETEs base..base+499999 and this file
-- sorts after the AUTO one, so the rows survive a regen via the I-244 cascade).

-- (DELETE narrowed from ..6999999 to this file's own guids when F-202 started
--  placing Lost Isles nodes in the shared 6950000+ hand-authored block.)
DELETE FROM `gameobject` WHERE `guid` BETWEEN 6950000 AND 6950003;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
  (6950000, 1731, 1, 0, 0, 1, 65535, -9192.4648, -11438.1221, 29.8694, 0.0000, 0, 0, 0.000000, 1.000000, 900, 100, 1, '', 0, 'F-199 Kaja''mine copper vein - NW mouth'),
  (6950001, 1731, 1, 0, 0, 1, 65535, -9028.0000, -11546.1328, 54.1562, 5.0615, 0, 0, 0.573558, -0.819165, 900, 100, 1, '', 0, 'F-199 Kaja''mine copper vein - middle chamber'),
  (6950002, 1731, 1, 0, 0, 1, 65535, -8908.0000, -11654.0000, 36.1667, 3.8397, 0, 0, 0.939697, -0.342009, 900, 100, 1, '', 0, 'F-199 Kaja''mine copper vein - E end'),
  (6950003, 1731, 1, 0, 0, 1, 65535, -9060.0166, -11730.1309, 42.8776, 0.8378, 0, 0, 0.406756, 0.913537, 900, 100, 1, '', 0, 'F-199 Kaja''mine copper vein - S branch');
