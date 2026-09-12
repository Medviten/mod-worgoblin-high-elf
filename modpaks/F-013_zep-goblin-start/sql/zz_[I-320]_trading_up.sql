-- I-320 quest 24741 "Trading Up" (Lost Isles, Raptor Rise) — world-side fixes.
--
-- SYMPTOM: no traps anywhere on the Raptor Rise, and using the Wild Clucker Eggs
-- (84311) killed nearby Spiny Raptors instead of luring one. The quest was also
-- uncompletable by any route: item 84312 "Spiny Raptor Egg" had no loot source in
-- any table.
--
-- INTENDED MECHANIC (donor: Maelstrom/lost_isles.cpp:1076,
-- npc_wild_clucker_egg_trading_up):
--   use eggs on a trap -> summon decoy 38195 at the trap marker -> decoy lures the
--   nearest Spiny Raptor (38187) in 40yd -> raptor reaches the decoy -> raptor dies,
--   decoy casts 66726 to drop lootable GO 201974 "Raptor Egg", decoy despawns.
--   No raptor in 40yd -> creature_text line 0 and despawn after 5s.
--
-- FOUR ROOT CAUSES, all fixed here or in dbc/[I-320]_spell.sql:
--   1. Trap marker 75113 was NOISE-filtered out of the port (its donor name,
--      "Wondi's Bunny - Trading Up - Spell Item Target", hits BOTH the "bunny" and
--      "wondi" tokens in creatures.py NOISE) -> no creature_template row at all, so
--      the ported condition 13/1/56576 -> 31/0/3/75113 could never resolve. Same
--      class as the I-246 marker holes; fixed at source with creatures.py NOISE_KEEP.
--   2. GO 310000 "TEMP Raptor Trap" ships displayId 0. Broken AT SOURCE — the donor
--      DB has the same row; Neltharion never finished the visible object. Fixed from
--      TDB 4.3.4 sniff data (retail 201972 "Raptor Trap", displayId 8068, stock).
--   3. Spell 56576 summoned a player guardian and summoned TWO of them — see
--      dbc/[I-320]_spell.sql.
--   4. The decoy's behaviour lived entirely in C++ -> 38195 arrived with no AIName,
--      no ScriptName and zero smart_scripts (I-310/I-311/I-312/I-313 signature).
--      Ported to SmartAI below. GO 201974 and its loot were never ported either.
--
-- Generator-first: 1 and 2 are now fixed in goblin_gen/{creatures,gameobjects}.py
-- and 201974 is in the go_scope fixture, so a regen emits the marker, its 24 spawns,
-- the trap template and the reward GO + loot. This file makes it live before that run
-- and keeps the SmartAI port (which no generator emits).
--
-- STAGING (beyond the donor, on Justin's direction): the donor's trap is an invisible
-- spell-focus and its decoy is an InvisibleStalker, so the whole set piece was
-- literally unwatchable. It is now played out with real props —
--   armed bear trap (GO 310000, jaws open)
--     -> use the eggs: a clutch of eggs appears in the jaws (GO 310001)
--     -> raptor walks in: SNAP, jaws shut, eggs gone
--     -> raptor dies in the trap
--     -> jaws open again, revealing the big Spiny Raptor Egg (GO 201974)
-- Every model and display id involved is stock 3.3.5a; nothing new ships in PATCH-Z.

-- =========================================================================
-- 1. Trap marker 75113 — template
-- =========================================================================
-- Modelled on 75042, the I-246 marker of the same donor family; the two donor rows
-- differ only in entry/name/subname/rank. unit_flags NOT_SELECTABLE (0x02000000) +
-- flags_extra TRIGGER (128) is the I-246 treatment: display 16480 is a VISIBLE
-- model, so a bare port would litter the Raptor Rise with 24 clickable bunnies.
-- After the gen run this becomes redundant with the AUTO row and can be reduced to
-- the UPDATE that sets unit_flags (the donor ships 0 there).
DELETE FROM creature_template WHERE entry = 75113;
INSERT INTO creature_template SET
  `entry` = 75113,
  `name` = 'Wondi''s Bunny - Trading Up - Spell Item Target',
  `subname` = 'The Lost Isles',
  `minlevel` = 85,
  `maxlevel` = 85,
  `exp` = 2,
  `faction` = 35,
  `npcflag` = 0,
  `speed_walk` = 1,
  `speed_run` = 1.14286,
  `rank` = 0,
  `unit_class` = 1,
  `unit_flags` = 33554432,
  `unit_flags2` = 0,
  `dynamicflags` = 0,
  `family` = 0,
  `type` = 7,
  `type_flags` = 4172,
  `lootid` = 0,
  `AIName` = '',
  `MovementType` = 0,
  `HoverHeight` = 1,
  `HealthModifier` = 1,
  `ManaModifier` = 1,
  `ArmorModifier` = 1,
  `DamageModifier` = 100.5,
  `ExperienceModifier` = 1,
  `RacialLeader` = 0,
  `movementId` = 0,
  `RegenHealth` = 1,
  `flags_extra` = 128,
  `ScriptName` = '',
  `VerifiedBuild` = 0;

DELETE FROM creature_template_model WHERE CreatureID = 75113;
INSERT INTO creature_template_model SET
  `CreatureID` = 75113,
  `Idx` = 0,
  `CreatureDisplayID` = 16480,
  `DisplayScale` = 1,
  `Probability` = 1,
  `VerifiedBuild` = 0;

-- =========================================================================
-- 2. Trap marker 75113 — 24 spawns, co-located with the trap objects
-- =========================================================================
-- Positions are the live GO 310000 spawns (guids 6000231-6000254), which are the
-- donor's own 75113 spawn coords with the map648->map1 offset already applied — so
-- marker and trap sit on exactly the same point and the 5yd "am I on a trap" test
-- in the donor script is satisfied by construction. phaseMask 2048 matches both the
-- source marker spawns and the traps.
--
-- Guids are in the hand-authored [I-xxx] block (base+950000+, 11950000+) so they can
-- never collide with the sequential AUTO range or the manual_spawns fixture block.
-- The DELETE is by ENTRY, not guid, and deliberately spares this block: after the
-- generator regains ownership of 75113 it will emit its own 24 spawns on AUTO guids,
-- and this file (which sorts after the AUTO files and re-applies in the same cascade)
-- clears them so the marker count stays at 24 rather than doubling to 48. Drop this
-- whole section once the gen has run and the AUTO spawns are verified.
DELETE FROM creature WHERE id = 75113 AND guid NOT BETWEEN 11950100 AND 11950123;
DELETE FROM creature WHERE guid BETWEEN 11950100 AND 11950123;
INSERT INTO creature (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
  (11950100, 75113, 1, 0, 0, 1, 2048,  0,  90.4077, -10704.26,  65.5700, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950101, 75113, 1, 0, 0, 1, 2048,  0, 166.3927, -10834.85,  93.9198, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950102, 75113, 1, 0, 0, 1, 2048,  0, 155.4077, -10571.82,  67.0545, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950103, 75113, 1, 0, 0, 1, 2048,  0, 455.8527, -10631.95,  71.4867, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950104, 75113, 1, 0, 0, 1, 2048,  0, 244.1147, -10490.30,  50.0195, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950105, 75113, 1, 0, 0, 1, 2048,  0, 425.3347, -10682.32,  89.3071, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950106, 75113, 1, 0, 0, 1, 2048,  0, 266.1957, -10659.09,  78.7939, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950107, 75113, 1, 0, 0, 1, 2048,  0, 183.8057, -10524.85,  61.7344, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950108, 75113, 1, 0, 0, 1, 2048,  0, 287.4147, -10566.81,  57.7009, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950109, 75113, 1, 0, 0, 1, 2048,  0, 310.9457, -10604.97,  69.1263, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950110, 75113, 1, 0, 0, 1, 2048,  0,  97.7497, -10552.83,  58.1757, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950111, 75113, 1, 0, 0, 1, 2048,  0, 374.7937, -10743.65, 101.5390, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950112, 75113, 1, 0, 0, 1, 2048,  0, 235.8937, -10568.84,  64.7016, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950113, 75113, 1, 0, 0, 1, 2048,  0, 290.4827, -10702.76,  90.4089, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950114, 75113, 1, 0, 0, 1, 2048,  0, 317.5257, -10750.92,  96.5352, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950115, 75113, 1, 0, 0, 1, 2048,  0, 297.5837, -10805.02, 106.3180, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950116, 75113, 1, 0, 0, 1, 2048,  0, 367.4827, -10685.32,  84.8263, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950117, 75113, 1, 0, 0, 1, 2048,  0, 405.1267, -10643.70,  74.5129, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950118, 75113, 1, 0, 0, 1, 2048,  0, 241.7827, -10694.53,  82.2902, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950119, 75113, 1, 0, 0, 1, 2048,  0, 123.8087, -10639.45,  67.2752, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950120, 75113, 1, 0, 0, 1, 2048,  0, 253.8437, -10779.71,  95.8762, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950121, 75113, 1, 0, 0, 1, 2048,  0,  66.8887, -10618.78,  60.9571, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950122, 75113, 1, 0, 0, 1, 2048,  0, 145.2097, -10682.52,  66.0615, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker'),
  (11950123, 75113, 1, 0, 0, 1, 2048,  0, 226.0000, -10828.78,  98.7110, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-320 Trading Up trap marker');

-- =========================================================================
-- 3. The traps themselves — a real, animated bear trap
-- =========================================================================
-- AUTO-owned row -> one consolidated UPDATE.
--
-- Built on Blizzard's own precedent for this exact mechanic: "Mammoth Trap" 188022
-- in Borean Tundra is type 1 BUTTON, size 3, Data0 1 (startOpen), Data1 0 (no
-- autoClose), AIName SmartGameObjectAI, spawned at state 0. Its sibling "Caribou
-- Trap" 187982 is the worked example of driving one from SmartAI — including
-- `action 118 SMART_ACTION_GO_SET_GO_STATE` to re-open it.
--
-- WHY THE TYPE CHANGES: type 8 SPELL_FOCUS has no GO state and therefore no
-- animation — it can only ever be a static prop. Type 1 BUTTON has two state-driven
-- poses, which is the snap. Data0 1644 / Data1 5 were the Cata SpellFocus type +
-- radius; on a BUTTON those slots are startOpen / autoCloseTime. Nothing reads the
-- old focus values — spell 56576 has spell_focus_object 0 and anchors on creature
-- 75113 via its type-13 condition, not on this GO.
--
-- STATE POLARITY — measured in-game 2026-08-08, do not "correct" it from the enum
-- names. For THIS model, GO_STATE_READY (1) renders the jaws OPEN (armed) and
-- GO_STATE_ACTIVE (0) renders them SHUT. That is the opposite of what the GOState
-- comments suggest ("ACTIVE = closed door open", GameObjectData.h:708), and the
-- first build shipped it that way and spawned every trap already snapped.
-- `startOpen` is NOT "spawn in the open position" — it is a client-side polarity
-- descriptor (GameObjectData.h:46) and the client never even receives it, since
-- Data fields are server-side only and the client gets nothing but the state byte
-- out of GAMEOBJECT_BYTES_1. So the pose is chosen by GO state and the model's own
-- authoring, full stop; the only way to pick correctly is to look at it.
-- Armed = READY also reads better server-side: READY is the resting state a GO
-- returns to, and sprung = ACTIVE is "used".
--
-- displayId 7529 is `World\Goober\G_BearTrap.mdx`, stock 3.3.5a, so no DBC row ships.
-- The PLAIN trap: one texture (SPELLS\TRAP.BLP), 7 bones, and exactly the four
-- sequences this needs — Spawn / Stand / Closed / Open. Also the display both the
-- Mammoth and Caribou traps use, so it is the precedented choice too.
--
-- Deliberately NOT 8068 `G_BearTrap_Hunter.mdx`, which is the same mesh as
-- `Spells\BearTrap.m2` byte-for-byte (identical 5-texture list, 17 bones, identical
-- Spawn/Stand/Closed/Custom0/Open set, 33104 vs 33088 bytes) but is the FREEZING
-- TRAP variant: it carries RIBBONBLUR1BEA_BLUE + SNOWFLAKE2/3 + DUST1_A emitters.
-- Frost on a tropical island — rejected 2026-08-08.
UPDATE gameobject_template SET
  `type` = 1,
  `displayId` = 7529,
  `name` = 'Raptor Trap',
  `Data0` = 1,
  `Data1` = 0,
  `AIName` = 'SmartGameObjectAI'
WHERE entry = 310000;

-- Players never interact with the traps — the item is what arms them — so kill
-- Use() outright with GO_FLAG_NOT_SELECTABLE (0x10). Without this a type-1 BUTTON
-- is clickable and a player could toggle a trap shut out of sequence, with
-- autoCloseTime 0 meaning it would never re-open on its own.
DELETE FROM gameobject_template_addon WHERE entry = 310000;
INSERT INTO gameobject_template_addon SET
  `entry` = 310000,
  `faction` = 0,
  `flags` = 16,
  `mingold` = 0,
  `maxgold` = 0;

-- Lay every trap ARMED = GO_STATE_READY (1), per the polarity note above.
-- animprogress 100 matches the Mammoth Trap spawns (the AUTO rows carry 255).
-- Targeted by ENTRY so it survives the AUTO guids being renumbered by a regen.
UPDATE gameobject SET `state` = 1, `animprogress` = 100 WHERE id = 310000;

-- =========================================================================
-- 3b. The bait — the clucker eggs you can actually see in the trap
-- =========================================================================
-- Decoy creature 38195 renders as InvisibleStalker (display 11686), so the visible
-- bait has to be its own object. Type 5 GENERIC = pure scenery, no Use() handler,
-- nothing to click. Display 7138 is stock `World\Expansion01\Doodads\Generic\
-- Arakkoa\Nest\AK_Egg01.mdx` — already used as a GO by "Rotten Arakkoa Egg" 184795.
--
-- Entry 310001 is deliberately adjacent to the trap. It sits in Neltharion's custom
-- band, which is ours to extend here (the donor uses only 310000 and 310009 in the
-- whole 310000-310010 range) — re-check that on any future donor re-extract.
--
-- Lifetime is handled by the SUMMON_GO ownership rule rather than a timer: summoned
-- by a CREATURE with the default GO_SUMMON_TIMED_OR_CORPSE_DESPAWN, the object is
-- added to the summoner (Object.cpp:2433), so it disappears the instant the decoy
-- despawns. That is what "ditch the egg when the trap snaps" is wired to.
DELETE FROM gameobject_template WHERE entry = 310001;
INSERT INTO gameobject_template SET
  `entry` = 310001,
  `type` = 5,
  `displayId` = 7138,
  `name` = 'Wild Clucker Eggs',
  `IconName` = '',
  `castBarCaption` = '',
  `unk1` = '',
  `size` = 1,
  `AIName` = '',
  `ScriptName` = '',
  `VerifiedBuild` = 0;

-- =========================================================================
-- 4. The reward — GO 201974 "Raptor Egg" and its loot
-- =========================================================================
-- Never ported: the GO sweep is spawn-driven and this object is only ever
-- spell-summoned (66726). Values are the donor/TDB row verbatim. Data0 43 is
-- lock 43, the client-openable "no key" lock used by quest chests.
DELETE FROM gameobject_template WHERE entry = 201974;
INSERT INTO gameobject_template SET
  `entry` = 201974,
  `type` = 3,
  `displayId` = 3851,
  `name` = 'Raptor Egg',
  `IconName` = '',
  `castBarCaption` = '',
  `unk1` = '',
  `size` = 1.5,
  `Data0` = 43,
  `Data1` = 201974,
  `Data2` = 0,
  `Data3` = 1,
  `AIName` = '',
  `ScriptName` = '',
  `VerifiedBuild` = 0;

-- Donor row is Cata item 50239 at chance -100; item_remap already maps
-- 50239 -> 84312 "Spiny Raptor Egg". Negative chance = quest-required at 100%.
DELETE FROM gameobject_loot_template WHERE Entry = 201974;
INSERT INTO gameobject_loot_template (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
  (201974, 84312, 0, 100, 1, 1, 0, 1, 1);

-- Client-side sparkle for players on the quest (GO_DYNFLAG_LO_SPARKLE is driven by
-- ObjectMgr's GO quest-item list, not by the loot table) is no longer hand-owned:
-- the questitems gen domain (I-332) emits 201974 -> 84312 into
-- zz_[AUTO,F-011]_22_gameobject_questitem.sql from the donor's questItem1 column.
-- Row retired here to keep single-file ownership.

-- =========================================================================
-- 5. The decoy egg 38195 — SmartAI port of npc_wild_clucker_egg_trading_up
-- =========================================================================
-- AUTO-owned row -> one consolidated UPDATE.
UPDATE creature_template SET
  `AIName` = 'SmartAI'
WHERE entry = 38195;

-- Beat-for-beat against the donor AI, with the staging split across the decoy and
-- the trap GO so the trap can animate. Full sequence:
--
--   use eggs on a trap  -> decoy summons GO 310001 in the middle of the trap (bait)
--                       -> 500ms later the nearest raptor in 40yd is lured in
--   raptor makes contact-> trap SNAPS SHUT (GO state 1)
--                       -> decoy despawns, taking its owned bait GO with it
--                       -> the trap takes over the rest via SET_DATA
--   +900ms              -> raptor dies in the closed trap
--   +1300ms             -> trap re-OPENS (GO state 0) and the lootable Raptor Egg
--                          appears on it
--
-- Deviations from the donor, deliberate:
--  * The donor casts SPELL_LOOK_LIKE_AN_EGG (71355) on itself. That spell is a bare
--    dummy aura whose only content is Cata SpellVisual 15099, which the 3.3.5a client
--    does not have — it would be an empty cast. Replaced by the bait GO, which is
--    what actually makes the egg visible (the decoy is an InvisibleStalker).
--  * The donor pacifies the lured raptor with a sanctuary/no-combat spell as well as
--    REACT_PASSIVE. Only the react state is ported (no such spell exists here); the
--    raptor still stops attacking and walks in.
--  * The reward chest is summoned by the TRAP, not cast by the decoy through spell
--    66726 — the decoy is gone by then. This is also strictly better: a GameObject
--    summoner fails both branches of the ownership test in Object.cpp:2433, so the
--    chest comes out UNOWNED exactly as SUMMON_OBJECT_WILD would have made it, and
--    it lands on the trap instead of GetClosePoint() beside the decoy. Spell 66726
--    stays in the DBC as ported donor data; nothing casts it.
--
-- Contact distance: the donor tests GetDistance(raptor) <= 1.0. SMART_EVENT_DISTANCE_CREATURE
-- measures with GetCreatureListWithEntryInGrid, which is centre-to-centre, and a raptor
-- stops at its combat reach — 3 is the equivalent "touching" threshold here.
--
-- The decoy needs no despawn backstop: spell 56576 has duration index 9 (30s), so the
-- TempSummon expires on its own if nothing at all happens.
-- Marker 75113 carries DONOR SAI of its own, which surfaced the moment NOISE_KEEP put
-- it back in the sweep (2026-08-08 gen run). It is the donor's real trap mechanism and
-- it cannot work here:
--   (75113, ev 11 RESPAWN      -> act 50 SUMMON_GO 201972)
--   (75113, ev 8 SPELLHIT 98914 -> act 9 ACTIVATE_GOBJECT, target 20 CLOSEST_GO 201972)
--   (75113, linked              -> act 41 FORCE_DESPAWN 1000)
-- i.e. each marker summons retail's Raptor Trap 201972 on respawn, and springs it when
-- hit by 98914. **GO 201972 does not exist in our gameobject_template** — the GO sweep is
-- spawn-driven and 201972 is only ever SAI-summoned, so it was never ported. Left alone,
-- all 24 markers would log "Gameobject template 201972 not found in database!" at every
-- grid load and the trap would never appear.
--
-- We do it with the static GO 310000 + its own SmartAI instead (below), which is built
-- and tested. Strip the donor rows. This DELETE must stay even after a clean gen run —
-- the AUTO file will re-emit them every time. The eventual source fix is a
-- `smartai_exclude` fixture entry for 75113; not done here because that fixture is
-- currently mid-edit in another session.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid IN (38195, 38187, 75113);
DELETE FROM smart_scripts WHERE source_type = 1 AND entryorguid = 310000;
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid IN (3819500, 3819501, 3818700, 3818701, 31000000);
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  -- on summon: passive + rooted, drop the visible bait into the trap, then hand the
  -- lure to a 500ms actionlist (donor EVENT_TRADING_EGG_1 @ 500).
  -- SUMMON_GO with a non-POSITION target places the object at the TARGET's position
  -- (SmartScript.cpp:1624) — i.e. dead centre of the trap, not on the decoy.
  (38195, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 0, 0,   8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - On Just Summoned - React Passive'),
  (38195, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - Linked - Root In The Trap'),
  (38195, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0,  50, 310001, 60, 0, 0, 0, 0, 20, 310000, 5, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - Linked - Lay The Bait Eggs In The Trap'),
  (38195, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0,  80, 3819500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - Linked - Run Lure Actionlist'),
  -- the raptor tells US when it is actually standing in the trap (SET_DATA 2 2 from
  -- its arrival handler below), rather than the decoy guessing from a distance check.
  -- allowOverride = 1 (action_param3): SetScript9 refuses to start a list while one is
  -- still loaded (SmartScript.cpp:5495). The lure list normally self-clears long before
  -- this, but if it ever did not, the whole spring sequence would silently no-op.
  (38195, 0, 4, 0, 38, 0, 100, 0, 2, 2, 0, 0, 0, 0,  80, 3819501, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - On Data 2 2 (raptor is in the trap) - Run Spring Actionlist'),
  -- no raptor in 40yd: say the line to the summoner and despawn after 5s (donor else-branch)
  (38195, 0, 5, 6, 104, 0, 100, 1, 0, 38187, 1, 40, 600, 0,  1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - On No Spiny Raptor Within 40yd (once) - Say Line 0'),
  (38195, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0,  41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - Linked - Despawn In 5s'),

  -- lure actionlist (runs ON the decoy): 500ms after the summon, push the nearest
  -- raptor into its own actionlist. Empty target list = no raptor in 40yd, which is
  -- harmless: event 7 above owns that branch.
  (3819500, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 80, 3818700, 0, 0, 0, 0, 0, 19, 38187, 40, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - After 500ms - Lure The Nearest Spiny Raptor'),

  -- spring actionlist (runs ON the decoy), started the moment the raptor reports in.
  -- 2400ms of feeding = three lunges at 0 / 1100 / 2200 (fired from the raptor's own
  -- list below), with the jaws closing mid-third.
  (3819501, 9, 0, 0, 0, 0, 100, 0, 2400, 2400, 0, 0, 0, 0, 118, 0, 0, 0, 0, 0, 0, 20, 310000, 5, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - After The Raptor Has Eaten - Snap The Trap Shut (state 0)'),
  (3819501, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0,  45, 1, 1, 0, 0, 0, 0, 20, 310000, 5, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - Tell The Trap To Finish The Sequence'),
  (3819501, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0,  41, 200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker Egg - Despawn (takes the bait eggs with it)'),

  -- ---- the raptor's arrival handler ----
  -- ROUND 4. The two earlier "trap fires too early" rounds were both treated as timing
  -- and both made it WORSE, because the real cause is movement, not delay:
  -- every Spiny Raptor spawn is MovementType 1 RANDOM_MOTION with wander_distance 6.
  -- MOVE_TO_POS runs a PointMovementGenerator in MOTION_SLOT_ACTIVE; the moment it
  -- COMPLETES, that slot pops and the random wander generator underneath resumes — so
  -- the raptor arrives at the eggs and immediately strolls up to 6 yards back out of
  -- the trap. Every millisecond added to the fuse gave it more time to leave.
  --
  -- So: root it on arrival, and drive the whole beat off genuine arrival rather than a
  -- distance guess. SMART_EVENT_MOVEMENTINFORM (POINT_MOTION_TYPE 8, pointId 2 — the
  -- id MOVE_TO_POS was given) fires exactly when the walk-in finishes and cannot fire
  -- for anything else: the wander is RANDOM_MOTION_TYPE 1. Same shape as stock
  -- "Stampeding Caribou - On Reached Point 0 - Set Data" (25989).
  --
  -- These are direct events on creature 38187, i.e. on ALL Spiny Raptors. That is safe
  -- precisely because nothing but this quest ever MovePoints one with id 2.
  (38187, 0, 0, 0, 34, 0, 100, 0, 8, 2, 0, 0, 0, 0, 80, 3818701, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - On Reaching The Eggs - Run Feeding Actionlist'),

  -- Emote 35 EMOTE_ONESHOT_ATTACK_UNARMED = AnimationData 16 "AttackUnarmed", a
  -- head-down lunge — the raptor snapping at the eggs. It is the ONLY animation in the
  -- kit that reads as feeding: Raptor_Outland.m2 has 21 sequences and not one of them
  -- is EmoteEat or an equivalent dig (Stand, Death, Walk, Run, StandWound,
  -- CombatWound/Critical, ShuffleLeft/Right, Walkbackwards, AttackUnarmed,
  -- JumpStart/Jump/JumpEnd/Fall, SwimIdle/Swim, MountSpecial, Drown, Drowned). Emote 7
  -- EMOTE_ONESHOT_EAT would have resolved to an animation the model does not carry and
  -- played nothing at all. It runs 1000ms, so 1100ms spacing gives three clean lunges.
  --
  -- The unroot at the end is a backstop, not part of the set piece: the raptor is dead
  -- ~1.3s after the snap. It only matters if the decoy vanished before the trap could
  -- finish, which would otherwise leave a permanently rooted raptor on the hillside.
  (3818701, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Arrived - Root (stop the 6yd wander walking it back out)'),
  (3818701, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0,  45, 2, 2, 0, 0, 0, 0, 19, 38195, 10, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Arrived - Tell The Eggs It Is In The Trap'),
  (3818701, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0,   5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Feeding - Lunge 1'),
  (3818701, 9, 3, 0, 0, 0, 100, 0, 1100, 1100, 0, 0, 0, 0,   5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Feeding - Lunge 2'),
  (3818701, 9, 4, 0, 0, 0, 100, 0, 1100, 1100, 0, 0, 0, 0,   5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Feeding - Lunge 3 (the jaws close through this one)'),
  (3818701, 9, 5, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Backstop - Unroot If It Somehow Survived'),
  (3818701, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0,   8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Backstop - React Aggressive Again'),

  -- raptor actionlist (runs ON the raptor, pushed by the line above). SMART_ACTION_MOVE_TO_POS
  -- moves `me`, so this has to live on the raptor's own script — hence the actionlist
  -- hand-off rather than an action on the decoy. Donor: SetReactState(PASSIVE) +
  -- SetWalk(false) + MovePoint(2, egg position).
  (3818700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0,  8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Lured - React Passive'),
  (3818700, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Lured - Run, Do Not Walk'),
  (3818700, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 69, 2, 0, 0, 0, 0, 0, 19, 38195, 45, 0, 0, 0, 0, 0, 0, 'Spiny Raptor - Lured - Move To The Egg'),

  -- the trap GO finishes the set piece. Data 1/1 comes from the decoy, whose own
  -- despawn is what removes the bait — so by the time this runs the trap is shut and
  -- the eggs are gone, exactly the beat the donor's Kill() lands on.
  (310000, 1, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 0, 0, 80, 31000000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Trap - On Data 1 1 (from the decoy) - Run Spring Actionlist'),
  -- safety: a trap left shut by an interrupted sequence re-arms itself on respawn
  (310000, 1, 1, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 118, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Trap - On Respawn - Re-Arm (jaws open, state 1)'),

  (31000000, 9, 0, 0, 0, 0, 100, 0, 900, 900, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 19, 38187, 6, 0, 0, 0, 0, 0, 0, 'Raptor Trap - 900ms After The Snap - Kill The Trapped Raptor'),
  (31000000, 9, 1, 0, 0, 0, 100, 0, 400, 400, 0, 0, 0, 0, 118, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Trap - 400ms Later - Open The Jaws Again (state 1)'),
  (31000000, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 50, 201974, 300, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Trap - Reveal The Spiny Raptor Egg (unowned: the summoner is a GO)');
