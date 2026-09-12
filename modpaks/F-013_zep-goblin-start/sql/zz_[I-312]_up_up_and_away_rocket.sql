-- I-312 "Up, Up & Away!" (quest 14244) — Sling Rocket (36505) never launches.
--
-- SYMPTOM: player takes the quest from Sassy Hardwrench (36425), clicks the
-- Rocket Sling GO (196439), is seated in the rocket — and the rocket just sits
-- on the launcher forever. No flight, no credit, no way out but /unstuck.
--
-- ROOT CAUSE: everything the rocket does lived in C++, not in data. The donor
-- dump implements it as `npc_sling_rocket` (VehicleAI subclass,
-- Maelstrom/lost_isles.cpp:996) — root on summon, unroot + flight-speed + a
-- 9-point MoveSmoothPath 600 ms after the player boards, then eject + credit on
-- the last node. The F-011 port carries data only, so 36505 arrived with NO
-- AIName and NO waypoints: the boarding half works (see below) and the flying
-- half does not exist. Replaced with SmartAI here, same shape as the I-311
-- cyclone.
--
-- Why boarding already works (not a bug, recorded so it is not "fixed" later):
-- 68804 "Summon Sling Rocket - Character" is a SUMMON_CATEGORY_VEHICLE summon
-- whose effect value names the ride spell (68805). The port's +1 die-sides drift
-- (see the I-277 note) makes CalcValue return 68806, which does not resolve, so
-- AC falls back to VEHICLE_SPELL_RIDE_HARDCODED (46598). Vehicle 524 has one
-- seat (6026) either way, so the drift is inert here — left alone deliberately.
--
-- Flight path altitudes are DERIVED, not the donor's raw z: the donor path is in
-- map-648 space and was transformed X-533.3333 / Y-12800 (see the F-011 offset
-- note), then re-sampled against the shipped heightmap with
-- `cli/lib/terrain_reader.py`. Minimum clearance en route is 32 yd (node 8) and
-- the arc peaks 239 yd over the sea floor, so the donor's shape is kept verbatim
-- apart from the landing node.

-- ---- template: give the rocket an AI ----
-- AUTO-owned row -> one consolidated UPDATE.
-- SmartAI replaces the default VehicleAI; nothing in VehicleAI is needed here
-- (the rocket is auto-piloted and despawns itself), same trade as 36178 in I-311.
UPDATE creature_template SET
  `AIName` = 'SmartAI'
WHERE entry = 36505;

-- ---- flight path: the donor arc, transformed and re-sampled ----
-- Donor coords (map 648)            -> map 1                      ground  clear
--   887.50 2707.27 152  node 1      ->  354.17 -10092.73 152       99.0    53.0
--   891.90 2689.06 172  node 2      ->  358.57 -10110.94 172       46.4   125.7
--   898.90 2655.59 197  node 3      ->  365.57 -10144.41 197       10.1   186.9
--   911.20 2599.17 213  node 4      ->  377.87 -10200.83 213      -25.7   238.7
--   919.80 2555.37 188  node 5      ->  386.47 -10244.63 188      -25.5   213.5
--   930.60 2502.59 133  node 6      ->  397.27 -10297.41 133      -25.6   158.6
--   938.00 2454.35  84  node 7      ->  404.67 -10345.65  84      -17.2   101.2
--   942.70 2417.70  33  node 8      ->  409.37 -10382.30  33        0.5    32.5
--   945.50 2396.28   4  node 9      ->  412.17 -10403.72   4        0.8     3.2
-- Node 9 is the ONE deviation: raised 4 -> 12. A flying escort cannot settle on
-- a node ~3 yd over the ground (I-311 round 10: the cyclone span in place and
-- only released its rider when the summon expired), and if the last node is
-- never "reached" neither ESCORT_REACHED nor ESCORT_ENDED fires, so the credit
-- never lands either. 12 puts the eject 11.2 yd up — below the 14.57 yd
-- fall-damage threshold — and 24 yd from ender Foreman Dampwick (36470).
DELETE FROM waypoints WHERE entry = 3650500;
INSERT INTO waypoints (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `point_comment`) VALUES
  (3650500, 1, 354.17, -10092.73, 152, NULL, 0, 'I-312 Sling Rocket - off the launcher'),
  (3650500, 2, 358.57, -10110.94, 172, NULL, 0, 'I-312 Sling Rocket - climb'),
  (3650500, 3, 365.57, -10144.41, 197, NULL, 0, 'I-312 Sling Rocket - climb'),
  (3650500, 4, 377.87, -10200.83, 213, NULL, 0, 'I-312 Sling Rocket - apex over the Dire Strait'),
  (3650500, 5, 386.47, -10244.63, 188, NULL, 0, 'I-312 Sling Rocket - descend'),
  (3650500, 6, 397.27, -10297.41, 133, NULL, 0, 'I-312 Sling Rocket - descend'),
  (3650500, 7, 404.67, -10345.65, 84, NULL, 0, 'I-312 Sling Rocket - descend'),
  (3650500, 8, 409.37, -10382.30, 33, NULL, 0, 'I-312 Sling Rocket - final approach'),
  (3650500, 9, 412.17, -10403.72, 12, NULL, 0, 'I-312 Sling Rocket - Landing Site (eject + credit)');

