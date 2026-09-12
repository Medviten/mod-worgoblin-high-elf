-- I-281 Monkey Business (q14019) — feeding a monkey must be what grants credit.
--
-- Symptom: using Nitro-Potassium Bananas (item 84301 -> spell 67917) granted a
-- credit on every use regardless of target, and the fed monkey never reacted, so
-- one monkey could be fed 10 times for the whole objective.
--
-- Two independent causes:
--
--   1. spell_script_names wired 67917 to spell_zep_fixed_credit<35760>, which
--      credits the caster on ANY effect hit without inspecting the target. That
--      wiring is REMOVED at the emitter (goblin_gen/spell_scripts.py RETIRED),
--      and the C++ registration is gone from zeppelin_goblin_start.cpp — the
--      credit is data-side only now.
--
--   2. The monkey's own SmartAI already implements the whole intended sequence
--      (credit the invoker, Sanctuary, self-root, Exploding Bananas, then
--      FORCE_DESPAWN 4s later via the linked row), but the 4.3.4 source keys it
--      on SPELLHIT 98914 "HMC Dummy Effect Current Target 1" — a Cata dummy the
--      3.3.5a chain never casts, because the item casts 67917 directly. The
--      event therefore never fired. Same defect class as I-274 / I-277.
--
-- Fixed here rather than in the emitter: 98914 is a GENERIC Cata dummy that also
-- appears on 34890, 36600, 39042 and 3660800 with unrelated meanings, so a blanket
-- 98914 -> 67917 remap in smartai.py would corrupt those. This is a per-quest
-- correction.
--
-- Row 0 of 34699 is a single row we own inside an entity the [AUTO,F-011] file
-- also writes, so it is DELETEd by its own (source_type, entryorguid, id) and the
-- remaining AUTO rows stay owned by AUTO. The I-244 cascade re-applies this file
-- after the AUTO file, so the AUTO DELETE-by-entity cannot strip it.


-- ---------------------------------------------------------------------------
-- 1. Key the feed reaction to the spell the bananas actually cast.
-- ---------------------------------------------------------------------------
-- Identical to the AUTO row except event_param1: 98914 -> 67917.
--
-- event_flags stays 1 (SMART_EVENT_FLAG_NOT_REPEATABLE) so a monkey reacts once.
-- link = 1 keeps the AUTO row id 1 (event 61 LINK -> action 41 FORCE_DESPAWN,
-- 4000 ms) chained, which is what stops the same monkey being fed twice.
-- action_param2 = 2 runs actionlist 3469900 regardless of combat state.
--
-- Credit ownership now sits in that actionlist: row 0 is
-- SMART_ACTION_CALL_KILLEDMONSTER 35760 with target_type 7 ACTION_INVOKER.
-- CALL_TIMED_ACTIONLIST passes GetLastInvoker() into SetScript9
-- (SmartScript.cpp:2109), and for SPELLHIT the invoker is the casting player, so
-- the "specific target type" branch of SMART_ACTION_CALL_KILLEDMONSTER
-- (SmartScript.cpp:1180-1194) resolves the player and awards the credit.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 34699 AND id = 0;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (34699, 0, 0, 1, 8, 0, 100, 1, 67917, 0, 0, 0, 80, 3469900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bomb-Throwing Monkey - On Spell Hit Nitro-Potassium Bananas - Run feed/explode actionlist (I-281)');


-- ---------------------------------------------------------------------------
-- 2. Refuse the cast on anything that is not a Bomb-Throwing Monkey.
-- ---------------------------------------------------------------------------
-- With credit owned by the monkey's SmartAI, feeding a wrong target already
-- awards nothing. This makes the failure explicit instead of silently consuming
-- the cast: the client reports an invalid target rather than playing the throw.
--
-- Source type is 17 CONDITION_SOURCE_TYPE_SPELL, NOT 13 SPELL_IMPLICIT_TARGET.
-- Type 13 only accepts spells whose effect uses an _AREA_/_CONE_/_NEARBY_
-- implicit target; 67917 keeps its ported single-target shape
-- (effect_implicit_target_a_1 = 25 TARGET_UNIT_TARGET_ANY), so ConditionMgr
-- rejects a type-13 row at load with "spell 67917 does not have implicit targets
-- of types: _AREA_, _CONE_, _NEARBY_ for effect 0, SourceGroup needs correction,
-- ignoring." The DELETE below clears such a row if one was ever applied.
--
-- Type 17 is evaluated in Spell::CheckCast (Spell.cpp:5825-5841) against
-- ConditionSourceInfo(m_caster) with mConditionTargets[1] = the explicit object
-- target, so ConditionTarget = 1 tests what the player clicked. A failure with
-- ConditionTarget set returns SPELL_FAILED_BAD_TARGETS, which is the "Invalid
-- target" the client shows.
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 67917;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17 AND SourceEntry = 67917;
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
  (17, 0, 67917, 0, 0, 31, 1, 3, 34699, 0, 0, 0, 0, '', 'I-281 - Nitro-Potassium Bananas only target Bomb-Throwing Monkey');
