-- I-336 "Surrender or Else!" (quest 24868) — Ace's escort, re-authored as SmartAI.
--
-- Megs Dreadshredder (38432) already casts 72058 "Surrender Or Else!: Summon Ace" on
-- the player when the quest is accepted, and that summons Ace 38455. Everything he
-- was supposed to do after that lived in a donor C++ CreatureScript,
-- `npc_ace_surrender_escort` (Neltharion `Maelstrom/lost_isles.cpp:1204-1346`), and
-- the port carries tables, not scripts — so 38455 arrived with AIName '',
-- ScriptName '', zero smart_scripts and zero waypoints. He stood at Megs' elbow
-- forever, there were no naga hatchlings to march anywhere, and because nothing ever
-- summoned the Faceless of the Deep the objective could not be completed at all.
-- (There is no gossip on Ace in retail either: the escort auto-starts a few seconds
-- after the quest is accepted. "Cannot talk to him" is him being inert.)
--
-- The donor script, beat for beat:
--
--   IsSummonedBy   REACT_PASSIVE, self-root, remove 49416 from the summoner, summon
--                  4x 38457 at fixed points and MoveFollow(Ace, 0.8, 0.5/0.8/1.1/1.4 pi),
--                  then at +1s talk 0 (@+1s) and talk 1 (@+4s), face Megs, and at
--                  +6s drop the root and Start(run) down the 35-point escort path.
--   WaypointReached  13 -> talk 2 ; 20 -> talk 3
--   WaypointReached  35 -> camera shake 45849, talk 4, summon 38448 (manual) and
--                  38450 (12s) at the ruins, talk 6 at +23s, and at +25s run to
--                  (215.52, 1945.00, 0.26) — Ace legs it back up the beach.
--   Cleanup        despawn Ace and his summons when the quest completes, is
--                  abandoned, or the player walks off.
--
-- Two things are re-created here because the generator cannot see them:
--
--   * The path. npc_escortAI reads TrinityCore's `script_waypoint`, which is not one
--     of the tables `zep goblin extract-neltharion` loads — `waypoints` comes back
--     EMPTY for 38455, which reads as "no path" but is not. The 35 points below were
--     pulled straight out of `source/sql/base/world.zip` and carry the standard
--     map648 -> map1 offset (X-533.3333, Y-12800.0, Z unchanged). Cross-check: point
--     35 lands at (-364.5, -10859.4) and the shipped `quest_poi_points` objective is
--     (-401, -10861), which is the Faceless summon spot below.
--   * The two summon-only creatures. `_summons.summoned_entries()` walks spell
--     effect 28, and the donor summons these from C++, so 38457 and 38450 had no
--     `creature_template` row at all. Closed at source by `_summons.CPP_SUMMONS`.
--
-- 38455's AIName is set at source too (`creatures.AI_NAME_PORTS`) — a blank AIName
-- means SmartAI never runs and every row in this file is dead.
--
-- Divergences from the donor, all deliberate:
--   * No self-root. 38455 is MovementType 0 / REACT_PASSIVE / IMMUNE_TO_PC|NPC, so he
--     stands still on his own. The donor's root exists to stop npc_escortAI drifting;
--     re-creating it here would mean a `remove root` step that, if it ever failed,
--     reproduces exactly the bug this file fixes.
--   * No "is a Faceless already up within 80 yards" guard before the summon. SmartAI
--     has no conditional of that shape, and the cost of dropping it is a second
--     Faceless if two players reach the ruins together — both killable, both credit.
--   * He WALKS, not runs (donor: `Start(false, true, …)` → run). On tester report,
--     2026-08-15: at run he is 6.72 yd/s against a player's 7.0, which leaves no
--     headroom to stop and fight, and the middle third of the path is at sea level
--     where the player swims at 4.72. Walking is 2.5 yd/s. One parameter — action
--     param1 on the ESCORT_START row — if that turns out too slow.
--   * He fights: faction 1770 + REACT_DEFENSIVE + an invincibility floor. See the
--     faction block below for why the donor's Ace could never have interacted with
--     anything.
--
-- ---------------------------------------------------------------------------
-- 1. The escort path (SmartWaypointMgr / `waypoints`, path id = the entry).
-- ---------------------------------------------------------------------------
-- NOT owned by the waypoints gen domain: its scope is derived from pathIDs
-- referenced by IMPORTED SAI rows, and the ESCORT_START that uses this one is
-- hand-authored below, so a regen neither emits nor deletes these.
--
-- `SMART_ACTION_ESCORT_START` is REJECTED AT LOAD if the path is missing
-- (SmartScriptMgr.cpp:1789), and SmartWaypointMgr only loads at startup — these rows
-- must be in the DB before the worldserver comes up or the escort is silently dead.
DELETE FROM waypoints WHERE entry = 38455;
INSERT INTO waypoints (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `point_comment`) VALUES
  (38455,  1,  145.338, -10783.590, 46.8518, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  2,  137.430, -10790.620, 42.5611, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  3,  125.531, -10797.600, 35.4695, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  4,  111.876, -10802.470, 28.0207, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  5,   88.882, -10813.040, 17.5265, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  6,   73.696, -10822.540, 12.9228, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  7,   53.916, -10821.930,  9.8150, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  8,   47.864, -10817.990,  9.9947, NULL, 0, 'I-336 Ace surrender escort'),
  (38455,  9,   39.423, -10810.580,  9.4517, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 10,   27.384, -10805.670,  7.4313, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 11,    1.469, -10799.470,  4.3354, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 12,  -23.046, -10793.680,  2.6140, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 13,  -49.599, -10803.420,  0.6479, NULL, 0, 'I-336 Ace surrender escort - talk 2'),
  (38455, 14,  -64.079, -10820.070,  0.2084, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 15,  -70.276, -10827.510, -0.5323, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 16,  -77.553, -10841.550, -0.5959, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 17,  -93.690, -10849.230, -0.5272, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 18, -103.127, -10849.830, -0.5158, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 19, -113.667, -10849.410, -0.1142, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 20, -127.782, -10850.010,  0.0142, NULL, 0, 'I-336 Ace surrender escort - talk 3'),
  (38455, 21, -141.156, -10850.920, -0.5119, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 22, -163.194, -10851.320, -0.5119, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 23, -184.753, -10852.010, -0.5119, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 24, -204.561, -10851.960, -0.5119, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 25, -217.243, -10853.510, -0.2732, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 26, -231.744, -10855.060, -0.2156, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 27, -241.881, -10856.500, -0.2386, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 28, -255.205, -10857.940, -0.0929, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 29, -261.609, -10856.370,  0.1676, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 30, -274.394, -10854.430, -0.5251, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 31, -292.784, -10853.740, -0.6009, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 32, -316.553, -10854.630,  0.1959, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 33, -333.125, -10855.620,  1.5046, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 34, -354.759, -10858.020,  3.7505, NULL, 0, 'I-336 Ace surrender escort'),
  (38455, 35, -364.549, -10859.360,  4.9361, NULL, 0, 'I-336 Ace surrender escort - showdown');

