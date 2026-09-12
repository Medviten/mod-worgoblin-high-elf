-- [BASE,F-036] open-azeroth: worldmapcontinent
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-036]_worldmapcontinent.sql with overrides

-- worldmapcontinent: 1 inserts, 3 updates, 0 deletes
DELETE FROM `worldmapcontinent` WHERE `id` = 10;
INSERT INTO `worldmapcontinent` (`id`, `map_id`, `left_boundary`, `right_boundary`, `top_boundary`, `bottom_boundary`, `continent_offset_x`, `continent_offset_y`, `scale`, `taxi_min_x`, `taxi_min_y`, `taxi_max_x`, `taxi_max_y`, `world_map_id`) VALUES (10, 1469, 27, 38, 26, 36, '0E-16', '0E-16', '1.0000000000000000', '0E-16', '0E-16', '0E-16', '0E-16', 751);
UPDATE `worldmapcontinent` SET `left_boundary` = 10, `right_boundary` = 46, `top_boundary` = 11, `continent_offset_x` = '21.0668106079101560', `continent_offset_y` = '-1.3237500190734863', `scale` = '0.5249779820442200' WHERE `id` = 1;
UPDATE `worldmapcontinent` SET `continent_offset_y` = '2.0000000000000000', `scale` = '0.5249779820442200' WHERE `id` = 2;
UPDATE `worldmapcontinent` SET `continent_offset_x` = '0.5000000000000000', `continent_offset_y` = '-8.6999998092651370', `scale` = '0.5699999928474426' WHERE `id` = 4;