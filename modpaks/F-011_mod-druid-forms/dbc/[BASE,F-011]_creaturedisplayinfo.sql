-- [F-040] mod-druid-forms: creaturedisplayinfo: 85 inserts, 0 updates, 0 deletes

-- New entries
/* Cataclysm Druid forms (conflicting with commented out High Elf copies) */
DELETE FROM `creaturedisplayinfo` WHERE `id` BETWEEN 33650 AND 33669;
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@DruidBearWorgenDisplay,          @DruidBearWorgenModel, 0, 0, 1,  255, 'DruidBearWorgen',          '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearWorgenBlackDisplay,     @DruidBearWorgenModel, 0, 0, 1,  255, 'DruidBearWorgenBlack',     '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearWorgenBrownDisplay,     @DruidBearWorgenModel, 0, 0, 1,  255, 'DruidBearWorgenBrown',     '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearWorgenTanDisplay,       @DruidBearWorgenModel, 0, 0, 1,  255, 'DruidBearWorgenTan',       '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearWorgenWhiteDisplay,     @DruidBearWorgenModel, 0, 0, 1,  255, 'DruidBearWorgenWhite',     '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearTrollBlueDisplay,       @DruidBearTrollModel,  0, 0, 1,  255, 'DruidBearTrollBlue',       '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearTrollPurpleDisplay,     @DruidBearTrollModel,  0, 0, 1,  255, 'DruidBearTrollPurple',     '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearTrollRedDisplay,        @DruidBearTrollModel,  0, 0, 1,  255, 'DruidBearTrollRed',        '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearTrollWhiteDisplay,      @DruidBearTrollModel,  0, 0, 1,  255, 'DruidBearTrollWhite',      '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearTrollYellowDisplay,     @DruidBearTrollModel,  0, 0, 1,  255, 'DruidBearTrollYellow',     '', '', '',  1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenDisplay,       @DruidCatWorgenModel,  0, 0, 1,  255, 'DruidCatSkinWorgen',       '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenBlackDisplay,  @DruidCatWorgenModel,  0, 0, 1,  255, 'DruidCatSkinWorgenBlack',  '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenBrownDisplay,  @DruidCatWorgenModel,  0, 0, 1,  255, 'DruidCatSkinWorgenBrown',  '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenWhiteDisplay,  @DruidCatWorgenModel,  0, 0, 1,  255, 'DruidCatSkinWorgenWhite',  '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatSkinWorgenYellowDisplay, @DruidCatWorgenModel,  0, 0, 1,  255, 'DruidCatSkinWorgenYellow', '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinBlackDisplay,   @DruidCatTrollModel,   0, 0, 1,  255, 'DruidCatTrollSkinBlack',   '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinBlueDisplay,    @DruidCatTrollModel,   0, 0, 1,  255, 'DruidCatTrollSkinBlue',    '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinGreenDisplay,   @DruidCatTrollModel,   0, 0, 1,  255, 'DruidCatTrollSkinGreen',   '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinRedDisplay,     @DruidCatTrollModel,   0, 0, 1,  255, 'DruidCatTrollSkinRed',     '', '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatTrollSkinWhiteDisplay,   @DruidCatTrollModel,   0, 0, 1,  255, 'DruidCatTrollSkinWhite',   '', '', '', -1, 0, 0, 0, 0, 0);

