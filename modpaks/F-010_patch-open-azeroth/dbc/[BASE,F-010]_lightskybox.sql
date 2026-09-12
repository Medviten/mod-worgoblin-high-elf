-- [BASE,F-036] open-azeroth: lightskybox
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-036]_lightskybox.sql with overrides

-- lightskybox: 9 inserts, 0 updates, 0 deletes
DELETE FROM `lightskybox` WHERE `id` = 128;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (128, 'environments\\stars\\hyjal_skybox.mdx', 0);
DELETE FROM `lightskybox` WHERE `id` = 130;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (130, 'Environments\\Stars\\LostIsleSkyBox.mdx', 2);
DELETE FROM `lightskybox` WHERE `id` = 131;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (131, 'environments\\stars\\lostislegloomyskybox.mdx', 2);
DELETE FROM `lightskybox` WHERE `id` = 133;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (133, 'Environments\\Stars\\KezanSkyBox.mdx', 1);
DELETE FROM `lightskybox` WHERE `id` = 150;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (150, 'environments\\stars\\uldum_sky01.mdx', 2);
DELETE FROM `lightskybox` WHERE `id` = 152;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (152, 'environments\\stars\\deepholm_sky01.mdx', 1);
DELETE FROM `lightskybox` WHERE `id` = 160;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (160, 'environments\\stars\\twilighthighlandssky.mdx', 2);
DELETE FROM `lightskybox` WHERE `id` = 200;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (200, 'environments\\stars\\highlandssky.mdx', 2);
DELETE FROM `lightskybox` WHERE `id` = 323;
INSERT INTO `lightskybox` (`id`, `name`, `flags`) VALUES (323, 'environments\\stars\\maelstrom_sky01.mdx', 0);