-- I-248 "Fourth and Goal" (28414) — goal credit for the aimed Throw Footbomb.
--
-- v5 (final architecture): credit comes from the C++ spell script
-- spell_zep_q28414_footbomb_goal (Zeppelin-Core Custom/zeppelin_goblin_start.cpp)
-- bound to 69992 below — it intersects the shot's flight path with the
-- GM-mapped goal quad (the smokestack gap) and credits 37203 when the ball
-- passes inside the frame. Every data-side detection attempt failed
-- structurally: dest-area effects only see the LANDING point (through-shots
-- land far behind), and the traj corridor is missile-width. Requires a core
-- rebuild to take effect; the rows below are safe to apply beforehand (an
-- unbuilt ScriptName only logs a startup warning).
--
-- All other rows are DELETE-only cleanup of v1-v4 plumbing:
-- v1: second bar spell 70052 + its condition; v2-v4: 69993 eff2 area-entry
-- condition, bunny spellhit SAI, and the 6-bunny goal grid (guids 12950010-15).
-- The AUTO bunny spawn 12000004 stays (KilledMonsterCredit needs only the
-- entry, but the retail spawn belongs there).

DELETE FROM spell_script_names WHERE spell_id = 69992;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(69992, 'spell_zep_q28414_footbomb_goal');

DELETE FROM creature_template_spell WHERE CreatureID = 37179 AND `Index` = 1;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 70052;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 69993 AND SourceGroup = 2;
DELETE FROM smart_scripts WHERE entryorguid = 37203 AND source_type = 0;
DELETE FROM creature WHERE guid IN (12950010, 12950011, 12950012, 12950013, 12950014, 12950015);
-- restore the AUTO/retail faction after v4's corridor experiment set it to 7
UPDATE creature_template SET faction = 35 WHERE entry = 37203;