/* Cataclysm Druid forms (not conflicting) */
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (
    @DruidCatSkinPurpleDisplay, 
    @DruidTreeFormGreenDisplay, @DruidTreeFormRedDisplay, @DruidTreeFormPurpleDisplay, @DruidTreeFormOrangeDisplay,
    @DruidOwlBearBlackSkinDisplay, @DruidOwlBearRedSkinDisplay,
    @StormCrowDruidSkinDisplay, @EpicDruidFlightWorgenDisplay, @EpicDruidFlightTrollDisplay, @DruidFlightTrollDisplay
);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@DruidCatSkinPurpleDisplay,    1231,   0, 0, 0.9, 255, 'DruidCatSkinPurple',    'DruidCatSkinPurple',     '', '',  1, 1, 0,   0, 0, 0),
(@DruidTreeFormGreenDisplay,    3805,   0, 0, 1.5, 255, 'DruidTreeFormGreen',    '',                       '', '', -1, 0, 0, 599, 0, 0),
(@DruidTreeFormRedDisplay,      3805,   0, 0, 1.5, 255, 'DruidTreeFormRed',      '',                       '', '', -1, 0, 0, 600, 0, 0),
(@DruidTreeFormPurpleDisplay,   3805,   0, 0, 1.5, 255, 'DruidTreeFormPurple',   '',                       '', '', -1, 0, 0, 601, 0, 0),
(@DruidTreeFormOrangeDisplay,   3805,   0, 0, 1.5, 255, 'DruidTreeFormOrange',   '',                       '', '', -1, 0, 0, 602, 0, 0),
(@DruidOwlBearBlackSkinDisplay, 2199, 204, 0, 0.9, 255, 'DruidOwlBearBlackSkin', 'DruidOwlBearBlackSkin2', '', '', -1, 0, 0,   0, 0, 0),
(@DruidOwlBearRedSkinDisplay,   2199, 204, 0, 0.9, 255, 'DruidOwlBearRedSkin',   'DruidOwlBearRedSkin2',   '', '', -1, 0, 0,   0, 0, 0),
(@StormCrowDruidSkinDisplay,    2540,   0, 0,   1, 255, 'StormCrowDruidSkin',    '',                       '', '',  1, 0, 0,   0, 0, 0),
(@EpicDruidFlightWorgenDisplay, 3845,   0, 0,   1, 255, 'EpicDruidFlightWorgen', '',                       '', '',  1, 0, 0,   0, 0, 0),
(@EpicDruidFlightTrollDisplay,  3846,   0, 0,   1, 255, 'EpicDruidFlightTroll1', 'EpicDruidFlightTroll2',  '', '',  1, 0, 0,   0, 0, 0),
(@DruidFlightTrollDisplay,      3846,   0, 0,   1, 255, 'DruidFlightTroll1',     'DruidFlightTroll2',      '', '',  1, 0, 0,   0, 0, 0); -- Different regular form.

/* Mists of Pandaria Druid forms */
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@DruidTravelAlliance, @DruidTravelHorde); -- New travel forms
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@DruidTravelAllianceDisplay, @DruidTravelAllianceModel, 0, 0, 1, 255, 'DruidTravelAlliance', 'DruidTravelAlliance', 'DruidTravelAlliance', '', 1, 0, 0, 0, 0, 0),
(@DruidTravelHordeDisplay,    @DruidTravelHordeModel,    0, 0, 1, 255, 'DruidTravelHorde',    'DruidTravelHorde',    'DruidTravelHorde',    '', 1, 0, 0, 0, 0, 0);

