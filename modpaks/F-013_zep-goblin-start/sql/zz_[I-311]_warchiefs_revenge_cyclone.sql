-- I-311 "Warchief's Revenge" (quest 14243) — Cyclone of the Elements vehicle (36178).
-- Loads after the [AUTO,F-011] files and owns:
--   * Retail-style behavior: the rider boards, the cyclone flies a cyclic circuit
--     over the Alliance Sailor beach while the rider casts Lightning Strike from
--     the vehicle bar; when the 50th sailor dies the cyclone breaks off and
--     ferries the rider (at double flight speed) to the Wild Overlook, ejecting
--     them at ender Thrall 36188. The source did this in C++
--     (npc_tornado_warchiefs_revange_vehicle, SkyFire lineage) which the port
--     drops — replaced with SmartAI below.
--   * The bar on an auto-piloted (no CAN_CONTROL) seat needs the I-311 core
--     patch (Vehicle::AddPassenger / HandlePetCastSpellOpcode serve the bar for
--     uncontrolled CAN_CAST seats); seat flags ride in dbc/[I-311]_vehicleseat.sql.
--   * Completion trigger: custom SMART_EVENT_QUEST_COMPLETED (112, fired on
--     creatures near the player when all objectives are done, onlyOwnSummon=1).
--   * Ferry speed: Swift Wings 54950 (+99% flight, 5s duration) re-applied every
--     4s by a phase-2-gated update tick — each waypoint leg re-reads speed.
--   * Recovery: retail auto-boards via the quest-accept summon (68408) and had
--     no re-board path. Clearing NOT_SELECTABLE lets the spellclick row (68436)
--     work, so a player who dismounts can re-click the cyclone; it lingers 2 min
--     after the passenger leaves, then despawns.
-- Display fix rides in dbc/[I-311]_creaturedisplayinfo.sql (invisible model);
-- the action bar spell is AUTO-owned (creature_template_spell 68445 Lightning
-- Strike); ladder jumps are fixture-fed AUTO rows (spell_target_position.json).

-- ---- template: enable SmartAI, make the vehicle clickable for re-boarding ----
-- AUTO-owned row -> one consolidated UPDATE.
UPDATE creature_template SET
  `AIName` = 'SmartAI',
  `unit_flags` = 0
WHERE entry = 36178;

-- ---- collision/targeting box for the repointed display (Air Elemental @ x3) ----
-- AUTO-owned row (sized for the invisible-stalker model) -> one UPDATE.
-- Stock scale-3.25 Living Cyclone (display 18404) uses 3.25 / 4.0625.
UPDATE creature_model_info SET
  `BoundingRadius` = 3,
  `CombatReach` = 3.75
WHERE DisplayID = 30296;

-- ---- WHY THE FERRY NEVER STARTED (round 9, proven by in-game diagnostics) ----
-- Both triggers DO fire (both diagnostic lines appeared in-game), so delivery was
-- fixed by the round-8 phase change and the remaining fault was the ferry actions:
-- the circuit is started with repeat=1, so `mCanRepeatPath` is true, and
-- `SmartAI::EndPath` ends with
--     if (mCanRepeatPath) StartPath(mForcedMovement, GetScript()->GetPathId(), true);
-- i.e. **SMART_ACTION_ESCORT_STOP on a repeating path immediately RESTARTS it**
-- (SmartAI.cpp:420-424). Worse, `StartPath` calls `StopPath()` when already
-- escorting, so even starting the ferry re-entered that restart. Net effect: the
-- trigger fired, the cyclone spoke, and it went straight back to circling.
-- Fix: stop with **fail=1** (third param). `EndPath(fail)` returns early
-- (SmartAI.cpp:411-415) BEFORE both the repeat-restart and the ESCORT_ENDED
-- broadcast, while still having cleared SMART_ESCORT_ESCORTING and reset
-- mCurrentWPID at the top — so the circuit genuinely dies and the ferry then
-- loads from node 1 on a clean slate. Nothing is lost by faking a "fail": the
-- escort carries no mEscortQuestID, and suppressing ESCORT_ENDED for the circuit
-- is desirable (row 5 must only react to the FERRY path ending).
-- Both trigger rows are now NOT_REPEATABLE (0x1) so neither can re-trigger and
-- restart the ferry mid-flight.

