-- ============================================================
-- I-228 Highperch Wyvern Area Z fixes (OpenAzeroth terrain raise)
-- v4: gameobjects on heightmap (==client GroundZ); CREATURES+WAYPOINTS on navmesh +1.0
--   (moving creatures walk the navmesh; HoverHeight=1 + model origin above feet).
--   gameobjects (nodes/eggs/shells/chest): heightmap + 0.1
-- ============================================================

-- Waypoints — Pao'ka Swiftmountain (entry 10427)
UPDATE `script_waypoint` SET `location_z` = 44.75 WHERE `entry` = 10427 AND `pointid` = 1;
UPDATE `script_waypoint` SET `location_z` = 49.82 WHERE `entry` = 10427 AND `pointid` = 5;
UPDATE `script_waypoint` SET `location_z` = -10.07 WHERE `entry` = 10427 AND `pointid` = 18;
UPDATE `script_waypoint` SET `location_z` = -24.37 WHERE `entry` = 10427 AND `pointid` = 19;
UPDATE `script_waypoint` SET `location_z` = -33.47 WHERE `entry` = 10427 AND `pointid` = 20;
UPDATE `script_waypoint` SET `location_z` = -53.01 WHERE `entry` = 10427 AND `pointid` = 24;
UPDATE `script_waypoint` SET `location_z` = 4.21 WHERE `entry` = 10427 AND `pointid` = 10;
UPDATE `script_waypoint` SET `location_z` = 0.89 WHERE `entry` = 10427 AND `pointid` = 11;
UPDATE `script_waypoint` SET `location_z` = 0.99 WHERE `entry` = 10427 AND `pointid` = 12;
UPDATE `script_waypoint` SET `location_z` = 0.34 WHERE `entry` = 10427 AND `pointid` = 13;
UPDATE `script_waypoint` SET `location_z` = -0.40 WHERE `entry` = 10427 AND `pointid` = 14;
UPDATE `script_waypoint` SET `location_z` = -0.62 WHERE `entry` = 10427 AND `pointid` = 15;
UPDATE `script_waypoint` SET `location_z` = -1.55 WHERE `entry` = 10427 AND `pointid` = 16;


