-- fix the event creature spawn for Tel'athion the Impure (17359) by object Barrel of Filth (181699)
DELETE FROM `event_scripts` WHERE `id` = 10685;

-- Water Spirit
INSERT INTO `event_scripts` SET
    `id` = 10685,
    `delay` = 5,
    `command` = 10,
    `datalong` = 6748,
    `datalong2` = 900000,
    `x` = -1647.27 + 9599.9999, -- adjusted for OA maps
    `y` = -10907.0 + 18133.333, -- adjusted for OA maps
    `z` = 58.3257,
    `o` = 4.56593;

-- Water Spirit
INSERT INTO `event_scripts` SET
    `id` = 10685,
    `delay` = 5,
    `command` = 10,
    `datalong` = 6748,
    `datalong2` = 900000,
    `x` = -1637.9 + 9599.9999, -- adjusted for OA maps
    `y` = -10915.8 + 18133.333, -- adjusted for OA maps
    `z` = 58.3306,
    `o` = 4.15948;

-- Tel'athion the Impure
INSERT INTO `event_scripts` SET
    `id` = 10685,
    `delay` = 2,
    `command` = 10,
    `datalong` = 17359,
    `datalong2` = 900000,
    `x` = -1651.2 + 9599.9999, -- adjusted for OA maps
    `y` = -10924.1 + 18133.333, -- adjusted for OA maps
    `z` = 58.633,
    `o` = 4.13593;