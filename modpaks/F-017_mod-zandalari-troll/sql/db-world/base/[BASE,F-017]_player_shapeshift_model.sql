REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES

/* Zandalari Troll Druid forms */
(@CatForm,         @ZandalariTroll,      0,        2, 94165), -- dark blue hair: druidcatzandalaritroll_black
(@CatForm,         @ZandalariTroll,      1,        2, 94166), -- blue hair: druidcatzandalaritroll_blue
(@CatForm,         @ZandalariTroll,      2,        2, 94167), -- green hair: druidcatzandalaritroll_green
(@CatForm,         @ZandalariTroll,      3,        2, 94167), -- orange hair: druidcatzandalaritroll_green
(@CatForm,         @ZandalariTroll,      4,        2, 94167), -- red hair: druidcatzandalaritroll_green
(@CatForm,         @ZandalariTroll,      5,        2, 94168), -- white hair: druidcatzandalaritroll_white
(@CatForm,         @ZandalariTroll,      6,        2, 94168), -- yellow hair: druidcatzandalaritroll_white
(@BearForm,        @ZandalariTroll,      0,        2, 94162), -- dark blue hair: druidbearzandalaritroll_dark
(@BearForm,        @ZandalariTroll,      1,        2, 94161), -- blue hair: druidbearzandalaritroll_blue
(@BearForm,        @ZandalariTroll,      2,        2, 94163), -- green hair: druidbearzandalaritroll_green
(@BearForm,        @ZandalariTroll,      3,        2, 94163), -- orange hair: druidbearzandalaritroll_green
(@BearForm,        @ZandalariTroll,      4,        2, 94163), -- red hair: druidbearzandalaritroll_green
(@BearForm,        @ZandalariTroll,      5,        2, 94164), -- white hair: druidbearzandalaritroll_white
(@BearForm,        @ZandalariTroll,      6,        2, 94164), -- yellow hair: druidbearzandalaritroll_white
(@BearForm,        @ZandalariTroll,    255,        2, 94163), -- default: druidbearzandalaritroll_green
(@DireBearForm,    @ZandalariTroll,      0,        2, 94162), -- dark blue hair: druidbearzandalaritroll_dark
(@DireBearForm,    @ZandalariTroll,      1,        2, 94161), -- blue hair: druidbearzandalaritroll_blue
(@DireBearForm,    @ZandalariTroll,      2,        2, 94163), -- green hair: druidbearzandalaritroll_green
(@DireBearForm,    @ZandalariTroll,      3,        2, 94163), -- orange hair: druidbearzandalaritroll_green
(@DireBearForm,    @ZandalariTroll,      4,        2, 94163), -- red hair: druidbearzandalaritroll_green
(@DireBearForm,    @ZandalariTroll,      5,        2, 94164), -- white hair: druidbearzandalaritroll_white
(@DireBearForm,    @ZandalariTroll,      6,        2, 94164), -- yellow hair: druidbearzandalaritroll_white
(@DireBearForm,    @ZandalariTroll,    255,        2, 94163), -- default: druidbearzandalaritroll_green
(@TreeForm,        @ZandalariTroll,    255,        2, 94172), -- ModelID: DruidTreeFormZandalari
(@MoonkinForm,     @ZandalariTroll,    255,        2, 94170), -- ModelID: druidowlbearzandalariepic2_body, druidowlbearzandalariepic2_armor, armorreflectgold5
(@FlightForm,      @ZandalariTroll,    255,        2, 94169), -- ModelID: druidflightzandalaritroll
(@SwiftFlightForm, @ZandalariTroll,    255,        2, 94169), -- ModelID: druidflightzandalaritroll
(@TravelForm,      @ZandalariTroll,    255,        2, 94171), -- ModelID: druidtravelzandalaritroll
(@AquaticForm,     @ZandalariTroll,      0,        2, 94174), -- dark blue hair: druidaquaticzandalari_dark
(@AquaticForm,     @ZandalariTroll,      1,        2, 94173), -- blue hair: druidaquaticzandalari_teal
(@AquaticForm,     @ZandalariTroll,      2,        2, 94175), -- green hair: druidaquaticzandalari_green
(@AquaticForm,     @ZandalariTroll,      3,        2, 94175), -- orange hair: druidaquaticzandalari_green
(@AquaticForm,     @ZandalariTroll,      4,        2, 94175), -- red hair: druidaquaticzandalari_green
(@AquaticForm,     @ZandalariTroll,      5,        2, 94176), -- white hair: druidaquaticzandalari_light
(@AquaticForm,     @ZandalariTroll,      6,        2, 94176), -- yellow hair: druidaquaticzandalari_light
(@AquaticForm,     @ZandalariTroll,    255,        2, 94175); -- default: druidaquaticzandalari_green