-- Gameobjects — nodes/eggs/shells/chest at heightmap + 0.1 (X/Y kept):
UPDATE `gameobject` SET `position_z` = 2.008631 WHERE `guid` = 215922;
UPDATE `gameobject` SET `position_z` = 46.625861 WHERE `guid` = 215973;
UPDATE `gameobject` SET `position_z` = -0.926570 WHERE `guid` = 215985;
UPDATE `gameobject` SET `position_z` = -40.878355 WHERE `guid` = 215987;
UPDATE `gameobject` SET `position_z` = -0.150485 WHERE `guid` = 215992;
UPDATE `gameobject` SET `position_z` = 0.448861 WHERE `guid` = 216110;
UPDATE `gameobject` SET `position_z` = 2.306210 WHERE `guid` = 216111;
UPDATE `gameobject` SET `position_z` = 1.643095 WHERE `guid` = 216116;
-- Highperch Wyvern Egg (guid 16664) — was 46.92, ground 46.62 -> 46.72
UPDATE `gameobject` SET `position_z` = 46.724050 WHERE `guid` = 16664;
-- Highperch Wyvern Egg (guid 16665) — was 48.67, ground 48.37 -> 48.47
UPDATE `gameobject` SET `position_z` = 48.467698 WHERE `guid` = 16665;
-- Highperch Wyvern Egg (guid 16666) — was 49.64, ground 49.34 -> 49.44
UPDATE `gameobject` SET `position_z` = 49.437719 WHERE `guid` = 16666;
-- Highperch Wyvern Egg (guid 16667) — was -0.40, ground -0.70 -> -0.60
UPDATE `gameobject` SET `position_z` = -0.601174 WHERE `guid` = 16667;
-- Highperch Wyvern Egg (guid 16668) — was 0.54, ground 0.24 -> 0.34
UPDATE `gameobject` SET `position_z` = 0.335730 WHERE `guid` = 16668;
-- Highperch Wyvern Egg (guid 16669) — was 0.13, ground -0.17 -> -0.07
UPDATE `gameobject` SET `position_z` = -0.065151 WHERE `guid` = 16669;
-- Highperch Wyvern Egg (guid 16670) — was 0.16, ground -0.14 -> -0.04
UPDATE `gameobject` SET `position_z` = -0.038408 WHERE `guid` = 16670;
-- Highperch Wyvern Egg (guid 16671) — was 1.33, ground 1.03 -> 1.13
UPDATE `gameobject` SET `position_z` = 1.133609 WHERE `guid` = 16671;
-- Highperch Wyvern Egg (guid 16672) — was 2.27, ground 1.97 -> 2.07
UPDATE `gameobject` SET `position_z` = 2.069565 WHERE `guid` = 16672;
UPDATE `gameobject` SET `position_z` = 2.008631 WHERE `guid` = 215834;
UPDATE `gameobject` SET `position_z` = 46.625861 WHERE `guid` = 215885;
UPDATE `gameobject` SET `position_z` = -0.926570 WHERE `guid` = 215897;
UPDATE `gameobject` SET `position_z` = -40.878355 WHERE `guid` = 215899;
UPDATE `gameobject` SET `position_z` = -0.150485 WHERE `guid` = 215904;
UPDATE `gameobject` SET `position_z` = 0.448861 WHERE `guid` = 216099;
UPDATE `gameobject` SET `position_z` = 2.306210 WHERE `guid` = 216100;
UPDATE `gameobject` SET `position_z` = 1.643095 WHERE `guid` = 216105;
UPDATE `gameobject` SET `position_z` = 2.008631 WHERE `guid` = 216010;
UPDATE `gameobject` SET `position_z` = 46.625861 WHERE `guid` = 216061;
UPDATE `gameobject` SET `position_z` = -0.926570 WHERE `guid` = 216073;
UPDATE `gameobject` SET `position_z` = -40.878355 WHERE `guid` = 216075;
UPDATE `gameobject` SET `position_z` = -0.150485 WHERE `guid` = 216080;
-- Solid Chest (guid 16719) — was 1.35, ground 1.05 -> 1.15
UPDATE `gameobject` SET `position_z` = 1.148886 WHERE `guid` = 16719;
-- Sunscorched Shell (guid 16673) — was -0.03, ground -0.33 -> -0.23
UPDATE `gameobject` SET `position_z` = -0.233550 WHERE `guid` = 16673;
-- Sunscorched Shell (guid 16674) — was 2.93, ground 2.63 -> 2.73
UPDATE `gameobject` SET `position_z` = 2.731547 WHERE `guid` = 16674;
-- Sunscorched Shell (guid 16705) — was 1.70, ground 1.40 -> 1.50
UPDATE `gameobject` SET `position_z` = 1.495009 WHERE `guid` = 16705;
-- Sunscorched Shell (guid 16710) — was 1.12, ground 0.82 -> 0.92
UPDATE `gameobject` SET `position_z` = 0.919632 WHERE `guid` = 16710;
-- Sunscorched Shell (guid 16711) — was 47.35, ground 47.05 -> 47.15
UPDATE `gameobject` SET `position_z` = 47.151304 WHERE `guid` = 16711;
-- Sunscorched Shell (guid 16712) — was -1.04, ground -1.34 -> -1.24
UPDATE `gameobject` SET `position_z` = -1.243814 WHERE `guid` = 16712;
-- Sunscorched Shell (guid 16714) — was -0.72, ground -1.02 -> -0.92
UPDATE `gameobject` SET `position_z` = -0.921961 WHERE `guid` = 16714;
UPDATE `gameobject` SET `position_z` = 0.448861 WHERE `guid` = 216121;
UPDATE `gameobject` SET `position_z` = 2.306210 WHERE `guid` = 216122;
UPDATE `gameobject` SET `position_z` = 1.643095 WHERE `guid` = 216127;

