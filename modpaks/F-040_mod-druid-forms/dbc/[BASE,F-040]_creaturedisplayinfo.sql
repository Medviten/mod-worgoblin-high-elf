-- [F-040] mod-druid-forms: creaturedisplayinfo: 85 inserts, 0 updates, 0 deletes

-- New entries
/* Cataclysm Druid forms (conflicting with commented out High Elf copies) */
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 33650 AND 33669;
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(33650, 3516, 0, 0, 1,  255, 'DruidBearWorgen', '', '', '', 1, 0, 0, 0, 0, 0),
(33651, 3516, 0, 0, 1,  255, 'DruidBearWorgenBlack', '', '', '', 1, 0, 0, 0, 0, 0),
(33652, 3516, 0, 0, 1,  255, 'DruidBearWorgenBrown', '', '', '', 1, 0, 0, 0, 0, 0),
(33653, 3516, 0, 0, 1,  255, 'DruidBearWorgenTan', '', '', '', 1, 0, 0, 0, 0, 0),
(33654, 3516, 0, 0, 1,  255, 'DruidBearWorgenWhite', '', '', '', 1, 0, 0, 0, 0, 0),
(33655, 3517, 0, 0, 1,  255, 'DruidBearTrollBlue', '', '', '', 1, 0, 0, 0, 0, 0),
(33656, 3517, 0, 0, 1,  255, 'DruidBearTrollPurple', '', '', '', 1, 0, 0, 0, 0, 0),
(33657, 3517, 0, 0, 1,  255, 'DruidBearTrollRed', '', '', '', 1, 0, 0, 0, 0, 0),
(33658, 3517, 0, 0, 1,  255, 'DruidBearTrollWhite', '', '', '', 1, 0, 0, 0, 0, 0),
(33659, 3517, 0, 0, 1,  255, 'DruidBearTrollYellow', '', '', '', 1, 0, 0, 0, 0, 0),
(33660, 3518, 0, 0, 1,  255, 'DruidCatSkinWorgen', '', '', '', -1, 0, 0, 0, 0, 0),
(33661, 3518, 0, 0, 1,  255, 'DruidCatSkinWorgenBlack', '', '', '', -1, 0, 0, 0, 0, 0),
(33662, 3518, 0, 0, 1,  255, 'DruidCatSkinWorgenBrown', '', '', '', -1, 0, 0, 0, 0, 0),
(33663, 3518, 0, 0, 1,  255, 'DruidCatSkinWorgenWhite', '', '', '', -1, 0, 0, 0, 0, 0),
(33664, 3518, 0, 0, 1,  255, 'DruidCatSkinWorgenYellow', '', '', '', -1, 0, 0, 0, 0, 0),
(33665, 3519, 0, 0, 1,  255, 'DruidCatTrollSkinBlack', '', '', '', -1, 0, 0, 0, 0, 0),
(33666, 3519, 0, 0, 1,  255, 'DruidCatTrollSkinBlue', '', '', '', -1, 0, 0, 0, 0, 0),
(33667, 3519, 0, 0, 1,  255, 'DruidCatTrollSkinGreen', '', '', '', -1, 0, 0, 0, 0, 0),
(33668, 3519, 0, 0, 1,  255, 'DruidCatTrollSkinRed', '', '', '', -1, 0, 0, 0, 0, 0),
(33669, 3519, 0, 0, 1,  255, 'DruidCatTrollSkinWhite', '', '', '', -1, 0, 0, 0, 0, 0);

/* Cataclysm Druid forms (not conflicting) */
DELETE FROM `creaturedisplayinfo` WHERE `id` = 34521;
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 37163 AND 37166; -- tree forms
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (37173, 37174, 37727, 37729, 37730, 94216); -- Owlbear and others
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(34521, 1231, 0, 0, 0.9, 255, 'DruidCatSkinPurple', 'DruidCatSkinPurple', '', '', 1, 1, 0, 0, 0, 0),
(37163, 3805, 0, 0, 1.5, 255, 'DruidTreeFormGreen', '', '', '', -1, 0, 0, 599, 0, 0),
(37164, 3805, 0, 0, 1.5, 255, 'DruidTreeFormRed', '', '', '', -1, 0, 0, 600, 0, 0),
(37165, 3805, 0, 0, 1.5, 255, 'DruidTreeFormPurple', '', '', '', -1, 0, 0, 601, 0, 0),
(37166, 3805, 0, 0, 1.5, 255, 'DruidTreeFormOrange', '', '', '', -1, 0, 0, 602, 0, 0),
(37173, 2199, 204, 0, 0.9, 255, 'DruidOwlBearBlackSkin', 'DruidOwlBearBlackSkin2', '', '', -1, 0, 0, 0, 0, 0),
(37174, 2199, 204, 0, 0.9, 255, 'DruidOwlBearRedSkin', 'DruidOwlBearRedSkin2', '', '', -1, 0, 0, 0, 0, 0),
(37727, 2540, 0, 0, 1, 255, 'StormCrowDruidSkin', '', '', '', 1, 0, 0, 0, 0, 0),
(37729, 3845, 0, 0, 1, 255, 'EpicDruidFlightWorgen', '', '', '', 1, 0, 0, 0, 0, 0),
(37730, 3846, 0, 0, 1, 255, 'EpicDruidFlightTroll1', 'EpicDruidFlightTroll2', '', '', 1, 0, 0, 0, 0, 0),
(94216, 3846, 0, 0, 1, 255, 'DruidFlightTroll1', 'DruidFlightTroll2', '', '', 1, 0, 0, 0, 0, 0); -- Different regular form.

