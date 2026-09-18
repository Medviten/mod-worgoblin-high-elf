-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 92600 AND 92605;
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@WorgenWildMaleDisplay, @WorgenWildFemaleDisplay, @GilneanMaleDisplay, @GilneanFemaleDisplay);
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 33650 AND 33669;

INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(92600, 3141, 0, 62100, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0),
(92601, 3141, 0, 62101, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0),
(92602, 3142, 0, 62102, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0),
(92603, 3142, 0, 62103, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0),
(92604, 3142, 0, 62104, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0),
(92605, 3141, 0, 62105, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0),

-- Worgen racial support
(@WorgenWildMaleDisplay, @WorgenWildMaleModel, 0, @WorgenMaleDisplayExtra, 1, 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@WorgenWildFemaleDisplay, @WorgenWildFemaleModel, 0, @WorgenFemaleDisplayExtra, 1, 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@GilneanMaleDisplay, @GilneanMaleModel, 0, @GilneanMaleDisplayExtra, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
(@GilneanFemaleDisplay, @GilneanFemaleModel, 0, @GilneanFemaleDisplayExtra, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),

-- Cataclysm druid forms
(33650, 3516, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgen', '', '', '', 1, 0, 0, 0, 0, 0),
(33651, 3516, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenBlack', '', '', '', 1, 0, 0, 0, 0, 0),
(33652, 3516, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenBrown', '', '', '', 1, 0, 0, 0, 0, 0),
(33653, 3516, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenTan', '', '', '', 1, 0, 0, 0, 0, 0),
(33654, 3516, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenWhite', '', '', '', 1, 0, 0, 0, 0, 0),
(33655, 3517, 0, 0, '1.0000000000000000', 255, 'DruidBearTrollBlue', '', '', '', 1, 0, 0, 0, 0, 0),
(33656, 3517, 0, 0, '1.0000000000000000', 255, 'DruidBearTrollPurple', '', '', '', 1, 0, 0, 0, 0, 0),
(33657, 3517, 0, 0, '1.0000000000000000', 255, 'DruidBearTrollRed', '', '', '', 1, 0, 0, 0, 0, 0),
(33658, 3517, 0, 0, '1.0000000000000000', 255, 'DruidBearTrollWhite', '', '', '', 1, 0, 0, 0, 0, 0),
(33659, 3517, 0, 0, '1.0000000000000000', 255, 'DruidBearTrollYellow', '', '', '', 1, 0, 0, 0, 0, 0),
(33660, 3518, 0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgen', '', '', '', -1, 0, 0, 0, 0, 0),
(33661, 3518, 0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenBlack', '', '', '', -1, 0, 0, 0, 0, 0),
(33662, 3518, 0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenBrown', '', '', '', -1, 0, 0, 0, 0, 0),
(33663, 3518, 0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenWhite', '', '', '', -1, 0, 0, 0, 0, 0),
(33664, 3518, 0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenYellow', '', '', '', -1, 0, 0, 0, 0, 0),
(33665, 3519, 0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinBlack', '', '', '', -1, 0, 0, 0, 0, 0),
(33666, 3519, 0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinBlue', '', '', '', -1, 0, 0, 0, 0, 0),
(33667, 3519, 0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinGreen', '', '', '', -1, 0, 0, 0, 0, 0),
(33668, 3519, 0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinRed', '', '', '', -1, 0, 0, 0, 0, 0),
(33669, 3519, 0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinWhite', '', '', '', -1, 0, 0, 0, 0, 0);