-- ---------------------------------------------------------------------------
-- 2. Ace 38455 — the escort itself.
-- ---------------------------------------------------------------------------
-- The donor ships no smart_scripts for 38455 (its behaviour was the ScriptName), so
-- the AUTO file emits no rows and no DELETE for this entry: these ids are ours
-- outright.
--
-- The per-point callbacks are SMART_EVENT_ESCORT_REACHED (40), NOT
-- SMART_EVENT_WAYPOINT_REACHED (108) — 108 belongs to the `waypoint_data` motion
-- type. A SmartAI escort splines the whole path in one go and `SplineHandler`
-- (Unit.cpp:753) fires MovementInform per spline point, which is what advances
-- mCurrentWPID and makes the mid-path ids below fire.
--
-- ESCORT_START passes quest = 0 on purpose. A non-zero quest makes SmartAI call
-- FailQuest on the out-of-range abandon path (SmartAI.cpp:461 -> EndPath fail
-- branch); 24868 is not a failable quest and the donor only despawns its summons.
-- Ace despawning himself on abandon is SmartAI's own behaviour; row 4 catches the
-- SMART_EVENT_DEATH it fires on the way out so the hatchlings go with him.
-- Faction: a DELIBERATE divergence from the donor, on tester report (2026-08-15,
-- "didn't interact with any naga mobs along the way").
--
-- The donor gives 38455 faction 35 "Friendly" — template 35 is faction 31 with
-- friend_group 1, enemy_group 0 and an empty enemies[] list, i.e. friendly to
-- everything and hostile to nothing. Retail Ace is an invulnerable prop who walks
-- through the Vashj'elan camp untouched; `npc_escortAI::Start` clearing
-- IMMUNE_TO_NPC is a no-op for him. So the escort really was silent by design, and
-- no amount of unit-flag work would have changed it.
--
-- 1770 is the DBC's purpose-built answer: faction 959 "Actor Good", friend_group 1
-- (friendly to players), enemies_1 = 960 "Actor Evil" — and the Vashj'elan Warrior
-- and Siren (38359 / 38360) both run template 1771, which IS faction 960 with
-- enemies_1 = 959. Mutual hostility, no new DBC rows, and 91 creatures in the world
-- DB already use 1770 for exactly this "scripted friendly actor" role.
--
-- AUTO-owned row -> one consolidated UPDATE. AIName is handled at source
-- (creatures.AI_NAME_PORTS); this is the only column this file owns.
UPDATE creature_template SET
  `faction` = 1770