/* Mists of Pandaria Druid forms */
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (40816, 45339); -- New travel forms
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(40816, 4870, 0, 0, 1, 255, 'DruidTravelAlliance', 'DruidTravelAlliance', 'DruidTravelAlliance', '', 1, 0, 0, 0, 0, 0),
(45339, 4871, 0, 0, 1, 255, 'DruidTravelHorde', 'DruidTravelHorde', 'DruidTravelHorde', '', 1, 0, 0, 0, 0, 0);

/* Battle for Azeroth Druid forms (random ID because I couldn't open the DB2 files) */
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 94160 AND 94210; -- Zandalari Troll, Highmountain Tauren, Kul Tiran
DELETE FROM `creaturedisplayinfo` WHERE `id` = 94214; -- Kul Tiran tree form
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(94160, 4872, 0, 0, 1, 255, 'druidflighthmtauren_brown', 'druidflighthmtauren_brown', '', '', 1, 0, 0, 0, 0, 0),
(94161, 4873, 0, 0, 1, 255, 'druidbearzandalaritroll_blue', '', '', '', 1, 0, 0, 0, 0, 0),
(94162, 4873, 0, 0, 1, 255, 'druidbearzandalaritroll_dark', '', '', '', 1, 0, 0, 0, 0, 0),
(94163, 4873, 0, 0, 1, 255, 'druidbearzandalaritroll_green', '', '', '', 1, 0, 0, 0, 0, 0),
(94164, 4873, 0, 0, 1, 255, 'druidbearzandalaritroll_white', '', '', '', 1, 0, 0, 0, 0, 0),
(94165, 4874, 0, 0, 1, 255, 'druidcatzandalaritroll_black', '', '', '', -1, 0, 0, 0, 0, 0),
(94166, 4874, 0, 0, 1, 255, 'druidcatzandalaritroll_blue', '', '', '', -1, 0, 0, 0, 0, 0),
(94167, 4874, 0, 0, 1, 255, 'druidcatzandalaritroll_green', '', '', '', -1, 0, 0, 0, 0, 0),
(94168, 4874, 0, 0, 1, 255, 'druidcatzandalaritroll_white', '', '', '', -1, 0, 0, 0, 0, 0),
(94169, 4875, 0, 0, 0.1, 255, 'druidflightzandalaritroll', '', '', '', 1, 0, 0, 0, 0, 0),
(94170, 4876, 204, 0, 0.9, 255, 'druidowlbearzandalariepic2_body', 'druidowlbearzandalariepic2_armor', 'armorreflectgold5', '', -1, 0, 0, 0, 0, 0),
(94171, 4877, 0, 0, 1, 255, 'druidtravelzandalaritroll', '', '', '', 1, 0, 0, 0, 0, 0),
(94172, 3805, 0, 0, 1.5, 255, 'DruidTreeFormZandalari', '', '', '', -1, 0, 0, 602, 0, 0),
(94173, 4878, 0, 0, 0.5, 255, 'druidaquaticzandalari_teal', '', '', '', 0, 0, 0, 0, 0, 0),
(94174, 4878, 0, 0, 0.5, 255, 'druidaquaticzandalari_dark', '', '', '', 0, 0, 0, 0, 0, 0),
(94175, 4878, 0, 0, 0.5, 255, 'druidaquaticzandalari_green', '', '', '', 0, 0, 0, 0, 0, 0),
(94176, 4878, 0, 0, 0.5, 255, 'druidaquaticzandalari_light', '', '', '', 0, 0, 0, 0, 0, 0),
(94177, 4879, 3022, 0, 1, 255, 'druidbearhmtauren_black', '', '', '', 1, 0, 0, 0, 0, 0),
(94178, 4879, 3022, 0, 1, 255, 'druidbearhmtauren_brown', '', '', '', 1, 0, 0, 0, 0, 0),
(94179, 4879, 3022, 0, 1, 255, 'druidbearhmtauren_silver', '', '', '', 1, 0, 0, 0, 0, 0),
(94180, 4879, 3022, 0, 1, 255, 'druidbearhmtauren_white', '', '', '', 1, 0, 0, 0, 0, 0),
(94181, 4879, 3022, 0, 1, 255, 'druidbearhmtauren_yellow', '', '', '', 1, 0, 0, 0, 0, 0),
(94182, 4880, 0, 0, 1, 255, 'druidcathmtauren_1black', 'druidcathmtauren_2hornsblack', '', '', -1, 0, 0, 0, 0, 0),
(94183, 4880, 0, 0, 1, 255, 'druidcathmtauren_1brown', 'druidcathmtauren_2hornsbrown', '', '', -1, 0, 0, 0, 0, 0),
(94184, 4880, 0, 0, 1, 255, 'druidcathmtauren_1red', 'druidcathmtauren_2hornsred', '', '', -1, 0, 0, 0, 0, 0),
(94185, 4880, 0, 0, 1, 255, 'druidcathmtauren_1white', 'druidcathmtauren_2hornswhite', '', '', -1, 0, 0, 0, 0, 0),
(94186, 4881, 204, 0, 0.9, 255, 'druidowlbear2_hmt', 'druidowlbear2_hmt_horns', 'druidowlbear2_ta', '', -1, 0, 0, 0, 0, 0),
(94187, 4882, 3022, 0, 1, 255, 'druidbearkultiran_brown', 'druidbearkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94188, 4882, 3022, 0, 1, 255, 'druidbearkultiran_dark', 'druidbearkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94189, 4882, 3022, 0, 1, 255, 'druidbearkultiran_green', 'druidbearkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94190, 4882, 3022, 0, 1, 255, 'druidbearkultiran_light', 'druidbearkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94191, 4883, 0, 0, 1, 255, 'druidcatkultiran_brown', 'druidcatkultiran_fx', '', '', -1, 0, 0, 0, 0, 0),
(94192, 4883, 0, 0, 1, 255, 'druidcatkultiran_dark', 'druidcatkultiran_fx', '', '', -1, 0, 0, 0, 0, 0),
(94193, 4883, 0, 0, 1, 255, 'druidcatkultiran_green', 'druidcatkultiran_fx', '', '', -1, 0, 0, 0, 0, 0),
(94194, 4883, 0, 0, 1, 255, 'druidcatkultiran_light', 'druidcatkultiran_fx', '', '', -1, 0, 0, 0, 0, 0),
(94195, 4884, 0, 0, 1, 255, 'druidflightkultiran_brown', 'druidflightkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94196, 4884, 0, 0, 1, 255, 'druidflightkultiran_dark', 'druidflightkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94197, 4884, 0, 0, 1, 255, 'druidflightkultiran_green', 'druidflightkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94198, 4884, 0, 0, 1, 255, 'druidflightkultiran_light', 'druidflightkultiran_fx', '', '', 1, 0, 0, 0, 0, 0),
(94199, 4885, 204, 0, 0.9, 255, 'kultiranmoonkin_noarmor', '', '', '', -1, 0, 0, 0, 0, 0),
(94200, 4885, 204, 0, 0.9, 255, 'kultiranmoonkin_black', '', '', '', -1, 0, 0, 0, 0, 0),
(94201, 4885, 204, 0, 0.9, 255, 'kultiranmoonkin_pale', '', '', '', -1, 0, 0, 0, 0, 0),
(94202, 4885, 204, 0, 0.9, 255, 'kultiranmoonkin_red', '', '', '', -1, 0, 0, 0, 0, 0),
(94203, 4886, 0, 0, 1, 255, 'druidtravelkultiranblue', '', '', '', 1, 0, 0, 0, 0, 0),
(94204, 4886, 0, 0, 1, 255, 'druidtravelkultiranbrown', '', '', '', 1, 0, 0, 0, 0, 0),
(94205, 4886, 0, 0, 1, 255, 'druidtravelkultirangreen', '', '', '', 1, 0, 0, 0, 0, 0),
(94206, 4886, 0, 0, 1, 255, 'druidtravelkultiranwhite', '', '', '', 1, 0, 0, 0, 0, 0),
(94207, 4887, 0, 0, 1, 255, 'druidaquatickultiran_brown', '', '', '', 0, 0, 0, 0, 0, 0),
(94208, 4887, 0, 0, 1, 255, 'druidaquatickultiran_dark', '', '', '', 0, 0, 0, 0, 0, 0),
(94209, 4887, 0, 0, 1, 255, 'druidaquatickultiran_green', '', '', '', 0, 0, 0, 0, 0, 0),
(94210, 4887, 0, 0, 1, 255, 'druidaquatickultiran_light', '', '', '', 0, 0, 0, 0, 0, 0),
(94214, 3805, 0, 0, 1.5, 255, 'druidtreeformkultiran', '', '', '', -1, 0, 0, 602, 0, 0);
