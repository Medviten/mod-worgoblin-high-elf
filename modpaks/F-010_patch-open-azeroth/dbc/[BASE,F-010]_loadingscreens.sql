-- [BASE,F-036] open-azeroth: loadingscreens
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-036]_loadingscreens.sql with overrides

-- loadingscreens: 8 inserts, 0 updates, 0 deletes
DELETE FROM `loadingscreens` WHERE `id` = 256;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (256, 'InstanceHallsofOrigination', 'Interface\\Glues\\LoadingScreens\\loadscreenhallsoforigination.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 258;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (258, 'StoneCore', 'Interface\\Glues\\LoadingScreens\\loadscreendeepholmdungeon.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 259;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (259, 'InstanceSkywall', 'Interface\\Glues\\LoadingScreens\\loadscreenskywall.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 264;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (264, 'InstanceUldumDungeon', 'Interface\\Glues\\LoadingScreens\\loadscreenuldumdungeon.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 268;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (268, 'Deepholm', 'Interface\\Glues\\LoadingScreens\\loadscreendeepholm.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 271;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (271, 'InstanceSkywallRaid', 'Interface\\Glues\\LoadingScreens\\loadscreenskywallraid.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 300;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (300, 'AbyssalMawInterior', 'Interface\\Glues\\LoadingScreens\\loadscreenthroneofthetides.blp', 0);
DELETE FROM `loadingscreens` WHERE `id` = 405;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (405, 'MaelstromZone', 'Interface\\Glues\\LoadingScreens\\loadingscreen_shamanartifact.blp', 1);