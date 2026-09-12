-- [I-269] Kezan Citizens (35063) buried under Kezan's raised road decks.
-- Reported across First Bank of Kezan, Bilgewater Port, Swindle Street and Kajaro Field.
--
-- Each of these spawns sits at a z that is EXACTLY the .map heightmap value at its XY --
-- i.e. on raw terrain. Kezan's roads are raised decks, not painted terrain: in-game .gps
-- reports GroundZ (heightmap) 0.2..1.8y BELOW FloorZ (vmap surface the player stands on),
-- and a navmesh probe shows a continuous ~4-8yd wide strip running through these XYs
-- sitting +0.8..+1.1y above the heightmap. The citizens stand underneath it.
--
-- Not a port defect: the Neltharion source rows carry the same z, and our terrain matches
-- Cata's heightmap essentially bit-for-bit (763/1138 F-011 spawns land within 0.15y of it).
-- It is a source-data artifact -- Neltharion script-ified Kezan citizen movement and froze
-- these wanderers as static spawns (see I-249), and these frozen positions happen to fall
-- under the deck. TDB 4.3.4 (build 15595) has no sniffed spawn at these XYs to arbitrate,
-- so each z below is the FloorZ measured in-game at that spot.
--
-- A few spawns clip a wall or prop rather than sinking into a deck; those need a lateral
-- move, so the list also carries an optional new x/y (nx/ny). NULL nx/ny = raise z only.
--
-- Fix: place at the surface measured in-game. Orientation is never touched.
-- Keyed by entry + ORIGINAL position, never by guid: the AUTO creature guids are sequential
-- and renumber on every `zep goblin gen` sweep. Add a row to the list to fix more. Matching
-- on the original position keeps this idempotent -- once a row is relocated it no longer
-- matches its own box, and a regen that restores the source position re-triggers the fix.
-- A guid must appear ONCE: a relocation row supersedes any lift row for the same spawn,
-- otherwise both match the same box and the winner is undefined.
UPDATE creature c
JOIN (
  -- relocations: matched at x/y, moved to nx/ny/z (clipping a wall/prop, not a deck)
            SELECT -8806.9933 AS x, -11104.45 AS y, -8809.6530 AS nx, -11104.798 AS ny, 48.2006 AS z  -- guid 12000288
  UNION ALL SELECT -8759.5933,      -11114.71,      -8761.8955,       -11116.465,       43.4025       -- guid 12000277
  UNION ALL SELECT -8787.7933,      -11260.67,      -8787.9390,       -11262.738,       41.0880       -- guid 12000274
  -- lifts: matched at x/y, z only (sunk into a raised deck)
  UNION ALL SELECT -8838.8833,      -11071.66,      NULL,             NULL,             51.1061       -- was 50.4751 (guid 12000257)
  UNION ALL SELECT -8836.0733,      -11103.18,      NULL,             NULL,             51.0233       -- was 50.5332 (guid 12000259)
  UNION ALL SELECT -8847.9833,      -11117.80,      NULL,             NULL,             51.0505       -- was 50.7781 (guid 12000260)
  UNION ALL SELECT -8781.4333,      -11114.90,      NULL,             NULL,             45.8004       -- was 45.6129 (guid 12000286)
  UNION ALL SELECT -8750.0333,      -11177.36,      NULL,             NULL,             33.1045       -- was 32.7057 (guid 12000299)
  UNION ALL SELECT -8653.0333,      -11428.32,      NULL,             NULL,             22.3380       -- was 22.0155 (guid 12000244)
  UNION ALL SELECT -8656.3933,      -11455.23,      NULL,             NULL,             17.2453       -- was 15.4275 (guid 12000245)
  UNION ALL SELECT -8700.2733,      -11507.35,      NULL,             NULL,             25.2401       -- was 24.8187 (guid 12000233)
  UNION ALL SELECT -8730.0233,      -11506.56,      NULL,             NULL,             29.0454       -- was 28.2544 (guid 12000223)
  UNION ALL SELECT -8760.1833,      -11354.97,      NULL,             NULL,             39.1258       -- was 38.8319 (guid 12000269)
  UNION ALL SELECT -8769.5533,      -11349.62,      NULL,             NULL,             40.3385       -- was 40.0124 (guid 12000266)
  UNION ALL SELECT -8804.7733,      -11349.45,      NULL,             NULL,             40.6444       -- was 40.3873 (guid 12000253)
  UNION ALL SELECT -8842.0433,      -11290.67,      NULL,             NULL,             45.6911       -- was 45.4685 (guid 12000250)
  UNION ALL SELECT -8853.4533,      -11286.78,      NULL,             NULL,             46.8894       -- was 46.5671 (guid 12000284)
  UNION ALL SELECT -8765.2933,      -11326.02,      NULL,             NULL,             40.4429       -- was 40.0014 (guid 12000264)
  UNION ALL SELECT -8771.2533,      -11311.81,      NULL,             NULL,             41.0035       -- was 40.8320 (guid 12000270)
  UNION ALL SELECT -8767.8433,      -11304.16,      NULL,             NULL,             40.8125       -- was 40.3551 (guid 12000294)
  UNION ALL SELECT -8651.8433,      -11233.30,      NULL,             NULL,             10.7052       -- was 10.2726 (guid 12000240)
  UNION ALL SELECT -8641.1533,      -11340.55,      NULL,             NULL,             10.0245       -- was  9.4708 (guid 12000227)
  UNION ALL SELECT -8640.3733,      -11338.04,      NULL,             NULL,             10.0710       -- was  9.4725 (guid 12000230)
  UNION ALL SELECT -8636.2533,      -11340.71,      NULL,             NULL,             10.0246       -- was  9.4458 (guid 12000228)
  UNION ALL SELECT -8632.9733,      -11329.43,      NULL,             NULL,             10.1106       -- was  9.3615 (guid 12000235)
) f ON ABS(c.position_x - f.x) < 0.5 AND ABS(c.position_y - f.y) < 0.5
SET c.position_x = COALESCE(f.nx, c.position_x),
    c.position_y = COALESCE(f.ny, c.position_y),
    c.position_z = f.z
WHERE c.map = 1
  AND c.id = 35063;
