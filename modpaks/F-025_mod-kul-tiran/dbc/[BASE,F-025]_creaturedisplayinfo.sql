-- creaturedisplayinfo: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` IN
(
    @KulTiranMaleDisplay,              @KulTiranFemaleDisplay,
    @DruidBearKulTiranBrownDisplay,    @DruidBearKulTiranDarkDisplay,     @DruidBearKulTiranGreenDisplay,    @DruidBearKulTiranLightDisplay,
    @DruidCatKulTiranBrownDisplay,     @DruidCatKulTiranDarkDisplay,      @DruidCatKulTiranGreenDisplay,     @DruidCatKulTiranLightDisplay,
    @DruidFlightKulTiranBrownDisplay,  @DruidFlightKulTiranDarkDisplay,   @DruidFlightKulTiranGreenDisplay,  @DruidFlightKulTiranLightDisplay,
    @DruidMoonkinKulTiranDisplay,      @DruidMoonkinKulTiranBlackDisplay, @DruidMoonkinKulTiranPaleDisplay,  @DruidMoonkinKulTiranRedDisplay,
    @DruidTravelKulTiranBlueDisplay,   @DruidTravelKulTiranBrownDisplay,  @DruidTravelKulTiranGreenDisplay,  @DruidTravelKulTiranWhiteDisplay,
    @DruidAquaticKulTiranBrownDisplay, @DruidAquaticKulTiranDarkDisplay,  @DruidAquaticKulTiranGreenDisplay, @DruidAquaticKulTiranLightDisplay,
    @DruidTreeKulTiranDisplay
);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@KulTiranMaleDisplay,              @KulTiranMaleModel,           0, @KulTiranMaleDisplayExtra,   '1.0000000000000000', 255, '',                          '',                       '', '',  3, 0, 0, 0, 0, 0),
(@KulTiranFemaleDisplay,            @KulTiranFemaleModel,         0, @KulTiranFemaleDisplayExtra, '1.0000000000000000', 255, '',                          '',                       '', '',  3, 0, 0, 0, 0, 0),
(@DruidBearKulTiranBrownDisplay,    @DruidBearKulTiranModel,   3022,                           0,                    1, 255, 'druidbearkultiran_brown',   'druidbearkultiran_fx',   '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearKulTiranDarkDisplay,     @DruidBearKulTiranModel,   3022,                           0,                    1, 255, 'druidbearkultiran_dark',    'druidbearkultiran_fx',   '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearKulTiranGreenDisplay,    @DruidBearKulTiranModel,   3022,                           0,                    1, 255, 'druidbearkultiran_green',   'druidbearkultiran_fx',   '', '',  1, 0, 0, 0, 0, 0),
(@DruidBearKulTiranLightDisplay,    @DruidBearKulTiranModel,   3022,                           0,                    1, 255, 'druidbearkultiran_light',   'druidbearkultiran_fx',   '', '',  1, 0, 0, 0, 0, 0),
(@DruidCatKulTiranBrownDisplay,     @DruidCatKulTiranModel,       0,                           0,                    1, 255, 'druidcatkultiran_brown',    'druidcatkultiran_fx',    '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatKulTiranDarkDisplay,      @DruidCatKulTiranModel,       0,                           0,                    1, 255, 'druidcatkultiran_dark',     'druidcatkultiran_fx',    '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatKulTiranGreenDisplay,     @DruidCatKulTiranModel,       0,                           0,                    1, 255, 'druidcatkultiran_green',    'druidcatkultiran_fx',    '', '', -1, 0, 0, 0, 0, 0),
(@DruidCatKulTiranLightDisplay,     @DruidCatKulTiranModel,       0,                           0,                    1, 255, 'druidcatkultiran_light',    'druidcatkultiran_fx',    '', '', -1, 0, 0, 0, 0, 0),
(@DruidFlightKulTiranBrownDisplay,  @DruidFlightKulTiranModel,    0,                           0,                    1, 255, 'druidflightkultiran_brown', 'druidflightkultiran_fx', '', '',  1, 0, 0, 0, 0, 0),
(@DruidFlightKulTiranDarkDisplay,   @DruidFlightKulTiranModel,    0,                           0,                    1, 255, 'druidflightkultiran_dark',  'druidflightkultiran_fx', '', '',  1, 0, 0, 0, 0, 0),
(@DruidFlightKulTiranGreenDisplay,  @DruidFlightKulTiranModel,    0,                           0,                    1, 255, 'druidflightkultiran_green', 'druidflightkultiran_fx', '', '',  1, 0, 0, 0, 0, 0),
(@DruidFlightKulTiranLightDisplay,  @DruidFlightKulTiranModel,    0,                           0,                    1, 255, 'druidflightkultiran_light', 'druidflightkultiran_fx', '', '',  1, 0, 0, 0, 0, 0),
(@DruidMoonkinKulTiranDisplay,      @DruidMoonkinKulTiranModel, 204,                           0,                  0.9, 255, 'kultiranmoonkin_noarmor',    '',                      '', '', -1, 0, 0, 0, 0, 0),
(@DruidMoonkinKulTiranBlackDisplay, @DruidMoonkinKulTiranModel, 204,                           0,                  0.9, 255, 'kultiranmoonkin_black',      '',                      '', '', -1, 0, 0, 0, 0, 0),
(@DruidMoonkinKulTiranPaleDisplay,  @DruidMoonkinKulTiranModel, 204,                           0,                  0.9, 255, 'kultiranmoonkin_pale',       '',                      '', '', -1, 0, 0, 0, 0, 0),
(@DruidMoonkinKulTiranRedDisplay,   @DruidMoonkinKulTiranModel, 204,                           0,                  0.9, 255, 'kultiranmoonkin_red',        '',                      '', '', -1, 0, 0, 0, 0, 0),
(@DruidTravelKulTiranBlueDisplay,   @DruidTravelKulTiranModel,    0,                           0,                    1, 255, 'druidtravelkultiran_blue',    '',                      '', '',  1, 0, 0, 0, 0, 0),
(@DruidTravelKulTiranBrownDisplay,  @DruidTravelKulTiranModel,    0,                           0,                    1, 255, 'druidtravelkultiran_brown',   '',                      '', '',  1, 0, 0, 0, 0, 0),
(@DruidTravelKulTiranGreenDisplay,  @DruidTravelKulTiranModel,    0,                           0,                    1, 255, 'druidtravelkultiran_green',   '',                      '', '',  1, 0, 0, 0, 0, 0),
(@DruidTravelKulTiranWhiteDisplay,  @DruidTravelKulTiranModel,    0,                           0,                    1, 255, 'druidtravelkultiran_white',   '',                      '', '',  1, 0, 0, 0, 0, 0),
(@DruidAquaticKulTiranBrownDisplay, @DruidAquaticKulTiranModel,   0,                           0,                    1, 255, 'druidaquatickultiran_brown', '',                      '', '',  0, 0, 0, 0, 0, 0),
(@DruidAquaticKulTiranDarkDisplay,  @DruidAquaticKulTiranModel,   0,                           0,                    1, 255, 'druidaquatickultiran_dark',  '',                      '', '',  0, 0, 0, 0, 0, 0),
(@DruidAquaticKulTiranGreenDisplay, @DruidAquaticKulTiranModel,   0,                           0,                    1, 255, 'druidaquatickultiran_green', '',                      '', '',  0, 0, 0, 0, 0, 0),
(@DruidAquaticKulTiranLightDisplay, @DruidAquaticKulTiranModel,   0,                           0,                    1, 255, 'druidaquatickultiran_light', '',                      '', '',  0, 0, 0, 0, 0, 0),
(@DruidTreeKulTiranDisplay,         @DruidTreeFormModel,          0,                           0,                  1.5, 255, 'druidtreeformkultiran', '',  '',                      '', -1,  0, 0, 602, 0, 0);
