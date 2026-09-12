-- Fix the event creature spawn for Geezle by spell (30298)
UPDATE `event_scripts` SET `x` = 4540, `y` = 6867, `z` = 0.51, `o` = 0.5 WHERE `id` = 10675; -- Geezle Spawn

-- Fix Geezle (17318) Movement / Spark Spawn
UPDATE `smart_scripts` SET `target_x` = 4497, `target_y` = 6867, `target_z` = 0.8  WHERE (`entryorguid` = 17318 AND `id` = 0); -- Spark Spawn
UPDATE `smart_scripts` SET `target_x` = 4522, `target_y` = 6879, `target_z` = 0.6  WHERE (`entryorguid` = 17318 AND `id` = 3); -- Geezle Move In
UPDATE `smart_scripts` SET `event_param2` = 3.0 WHERE (`entryorguid` = 17318 AND `id` = 5); -- Geezle Orientation

-- Fix Spark (17243) Movement
UPDATE `smart_scripts` SET `target_x` = 4513, `target_y` = 6879, `target_z` = 0.45  WHERE (`entryorguid` = 17243 AND `id` = 0); -- Spark Move In
UPDATE `smart_scripts` SET `target_x` = 4497, `target_y` = 6879, `target_z` = 0.8  WHERE (`entryorguid` = 1724301 AND `id` = 12); -- Spark Move Away
UPDATE `smart_scripts` SET `target_x` = 4540, `target_y` = 6867, `target_z` = 0.51  WHERE (`entryorguid` = 1724301 AND `id` = 14); -- Geezle Move Away?