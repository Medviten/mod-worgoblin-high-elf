-- creaturedisplayinfo: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@ZandalariTrollMaleDisplay, @ZandalariTrollFemaleDisplay);
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 94160 AND 94210; -- Zandalari Troll (same as F-040)
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@ZandalariTrollMaleDisplay, @ZandalariTrollMaleModel, 0, @ZandalariTrollMaleDisplayExtra, '1.1699999570846558', 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@ZandalariTrollFemaleDisplay, @ZandalariTrollFemaleModel, 0, @ZandalariTrollFemaleDisplayExtra, '1.1699999570846558', 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
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
(94176, 4878, 0, 0, 0.5, 255, 'druidaquaticzandalari_light', '', '', '', 0, 0, 0, 0, 0, 0);
