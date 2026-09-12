-- I-318 : Cluster Cluck (q24671) — Remote Control Fireworks paid credit for nothing
--
-- Override for the generated spell_script_names row. The generator no longer
-- emits it (spell_scripts.py RETIRED); this file makes the fix live without a
-- regen and clears a stale row from an already-loaded database.
--
-- Defect: spell 71170 was bound to spell_zep_fixed_credit<38117>, which credits
-- GetCaster() on OnEffectHitTarget for ANY hit target. Effect 0 of 71170 is a
-- DUMMY on implicit target 25 (TARGET_UNIT_TARGET_ANY), so the client self-casts
-- when nothing is selected -> using the item anywhere banked a free credit. A
-- genuine capture paid twice: once from the script, once from the Wild Clucker's
-- own imported SmartAI (38111 SPELLHIT 71170 -> actionlist 3811100 id 1,
-- CALL_KILLEDMONSTER 38117 on the action invoker). The SmartAI copy is the
-- correct one — it also clears the spellclick flag so a bird can't be clicked
-- twice, casts the jetpack visual, sets faction 35, casts Flight and walks the
-- escape path. Identical defect and fix to I-281 (Monkey Business bananas).
DELETE FROM spell_script_names WHERE spell_id = 71170;

-- Restrict the item to actual cluckers so a mis-click reports "Invalid target"
-- instead of silently burning a cast. SourceGroup 1 = EFFECT_0 mask,
-- condition 31 = CONDITION_OBJECT_ENTRY_GUID, value1 3 = TYPEID_UNIT.
-- The generated conditions file already DELETEs source_type 13 / entry 71170,
-- and [I-318] sorts after [AUTO,F-011], so this row survives a regen.
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 71170;
INSERT INTO conditions SET
  `SourceTypeOrReferenceId` = 13,
  `SourceGroup` = 1,
  `SourceEntry` = 71170,
  `SourceId` = 0,
  `ElseGroup` = 0,
  `ConditionTypeOrReference` = 31,
  `ConditionTarget` = 0,
  `ConditionValue1` = 3,
  `ConditionValue2` = 38111,
  `ConditionValue3` = 0,
  `NegativeCondition` = 0,
  `ErrorType` = 0,
  `ErrorTextId` = 0,
  `ScriptName` = '',
  `Comment` = 'Cluster Cluck - Remote Control Fireworks only targets Wild Cluckers';
