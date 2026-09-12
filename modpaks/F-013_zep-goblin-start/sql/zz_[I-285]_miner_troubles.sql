-- ============================================================
-- I-285  Quest 14021 "Miner Troubles" — the Frightened Miner escort, complete
-- ============================================================
-- CONSOLIDATED final state. This file replaces the historical layer stack
-- zz_[I-288] / [I-292 §4] / [I-293 §1-3] / [I-294 §2] / [I-295] / [I-298] / [I-303]
-- (one content = one issue = I-285). The camera-quest halves of the mixed files
-- stayed behind under their original ids.
--
-- DESIGN (deliberate divergence from retail): Cata drove npc_escortAI over a
-- ~54-point script_waypoint path that is not in the Neltharion data-only dump.
-- Instead, six invisible ANCHORS (creature 900300) stand at positions measured
-- in-game with .gps, one per Kaja'mite deposit. One DISTANCE_CREATURE event per
-- anchor guid, flagged NOT_REPEATABLE, fires once per summoned miner —
-- order-independent and re-trigger-proof. The farewell fires on QUEST COMPLETION
-- (SMART_EVENT_QUEST_COMPLETED, 112 — a per-summon counter could not survive the
-- objective being split across re-summons). Objective is 4 of 6.
--
-- LIFECYCLE (all through controller aura 68062 on the player; its effect 2
-- FORCE_CASTs summon 68059):
--   * spell_area (below) owns EVERY application: quest accept (SendQuestUpdate
--     runs inside AddQuest), login, and area re-entry all full-cast 68062 when
--     14021 is INCOMPLETE. Dampwick's AUTO accept-cast is deleted — it fired
--     AFTER the spell_area cast and summoned a second miner.
--   * abandon: SMART_EVENT_QUEST_ABANDONED (111) — Zeppelin core event, fired on
--     creatures near the abandoning player with onlyOwnSummon=1, so exactly this
--     player's miner reacts (rows 16/17 despawn cart + self). Needs the core
--     built with the I-285 SmartAI patch. Pure-data shapes were proven
--     impossible first: timed SAI conditions cannot see the summoner, and
--     area-aura mirroring is unscopable (FillTargetMap ignores conditions).
--   * hand-in: the farewell already despawned him; logout: the on-summon sweep
--     (intro id 10) despawns the ghost when the login autocast re-summons.
--
-- ACTION 80 PARAM TRAP (cost a test round): the SmartScriptMgr.h enum comment is
-- WRONG for this fork — the real struct is {id, timerType, allowOverride}, so
-- param2 = timer type (0 OOC / 1 IC / >1 always) and param3 is a BOOLEAN.
-- The completion event fires synchronously from inside the stop actionlist's
-- kill-credit action, and SetScript9 refuses to start an actionlist from inside
-- one — so the event only flips an event phase and a phase-gated UPDATE_OOC
-- (row 15) starts the farewell from the main loop.

SET @MINER      = 35813;
SET @CART       = 35814;
SET @CREDIT     = 35816;
SET @ORE_GO     = 195622;   -- Kaja'mite Ore (6 nodes in the cavern)
SET @PAINTING   = 37872;    -- cave-painting marker bunny
SET @AURA       = 68062;    -- Miner Troubles: Frightened Miner Controller Aura (on player)
SET @ROOT       = 42716;    -- Self Root Forever (No Visual)
SET @EMOTE_MINE = 233;      -- EMOTE_STATE_WORK_MINING
SET @ANCHOR     = 900300;
SET @DAMPWICK   = 35769;

-- ---------------------------------------------------------------
-- 1. Ore cart 35814 — summon-only in Cata too, so the port never carried it;
-- ported by hand. Display 28291 is stock 3.3.5a and has a creature_model_info row.
-- ---------------------------------------------------------------
DELETE FROM `creature_template` WHERE `entry` = @CART;
INSERT INTO `creature_template` SET
  `entry` = @CART,
  `name` = 'Miner Troubles Ore Cart',
  `minlevel` = 6,
  `maxlevel` = 6,
  `faction` = 35,
  `npcflag` = 0,
  `speed_walk` = 1,
  `speed_run` = 1.14286,
  `unit_class` = 1,
  `unit_flags` = 33555200,      -- NOT_SELECTABLE | IMMUNE_TO_PC | IMMUNE_TO_NPC
  `type` = 10,
  `HealthModifier` = 1,
  `ManaModifier` = 1,
  `ArmorModifier` = 1,
  `DamageModifier` = 1,
  `BaseVariance` = 1,
  `RangeVariance` = 1,
  `RegenHealth` = 1,
  `MovementType` = 0,
  `AIName` = 'SmartAI',
  `flags_extra` = 2,            -- CIVILIAN
  `VerifiedBuild` = 0;

