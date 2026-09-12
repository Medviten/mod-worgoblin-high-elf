-- I-257 "Robbing Hoods" (14121) — driving the Hot Rod over Hired Looters now
-- robs them. Spell chain in dbc/[I-257]_spell.sql: 66392 "Hot Rod" eff2
-- (driver-held aura 23, 250ms periodic, target caster) -> 66301 (12yd
-- front-cone knockback, looters only) -> looter SpellHit SAI -> 67041
-- (Create Stolen Loot 84466 on the driver).
--
-- The kill-and-loot path (84466 at 88% in creature_loot_template) already
-- works and stays; this adds the missing retail run-over path, so the quest
-- keeps its item objective (12x 84466).
--
-- The trigger rides eff2 of the CONTROL spell because the Hot Rod is a
-- SUMMON_CATEGORY_VEHICLE summon: EffectSummon auto-boards the summoner with
-- a direct ride cast (SpellEffects.cpp:2571) and HandleSpellClick never runs
-- — a spellclick-row carrier never fires on this vehicle. 66392 is cast BY
-- the boarding player on both the auto-board and spellclick paths, so eff2
-- (target 1 = caster) always lands on the driver. Knockback is therefore
-- always-on while driving (retail-accurate bulldozing); the ITEM is what is
-- quest-gated, via the looter's type-22 condition below.

-- ---- retired first attempt: spellclick-row carrier (never fires; see above) ----
DELETE FROM npc_spellclick_spells WHERE npc_entry = 34840 AND spell_id = 66302;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 18 AND SourceGroup = 34840 AND SourceEntry = 66302;

-- ---- exiting: strip the trigger + dismiss the car ----
-- 34840 ships with empty AIName (F-011 "AIName dropped" pattern) and so runs
-- VehicleAI, whose only job here is despawn-on-exit. Converting to SmartAI for
-- the aura cleanup means replicating that dismissal (row 1). PASSENGER_REMOVED
-- is the proven-reliable possessed-vehicle event (I-251). Homie removals also
-- fire it during despawn: the aura strip is a no-op on them and the re-despawn
-- is harmless. 34840 template is AUTO-owned -> one consolidated UPDATE.
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = 34840;

DELETE FROM smart_scripts WHERE entryorguid = 34840 AND source_type = 0;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (34840, 0, 0, 1, 28, 0, 100, 0, 1000, 1000, 0, 0, 28, 66392, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'I-257 Hot Rod - On Passenger Removed - Strip run-over trigger (66392 eff2) from exiting passenger'),
  (34840, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'I-257 Hot Rod - Linked - Dismiss (replicates VehicleAI despawn-on-exit)');

-- ---- the robbery: looter reacts to being run over ----
-- AUTO owns 35234 row 0 (Torch Toss); I-257 owns rows 10+. Invoker of the
-- spellhit is the driver (66301 is cast by the player-held aura), so target 7
-- lands CREATE_ITEM on them. Run-over is lethal (retail: they ragdoll and lie
-- dead): delayed KillSelf at 1500ms ~ landing, so the knockback arc plays out
-- before the corpse drops. KillSelf leaves no loot recipient -> the corpse is
-- unlootable and cannot double-grant the 88% quest drop on top of the auto
-- item. 300s respawn x85 spawns keeps the streets stocked. The 6s event
-- cooldown is a safety net for the (now rare) survive-and-rehit window.
-- The I-244 cascade re-applies this after every gen run.
-- Two independent rows on the same spellhit, gated differently:
--   * row 10 (ITEM, quest-gated via the type-22 condition below): Create
--     Stolen Loot at the driver, only while 14121 is incomplete.
--   * row 11 chain (STUN + DEATH, unconditional — retail cars are always
--     lethal, including after the quest): cast 66302 on self — a real
--     MOD_STUN aura, NOT a SET_UNIT_FLAG (the flag never calls SetStunned so
--     it neither stuns nor blocks Torch Toss; that was the bug). The stun's
--     SetStunned() does CastStop() + blocks new casts/melee for 2s, so no
--     mid-air Torch Toss and no landing melee, and the client shows stun
--     stars. Linked -> KillSelf at 1500ms ~ landing (stun 2s outlasts it).
-- Deliberately NOT react-passive at the template level — looters still
-- retaliate normally on the kill-and-loot path, like retail.
DELETE FROM smart_scripts WHERE entryorguid = 35234 AND source_type = 0 AND id IN (10, 11, 12, 13);
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (35234, 0, 10, 0, 8, 0, 100, 0, 66301, 0, 6000, 6000, 11, 67041, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'I-257 Hired Looter - On Spellhit Hot Rod Knockback - Create Stolen Loot for driver (quest-gated)'),
  (35234, 0, 11, 12, 8, 0, 100, 0, 66301, 0, 6000, 6000, 11, 66302, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'I-257 Hired Looter - On Spellhit Hot Rod Knockback - Stun self (no mid-air Torch Toss)'),
  (35234, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 1500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'I-257 Hired Looter - Linked - Die on landing (1.5s)');

-- Item creation only while 14121 is INCOMPLETE in the invoker's log (stops
-- surplus 84466 piling up once 12/12 is reached mid-drive).
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 22 AND SourceGroup = 11 AND SourceEntry = 35234;
INSERT INTO conditions SET
  SourceTypeOrReferenceId = 22,
  SourceGroup = 11,
  SourceEntry = 35234,
  SourceId = 0,
  ElseGroup = 0,
  ConditionTypeOrReference = 9,
  ConditionTarget = 0,
  ConditionValue1 = 14121,
  ConditionValue2 = 0,
  ConditionValue3 = 0,
  NegativeCondition = 0,
  ErrorType = 0,
  ErrorTextId = 0,
  ScriptName = '',
  Comment = 'I-257 Stolen Loot only while Robbing Hoods incomplete';

-- ---- knockback scope: cone-entry gate (I-246 lane-marker pattern) ----
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 66301;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
  (13, 1, 66301, 0, 0, 31, 0, 3, 35234, 0, 0, 0, 0, '', 'I-257 Hot Rod Knockback -> Hired Looters only');
