-- I-277 Goblin Escape Pods — authored AC behaviour for the summoned survivor.
--
-- Everything else about this quest lives in the emitter (gameobjects.DATA_OVERRIDE,
-- spells.COND_TARGET_OVERRIDE / EFFECT_OVERRIDE). These two rows cannot: one is a
-- SmartAI row the 4.3.4 source does not have at all, and the other corrects a
-- source coordinate the smartai emitter does not translate.
--
-- Both are single rows we OWN inside entities the [AUTO,F-011] file also writes,
-- so each is DELETEd by its own id rather than by entity — the AUTO rows stay
-- owned by AUTO. The I-244 cascade re-applies this file after the AUTO file, so
-- the AUTO DELETE-by-entity above cannot strip these.


-- ---------------------------------------------------------------------------
-- 1. Sink the survivor to swim depth the instant it is summoned.
-- ---------------------------------------------------------------------------
-- Spell 66137 uses implicit target 46 TARGET_DEST_NEARBY_ENTRY, so the summon
-- lands on the anchor object's exact position — escape pod 195188, whose 37
-- spawns all sit at position_z = 0, the water surface. The survivor therefore
-- appears standing on top of the water with its swim emote playing.
--
-- Nothing in the spell can offset that destination, and the pod's own z cannot
-- be lowered instead: goober.floatOnWater (Data21) is declared at
-- GameObjectData.h:110 but read by NO game code, so dropping the GO would simply
-- sink the pod too.
--
-- SMART_ACTION_MOVE_TO_POS (69) treats target_x/y/z as a RELATIVE OFFSET for
-- every target type except SMART_TARGET_POSITION and RANDOM_POINT
-- (SmartScript.cpp:1910-1927, `MovePoint(x + e.target.x, y + e.target.y,
-- z + e.target.z)`), so with target_type 1 SELF this is "descend 5 yards from
-- wherever you were summoned" and stays correct for all 37 pods.
--
-- Safe for a swimmer: Creature::CanSwim() (Creature.cpp:3361) is true for
-- anything that cannot fly, and UpdateAllowedPositionZ clamps a swimmer to
-- [ground_z, water_surface] — so the offset holds as long as the seabed is
-- deeper. action_param6 (disableForceDestination) stays 0, so isForced is true
-- and the exact destination is honoured rather than snapped to the navmesh.
--
-- Depth is -2, not -5: 5 yards put the survivor visibly too deep. This is the
-- tuning value — target_z on the row below, and keep the swim-away row in
-- section 2 at the same depth so it does not change height as it leaves.
--
-- Added as a SECOND row on the same SMART_EVENT_JUST_SUMMONED (54) as the AUTO
-- row: SmartScript::ProcessEventsFor (SmartScript.cpp:138) iterates the whole
-- event list with no break, so both fire.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 34748 AND id = 1;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (34748, 0, 1, 0, 54, 0, 100, 0, 0, 0, 0, 0, 69, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, -2, 0, 'Goblin Survivor - JUST_SUMMONED - descend 2y to swim depth (I-277)');


-- ---------------------------------------------------------------------------
-- 2. Translate the swim-away destination from map 648 to map 1.
-- ---------------------------------------------------------------------------
-- Actionlist 3474800 row 4 is the survivor's "swim off" move. The AUTO file
-- emits the source position VERBATIM as (568.97, 3164.01, -0.956), which is a
-- raw Cata map-648 coordinate — on map 1 that is a point in open Kalimdor,
-- nowhere near Shipwreck Shore, so the survivor swims away in a wrong direction
-- for the ~3s it has left before despawning.
--
-- This is NOT specific to this row: the smartai emitter never applies the F-011
-- map648->map1 offset to target_x/y at all. 30 rows in `smart_scripts` carry
-- untranslated Cata coordinates and ZERO carry translated ones. Fixing that at
-- the emitter would move 30 rows across quests that have not been tested, and
-- it must only ever apply to target_type 8 (and RANDOM_POINT) — for every other
-- target type those same columns are the relative offset used above. Tracked as
-- a separate open item on I-277; this file corrects only the escape-pod row.
--
-- Offset is the same DX/DY the spawn emitters use: X-533.3333, Y-12800.
--   568.97 - 533.3333 = 35.6367
--   3164.01 - 12800   = -9635.99
-- z is set to -2 rather than the source's -0.956 so the survivor swims away at
-- the same depth section 1 drops it to, instead of bobbing back to the surface.
-- Keep this in step with the target_z there.
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid = 3474800 AND id = 4;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (3474800, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 35.6367, -9635.99, -2, 0, 'Goblin Survivor - swim away (map648->map1 translated, I-277)');
