-- ============================================================================
-- [I-310] Get to the Gyrochoppa! (quest 14241) -- parked Gyrochoppa invisible
-- ============================================================================
-- The parked Gyrochoppa (36127, guid 11001289) spawns with aura 49414
-- "Generic Quest Invisibility 1" (invisibility type 7) via its
-- creature_template_addon, carried over from the Cata port. The players' half
-- of the pair -- 49416 "Generic Quest Invisibility Detection 1" (detect
-- type 7) -- was never granted: no spell_area row references quest 14241, so
-- the choppa is permanently invisible to everyone. The pilot (36129) and the
-- SI:7 Operatives (36103) share the same spot and phase (phaseMask 2) and are
-- visible, which rules out phasing; the display (22719, stock WotLK
-- Gyrocopter_02) is valid, which rules out a model problem.
--
-- 36127 is not scenery: it ENDS 14241, STARTS 14242 Precious Cargo, and its
-- SmartAI casts 68386 on quest-accept to board the player. Invisible choppa =
-- chain dead end.
--
-- spell_area lifecycle (same shape as the I-276 rows; AC semantics from
-- SpellArea::IsFitToRequirements, SpellMgr.cpp:1062):
--   * area 4720 = The Lost Isles ZONE id -- the check is
--     (newZone != areaId && newArea != areaId), so the zone id matches from
--     every subzone; no dependence on where the SI:7 camp's subzone borders
--     fall.
--   * quest_start_status is a bitmask over (1 << QuestStatus):
--       74 = 1<<1 COMPLETE | 1<<3 INCOMPLETE | 1<<6 REWARDED
--     -> visible from the moment 14241 is accepted (SendQuestUpdate casts the
--     aura immediately, no zone re-enter needed), through kill/loot, at the
--     hand-in AT the choppa, and still there while 14242 is accepted and the
--     boarding cast fires.
--   * quest_end 14445 "Farewell, For Now", mask 27 (not REWARDED) -> the row
--     stops fitting when the boat arc closes; SendQuestUpdate's quest-end
--     pass strips 49416 and the parked choppas vanish again, as on retail.
--     Round 4: this was originally 14242, but the ported gossip conditions on
--     menu 510033 ("fly back" option: 14242 rewarded AND 14445 not rewarded)
--     prove the design keeps the choppa usable through the whole Vengeance
--     Wake sequence (14326 Meet Me Up Top -> 14243 Warchief's Revenge ->
--     14445). Ending detection at 14242 hid the choppa at exactly the moment
--     its re-fly option unlocked.
--
-- NOT a bug: the user report noted the keys dropping off an "SI:7 dude"
-- instead of the pilot. That is retail behaviour -- the quest text reads
-- "retrieve the keys ... from one of their operatives", and the ported loot
-- has 36103 SI:7 Operative at 69% alongside 36129 Gyrochoppa Pilot at 100%.
DELETE FROM `spell_area` WHERE `spell` = 49416 AND `area` = 4720 AND `quest_start` = 14241;
INSERT INTO `spell_area`
  (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`,
   `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
  (49416, 4720, 14241, 14445, 0, 0, 2, 1, 74, 27);

-- ============================================================================
-- Round 2: ridden Gyrochoppa (36143) cannot fly -- swims at swim speed
-- ============================================================================
-- 36143 is the actual vehicle (VehicleId 505) summoned for 14242 Precious
-- Cargo. It is summon-only, so the port's collector never saw it spawned and
-- it got NEITHER of the two things every stock player-driven flying vehicle
-- has (reference: Oculus drakes 27692/27755/27756, Hover Disk 30234):
--
--   * a creature_template_movement row with Flight set -- the parked twin
--     36127 has (Ground 0, Swim 0, Flight 1); 36143 had no row at all, so it
--     defaulted to ground movement and treats the sea as something to swim
--     through.
--   * a creature_template_addon aura of SPELL_AURA_FLY (201). This is the
--     piece that actually reaches the CLIENT: the addon applies it at summon,
--     HandleAuraAllowFlight -> Unit::SetCanFly sets MOVEMENTFLAG_CAN_FLY in
--     the vehicle's movementInfo, and the boarding player's client honours it
--     as flight control. Creature::UpdateMovementFlags cannot do this: it
--     early-returns once m_movedByPlayer is set, and before that only fires
--     when the creature is already airborne. 59553 "Flight" is the exact
--     aura the Oculus drakes use.
--
-- creature_template_movement joins into the WORLD_SEL_CREATURE_TEMPLATE
-- reload query, but nothing reloads creature_template_addon -- worldserver
-- restart required to take effect.
DELETE FROM `creature_template_movement` WHERE `CreatureId` = 36143;
INSERT INTO `creature_template_movement`
  (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`)
VALUES
  (36143, 0, 0, 1, 0, 0, 0, NULL);

DELETE FROM `creature_template_addon` WHERE `entry` = 36143;
INSERT INTO `creature_template_addon`
  (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`)
VALUES
  (36143, 0, 0, 0, 1, 0, 2, '59553');

-- Round 3: ported speed_flight 1.1429 (~8 yd/s) is barely running pace --
-- the ride to the Vengeance Wake crawled. 3.0 = +200% movement (~21 yd/s,
-- epic ground mount speed in the air). Stock ported row -> consolidated
-- UPDATE, not a rewrite of the template.
UPDATE `creature_template` SET `speed_flight` = 3 WHERE `entry` = 36143;

-- ============================================================================
-- Round 4: park-and-return -- get OUT on the boat, get back IN
-- ============================================================================
-- The ridden choppa is a per-player SUMMON (68386, SummonProperties 827): the
-- core dismisses it the moment its owner exits (Unit::ExitVehicle minion
-- path), so "parking" the vehicle itself is impossible. The shore already
-- models the answer: a parked clicker (36127) whose gossip re-summons a fresh
-- ride. The port even shipped the conditions for it -- menu 510033's option
-- is gated 14242 REWARDED + 14445 NOT rewarded, a re-fly window spanning the
-- whole Vengeance Wake arc. What was missing:
--
--   * Seat 5706 (vehicle 505) is Cata-bit diseased (see the paired DBC file
--     dbc/[I-310]_vehicleseat.sql): no CAN_ENTER_OR_EXIT 0x2000000 -- the
--     SERVER refuses voluntary exit requests -- and no CAN_CAST 0x20000000,
--     so the client never shows the vehicle bar's Leave button.
--   * Nothing to click on the boat. New 36127 spawn on the Vengeance Wake
--     deck (hand guid 11900003), phaseMask 6 = phases 2|4 covering the
--     arrival phase and the deck-fight phase. It inherits the template's
--     49414 invisibility, which is correct now that detection runs to 14445.
--   * The option text said "Let me fly back to Vengeance Wake!", which reads
--     wrong when clicked ON the Vengeance Wake -- neutralised. Stock ported
--     row (AUTO gossip file) -> consolidated UPDATE.
DELETE FROM `creature` WHERE `guid` = 11900003;
INSERT INTO `creature` SET
  `guid` = 11900003,
  `id` = 36127,
  `map` = 1,
  `spawnMask` = 1,
  `phaseMask` = 6,
  `position_x` = 457.0,
  `position_y` = -8955.0,
  `position_z` = 14.4,
  `orientation` = 1.6,
  `spawntimesecs` = 300,
  `wander_distance` = 0,
  `MovementType` = 0;

UPDATE `gossip_menu_option` SET `OptionText` = 'Fire up the Gyrochoppa!' WHERE `MenuID` = 510033 AND `OptionID` = 0;