-- ---- SmartAI: idle on the launcher -> fly on boarding -> credit + despawn ----
-- Launch is deferred 600 ms through a timed actionlist exactly as the donor does
-- (EVENT_SLING_ROCKET_1 @ 600), so the client has finished seating the player
-- before the spline starts and the ride does not visibly snap.
-- Speed/flight come from stock 54421 "Flight" (SPELL_AURA_FLY + aura 206
-- SPELL_AURA_MOD_INCREASE_FLIGHT_SPEED @ +100%), the same spell the donor casts:
-- it doubles speed_flight 3.5 -> 7.0 (~49 yd/s, ~9 s for the 426 yd arc) AND
-- guarantees MOVEMENTFLAG_CAN_FLY so the escort splines fly instead of trying to
-- path over the sea floor. No creature_template_addon fly aura is added — that
-- is only needed for PLAYER-driven vehicles (seat 6026 has no CAN_CONTROL).
-- Credit + eject are armed on BOTH the last waypoint (40) and path end (58).
-- Reaching node 9 calls EndPath immediately after, so in the normal case both
-- fire; CALL_KILLEDMONSTER is idempotent for a count-1 objective and the second
-- FORCE_DESPAWN lands on an already-despawning creature, so the redundancy is
-- free insurance against either hook being skipped.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 36505;
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid = 3650500;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (36505, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - On Just Summoned - React Passive'),
  (36505, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - Linked - Root On The Launcher Until Boarded'),
  (36505, 0, 2, 0, 27, 0, 100, 1, 0, 0, 0, 0, 80, 3650500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - On Passenger Boarded (once) - Run Launch Actionlist'),
  (36505, 0, 10, 11, 40, 0, 100, 1, 9, 3650500, 0, 0, 33, 50046, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - On Landing Node Reached (once) - Credit Rider With 50046'),
  (36505, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - Linked - Despawn (ejects the rider at the Landing Site)'),
  (36505, 0, 12, 13, 58, 0, 100, 1, 0, 3650500, 0, 0, 33, 50046, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - On Flight Path Ended (once, backstop) - Credit Rider With 50046'),
  (36505, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - Linked - Despawn (ejects the rider at the Landing Site)'),
  (36505, 0, 20, 0, 28, 0, 100, 0, 0, 0, 0, 0, 41, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - On Passenger Removed - Despawn (no orphaned rockets if the rider bails)');

-- ---- ROUND 2: why round 1 shipped and still did nothing ----
-- The PASSENGER_BOARDED row was REJECTED AT LOAD and the rocket therefore never
-- had anything to launch it:
--   SmartAIMgr: Entry 36505 SourceType 0 Event 2 Action 80 uses param value of
--   type Boolean with value 2, valid values are 0 or 1, skipped.
-- That line goes to **SAI.log, not Errors.log** — grepping Errors.log for the
-- entry shows a clean load, which is exactly how this got shipped.
-- Cause: the header comment on SMART_ACTION_CALL_TIMED_ACTIONLIST
-- (SmartScriptMgr.h:636) says "ID, stop after combat?(0/1), timer update type"
-- but the STRUCT (SmartScriptMgr.h:1163) is
--     { uint32 id; uint32 timerType; SAIBool allowOverride; }
-- i.e. param2 = timerType (0-OOC, 1-IC, 2-ALWAYS), param3 = allowOverride BOOL.
-- The struct is authoritative — `IsSAIBoolValid(e.action.timedActionList.allowOverride)`
-- (SmartScriptMgr.cpp:1996) is what rejected the row. The AUTO-ported Gallywix row
-- (36513: `80, 3651300, 2, 0`) had it right; round 1 "corrected" it from the comment.
-- Now param2 = 2 (ALWAYS, so the launch timer ticks regardless of combat state)
-- and param3 = 0.

-- Timed actionlist 3650500: timers are sequential delays, each measured from the
-- previous entry firing.
-- NOTE on ESCORT_START (53): action_param1 is NOT a run/walk bool in this core —
-- it is `ForcedMovement` (MotionMaster.h:84), where 1 = WALK and 2 = RUN. It must
-- be 2 or the rocket crawls the arc at walk speed. action_param6 is reactState
-- and is applied unconditionally (SmartScript.cpp:1775), so 0 = REACT_PASSIVE
-- re-asserts the donor's passive rocket. quest/despawnTime (params 4/5) stay 0:
-- a non-zero quest arms SmartAI's escort-invoker proximity check, and despawn is
-- handled explicitly below.
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (3650500, 9, 0, 0, 0, 0, 100, 0, 600, 600, 0, 0, 103, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - 600ms After Boarding - Unroot'),
  (3650500, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 54421, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - Add Flight (54421: can-fly + 100% flight speed)'),
  (3650500, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 2, 3650500, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - Launch Along The Arc To The Landing Site'),
  (3650500, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 90000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sling Rocket - Safety Despawn 90s (flight is ~9s; a stalled path can never strand the rider)');