DELETE FROM `creature_template_model` WHERE `CreatureID` = @CART;
INSERT INTO `creature_template_model` SET
  `CreatureID` = @CART, `Idx` = 0, `CreatureDisplayID` = 28291,
  `DisplayScale` = 1, `Probability` = 1, `VerifiedBuild` = 0;

-- ---------------------------------------------------------------
-- 2. The anchor NPC + the six measured stand positions.
-- Display 11686 is the stock invisible stalker; NOT_SELECTABLE | IMMUNE_TO_PC |
-- IMMUNE_TO_NPC so it can never be seen, clicked or hit. Guids are hand-assigned
-- (6700010+) and therefore stable and safe to reference from SmartAI — unlike the
-- ore nodes, whose guids come from [AUTO,F-011] and must never be pinned.
-- ---------------------------------------------------------------
DELETE FROM `creature_template` WHERE `entry` = @ANCHOR;
INSERT INTO `creature_template` SET
  `entry` = @ANCHOR,
  `name` = 'Kaja''mite Mining Spot',
  `minlevel` = 1, `maxlevel` = 1, `faction` = 35, `npcflag` = 0,
  `speed_walk` = 1, `speed_run` = 1.14286, `unit_class` = 1,
  `unit_flags` = 33555200,
  `type` = 10, `HealthModifier` = 1, `ManaModifier` = 1, `ArmorModifier` = 1,
  `DamageModifier` = 1, `BaseVariance` = 1, `RangeVariance` = 1,
  `RegenHealth` = 1, `MovementType` = 0, `AIName` = '',
  `flags_extra` = 130,          -- CIVILIAN | NO_XP
  `VerifiedBuild` = 0;

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ANCHOR;
INSERT INTO `creature_template_model` SET
  `CreatureID` = @ANCHOR, `Idx` = 0, `CreatureDisplayID` = 11686,
  `DisplayScale` = 1, `Probability` = 1, `VerifiedBuild` = 0;