WHERE entry = 38455;

DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 38455;
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid IN (3845500, 3845501);
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 38457;
INSERT INTO smart_scripts
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`,
   `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`,
   `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`,
   `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
   `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  -- event 54 JUST_SUMMONED: invoker is the summoner, i.e. the player who accepted the quest.
  (38455, 0, 0, 0, 54, 0, 100, 0,  0,     0, 0, 0, 0, 0, 80, 3845500, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 0, 'Ace - On Just Summoned - Run Intro Actionlist (I-336)'),
  (38455, 0, 1, 0, 40, 0, 100, 0, 13, 38455, 0, 0, 0, 0,  1,       2, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 0, 'Ace - On Waypoint 13 Reached - Say Line 2 (I-336)'),
  (38455, 0, 2, 0, 40, 0, 100, 0, 20, 38455, 0, 0, 0, 0,  1,       3, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 0, 'Ace - On Waypoint 20 Reached - Say Line 3 (I-336)'),
  (38455, 0, 3, 0, 40, 0, 100, 0, 35, 38455, 0, 0, 0, 0, 80, 3845501, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 0, 'Ace - On Waypoint 35 Reached - Run Showdown Actionlist (I-336)'),
  -- SmartAI fires SMART_EVENT_DEATH before despawning an escort whose player walked off.
  (38455, 0, 4, 0,  6, 0, 100, 0,  0,     0, 0, 0, 0, 0, 41,       0, 0, 0, 0, 0, 0, 11, 38457, 80, 1, 0, 0, 0, 0, 0, 'Ace - On Death/Escort Abandoned - Despawn Naga Hatchlings (I-336)'),

  -- ---- 3845500: intro. Delays are per-entry waits, so t is cumulative. ----
  -- t=0     passive + the four hatchlings, at the donor's absolute positions
  -- t=500   they form up behind Ace (SEMI_CIRCLE_BEHIND = 90/135/180/225 degrees)
  -- t=2000  face Megs, say line 0
  -- t=5000  say line 1
  -- t=7000  arm him for the walk down  <- donor: talk at 2s and 5s, Start() at 7s
  (3845500, 9, 0, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,   8,     0,  0,   0, 0, 0, 0,  1,     0,  0, 0, 0,        0,         0,      0,     0, 'Ace intro - React Passive (I-336)'),
  (3845500, 9, 1, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,  12, 38457,  8,   0, 0, 0, 0,  8,     0,  0, 0, 0, 151.2403, -10772.99, 51.280, 3.100, 'Ace intro - Summon Naga Hatchling 1 (I-336)'),
  (3845500, 9, 2, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,  12, 38457,  8,   0, 0, 0, 0,  8,     0,  0, 0, 0, 151.4029, -10775.85, 50.361, 2.700, 'Ace intro - Summon Naga Hatchling 2 (I-336)'),
  (3845500, 9, 3, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,  12, 38457,  8,   0, 0, 0, 0,  8,     0,  0, 0, 0, 149.1441, -10778.45, 49.281, 2.400, 'Ace intro - Summon Naga Hatchling 3 (I-336)'),
  (3845500, 9, 4, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,  12, 38457,  8,   0, 0, 0, 0,  8,     0,  0, 0, 0, 144.8968, -10778.52, 48.525, 1.300, 'Ace intro - Summon Naga Hatchling 4 (I-336)'),
  (3845500, 9, 5, 0, 0, 0, 100, 0,  500,  500, 0, 0, 0, 0, 230,     1,  2, 100, 0, 0, 0, 11, 38457, 20, 1, 0,        0,         0,      0,     0, 'Ace intro - Hatchlings Follow Ace In Formation (I-336)'),
  (3845500, 9, 6, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0, 0,  66,     0,  0,   0, 0, 0, 0, 19, 38432, 15, 0, 0,        0,         0,      0,     0, 'Ace intro - Face Megs Dreadshredder (I-336)'),
  (3845500, 9, 7, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,   1,     0,  0,   0, 0, 0, 0,  7,     0,  0, 0, 0,        0,         0,      0,     0, 'Ace intro - Say Line 0 (I-336)'),
  (3845500, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 0,   1,     1,  0,   0, 0, 0, 0,  7,     0,  0, 0, 0,        0,         0,      0,     0, 'Ace intro - Say Line 1 (I-336)'),
  -- He cannot die on the way down: 30% of max HP is a floor, so a bad pull can
  -- never leave the player with an accepted quest and no escort.
  (3845500, 9,  9, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 0,  42,     0, 30,    0, 0, 0, 0,  1,    0,  0, 0, 0,        0,         0,      0,     0, 'Ace intro - Invincibility Floor 30 pct (I-336)'),
  -- `npc_escortAI::Start` clears UNIT_FLAG_IMMUNE_TO_NPC (ScriptedEscortAI.cpp:480)
  -- before it moves; without this the naga cannot touch him. IMMUNE_TO_PC (256)
  -- stays, so players still cannot.
  (3845500, 9, 10, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,  19,   512,     0, 0, 0, 0, 0,  1,    0,  0, 0, 0,        0,         0,      0,     0, 'Ace intro - Drop Immune To NPC (I-336)'),
  -- ESCORT_START params: 1 = WALK (ForcedMovement, not a bool), path 38455, no
  -- repeat, quest 0 (see header), no despawn timer, reactState 1 = DEFENSIVE
  -- (applied always). Target 7 stores the player in SMART_ESCORT_TARGETS, which is
  -- what arms the "player walked off" despawn.
  (3845500, 9, 11, 0, 0, 0, 100, 0,    0,    0, 0, 0, 0, 0,  53,     1, 38455, 0, 0, 0, 1,  7,    0,  0, 0, 0,        0,         0,      0,     0, 'Ace intro - Start Escort Walking (I-336)'),

  -- ---- 3845501: the showdown at the Ruins of Vashj''elan. ----
  -- Waypoint 35 is the last point, so ESCORT_REACHED fires and EndPath() clears the
  -- escort state immediately after — which is why the MOVE_TO_POS below is safe.
  -- t=0      camera shake + "come on out and surrender"
  -- t=500    the Faceless of the Deep and its void zone rise out of the ruins
  -- t=23500  "this does not look good, I'm out of here"
  -- t=25500  Ace runs for the beach     <- donor: talk 6 at +23s, leg 3 at +25s
  -- t=45500  he and the hatchlings are gone
  -- Back to prop mode first: he arrived hostile-to-naga and defensive, and the
  -- Faceless is faction 14 (hostile to everything). Without this he brawls with a
  -- boss he is supposed to run away from.
  (3845501, 9,  0, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0, 18,   512,     0,     0, 0, 0, 0,  1,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - Restore Immune To NPC (I-336)'),
  (3845501, 9,  1, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0,  8,     0,     0,     0, 0, 0, 0,  1,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - React Passive (I-336)'),
  (3845501, 9,  2, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0, 11, 45849,     0,     0, 0, 0, 0,  1,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - Camera Shake (I-336)'),
  (3845501, 9,  3, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0,  1,     4,     0,     0, 0, 0, 0,  7,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - Say Line 4 (I-336)'),
  (3845501, 9,  4, 0, 0, 0, 100, 0,   500,   500, 0, 0, 0, 0, 12, 38448,     8,     0, 0, 0, 0,  8,     0,  0, 0, 0, -394.0633, -10866.01, 7.181, 0.189, 'Ace showdown - Summon Faceless of the Deep (I-336)'),
  (3845501, 9,  5, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0, 12, 38450,     2, 12000, 0, 0, 0,  8,     0,  0, 0, 0, -394.0633, -10866.01, 7.181, 0.189, 'Ace showdown - Summon Faceless Void Zone (I-336)'),
  (3845501, 9,  6, 0, 0, 0, 100, 0, 23000, 23000, 0, 0, 0, 0,  1,     6,     0,     0, 0, 0, 0,  7,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - Say Line 6 (I-336)'),
  (3845501, 9,  7, 0, 0, 0, 100, 0,  2000,  2000, 0, 0, 0, 0, 59,     1,     0,     0, 0, 0, 0,  1,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - Set Run (I-336)'),
  (3845501, 9,  8, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0, 69,     1,     0,     0, 0, 0, 0,  8,     0,  0, 0, 0, -317.8133, -10855.00, 0.260, 0.000, 'Ace showdown - Flee To The Beach (I-336)'),
  (3845501, 9,  9, 0, 0, 0, 100, 0, 20000, 20000, 0, 0, 0, 0, 41,     0,     0,     0, 0, 0, 0, 11, 38457, 80, 1, 0,         0,         0,     0,     0, 'Ace showdown - Despawn Naga Hatchlings (I-336)'),
  (3845501, 9, 10, 0, 0, 0, 100, 0,     0,     0, 0, 0, 0, 0, 41,     0,     0,     0, 0, 0, 0,  1,     0,  0, 0, 0,         0,         0,     0,     0, 'Ace showdown - Despawn Self (I-336)'),

  -- ---- 38457: the hatchlings. ----
  -- The follow itself is issued by Ace (FOLLOW_GROUP above) so all four get distinct
  -- angles from one entry; this only carries the donor's REACT_PASSIVE, and keeps the
  -- entry from loading SmartAI with an empty script.
  (38457, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Naga Hatchling - On Just Summoned - React Passive (I-336)');
