-- I-340  Zombies vs. Super Booster Rocket Boots (quest 24942, item 84320)
--
-- The boots' on-use spell 72891 is a SCRIPT_EFFECT whose whole chain (72889
-- summon -> 72887 control-vehicle -> 72885 burning aura -> 72886 fire nova) was
-- never ported: none of those four ids reaches a _spellscope reference site
-- (72886 appears only as a SmartAI EVENT param, the rest only from donor C++).
-- They are now in the missing_spells fixture and ship in
-- dbc/[AUTO,F-011]_spell.sql.
--
-- This file carries the ONE world-side row that ports with them: the donor's
-- type-13 implicit-target condition that narrows 72886's 8-yard nova to Goblin
-- Zombie (38753). Without it the nova burns every hostile in range.
--
-- It is a duplicate of the row now emitted into zz_[AUTO,F-011]_70_conditions.sql
-- and exists only so the fix can go live without applying that AUTO file, which
-- currently also carries a parallel session's in-flight graveyard spawns.
-- RETIRE THIS FILE once the AUTO conditions file has been applied normally.

DELETE FROM conditions
 WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 72886;

INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
  (13, 1, 72886, 0, 0, 31, 0, 3, 38753, 0, 0, 0, 0, '', 'I-340 72886 nova hits Goblin Zombie 38753 only');

-- ---------------------------------------------------------------------------
-- 72887 rider-aura script (I-340, second pass).
--
-- The burning aura could not be hung off the boots' CreatureAI: seat 7562 is
-- VEHICLE_SEAT_FLAG_CAN_CONTROL, so Vehicle::AddPassenger charms the vehicle to
-- the player, and Unit::SetCharmedBy -> CreatureAI::OnCharmed sets
-- `IsAIEnabled = false`. PassengerBoarded (Vehicle.cpp:496) and UpdateAI are both
-- gated on that flag, so every CreatureAI hook is dead for the whole ride.
--
-- 72887's DUMMY effect on the rider is co-terminous with the ride and AC removes
-- it itself on exit, so the apply/remove pair lives there instead. Same duplicate
-- of the AUTO file as the condition above; retire together.
-- ---------------------------------------------------------------------------

DELETE FROM spell_script_names WHERE spell_id = 72887;

INSERT INTO spell_script_names (`spell_id`, `ScriptName`) VALUES
  (72887, 'spell_zep_q24942_boots_ride');