DELETE FROM `creature` WHERE `guid` BETWEEN 6700010 AND 6700015;
INSERT INTO `creature`
  (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`,
   `position_x`, `position_y`, `position_z`, `orientation`,
   `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`,
   `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
  (6700010, @ANCHOR, 1, 0, 0, 1, 1, 0,  53.535862, -9836.105,  -2.3087928, 1.2063711, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-285 mining spot @ node 6000160'),
  (6700011, @ANCHOR, 1, 0, 0, 1, 1, 0,  42.827200, -9893.152,  -7.2200690, 5.0597150, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-285 mining spot @ node 6000158'),
  (6700012, @ANCHOR, 1, 0, 0, 1, 1, 0,  64.461350, -9908.587,  -7.0073686, 5.7111926, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-285 mining spot @ node 6000159'),
  (6700013, @ANCHOR, 1, 0, 0, 1, 1, 0,  74.033650, -9941.422,  -6.9160533, 4.6796810, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-285 mining spot @ node 6000162'),
  (6700014, @ANCHOR, 1, 0, 0, 1, 1, 0, 110.565970, -9796.144, -13.6269330, 1.0426075, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-285 mining spot @ node 6000161'),
  (6700015, @ANCHOR, 1, 0, 0, 1, 1, 0, 131.539570, -9852.357,   0.0081887, 0.7300749, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-285 mining spot @ node 6000163');

-- ---------------------------------------------------------------
-- 3. Miner: AUTO owns the template -> consolidated UPDATE. AC will not run
-- SmartAI on a creature whose AIName is empty, and the port leaves it empty.
-- ---------------------------------------------------------------
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @MINER;

-- ---------------------------------------------------------------
-- 4. Quest 14021 counts the deposits (retail gave one credit at the end of the
-- fixed path; proximity-driven needs a visible count). AUTO owns quest_template
-- 14021 -> consolidated UPDATE. Six anchors exist, any four finish.
-- ---------------------------------------------------------------
UPDATE `quest_template` SET
  `RequiredNpcOrGoCount1` = 4,
  `ObjectiveText1` = 'Kaja''mite deposits mined'
WHERE `ID` = 14021;

-- ---------------------------------------------------------------
-- 5. "Found one" call-out. The source's 13 text groups (0-12, AUTO-owned) are all
-- reaction lines for the retail waypoint script; group 13 is ours.
-- ---------------------------------------------------------------
DELETE FROM `creature_text` WHERE `CreatureID` = @MINER AND `GroupID` = 13;
INSERT INTO `creature_text`
  (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`,
   `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@MINER, 13, 0, 'Look at that — kaja''mite! Cover me, $n, I''m goin'' in.', 12, 0, 33, 1, 0, 0, 0, 0, 'Frightened Miner - spotted a deposit'),
(@MINER, 13, 1, 'Ooh, that''s a big vein. Hold ''em off and I''ll do the rest!', 12, 0, 33, 1, 0, 0, 0, 0, 'Frightened Miner - spotted a deposit'),
(@MINER, 13, 2, 'Kaja''mite! Boss is gonna love this. Keep them monkeys busy!', 12, 0, 34, 1, 0, 0, 0, 0, 'Frightened Miner - spotted a deposit');

-- ---------------------------------------------------------------
-- 6. The script. MOVE_TO_POS rows: param4 ContactDistance = 0 (the anchors ARE
-- the stand spot) and param6 disableForceDestination = 1 (stop at the last
-- reachable point instead of walking through rock). FOLLOW distance 4 reads as an
-- escort instead of standing inside the player; FOLLOW angle is RELATIVE TO THE
-- TARGET'S FACING (angle 0 = right in front of them), values > 6 are degrees —
-- 180 = directly behind. Player <- miner <- cart.
-- ---------------------------------------------------------------
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (@MINER, @CART);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 3581300 AND 3581307;

INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,
   `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- intro
(@MINER, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0,
   80, 3581300, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - On summon - intro'),
(@MINER, 0, 1, 0, 75, 0, 100, 1, 0, @PAINTING, 25, 2000, 0,
   1, 1, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Near the paintings (once) - Talk 1'),
-- one row per mining spot; NOT_REPEATABLE (event_flags 1) = fires once, ever
(@MINER, 0, 2, 6, 75, 0, 100, 1, 6700010, 0, 10, 1000, 0,
   80, 3581301, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Reached mining spot 1'),
(@MINER, 0, 3, 7, 75, 0, 100, 1, 6700011, 0, 10, 1000, 0,
   80, 3581302, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Reached mining spot 2'),
(@MINER, 0, 4, 8, 75, 0, 100, 1, 6700012, 0, 10, 1000, 0,
   80, 3581303, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Reached mining spot 3'),
(@MINER, 0, 5, 9, 75, 0, 100, 1, 6700013, 0, 10, 1000, 0,
   80, 3581304, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Reached mining spot 4'),
-- the "look, kaja'mite!" call-out, chained off each trigger
(@MINER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   1, 13, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Spotted a deposit - Talk 13'),
(@MINER, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   1, 13, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Spotted a deposit - Talk 13'),
(@MINER, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   1, 13, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Spotted a deposit - Talk 13'),
(@MINER, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   1, 13, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Spotted a deposit - Talk 13'),
-- quest complete (4th deposit credited, whichever it was): flip the phase; row
-- 15 starts the farewell from the main loop (SetScript9 refuses
-- actionlist-from-actionlist). SMART_EVENT_QUEST_COMPLETED (112, Zeppelin core,
-- onlyOwnSummon=1) replaces the old SET_COUNTER machinery: the counter was
-- per-summon, so 4 deposits split across a relog/re-summon completed the quest
-- without any single miner ever counting to 4 — the farewell never fired.
(@MINER, 0, 10, 0, 112, 0, 100, 0, 14021, 1, 0, 0, 0,
   22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - quest 14021 complete - enter the finish phase'),
(@MINER, 0, 11, 13, 75, 0, 100, 1, 6700014, 0, 10, 1000, 0,
   80, 3581306, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Reached mining spot 5'),
(@MINER, 0, 12, 14, 75, 0, 100, 1, 6700015, 0, 10, 1000, 0,
   80, 3581307, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Reached mining spot 6'),
(@MINER, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   1, 13, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Spotted a deposit - Talk 13'),
(@MINER, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   1, 13, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Spotted a deposit - Talk 13'),
(@MINER, 0, 15, 0, 1, 1, 100, 1, 1000, 1000, 0, 0, 0,
   80, 3581305, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - finish phase - run the farewell (outside any actionlist)'),
-- dismissed: my summoner abandoned 14021. SMART_EVENT_QUEST_ABANDONED (111,
-- Zeppelin core) fires on creatures near the player; param2 onlyOwnSummon=1
-- makes the core check TempSummon::GetSummonerGUID against the abandoner, so
-- only this player's miner reacts.
(@MINER, 0, 16, 17, 111, 0, 100, 0, 14021, 1, 0, 0, 0,
   41, 2000, 0, 0, 0, 0, 0, 9, @CART, 0, 40, 0, 0, 0, 0, 'Miner - quest abandoned - despawn the cart'),
(@MINER, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - quest abandoned - despawn self'),

-- ore cart
(@CART, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Ore Cart - follow the miner'),
(@CART, 0, 1, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0,
   8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ore Cart - react passive'),

-- intro actionlist
(3581300, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - react passive'),
(3581300, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   12, @CART, 3, 1800000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - summon the ore cart'),
(3581300, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - follow the player'),
(3581300, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0,
   1, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Talk 0'),
-- accepting again summons another miner and nothing dismissed the first;
-- CREATURE_RANGE minDist 1 excludes the new miner itself (distance 0)
(3581300, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 0, 0, 0, 0, 0, 0, 9, @MINER, 1, 80, 0, 0, 0, 0, 'Miner - despawn any earlier miner still following'),

-- stop 1 (spot guid 6700010)
(3581301, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   69, 0, 0, 0, 0, 0, 1, 10, 6700010, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - walk to the measured mining spot'),
(3581301, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   11, @ROOT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - root in place'),
(3581301, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   17, @EMOTE_MINE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - mining emote'),
(3581301, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0,
   17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - stop mining'),
(3581301, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   28, @ROOT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - unroot'),
(3581301, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   33, @CREDIT, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - credit one deposit'),
(3581301, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 1000, 0, 0, 0, 0, 0, 20, @ORE_GO, 12, 0, 0, 0, 0, 0, 'Miner - Stop 1 - the deposit is consumed'),
(3581301, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - resume following'),
(3581301, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 9, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - Talk 9'),
(3581301, 9, 10, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   1, 7, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 1 - Talk 7'),
-- stop 2 (spot guid 6700011)
(3581302, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   69, 0, 0, 0, 0, 0, 1, 10, 6700011, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - walk to the measured mining spot'),
(3581302, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   11, @ROOT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - root in place'),
(3581302, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   17, @EMOTE_MINE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - mining emote'),
(3581302, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0,
   17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - stop mining'),
(3581302, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   28, @ROOT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - unroot'),
(3581302, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   33, @CREDIT, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - credit one deposit'),
(3581302, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 1000, 0, 0, 0, 0, 0, 20, @ORE_GO, 12, 0, 0, 0, 0, 0, 'Miner - Stop 2 - the deposit is consumed'),
(3581302, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - resume following'),
(3581302, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 4, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - Talk 4'),
(3581302, 9, 10, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   1, 10, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 2 - Talk 10'),
-- stop 3 (spot guid 6700012)
(3581303, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   69, 0, 0, 0, 0, 0, 1, 10, 6700012, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - walk to the measured mining spot'),
(3581303, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   11, @ROOT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - root in place'),
(3581303, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   17, @EMOTE_MINE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - mining emote'),
(3581303, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0,
   17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - stop mining'),
(3581303, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   28, @ROOT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - unroot'),
(3581303, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   33, @CREDIT, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - credit one deposit'),
(3581303, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 1000, 0, 0, 0, 0, 0, 20, @ORE_GO, 12, 0, 0, 0, 0, 0, 'Miner - Stop 3 - the deposit is consumed'),
(3581303, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - resume following'),
(3581303, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 3, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - Talk 3'),
(3581303, 9, 10, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   1, 11, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 3 - Talk 11'),
-- stop 4 (spot guid 6700013)
(3581304, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   69, 0, 0, 0, 0, 0, 1, 10, 6700013, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - walk to the measured mining spot'),
(3581304, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   11, @ROOT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - root in place'),
(3581304, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   17, @EMOTE_MINE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - mining emote'),
(3581304, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0,
   17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - stop mining'),
(3581304, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   28, @ROOT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - unroot'),
(3581304, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   33, @CREDIT, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - credit one deposit'),
(3581304, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 1000, 0, 0, 0, 0, 0, 20, @ORE_GO, 12, 0, 0, 0, 0, 0, 'Miner - Stop 4 - the deposit is consumed'),
(3581304, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - resume following'),
(3581304, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 5, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - Talk 5'),
(3581304, 9, 10, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   1, 2, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Stop 4 - Talk 2'),

-- farewell actionlist
(3581305, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 12, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Talk 12 (we are done here)'),
(3581305, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   1, 6, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Talk 6 (thanks for the escort)'),
(3581305, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 0,
   28, @AURA, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - strip the controller aura'),
(3581305, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 5000, 0, 0, 0, 0, 0, 9, @CART, 0, 40, 0, 0, 0, 0, 'Miner - despawn the cart'),
(3581305, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - despawn self'),

-- stop 5 (spot guid 6700014)
(3581306, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   69, 0, 0, 0, 0, 0, 1, 10, 6700014, 0, 0, 0, 0, 0, 0, 'Miner - walk to the measured mining spot'),
(3581306, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   11, @ROOT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - root in place'),
(3581306, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   17, @EMOTE_MINE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - mining emote'),
(3581306, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0,
   17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - stop mining'),
(3581306, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   28, @ROOT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - unroot'),
(3581306, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   33, @CREDIT, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - credit one deposit'),
(3581306, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 1000, 0, 0, 0, 0, 0, 20, @ORE_GO, 12, 0, 0, 0, 0, 0, 'Miner - the deposit is consumed'),
(3581306, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - resume following'),
(3581306, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 4, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Talk 4'),
-- stop 6 (spot guid 6700015)
(3581307, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   69, 0, 0, 0, 0, 0, 1, 10, 6700015, 0, 0, 0, 0, 0, 0, 'Miner - walk to the measured mining spot'),
(3581307, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0,
   11, @ROOT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - root in place'),
(3581307, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 0,
   17, @EMOTE_MINE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - mining emote'),
(3581307, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0,
   17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - stop mining'),
(3581307, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   28, @ROOT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Miner - unroot'),
(3581307, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   33, @CREDIT, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - credit one deposit'),
(3581307, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 1000, 0, 0, 0, 0, 0, 20, @ORE_GO, 12, 0, 0, 0, 0, 0, 'Miner - the deposit is consumed'),
(3581307, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - resume following'),
(3581307, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0,
   1, 11, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Miner - Talk 11');

-- ---------------------------------------------------------------
-- 7. Application: spell_area owns it. AC semantics: quest_start_status AND
-- quest_end_status are BOTH required masks (quest_end is NOT a forbidden state
-- despite the core comment — that is TC). 8/8 = active only while INCOMPLETE;
-- leaving INCOMPLETE removes the aura via SendQuestUpdate's quest_end loop.
-- A never-fitting row (the original 8/64) not only never autocasts — it makes
-- EVERY cast of 68062 fail INCORRECT_AREA via SpellInfo::CheckLocation's DB base
-- check, triggered casts included.
-- ---------------------------------------------------------------
DELETE FROM `spell_area` WHERE `spell` = @AURA AND `area` = 4720;
INSERT INTO `spell_area`
  (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`,
   `autocast`, `quest_start_status`, `quest_end_status`) VALUES
  (@AURA, 4720, 14021, 14021, 0, 0, 2, 1, 8, 8);

-- 68062 must NOT persist to character_aura on logout, or the login autocast
-- skips on HasAura and the miner is never re-summoned.
-- 0x01000000 = SPELL_ATTR0_CU_AURA_CANNOT_BE_SAVED.
DELETE FROM `spell_custom_attr` WHERE `spell_id` = @AURA;
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES (@AURA, 0x01000000);

-- SendQuestUpdate autocasts 68062 during AddQuest — BEFORE the questgiver SAI
-- hook — so Dampwick's AUTO accept-cast (id 2) would summon a SECOND miner.
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = @DAMPWICK AND `id` = 2;

-- ---------------------------------------------------------------
-- 8. Retired mechanisms, kept as cleanup so previously-applied rows never
-- resurface on a live DB:
--   * the I-303 timed self-check (row 16 + SourceType-22 condition) — on a
--     timed event ConditionTarget 1 is the MINER, not the summoner, so it
--     despawned every summon 5s in;
--   * the dismiss-ping (spell 900844 + on-aura-removal spell_linked_spell +
--     target condition) — worked, but superseded by SMART_EVENT_QUEST_ABANDONED,
--     which scopes to the abandoner's own summon with no radius caveat.
-- ---------------------------------------------------------------
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -@AURA;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 900844;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 35813 AND `SourceEntry` = 16;
