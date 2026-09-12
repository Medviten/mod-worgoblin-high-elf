-- I-328 "A Goblin in Shark's Clothing" (quest 24817) — Mechashark X-Steam (38318).
--
-- Symptom: clicking the Mechashark X-Steam Controller (GO 202108) spawns the shark
-- next to the player and nothing else happens — no vehicle entry, no objective credit.
--
-- Chain: GO 202108 Data10 -> spell 71662 (FORCE_CAST) -> 71648 (SUMMON 38318,
-- SummonProperties 827 = SUMMON_CATEGORY_VEHICLE) -> AC casts the CONTROL_VEHICLE
-- spell 71661 on the summon. That last step is guarded (SpellEffects.cpp:2554):
--
--     if (!summon || !summon->IsVehicle())
--         return;
--
-- and 38318 shipped with VehicleId 0, so the function returns right after summoning.
--
-- Why VehicleId was lost: 38318 has no spawn row anywhere (summon-only), so it reaches
-- creature_template either from creatures.py via the port's summon closure (full row,
-- carries VehicleId) or from quest_npcs.py as a RequiredNpcOrGo objective proxy (a
-- reduced column set with no VehicleId / speed_swim / unit_flags2). The proxy won,
-- because the summon closure never contained it: _spellscope.GO_SPELL_FIELDS looks up
-- "Data10" while the Neltharion donor's gameobject_template columns are lowercase
-- (data0..data23) — SQL is case-insensitive, the connector's dict keys are not, so
-- row.get("Data10") is None and the whole GO data-field walk vanished from
-- presweep_required(), the only scope _summons.py reads. Fixed in the emitter; this
-- file carries the live state so the zone works without a full regen.
--
-- Companion DBC files: [I-328]_vehicle.sql (Vehicle 628), [I-328]_vehicleseat.sql
-- (seat 7527), [I-328]_spell.sql (71648 ride-spell value).
--
-- Not touched here: zz_[F-011]_invalid_factions.sql sets 38318 faction 14. Harmless
-- once the ride works — SpellEffects.cpp:2577 overwrites a vehicle summon's faction
-- with the summoner's — and it is the correct guard while the shark is unridable.

-- AUTO-owned row (zz_[AUTO,F-011]_10_creature_template.sql) -> one consolidated UPDATE.
-- Donor values: VehicleId 628, speed_swim 2.0, unit_flags2 2048 (REGENERATE_POWER).
UPDATE creature_template SET
  `VehicleId` = 628,
  `speed_swim` = 2,
  `unit_flags2` = 2048
WHERE entry = 38318;

-- Vehicle action bar (donor creature_template.spell1-3). All three are already ported
-- by [AUTO,F-011]_spell.sql; vehicles.py never emitted the bar because it iterates
-- collected creatures with VehicleId != 0.
--   71658 Egg-splosive Barrage / 71659 Freakin' Laser Beam / 71660 Repair
DELETE FROM creature_template_spell WHERE CreatureID = 38318;
INSERT INTO creature_template_spell (CreatureID, `Index`, Spell, VerifiedBuild) VALUES
  (38318, 0, 71658, 0),
  (38318, 1, 71659, 0),
  (38318, 2, 71660, 0);

-- Re-board path after a voluntary exit. Dropped because spellclick.py is spawn-scoped
-- (TRIM(zone) on the source `creature` table) and this creature never spawns — the same
-- summon-only hole _summons documents for templates (I-242) and creature_addon for
-- addons (I-277). cast_flags 1 = NPC_CLICK_CAST_CASTER_CLICKER: the clicker casts 71661
-- on the shark. Ungated in the source (no SourceType-18 condition) — the shark only
-- exists as the clicker's own summon.
DELETE FROM npc_spellclick_spells WHERE npc_entry = 38318;
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, cast_flags, user_type) VALUES
  (38318, 71661, 1, 0);