/* Battle for Azeroth Druid forms (random ID because I couldn't open the DB2 files) */
DELETE FROM `creaturedisplayinfo` WHERE `id` IN
(
    @DruidBearHighmountainTaurenBlackDisplay,   @DruidBearHighmountainTaurenBrownDisplay, @DruidBearHighmountainTaurenSilverDisplay, @DruidBearHighmountainTaurenWhiteDisplay, @DruidBearHighmountainTaurenYellowDisplay,
    @DruidBearZandalariTrollBlueDisplay,        @DruidBearZandalariTrollDarkDisplay,      @DruidBearZandalariTrollGreenDisplay,      @DruidBearZandalariTrollWhiteDisplay,
    @DruidBearKulTiranBrownDisplay,             @DruidBearKulTiranDarkDisplay,            @DruidBearKulTiranGreenDisplay,            @DruidBearKulTiranLightDisplay,
    @DruidCatHighmountainTaurenBlackDisplay,    @DruidCatHighmountainTaurenBrownDisplay,  @DruidCatHighmountainTaurenRedDisplay,     @DruidCatHighmountainTaurenWhiteDisplay,
    @DruidCatZandalariTrollBlackDisplay,        @DruidCatZandalariTrollBlueDisplay,       @DruidCatZandalariTrollGreenDisplay,       @DruidCatZandalariTrollWhiteDisplay,
    @DruidCatKulTiranBrownDisplay,              @DruidCatKulTiranDarkDisplay,             @DruidCatKulTiranGreenDisplay,             @DruidCatKulTiranLightDisplay,
    @DruidMoonkinHighmountainTaurenDisplay,     @DruidMoonkinZandalariTrollDisplay,       @DruidMoonkinKulTiranDisplay,              @DruidMoonkinKulTiranBlackDisplay,        @DruidMoonkinKulTiranPaleDisplay,            @DruidMoonkinKulTiranRedDisplay,
    @DruidFlightHighmountainTaurenDisplay, @DruidFlightZandalariTrollDisplay,        @DruidFlightKulTiranBrownDisplay,          @DruidFlightKulTiranDarkDisplay,          @DruidFlightKulTiranGreenDisplay,            @DruidFlightKulTiranLightDisplay,
    @DruidTravelZandalariTrollDisplay,          @DruidTravelKulTiranBlueDisplay,          @DruidTravelKulTiranBrownDisplay,          @DruidTravelKulTiranGreenDisplay,         @DruidTravelKulTiranWhiteDisplay,
    @DruidAquaticZandalariTrollTealDisplay,     @DruidAquaticZandalariTrollDarkDisplay,   @DruidAquaticZandalariTrollGreenDisplay,   @DruidAquaticZandalariTrollLightDisplay,
    @DruidAquaticKulTiranBrownDisplay,          @DruidAquaticKulTiranDarkDisplay,         @DruidAquaticKulTiranGreenDisplay,         @DruidAquaticKulTiranLightDisplay,
    @DruidTreeZandalariTrollDisplay,
    @DruidTreeKulTiranDisplay
);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@DruidFlightHighmountainTaurenDisplay,      @DruidFlightHighmountainTaurenModel,     0, 0,   1, 255, 'druidflighthmtauren_brown',       'druidflighthmtauren_brown',        '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearZandalariTrollBlueDisplay,        @DruidBearZandalariTrollModel,           0, 0,   1, 255, 'druidbearzandalaritroll_blue',    '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearZandalariTrollDarkDisplay,        @DruidBearZandalariTrollModel,           0, 0,   1, 255, 'druidbearzandalaritroll_dark',    '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearZandalariTrollGreenDisplay,       @DruidBearZandalariTrollModel,           0, 0,   1, 255, 'druidbearzandalaritroll_green',   '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearZandalariTrollWhiteDisplay,       @DruidBearZandalariTrollModel,           0, 0,   1, 255, 'druidbearzandalaritroll_white',   '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidCatZandalariTrollBlackDisplay,        @DruidCatZandalariTrollModel,            0, 0,   1, 255, 'druidcatzandalaritroll_black',    '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatZandalariTrollBlueDisplay,         @DruidCatZandalariTrollModel,            0, 0,   1, 255, 'druidcatzandalaritroll_blue',     '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatZandalariTrollGreenDisplay,        @DruidCatZandalariTrollModel,            0, 0,   1, 255, 'druidcatzandalaritroll_green',    '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatZandalariTrollWhiteDisplay,        @DruidCatZandalariTrollModel,            0, 0,   1, 255, 'druidcatzandalaritroll_white',    '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidFlightZandalariTrollDisplay,          @DruidFlightZandalariTrollModel,         0, 0, 0.1, 255, 'druidflightzandalaritroll',       '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidMoonkinZandalariTrollDisplay,         @DruidMoonkinZandalariTrollModel,      204, 0, 0.9, 255, 'druidowlbearzandalariepic2_body', 'druidowlbearzandalariepic2_armor', 'armorreflectgold5', '', -1, 0, 0,   0, 0, 0),
(@DruidTravelZandalariTrollDisplay,          @DruidTravelZandalariTrollModel,         0, 0,   1, 255, 'druidtravelzandalaritroll',       '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidTreeZandalariTrollDisplay,            @DruidTreeFormModel,                     0, 0, 1.5, 255, 'DruidTreeFormZandalari',          '',                                 '',                  '', -1, 0, 0, 602, 0, 0),
(@DruidAquaticZandalariTrollTealDisplay,     @DruidAquaticZandalariTrollModel,        0, 0, 0.5, 255, 'druidaquaticzandalari_teal',      '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidAquaticZandalariTrollDarkDisplay,     @DruidAquaticZandalariTrollModel,        0, 0, 0.5, 255, 'druidaquaticzandalari_dark',      '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidAquaticZandalariTrollGreenDisplay,    @DruidAquaticZandalariTrollModel,        0, 0, 0.5, 255, 'druidaquaticzandalari_green',     '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidAquaticZandalariTrollLightDisplay,    @DruidAquaticZandalariTrollModel,        0, 0, 0.5, 255, 'druidaquaticzandalari_light',     '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidBearHighmountainTaurenBlackDisplay,   @DruidBearHighmountainTaurenModel,    3022, 0,   1, 255, 'druidbearhmtauren_black',         '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearHighmountainTaurenBrownDisplay,   @DruidBearHighmountainTaurenModel,    3022, 0,   1, 255, 'druidbearhmtauren_brown',         '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearHighmountainTaurenSilverDisplay,  @DruidBearHighmountainTaurenModel,    3022, 0,   1, 255, 'druidbearhmtauren_silver',        '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearHighmountainTaurenWhiteDisplay,   @DruidBearHighmountainTaurenModel,    3022, 0,   1, 255, 'druidbearhmtauren_white',         '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearHighmountainTaurenYellowDisplay,  @DruidBearHighmountainTaurenModel,    3022, 0,   1, 255, 'druidbearhmtauren_yellow',        '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidCatHighmountainTaurenBlackDisplay,    @DruidCatHighmountainTaurenModel,        0, 0,   1, 255, 'druidcathmtauren_1black',         'druidcathmtauren_2hornsblack',     '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatHighmountainTaurenBrownDisplay,    @DruidCatHighmountainTaurenModel,        0, 0,   1, 255, 'druidcathmtauren_1brown',         'druidcathmtauren_2hornsbrown',     '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatHighmountainTaurenRedDisplay,      @DruidCatHighmountainTaurenModel,        0, 0,   1, 255, 'druidcathmtauren_1red',           'druidcathmtauren_2hornsred',       '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatHighmountainTaurenWhiteDisplay,    @DruidCatHighmountainTaurenModel,        0, 0,   1, 255, 'druidcathmtauren_1white',         'druidcathmtauren_2hornswhite',     '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidMoonkinHighmountainTaurenDisplay,     @DruidMoonkinHighmountainTaurenModel,  204, 0, 0.9, 255, 'druidowlbear2_hmt',               'druidowlbear2_hmt_horns',          'druidowlbear2_ta',  '', -1, 0, 0,   0, 0, 0),
(@DruidBearKulTiranBrownDisplay,             @DruidBearKulTiranModel,              3022, 0,   1, 255, 'druidbearkultiran_brown',         'druidbearkultiran_fx',             '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearKulTiranDarkDisplay,              @DruidBearKulTiranModel,              3022, 0,   1, 255, 'druidbearkultiran_dark',          'druidbearkultiran_fx',             '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearKulTiranGreenDisplay,             @DruidBearKulTiranModel,              3022, 0,   1, 255, 'druidbearkultiran_green',         'druidbearkultiran_fx',             '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidBearKulTiranLightDisplay,             @DruidBearKulTiranModel,              3022, 0,   1, 255, 'druidbearkultiran_light',         'druidbearkultiran_fx',             '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidCatKulTiranBrownDisplay,              @DruidCatKulTiranModel,                  0, 0,   1, 255, 'druidcatkultiran_brown',          'druidcatkultiran_fx',              '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatKulTiranDarkDisplay,               @DruidCatKulTiranModel,                  0, 0,   1, 255, 'druidcatkultiran_dark',           'druidcatkultiran_fx',              '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatKulTiranGreenDisplay,              @DruidCatKulTiranModel,                  0, 0,   1, 255, 'druidcatkultiran_green',          'druidcatkultiran_fx',              '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidCatKulTiranLightDisplay,              @DruidCatKulTiranModel,                  0, 0,   1, 255, 'druidcatkultiran_light',          'druidcatkultiran_fx',              '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidFlightKulTiranBrownDisplay,           @DruidFlightKulTiranModel,               0, 0,   1, 255, 'druidflightkultiran_brown',       'druidflightkultiran_fx',           '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidFlightKulTiranDarkDisplay,            @DruidFlightKulTiranModel,               0, 0,   1, 255, 'druidflightkultiran_dark',        'druidflightkultiran_fx',           '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidFlightKulTiranGreenDisplay,           @DruidFlightKulTiranModel,               0, 0,   1, 255, 'druidflightkultiran_green',       'druidflightkultiran_fx',           '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidFlightKulTiranLightDisplay,           @DruidFlightKulTiranModel,               0, 0,   1, 255, 'druidflightkultiran_light',       'druidflightkultiran_fx',           '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidMoonkinKulTiranDisplay,               @DruidMoonkinKulTiranModel,            204, 0, 0.9, 255, 'kultiranmoonkin_noarmor',         '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidMoonkinKulTiranBlackDisplay,          @DruidMoonkinKulTiranModel,            204, 0, 0.9, 255, 'kultiranmoonkin_black',           '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidMoonkinKulTiranPaleDisplay,           @DruidMoonkinKulTiranModel,            204, 0, 0.9, 255, 'kultiranmoonkin_pale',            '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidMoonkinKulTiranRedDisplay,            @DruidMoonkinKulTiranModel,            204, 0, 0.9, 255, 'kultiranmoonkin_red',             '',                                 '',                  '', -1, 0, 0,   0, 0, 0),
(@DruidTravelKulTiranBlueDisplay,            @DruidTravelKulTiranModel,               0, 0,   1, 255, 'druidtravelkultiran_blue',        '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidTravelKulTiranBrownDisplay,           @DruidTravelKulTiranModel,               0, 0,   1, 255, 'druidtravelkultiran_brown',       '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidTravelKulTiranGreenDisplay,           @DruidTravelKulTiranModel,               0, 0,   1, 255, 'druidtravelkultiran_green',       '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidTravelKulTiranWhiteDisplay,           @DruidTravelKulTiranModel,               0, 0,   1, 255, 'druidtravelkultiran_white',       '',                                 '',                  '',  1, 0, 0,   0, 0, 0),
(@DruidAquaticKulTiranBrownDisplay,          @DruidAquaticKulTiranModel,              0, 0,   1, 255, 'druidaquatickultiran_brown',      '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidAquaticKulTiranDarkDisplay,           @DruidAquaticKulTiranModel,              0, 0,   1, 255, 'druidaquatickultiran_dark',       '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidAquaticKulTiranGreenDisplay,          @DruidAquaticKulTiranModel,              0, 0,   1, 255, 'druidaquatickultiran_green',      '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidAquaticKulTiranLightDisplay,          @DruidAquaticKulTiranModel,              0, 0,   1, 255, 'druidaquatickultiran_light',      '',                                 '',                  '',  0, 0, 0,   0, 0, 0),
(@DruidTreeKulTiranDisplay,                  @DruidTreeFormModel,                     0, 0, 1.5, 255, 'druidtreeformkultiran',           '',                                 '',                  '', -1, 0, 0, 602, 0, 0);
