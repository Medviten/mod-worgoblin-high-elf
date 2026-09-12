-- I-337 — goblin-zone creature visibility: undo the donor `distance_visibility` mis-map.
--
-- Reported as "there is heaps of pygmies I just can't see them, they are too far for my
-- vision range" from the B.C. Eliminator. It is NOT the server's global visibility
-- setting (`Visibility.Distance.Continents` is the stock 100): the goblin zone was
-- shipped at FIFTY yards.
--
-- Root cause: goblin_gen/creature_addon.py copied the donor's
-- `creature_template_addon.distance_visibility` straight into AC's
-- `visibilityDistanceType`. They are not the same field. In the source that column is a
-- table-wide constant — 2 on 25078 of 25080 rows, 0 on the other two — so it carries no
-- per-creature intent at all. AC reads the column as the VisibilityDistanceType enum
-- (ObjectDefines.h:61): Normal 0 = 100yd, Tiny 1 = 25, **Small 2 = 50**, Large 3 = 200,
-- Gigantic 4 = 400, Infinite 5 = 533. Every one of the 299 emitted rows landed on Small,
-- halving the range at which the entire zone becomes visible.
--
-- Fixed at source (creature_addon.py now always emits 0); this file repairs the live rows.
--
-- Scope: `entry >= 34000 AND visibilityDistanceType = 2` is exactly the 286 goblin-zone
-- rows today (285 from zz_[AUTO,F-011]_11_creature_template_addon.sql + 36143 Gyrochoppa,
-- whose addon row is defined by zz_[I-310]_get_to_the_gyrochoppa.sql — this file sorts
-- after it). Deliberately NOT touched: the 13 sub-34000 stock entries the emitter also
-- overwrote (2110 Black Rat, 4075 Rat, 6827 Shore Crab, 7395 Cockroach, 13321 Small Frog,
-- the four ELM bunnies, 31688 Whirlwind, 33420 Strange Tentacle and two orphan rows) —
-- Small is the correct, stock value for critters and invisible markers.
UPDATE creature_template_addon SET `visibilityDistanceType` = 0
WHERE `entry` >= 34000 AND `visibilityDistanceType` = 2;

-- 6491 Spirit Healer: stock entry, overwritten to Small by the emitter. A spirit healer
-- you can only see from 50yd defeats the point of the marker.
UPDATE creature_template_addon SET `visibilityDistanceType` = 0 WHERE `entry` = 6491;

-- ---------------------------------------------------------------------------
-- REQUESTED TUNING (deliberate divergence): Oomlot Warriors -> Large (200yd).
-- q24901 is fought from a rooted turret whose only spell has a 100yd range
-- (spellrange 135 "Tower 100"), and the static hillside field plus the six script
-- summon points sit 100-140yd downhill of it (zeppelin_goblin_creatures.cpp
-- EliminatorWarriorSpawns). At Normal the far half of the invasion is invisible from the
-- gun even though it is standing right there. Large makes the assault read as an assault.
-- 200yd is well inside the core's MAX_VISIBILITY_DISTANCE of 250.
UPDATE creature_template_addon SET `visibilityDistanceType` = 3
WHERE `entry` IN (75116, 38531, 385310);