-- Creature spawns — navmesh surface + 1.0 (HoverHeight=1, origin above feet); X/Y kept
-- 4107 guid 21127 (wander) — navmesh 50.35 -> 51.35
UPDATE `creature` SET `position_z` = 51.345500 WHERE `guid` = 21127;
-- 4107 guid 21128 (wander) — navmesh 3.04 -> 4.04
UPDATE `creature` SET `position_z` = 4.036500 WHERE `guid` = 21128;
-- 4107 guid 21129 (wander) — navmesh -0.11 -> 0.89
UPDATE `creature` SET `position_z` = 0.892200 WHERE `guid` = 21129;
-- 4107 guid 21130 (wander) — navmesh 45.68 -> 46.68
UPDATE `creature` SET `position_z` = 46.684200 WHERE `guid` = 21130;
-- 4107 guid 21131 (wander) — navmesh 0.93 -> 1.93
UPDATE `creature` SET `position_z` = 1.929500 WHERE `guid` = 21131;
-- 4107 guid 21132 (wander) — navmesh -0.31 -> 0.69
UPDATE `creature` SET `position_z` = 0.693500 WHERE `guid` = 21132;
-- 4107 guid 21133 (waypoint) — navmesh 48.23 -> 49.23
UPDATE `creature` SET `position_z` = 49.233994 WHERE `guid` = 21133;
-- 4107 guid 21134 (wander) — navmesh 47.83 -> 48.83
UPDATE `creature` SET `position_z` = 48.828900 WHERE `guid` = 21134;
-- 4107 guid 21135 (wander) — navmesh -0.00 -> 1.00
UPDATE `creature` SET `position_z` = 0.999800 WHERE `guid` = 21135;
-- 4107 guid 21136 (wander) — navmesh -0.58 -> 0.42
UPDATE `creature` SET `position_z` = 0.416500 WHERE `guid` = 21136;
-- 4107 guid 21137 (wander) — navmesh -0.25 -> 0.75
UPDATE `creature` SET `position_z` = 0.745600 WHERE `guid` = 21137;
-- 4107 guid 21138 (wander) — navmesh -0.36 -> 0.64
UPDATE `creature` SET `position_z` = 0.642600 WHERE `guid` = 21138;
-- 4107 guid 21139 (wander) — navmesh 0.95 -> 1.95
UPDATE `creature` SET `position_z` = 1.954400 WHERE `guid` = 21139;
-- 4107 guid 21140 (wander) — navmesh 0.11 -> 1.11
UPDATE `creature` SET `position_z` = 1.112400 WHERE `guid` = 21140;
-- 4107 guid 21141 (wander) — navmesh 0.30 -> 1.30
UPDATE `creature` SET `position_z` = 1.297400 WHERE `guid` = 21141;
-- 4107 guid 21142 (idle) — navmesh -0.25 -> 0.75
UPDATE `creature` SET `position_z` = 0.745600 WHERE `guid` = 21142;
-- 4107 guid 21143 (wander) — navmesh -0.29 -> 0.71
UPDATE `creature` SET `position_z` = 0.708400 WHERE `guid` = 21143;
-- 4109 guid 21147 (wander) — navmesh 0.32 -> 1.32
UPDATE `creature` SET `position_z` = 1.319700 WHERE `guid` = 21147;
-- 4109 guid 21148 (wander) — navmesh 47.35 -> 48.35
UPDATE `creature` SET `position_z` = 48.352000 WHERE `guid` = 21148;
-- 4109 guid 21149 (waypoint) — navmesh -0.13 -> 0.87
UPDATE `creature` SET `position_z` = 0.871800 WHERE `guid` = 21149;
-- 4109 guid 21150 (wander) — navmesh -0.18 -> 0.82
UPDATE `creature` SET `position_z` = 0.815100 WHERE `guid` = 21150;
-- 4109 guid 21151 (idle) — navmesh 0.99 -> 1.99
UPDATE `creature` SET `position_z` = 1.985300 WHERE `guid` = 21151;
-- 4110 guid 21153 (idle) — navmesh -0.14 -> 0.86
UPDATE `creature` SET `position_z` = 0.859300 WHERE `guid` = 21153;
-- 4110 guid 21154 (waypoint) — navmesh -0.74 -> 0.26
UPDATE `creature` SET `position_z` = 0.262700 WHERE `guid` = 21154;