-- ---------------------------------------------------------------------------
-- Round 2 (reported in game): boarding worked, the bar worked, The Hammer died
-- and credited — but objective 1 "Use the Mechashark X-Steam Controller" never
-- ticked, and the shark surfaced on the beach instead of in the strait.
-- ---------------------------------------------------------------------------

-- 1. The credit. SAI row 3 is `event 27 PASSENGER_BOARDED -> action 33
-- CALL_KILLEDMONSTER 38318, target 23 OWNER_OR_SUMMONER` — correct, and dead,
-- because AC drops EVERY SmartAI event on a charmed creature unless the row opts
-- in (SmartScript.cpp:4187):
--
--     if (!(e.event.event_flags & SMART_EVENT_FLAG_WHILE_CHARMED) && IsCharmedCreature(me))
--         return;
--
-- A player-driven vehicle IS charmed, and `Vehicle::AddPassenger` charms it
-- (SetCharmedBy, Vehicle.cpp:437) BEFORE it fires the PassengerBoarded hook
-- (Vehicle.cpp:497) — so the very event that exists to react to boarding can
-- never fire without flag 0x200. The Cata core has no such gate, so no donor row
-- carries it. This is also the unexplained half of I-242 round 5 ("SAI on-spellhit
-- audio NEVER fired on the player-possessed vehicle").
--
-- Scoped to the one row that must fire while driven. Rows 4/5 (SET_RUN) and row 6
-- (JUST_SUMMONED -> the visual aura) fire before boarding or not at all; row 0 is
-- already dead on a junk spell id. AUTO-owned rows -> UPDATE by primary key.
UPDATE smart_scripts SET event_flags = 512
WHERE entryorguid = 38318 AND source_type = 0 AND id = 3;

-- 2. The land spawn. Spell 71648's summon uses implicit target 46
-- TARGET_DEST_NEARBY_ENTRY, which picks its destination by grid-searching for the
-- nearest object matching the spell's SourceType-13 condition — here
-- `31 / 3 TYPEID_UNIT / 75042`, Neltharion's generic "Wondi's Bunny - Generic
-- Nearby Target 0" marker. With no 75042 in range the destination collapses to the
-- caster, so the submarine surfaced wherever the player was standing.
--
-- The marker the donor meant is guid 91301, phaseMask 2048 (the quest's phase, same
-- as The Hammer), at map648 (903.52, 2441.3, -6.12) -> map1 via the F-011 offset
-- (-533.3333, -12800): 30 yards off the controllers and six yards UNDER the surface,
-- which is the whole point — the shark is supposed to launch submerged. Spell range
-- index 6 is Vision Range, so the search reaches it comfortably.
--
-- It is not in the world because I-246 deletes every 75042/75044/75045 spawn outside
-- phaseMask 3 (its football-field lane markers) and called this one "75042's
-- unrelated beach spawn". It is not unrelated — it is this quest's launch point.
-- This file sorts after zz_[I-246]_*, so the DELETE runs first and this INSERT wins;
-- keep it that way.
--
-- Explicit guid: an AUTO-range guid would be reassigned by the next regen, and a
-- guid-less INSERT is silently wiped (reference_creature_guid_autoincrement_trap).
-- Template 75042 is already flags_extra 128 CREATURE_FLAG_EXTRA_TRIGGER via I-246,
-- so the marker is invisible and unselectable.
DELETE FROM creature WHERE guid = 3110900;
INSERT INTO creature SET
  `guid` = 3110900,
  `id` = 75042,
  `map` = 1,
  `zoneId` = 0,
  `areaId` = 0,
  `spawnMask` = 1,
  `phaseMask` = 2048,
  `equipment_id` = 0,
  `position_x` = 370.187,
  `position_y` = -10358.7,
  `position_z` = -6.12,
  `orientation` = 1.84,
  `spawntimesecs` = 300,
  `wander_distance` = 0,
  `currentwaypoint` = 0,
  `MovementType` = 0,
  `VerifiedBuild` = 0;