-- ---- diagnostic + flavor line for the SET_DATA trigger path (round 9) ----
-- GroupID 0 ("Heading to the Wild Overlook.") is AUTO-owned source text and is
-- used by the 112 path; this adds GroupID 1 for the sailor-signal path so the
-- two triggers are distinguishable in-game: whichever line appears identifies
-- which mechanism actually reached the cyclone. If NEITHER appears, nothing is
-- reaching its SmartAI and the fault is delivery, not the ferry actions.
DELETE FROM creature_text WHERE CreatureID = 36178 AND GroupID = 1;
INSERT INTO creature_text (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
  (36178, 1, 0, 'The winds carry us onward!', 12, 0, 100, 0, 0, 0, 0, 0, 'I-311 Cyclone - ferry via sailor signal');

-- ---- flight paths ----
-- 3617800: cyclic circuit over the sailor beach (Thrall at 447.6,-8976.8);
--   z=15 clears the beach and keeps any bail-out under the 14.57yd fall-damage
--   threshold.
-- 3617801: ferry to the Wild Overlook (ender Thrall 36188 at 339,-10038.6,119.3),
--   climbing south along the coast; last node is 2yd over his ground so the
--   despawn-eject lands the rider beside him.
-- Altitudes (round 10) are DERIVED from the shipped heightmap, not guessed:
-- `cli/lib/terrain_reader.py` sampled the ground every 4-5yd along both routes.
--   * CIRCUIT z 15 -> 38. The seafloor here is -20..-39, so terrain was never the
--     problem: the rider was clipping the WRECKED SHIPS. Those ships are client-
--     side ADT/WMO art with NO server-side collision (vmap tile 001_31_48 holds
--     only the stock Uldum doodads that occupy these coords on Kalimdor), so no
--     server query can locate them. Decks sit at z -2..+3 (rope-ladder GOs at
--     z -3.9/-4.0, highest sailor spawn z 3.3), so 38 clears hull and rigging
--     with room to spare while keeping every sailor inside Lightning Strike's
--     100yd range (38 vertical leaves 92 horizontal).
--   * FERRY: the old 5-node path drove straight through the island's ridge —
--     ground peaks at 134 around (385,-9690) while the path was at ~92, i.e. 41yd
--     INSIDE the rock. There is no low pass (the whole y -9600..-9950 band is
--     above 100), so the route now climbs over it: 13 nodes, altitude = local
--     peak + clearance with a 70yd look-ahead so it climbs BEFORE the ridge.
--     Verified minimum clearance 24yd en route.
--   * The old final node sat 2.8yd above ground — the cyclone could not settle on
--     it, span in place, and only dropped the rider when the summon expired. The
--     new last node is 12.9yd up and 14.7yd from ender Thrall (36188).
DELETE FROM waypoints WHERE entry IN (3617800, 3617801);
INSERT INTO waypoints (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `point_comment`) VALUES
  (3617800, 1, 455, -8880, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 2, 535, -8900, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 3, 565, -8955, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 4, 535, -9020, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 5, 455, -9040, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 6, 375, -9020, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 7, 350, -8955, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617800, 8, 375, -8900, 38, NULL, 0, 'I-311 Cyclone circuit'),
  (3617801, 1, 455.0, -9005.0, 38, NULL, 0, 'I-311 Cyclone ferry - leave the beach'),
  (3617801, 2, 445.8, -9095.0, 38, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 3, 436.6, -9185.0, 38, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 4, 427.5, -9275.0, 40, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 5, 418.5, -9365.0, 48, NULL, 0, 'I-311 Cyclone ferry - begin climb'),
  (3617801, 6, 409.5, -9455.0, 62, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 7, 400.5, -9545.0, 102, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 8, 391.5, -9635.0, 164, NULL, 0, 'I-311 Cyclone ferry - over the ridge (ground 97)'),
  (3617801, 9, 382.2, -9725.0, 164, NULL, 0, 'I-311 Cyclone ferry - over the ridge (ground 121)'),
  (3617801, 10, 372.2, -9815.0, 150, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 11, 361.2, -9905.0, 145, NULL, 0, 'I-311 Cyclone ferry to Wild Overlook'),
  (3617801, 12, 350.0, -9985.0, 140, NULL, 0, 'I-311 Cyclone ferry - descend'),
  (3617801, 13, 345.0, -10025.0, 128, NULL, 0, 'I-311 Cyclone ferry - arrive by Thrall 36188');

-- ---- SmartAI: circuit while ridden -> ferry on completion -> clean up ----
-- NO event phases (round 6). The completion trigger (112) was gated to phase 1
-- and never fired in-game: `SmartScript::OnReset` calls `SetPhase(0)` on every
-- evade, and the cyclone takes hits from the sailors it is farming, so the phase
-- was silently cleared mid-flight and `IsInPhase(1)` failed forever after.
-- Phases are gone; the 112 row is instead made once-only with event_flags 0x1
-- (SMART_EVENT_FLAG_NOT_REPEATABLE, checked independently of phase).
-- `onlyOwnSummon` is also 0 now: it requires GetSummonerGUID() == the completing
-- player, which is a second silent failure mode if the summon chain ever routes
-- the cast through Thrall. The quest id (14243) + this SAI living only on the
-- cyclone is specific enough.
-- Ferry speed: 900882 Cyclone Tailwind (invisible, permanent) on the cyclone
-- itself — replaces stock 54950 Swift Wings, whose wing visual and buff icon the
-- rider saw and whose 5s duration needed a phase-gated refresh ticker.
-- Rider bar: boarding applies 900881 (aura 293 -> OverrideSpellData 508 ->
-- Lightning Strike) to the passenger; it is stripped both at ferry end (target
-- 29 = vehicle passenger, before the despawn ejects them) and on any passenger
-- removal (invoker) — dual paths so the override bar can never outlive the ride.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 36178;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (36178, 0, 0, 1, 27, 0, 100, 0, 0, 0, 0, 0, 53, 2, 3617800, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Passenger Boarded - Start Cyclic Beach Circuit'),
  (36178, 0, 1, 10, 61, 0, 100, 0, 0, 0, 0, 0, 75, 900881, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Give Rider the Cyclone Bar'),
  (36178, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 44, 4294967295, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Phase ANYWHERE (be findable by phase-filtered searches)'),
  (36178, 0, 11, 0, 54, 0, 100, 0, 0, 0, 0, 0, 44, 4294967295, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Just Summoned - Phase ANYWHERE'),
  (36178, 0, 2, 12, 112, 0, 100, 1, 14243, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Rider Completed Warchief''s Revenge (once) - Say Heading to the Wild Overlook'),
  (36178, 0, 9, 12, 38, 0, 100, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Ferry Signal From Dying Sailor (once) - Say The winds carry us onward'),
  (36178, 0, 12, 3, 61, 0, 100, 0, 0, 0, 0, 0, 55, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Stop Circuit (fail=1: EndPath must NOT repeat-restart it)'),
  (36178, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 75, 900882, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Add Cyclone Tailwind (invisible haste)'),
  (36178, 0, 4, 13, 61, 0, 100, 0, 0, 0, 0, 0, 53, 2, 3617801, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Start Ferry to Wild Overlook'),
  (36178, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 90000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Safety despawn 90s (ferry is ~50s; rider can never be stranded if the path stalls)'),
  (36178, 0, 5, 6, 58, 0, 100, 0, 0, 3617801, 0, 0, 28, 900881, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Ferry Path Ended - Strip Rider Bar'),
  (36178, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Despawn (eject rider at Wild Overlook)'),
  (36178, 0, 7, 8, 28, 0, 100, 0, 0, 0, 0, 0, 28, 900881, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - On Passenger Removed - Strip Rider Bar'),
  (36178, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 120000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyclone of the Elements - Linked - Despawn After 2 Minutes');

-- ---- ROOT CAUSE (round 8): the cyclone was UNFINDABLE, not unresponsive ----
-- Round 7's independent sailor->cyclone signal ALSO did nothing, which is the
-- tell: the two trigger paths share exactly one thing — each has to FIND the
-- cyclone with a phase-filtered proximity search (`UnitListSearcher` for the 112
-- broadcast, `FindNearestCreature` for SMART_TARGET_CLOSEST_CREATURE), and both
-- reject any candidate failing `InSamePhase`. Everything else was eliminated:
-- rows load without error, SmartAI is live (its own events 27/61 fire), the
-- condition semantics and the credit-before-JustDied ordering are both correct
-- (KillRewarder.cpp:205 runs at Unit.cpp:14210, JustDied at :14344).
-- Why it looked fine: the rider NEVER needs to see the cyclone through phase
-- rules — the summon seats them server-side and the client renders whatever
-- vehicle it is told it is riding. So a cyclone summoned into the wrong phase
-- flies, carries and kills perfectly while being invisible to every search.
-- Fix: the cyclone puts itself in PHASEMASK_ANYWHERE (0xFFFFFFFF) on summon and
-- again on boarding, so phase can never hide it from a search again.
-- Belt-and-braces trigger (kept from round 7): the 50th kill also signals the
-- cyclone directly. `Unit::Kill` awards quest credit (Unit.cpp:14210 ->
-- KillRewarder.cpp:205) BEFORE firing the victim's JustDied/SMART_EVENT_DEATH
-- (Unit.cpp:14344), so on the 50th sailor's own death the quest is already
-- COMPLETE and the condition below passes. The 112 row stays as the primary
-- path, maximally permissive (no phase mask, no event flags, no onlyOwnSummon)
-- — whichever arrives first wins; the second is a no-op because the circuit is
-- already stopped. Both need the phase fix above to find the cyclone at all.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 36176 AND id >= 90;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (36176, 0, 90, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36178, 200, 0, 0, 0, 0, 0, 0, 'Alliance Sailor - On Death (quest complete, see conditions) - Signal Cyclone to Ferry');

-- Gate: only the kill that COMPLETES 14243 (and any after it) pings the cyclone.
-- CONDITION_SOURCE_TYPE_SMART_EVENT (22): SourceGroup is the SAI row id + 1
-- (ConditionMgr.cpp:1064), SourceId is the source_type, ConditionTarget 0 is the
-- event invoker — for SMART_EVENT_DEATH that is the killer (SmartAI.cpp:885).
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 22 AND SourceEntry = 36176 AND SourceGroup = 91;
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
  (22, 91, 36176, 0, 0, 28, 0, 14243, 0, 0, 0, 'I-311 - Sailor death pings cyclone only once Warchiefs Revenge is complete');