-- Wyvern waypoint routes — navmesh surface + 1.0 per point; X/Y kept
-- path 211330 (10 pts)
UPDATE `waypoint_data` SET `position_z` = 49.571500 WHERE `id` = 211330 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 50.299600 WHERE `id` = 211330 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 49.496500 WHERE `id` = 211330 AND `point` = 3;
UPDATE `waypoint_data` SET `position_z` = 48.167100 WHERE `id` = 211330 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 47.754600 WHERE `id` = 211330 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = 47.460900 WHERE `id` = 211330 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = 48.027800 WHERE `id` = 211330 AND `point` = 7;
UPDATE `waypoint_data` SET `position_z` = 48.261100 WHERE `id` = 211330 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 48.882900 WHERE `id` = 211330 AND `point` = 9;
UPDATE `waypoint_data` SET `position_z` = 49.448900 WHERE `id` = 211330 AND `point` = 10;
-- path 211490 (16 pts)
UPDATE `waypoint_data` SET `position_z` = 0.933400 WHERE `id` = 211490 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 1.027800 WHERE `id` = 211490 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 1.518400 WHERE `id` = 211490 AND `point` = 3;
UPDATE `waypoint_data` SET `position_z` = 1.164200 WHERE `id` = 211490 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 0.679300 WHERE `id` = 211490 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = -0.004000 WHERE `id` = 211490 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = -0.105300 WHERE `id` = 211490 AND `point` = 7;
UPDATE `waypoint_data` SET `position_z` = 0.212300 WHERE `id` = 211490 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 0.553800 WHERE `id` = 211490 AND `point` = 9;
UPDATE `waypoint_data` SET `position_z` = 0.572000 WHERE `id` = 211490 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = 0.702800 WHERE `id` = 211490 AND `point` = 11;
UPDATE `waypoint_data` SET `position_z` = 0.293700 WHERE `id` = 211490 AND `point` = 12;
UPDATE `waypoint_data` SET `position_z` = 0.887700 WHERE `id` = 211490 AND `point` = 13;
UPDATE `waypoint_data` SET `position_z` = 1.241100 WHERE `id` = 211490 AND `point` = 14;
UPDATE `waypoint_data` SET `position_z` = 1.032100 WHERE `id` = 211490 AND `point` = 15;
UPDATE `waypoint_data` SET `position_z` = 1.032100 WHERE `id` = 211490 AND `point` = 16;
-- path 211540 (12 pts)
UPDATE `waypoint_data` SET `position_z` = 0.166400 WHERE `id` = 211540 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 0.166400 WHERE `id` = 211540 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 0.906500 WHERE `id` = 211540 AND `point` = 3;
UPDATE `waypoint_data` SET `position_z` = 0.895000 WHERE `id` = 211540 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 1.456500 WHERE `id` = 211540 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = 1.606500 WHERE `id` = 211540 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = 1.236800 WHERE `id` = 211540 AND `point` = 7;
UPDATE `waypoint_data` SET `position_z` = 0.453586 WHERE `id` = 211540 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 0.724373 WHERE `id` = 211540 AND `point` = 9;
UPDATE `waypoint_data` SET `position_z` = 0.912500 WHERE `id` = 211540 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = 0.745600 WHERE `id` = 211540 AND `point` = 11;
UPDATE `waypoint_data` SET `position_z` = 0.745600 WHERE `id` = 211540 AND `point` = 12;
