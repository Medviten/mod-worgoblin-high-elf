-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 92600 AND 92605;
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@WorgenWildMaleDisplay, @WorgenWildFemaleDisplay, @GilneanMaleDisplay, @GilneanFemaleDisplay);
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 33650 AND 33669;

INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(92600, 3141, 0, 62100, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- male worgen
(92601, 3141, 0, 62101, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- male worgen
(92602, 3142, 0, 62102, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- female worgen
(92603, 3142, 0, 62103, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- female worgen
(92604, 3142, 0, 62104, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- female worgen
(92605, 3141, 0, 62105, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- male worgen

-- Worgen racial support
(@WorgenWildMaleDisplay, @WorgenWildMaleModel, 0, @WorgenMaleDisplayExtra, 1, 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@WorgenWildFemaleDisplay, @WorgenWildFemaleModel, 0, @WorgenFemaleDisplayExtra, 1, 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@GilneanMaleDisplay, @GilneanMaleModel, 0, @GilneanMaleDisplayExtra, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
(@GilneanFemaleDisplay, @GilneanFemaleModel, 0, @GilneanFemaleDisplayExtra, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),

-- Cataclysm druid forms
(@DruidBearWorgenDisplay,          @DruidBearWorgenModel, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgen', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearWorgenBlackDisplay,     @DruidBearWorgenModel, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenBlack', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearWorgenBrownDisplay,     @DruidBearWorgenModel, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenBrown', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearWorgenTanDisplay,       @DruidBearWorgenModel, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenTan', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearWorgenWhiteDisplay,     @DruidBearWorgenModel, 0, 0, '1.0000000000000000', 255, 'DruidBearWorgenWhite', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearTrollBlueDisplay,       @DruidBearTrollModel,  0, 0, '1.0000000000000000', 255, 'DruidBearTrollBlue', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearTrollPurpleDisplay,     @DruidBearTrollModel,  0, 0, '1.0000000000000000', 255, 'DruidBearTrollPurple', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearTrollRedDisplay,        @DruidBearTrollModel,  0, 0, '1.0000000000000000', 255, 'DruidBearTrollRed', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearTrollWhiteDisplay,      @DruidBearTrollModel,  0, 0, '1.0000000000000000', 255, 'DruidBearTrollWhite', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidBearTrollYellowDisplay,     @DruidBearTrollModel,  0, 0, '1.0000000000000000', 255, 'DruidBearTrollYellow', '', '', '', 1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenDisplay,       @DruidCatWorgenModel,  0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgen', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenBlackDisplay,  @DruidCatWorgenModel,  0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenBlack', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenBrownDisplay,  @DruidCatWorgenModel,  0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenBrown', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenWhiteDisplay,  @DruidCatWorgenModel,  0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenWhite', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenYellowDisplay, @DruidCatWorgenModel,  0, 0, '1.0000000000000000', 255, 'DruidCatSkinWorgenYellow', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinBlackDisplay,   @DruidCatTrollModel,   0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinBlack', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinBlueDisplay,    @DruidCatTrollModel,   0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinBlue', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinGreenDisplay,   @DruidCatTrollModel,   0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinGreen', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinRedDisplay,     @DruidCatTrollModel,   0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinRed', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinWhiteDisplay,   @DruidCatTrollModel,   0, 0, '1.0000000000000000', 255, 'DruidCatTrollSkinWhite', '', '', '', -1, 0, 0, 0, 0, 0);