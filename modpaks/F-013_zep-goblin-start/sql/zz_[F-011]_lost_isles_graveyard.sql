-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 Goblin Starting Zone -- Lost Isles graveyards (server-side, non-disruptive)
-- Zone 4720 (The Lost Isles) on OA Kalimdor map 1.
-- I-252 rework (2026-08-04): graveyards covering the zone's hubs, IDs = their
-- area IDs, positions from in-game .gps ground readings. Nearest-graveyard selection
-- picks the right one per death location; Faction 0 = both factions.
-- Legacy single graveyard ID 4720 (Gobber's Inn hub) retired -- superseded by 4952.
-- 2026-08-13: added 4876 (Ruins of Vashj'elan). Deaths there were resolving to the
-- Horde Base Camp stone 754yd away and 93yd up a cliff -- the worst run in the zone.
--
-- 2026-08-20 (I-252 round 3): completed the set from the RETAIL graveyard list instead of
-- adding one stone per report. Cata `WorldSafeLocs.dbc` (Whitemane 15595 extract) has 15
-- rows linked to zone 4720 in tdb434 `graveyard_zone`; transformed to map 1 with the
-- standard F-011 offset (X-533.3333 / Y-12800) every one lands on our terrain:
-- heightmap Z matches the Cata Z to <1yd for the 12 outdoor rows, and all 15 points come
-- back ON_MESH (<1.2yd) against our mmaps -- including the Vengeance Wake ship decks
-- (heightmap is the -33 seabed under the WMO) and Volcanoth's Lair cave (heightmap 470
-- is the mountain above it). Retail 1488/1489/1492/1713 are the four we already had
-- (ours are within 3yd, left untouched); the 10 rows below are the ones we were missing.
-- Retail ID -> ours: 1491->4781, 1496/1497->4784 (two ship phases, one stone kept),
-- 1702->4870, 1704->4899, 1705->4909, 1708->4912, 1711->4923, 1712->4958, 1716->4886,
-- 1773->4911. IDs stay the ADT area ID at the stone (Volcanoth's Lair uses its own
-- AreaTable id 4911 -- the cave's surface chunk reads 4899 and would collide with Lost Peak).
-- 4876 (Ruins of Vashj'elan) has no retail counterpart and is kept.
-- Spirit Healers (6491) for these live in cli/data/goblin/fixtures/manual_spawns.json
-- (guids 11900001/04-07 and 11900008-11900017 -- 03 is hand-claimed by zz_[I-310]),
-- emitted via `zep goblin gen creatures`.
-- (`game_graveyard` has no orientation column.)

DELETE FROM game_graveyard WHERE ID IN (4720, 4721, 4779, 4781, 4783, 4784, 4870, 4876, 4886, 4899, 4909, 4911, 4912, 4923, 4952, 4958);
INSERT INTO game_graveyard (ID, Map, x, y, z, Comment) VALUES
  (4721, 1, 100.939926, -9683.685, 3.2355766, 'Lost Isles - Shipwreck Shore (F-011)'),
  (4779, 1, -15.813403, -10093.472, 105.8947, 'Lost Isles - Horde Base Camp (F-011)'),
  (4781, 1, 338.149366, -10019.799561, 114.662231, 'Lost Isles - Wild Overlook (F-011, retail WSL 1491)'),
  (4783, 1, 473.76096, -9490.309, 3.305902, 'Lost Isles - Alliance Beachhead (F-011)'),
  (4784, 1, 437.76045, -8997.019043, 14.392098, 'Lost Isles - Vengeance Wake deck (F-011, retail WSL 1496)'),
  (4870, 1, 319.571241, -10474.097168, 13.205963, 'Lost Isles - Landing Site / Town-In-A-Box (F-011, retail WSL 1702)'),
  (4876, 1, 87.629654, -10840.065, 12.774312, 'Lost Isles - Ruins of Vashj''elan (F-011)'),
  (4886, 1, 177.631971, -10974.203125, 104.505363, 'Lost Isles - Oomlot Village (F-011, retail WSL 1716)'),
  (4899, 1, 947.204908, -10737.364502, 224.336502, 'Lost Isles - Lost Peak (F-011, retail WSL 1704)'),
  (4909, 1, 856.059034, -11463.980835, 132.912949, 'Lost Isles - Lost Caldera (F-011, retail WSL 1705)'),
  (4911, 1, 635.446729, -11708.790039, 120.081001, 'Lost Isles - Volcanoth''s Lair (F-011, retail WSL 1773)'),
  (4912, 1, 1207.628492, -10109.428711, 85.315758, 'Lost Isles - Warchief''s Lookout (F-011, retail WSL 1708)'),
  (4923, 1, 1235.493116, -10788.03125, 220.938904, 'Lost Isles - Sky Falls (F-011, retail WSL 1711)'),
  (4952, 1, 1885.7053, -10898.985, 13.47201, 'Lost Isles - KTC Oil Platform (F-011)'),
  (4958, 1, 1526.324659, -10485.439209, 71.343658, 'Lost Isles - Verdant Highlands (F-011, retail WSL 1712)');

DELETE FROM graveyard_zone WHERE GhostZone = 4720;
INSERT INTO graveyard_zone (ID, GhostZone, Faction, Comment) VALUES
  (4721, 4720, 0, 'Lost Isles -> Shipwreck Shore graveyard (F-011)'),
  (4779, 4720, 0, 'Lost Isles -> Horde Base Camp graveyard (F-011)'),
  (4781, 4720, 0, 'Lost Isles -> Wild Overlook graveyard (F-011)'),
  (4783, 4720, 0, 'Lost Isles -> Alliance Beachhead graveyard (F-011)'),
  (4784, 4720, 0, 'Lost Isles -> Vengeance Wake graveyard (F-011)'),
  (4870, 4720, 0, 'Lost Isles -> Landing Site / Town-In-A-Box graveyard (F-011)'),
  (4876, 4720, 0, 'Lost Isles -> Ruins of Vashj''elan graveyard (F-011)'),
  (4886, 4720, 0, 'Lost Isles -> Oomlot Village graveyard (F-011)'),
  (4899, 4720, 0, 'Lost Isles -> Lost Peak graveyard (F-011)'),
  (4909, 4720, 0, 'Lost Isles -> Lost Caldera graveyard (F-011)'),
  (4911, 4720, 0, 'Lost Isles -> Volcanoth''s Lair graveyard (F-011)'),
  (4912, 4720, 0, 'Lost Isles -> Warchief''s Lookout graveyard (F-011)'),
  (4923, 4720, 0, 'Lost Isles -> Sky Falls graveyard (F-011)'),
  (4952, 4720, 0, 'Lost Isles -> KTC Oil Platform graveyard (F-011)'),
  (4958, 4720, 0, 'Lost Isles -> Verdant Highlands graveyard (F-011)');
