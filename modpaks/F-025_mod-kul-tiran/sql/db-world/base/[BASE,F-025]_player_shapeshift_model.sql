REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES
/* Kul Tiran Druid forms */
(@CatForm,         @KulTiran,   0, 2, 94191), -- dark brown hair: druidcatkultiran_brown
(@CatForm,         @KulTiran,   1, 2, 94192), -- black hair: druidcatkultiran_dark
(@CatForm,         @KulTiran,   2, 2, 94193), -- red hair: druidcatkultiran_green
(@CatForm,         @KulTiran,   3, 2, 94193), -- light brown hair: druidcatkultiran_green
(@CatForm,         @KulTiran,   4, 2, 94194), -- grey hair: druidcatkultiran_light
(@CatForm,         @KulTiran,   5, 2, 94194), -- light blonde hair: druidcatkultiran_light
(@CatForm,         @KulTiran,   6, 2, 94194), -- dark blonde hair: druidcatkultiran_light
(@BearForm,        @KulTiran,   0, 2, 94187), -- dark brown hair: druidbearkultiran_brown
(@BearForm,        @KulTiran,   1, 2, 94188), -- black hair: druidbearkultiran_dark
(@BearForm,        @KulTiran,   2, 2, 94189), -- red hair: druidbearkultiran_green
(@BearForm,        @KulTiran,   3, 2, 94189), -- light brown hair: druidbearkultiran_green
(@BearForm,        @KulTiran,   4, 2, 94190), -- grey hair: druidbearkultiran_light
(@BearForm,        @KulTiran,   5, 2, 94190), -- light blonde hair: druidbearkultiran_light
(@BearForm,        @KulTiran,   6, 2, 94190), -- dark blonde hair: druidbearkultiran_light
(@DireBearForm,    @KulTiran,   0, 2, 33651), -- black hair: DruidBearKul TiranBlack
(@DireBearForm,    @KulTiran,   1, 2, 33650), -- light brown hair: DruidBearKul Tiran
(@DireBearForm,    @KulTiran,   2, 2, 33652), -- brown hair: DruidBearKul TiranBrown
(@DireBearForm,    @KulTiran,   3, 2, 33654), -- red hair: DruidBearKul TiranWhite
(@DireBearForm,    @KulTiran,   4, 2, 33653), -- dark blonde hair: DruidBearKul TiranTan
(@MoonkinForm,     @KulTiran,   0, 2, 94199), -- dark brown hair: kultiranmoonkin_noarmor
(@MoonkinForm,     @KulTiran,   1, 2, 94200), -- black hair: kultiranmoonkin_black
(@MoonkinForm,     @KulTiran,   2, 2, 94202), -- red hair: kultiranmoonkin_red
(@MoonkinForm,     @KulTiran,   3, 2, 94202), -- light brown hair: kultiranmoonkin_red
(@MoonkinForm,     @KulTiran,   4, 2, 94201), -- grey hair: kultiranmoonkin_pale
(@MoonkinForm,     @KulTiran,   5, 2, 94201), -- light blonde hair: kultiranmoonkin_pale
(@MoonkinForm,     @KulTiran,   6, 2, 94201), -- dark blonde hair: kultiranmoonkin_pale
(@SwiftFlightForm, @KulTiran,   0, 2, 94195), -- dark brown hair: druidflightkultiran_brown
(@SwiftFlightForm, @KulTiran,   1, 2, 94196), -- black hair: druidflightkultiran_dark
(@SwiftFlightForm, @KulTiran,   2, 2, 94197), -- red hair: druidflightkultiran_green
(@SwiftFlightForm, @KulTiran,   3, 2, 94197), -- light brown hair: druidflightkultiran_green
(@SwiftFlightForm, @KulTiran,   4, 2, 94198), -- grey hair: druidflightkultiran_light
(@SwiftFlightForm, @KulTiran,   5, 2, 94198), -- light blonde hair: druidflightkultiran_light
(@SwiftFlightForm, @KulTiran,   6, 2, 94198), -- dark blonde hair: druidflightkultiran_light
(@FlightForm,      @KulTiran,   0, 2, 94195), -- dark brown hair: druidflightkultiran_brown
(@FlightForm,      @KulTiran,   1, 2, 94196), -- black hair: druidflightkultiran_dark
(@FlightForm,      @KulTiran,   2, 2, 94197), -- red hair: druidflightkultiran_green
(@FlightForm,      @KulTiran,   3, 2, 94197), -- light brown hair: druidflightkultiran_green
(@FlightForm,      @KulTiran,   4, 2, 94198), -- grey hair: druidflightkultiran_light
(@FlightForm,      @KulTiran,   5, 2, 94198), -- light blonde hair: druidflightkultiran_light
(@FlightForm,      @KulTiran,   6, 2, 94198), -- dark blonde hair: druidflightkultiran_light
(@TravelForm,      @KulTiran,   0, 2, 94203), -- dark brown hair: druidtravelkultiranblue
(@TravelForm,      @KulTiran,   1, 2, 94204), -- black hair: druidtravelkultiranbrown
(@TravelForm,      @KulTiran,   2, 2, 94205), -- red hair: druidtravelkultirangreen
(@TravelForm,      @KulTiran,   3, 2, 94205), -- light brown hair: druidtravelkultirangreen
(@TravelForm,      @KulTiran,   4, 2, 94206), -- grey hair: druidtravelkultiranwhite
(@TravelForm,      @KulTiran,   5, 2, 94206), -- light blonde hair: druidtravelkultiranwhite
(@TravelForm,      @KulTiran,   6, 2, 94206), -- dark blonde hair: druidtravelkultiranwhite
(@AquaticForm,     @KulTiran,   0, 2, 94207), -- dark brown hair: druidaquatickultiran_brown
(@AquaticForm,     @KulTiran,   1, 2, 94208), -- black hair: druidaquatickultiran_dark
(@AquaticForm,     @KulTiran,   2, 2, 94209), -- red hair: druidaquatickultiran_green
(@AquaticForm,     @KulTiran,   3, 2, 94209), -- light brown hair: druidaquatickultiran_green
(@AquaticForm,     @KulTiran,   4, 2, 94210), -- grey hair: druidaquatickultiran_light
(@AquaticForm,     @KulTiran,   5, 2, 94210), -- light blonde hair: druidaquatickultiran_light
(@AquaticForm,     @KulTiran,   6, 2, 94210), -- dark blonde hair: druidaquatickultiran_light
(@TreeForm,        @KulTiran, 255, 2, 94214); -- Model ID: druidtreeformkultiran
