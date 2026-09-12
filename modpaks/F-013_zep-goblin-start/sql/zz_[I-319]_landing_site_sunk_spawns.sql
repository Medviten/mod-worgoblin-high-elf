-- [I-319] Landing Site (area 4870) NPCs standing below the terrain surface.
-- Reported in-game at 379.71 / -10470.49 / 5.06 (phase 2048): the Oomlot Warrior raid on
-- the crash camp, Hobart Grapplehammer, Assistant Greely, Maxx Avalanche, the Kezan
-- Citizens and others stand buried up to 1.8y deep. GM vision shows every phase at once,
-- hence "a heap of NPCs".
--
-- TARGET Z = .map heightmap + 0.05, verified against the client rather than assumed: the
-- reporter's .gps at 379.7138/-10470.493 read GroundZ 5.063431, and the heightmap there is
-- 5.063426 -- equal to 5 decimals. GroundZ == FloorZ at that spot, and a navmesh-minus-
-- heightmap probe over the whole camp shows only the usual noisy +0.3 bias with no
-- continuous raised strip, so there is no vmap deck here (unlike I-269). Plain terrain,
-- and the heightmap is the true visual floor.
--
-- THRESHOLD: normalise anything measurably off that floor (>0.02). Two earlier passes cut
-- at 0.50 then 0.10 and both left NPCs visibly buried -- Assistant Greely (38124, -0.41),
-- Maxx Avalanche (38515, -0.25), Kezan Citizens (38745, -0.15..-0.37). These are goblin
-- models ~1.3-1.4y tall (GOBLINMALE collision_height 1.274, GOBLINFEMALE 1.442,
-- geo_box_min_z ~-0.08 so the origin is at the feet), so even 0.2y of sink is shin-deep and
-- plainly visible. Do NOT reason about sink in absolute yards without reference to the
-- model's height, and do not pick a cut that leaves spawns sitting just under it.
--
-- Why F-170 cannot do this: mmap_query's ON_MESH test is dist <= 3.0 AND |zDiff| <= 3.0, so
-- every one of these reports ON_MESH and `zep world terrain check` calls the region clean.
-- Worse, the same box holds 40 spawns that are genuinely OFF_MESH and MUST stay off-mesh
-- (12 Ravenous Lurkers underwater, 9 Lost Isles Mail Birds flying, cliff/air encounter
-- spawns) -- a zone-wide `terrain fix -t creature` would beach those and fix none of these.
--
-- Not a port defect: goblin_gen/creatures.py passes the source z through verbatim (x/y get
-- the map-648 offset, z does not). The OA terrain at the camp sits above the ground Cata
-- authored these spawns against.
--
-- Keyed by entry + ORIGINAL position, never by guid: the AUTO creature guids are sequential
-- and renumber on every `zep goblin gen` sweep. One row per position CLUSTER, so phase twins
-- standing on one spot are normalised to the floor together (they are the same NPC in
-- different phases and must not end up at different heights -- 4 spawns here were floating
-- slightly and come DOWN, at most 0.21). Generated with three guards: (1) a cluster member
-- more than 0.50 above target is assumed to be standing on a prop and the whole cluster is
-- left alone; (2) the terrain under a cluster must be flat, max 2.0y heightmap spread over
-- a +/-2y cross (~27 deg; the camp's median is 0.39y), because a single-point heightmap
-- sample is unreliable on slopes; (3) each row's 0.5 match box must select exactly its
-- intended spawns and no two rows may match the same creature -- phase twins sit ~0.1y
-- apart and naive per-guid rows leave the winner undefined.
--
-- Excluded deliberately:
--   * guid 11002201 (Oomlot Warrior 38531, Raptor Rise) -- sunk 0.55y but on a slope.
--   * 131 zone-wide spawns reading |dz| > 10 (Lost Peak, Vicious Vale, Sky Falls) -- the
--     known heightmap-on-steep-cliffs failure mode, not real burial.
UPDATE creature c
JOIN (
            SELECT   6827 AS id,   304.7900 AS x, -10413.0000 AS y,   0.0449 AS z  -- Shore Crab: was -0.0749 (guid 11000161)
  UNION ALL SELECT   6827,         461.7980,       -10437.9000,         1.6030       -- Shore Crab: was 1.5182 (guid 11000209)
  UNION ALL SELECT  36471,         398.8515,       -10465.5500,         5.0709       -- Foreman Dampwick: was 4.9730, 5.0951 (guid 11001565, 11001566)
  UNION ALL SELECT  38111,         379.5140,       -10513.8000,        12.7091       -- Wild Clucker: was 12.5587 (guid 11001834)
  UNION ALL SELECT  38111,         412.6170,       -10521.6000,        12.5434       -- Wild Clucker: was 12.4444 (guid 11001835)
  UNION ALL SELECT  38111,         435.7950,       -10427.4000,         2.5596       -- Wild Clucker: was 2.4865 (guid 11001782)
  UNION ALL SELECT  38120,         384.6403,       -10463.6667,         5.0856       -- Hobart Grapplehammer: was 3.2929, 4.7220, 3.2373 (guid 11001876, 11001879, 11001880)
  UNION ALL SELECT  38122,         395.4600,       -10459.6000,         5.0709       -- Bamm Megabomb: was 5.0353, 4.9379 (guid 11001884, 11001885)
  UNION ALL SELECT  38124,         374.6495,       -10460.6500,         5.1678       -- Assistant Greely: was 4.7467, 4.7002 (guid 11001891, 11001892)
  UNION ALL SELECT  38409,         379.4905,       -10442.4500,         5.6323       -- Goblin Survivor: was 5.2628, 5.1830 (guid 11002047, 11002064)
  UNION ALL SELECT  38409,         387.2860,       -10472.2500,         5.0709       -- Goblin Survivor: was 4.6630, 4.5212 (guid 11002049, 11002062)
  UNION ALL SELECT  38409,         396.6670,       -10454.5000,         5.7109       -- Goblin Survivor: was 5.0635 (guid 11002065)
  UNION ALL SELECT  38409,         403.0485,       -10456.3000,         5.1792       -- Goblin Survivor: was 5.1936, 5.0940 (guid 11002046, 11002067)
  UNION ALL SELECT  38409,         414.1700,       -10470.3000,         5.3630       -- Goblin Survivor: was 5.1710 (guid 11002068)
  UNION ALL SELECT  38432,         391.2205,       -10457.0000,         5.2999       -- Megs Dreadshredder: was 5.1905, 5.0700 (guid 11002092, 11002094)
  UNION ALL SELECT  38511,         374.5775,       -10457.1000,         5.2876       -- Sally "Salvager" Sandscrew: was 5.5017, 5.1024 (guid 11002108, 11002110)
  UNION ALL SELECT  38513,         375.5170,       -10470.8500,         5.1297       -- Evol Fingers: was 5.1959, 5.0038 (guid 11002112, 11002113)
  UNION ALL SELECT  38514,         387.3865,       -10453.7500,         5.2176       -- Fizz Lighter: was 4.8712, 4.7798 (guid 11002119, 11002120)
  UNION ALL SELECT  38515,         383.1000,       -10452.4500,         5.1151       -- Maxx Avalanche: was 4.8879, 4.8157 (guid 11002122, 11002123)
  UNION ALL SELECT  38518,         391.9850,       -10472.7500,         5.3561       -- Warrior-Matic NX-01: was 5.2529, 5.1321 (guid 11002139, 11002140)
  UNION ALL SELECT  38738,         386.7695,       -10473.9500,         5.0709       -- Coach Crosscheck: was 4.9035, 4.9835 (guid 11002293, 11002294)
  UNION ALL SELECT  38745,         375.6665,       -10455.2500,         5.3134       -- Kezan Citizen: was 5.2450, 5.1849 (guid 11002335, 11002346)
  UNION ALL SELECT  38745,         377.9040,       -10441.7500,         5.6073       -- Kezan Citizen: was 5.3061, 5.2078 (guid 11002336, 11002354)
  UNION ALL SELECT  38745,         378.0835,       -10443.7500,         5.7695       -- Kezan Citizen: was 5.4218, 5.3502 (guid 11002337, 11002347)
  UNION ALL SELECT  38745,         385.1160,       -10473.9000,         5.0709       -- Kezan Citizen: was 5.0053, 4.9240 (guid 11002340, 11002349)
  UNION ALL SELECT  38745,         389.4710,       -10479.1000,         6.4784       -- Kezan Citizen: was 6.2776 (guid 11002353)
  UNION ALL SELECT  38745,         390.3140,       -10444.0000,         6.1747       -- Kezan Citizen: was 5.9331, 5.8853 (guid 11002339, 11002355)
  UNION ALL SELECT  38746,         384.4605,       -10470.6500,         5.0767       -- Gobber: was 4.4420, 4.4389 (guid 11002359, 11002361)
  UNION ALL SELECT  38753,         430.4760,       -10500.1000,         8.3597       -- Goblin Zombie: was 7.8296 (guid 11002487)
  UNION ALL SELECT  38753,         431.3570,       -10497.0000,         7.9147       -- Goblin Zombie: was 6.9009 (guid 11002486)
  UNION ALL SELECT  38753,         442.6390,       -10516.0000,        11.2542       -- Goblin Zombie: was 11.0585 (guid 11002483)
  UNION ALL SELECT  38753,         460.5280,       -10498.0000,         8.7569       -- Goblin Zombie: was 8.5981 (guid 11002489)
  UNION ALL SELECT  42473,         380.0745,       -10445.3500,         5.9640       -- Grimy Greasefingers: was 5.4406, 5.3635 (guid 11003508, 11003509)
  UNION ALL SELECT  75116,         376.0080,       -10453.7000,         5.3366       -- Oomlot Warrior: was 5.2625 (guid 11003339)
  UNION ALL SELECT  75116,         376.1560,       -10463.6000,         5.1153       -- Oomlot Warrior: was 4.1875 (guid 11003236)
  UNION ALL SELECT  75116,         377.2370,       -10460.6000,         5.1427       -- Oomlot Warrior: was 4.0481 (guid 11003413)
  UNION ALL SELECT  75116,         378.3690,       -10466.3000,         5.0966       -- Oomlot Warrior: was 3.9495 (guid 11003302)
  UNION ALL SELECT  75116,         379.8840,       -10458.3000,         5.1360       -- Oomlot Warrior: was 3.8308 (guid 11003418)
  UNION ALL SELECT  75116,         381.0030,       -10463.8000,         5.0955       -- Oomlot Warrior: was 3.3183 (guid 11001860)
  UNION ALL SELECT  75116,         381.1020,       -10468.2000,         5.0911       -- Oomlot Warrior: was 4.1230 (guid 11001875)
  UNION ALL SELECT  75116,         383.7590,       -10456.5000,         5.1240       -- Oomlot Warrior: was 4.0919 (guid 11003280)
  UNION ALL SELECT  75116,         384.4930,       -10461.1000,         5.0986       -- Oomlot Warrior: was 3.4466 (guid 11001793)
  UNION ALL SELECT  75116,         385.0920,       -10468.5000,         5.0769       -- Oomlot Warrior: was 3.8736 (guid 11003308)
  UNION ALL SELECT  75116,         387.7720,       -10468.8000,         5.0720       -- Oomlot Warrior: was 3.8265 (guid 11002103)
  UNION ALL SELECT  75116,         387.8050,       -10463.9000,         5.0796       -- Oomlot Warrior: was 3.6009 (guid 11001807)
  UNION ALL SELECT  75116,         389.1350,       -10459.0000,         5.1100       -- Oomlot Warrior: was 4.3052 (guid 11001898)
  UNION ALL SELECT  75116,         390.8360,       -10458.8000,         5.1090       -- Oomlot Warrior: was 4.6182 (guid 11003301)
  UNION ALL SELECT  75116,         391.1370,       -10462.0000,         5.0786       -- Oomlot Warrior: was 4.0259 (guid 11001815)
  UNION ALL SELECT  75116,         394.8940,       -10460.3000,         5.0709       -- Oomlot Warrior: was 4.8900 (guid 11003264)
  UNION ALL SELECT  75116,         395.8250,       -10437.4000,         6.1181       -- Oomlot Warrior: was 6.0387 (guid 11003281)
  UNION ALL SELECT  75116,         401.7850,       -10438.9000,         6.3227       -- Oomlot Warrior: was 5.8949 (guid 11003299)
  UNION ALL SELECT  75116,         426.1160,       -10502.1000,         8.0076       -- Oomlot Warrior: was 7.8562 (guid 11003340)
  UNION ALL SELECT 385310,         406.9080,       -10438.7000,         6.1175       -- Oomlot Warrior: was 5.9826 (guid 11003621)
  UNION ALL SELECT 385310,         429.1110,       -10500.1000,         8.2321       -- Oomlot Warrior: was 7.6958 (guid 11003640)
) f ON c.id = f.id
   AND ABS(c.position_x - f.x) < 0.5
   AND ABS(c.position_y - f.y) < 0.5
SET c.position_z = f.z
WHERE c.map = 1;
