REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES
/* Kul Tiran Druid forms */
(@CatForm,         @KulTiran,   0, 2, @DruidCatKulTiranBrownDisplay), -- dark brown hair: druidcatkultiran_brown
(@CatForm,         @KulTiran,   1, 2, @DruidCatKulTiranDarkDisplay),  -- black hair: druidcatkultiran_dark
(@CatForm,         @KulTiran,   2, 2, @DruidCatKulTiranGreenDisplay), -- red hair: druidcatkultiran_green
(@CatForm,         @KulTiran,   3, 2, @DruidCatKulTiranGreenDisplay), -- light brown hair: druidcatkultiran_green
(@CatForm,         @KulTiran,   4, 2, @DruidCatKulTiranLightDisplay), -- grey hair: druidcatkultiran_light
(@CatForm,         @KulTiran,   5, 2, @DruidCatKulTiranLightDisplay), -- light blonde hair: druidcatkultiran_light
(@CatForm,         @KulTiran,   6, 2, @DruidCatKulTiranLightDisplay), -- dark blonde hair: druidcatkultiran_light
(@BearForm,        @KulTiran,   0, 2, @DruidBearKulTiranBrownDisplay), -- dark brown hair: druidbearkultiran_brown
(@BearForm,        @KulTiran,   1, 2, @DruidBearKulTiranDarkDisplay),  -- black hair: druidbearkultiran_dark
(@BearForm,        @KulTiran,   2, 2, @DruidBearKulTiranGreenDisplay), -- red hair: druidbearkultiran_green
(@BearForm,        @KulTiran,   3, 2, @DruidBearKulTiranGreenDisplay), -- light brown hair: druidbearkultiran_green
(@BearForm,        @KulTiran,   4, 2, @DruidBearKulTiranLightDisplay), -- grey hair: druidbearkultiran_light
(@BearForm,        @KulTiran,   5, 2, @DruidBearKulTiranLightDisplay), -- light blonde hair: druidbearkultiran_light
(@BearForm,        @KulTiran,   6, 2, @DruidBearKulTiranLightDisplay), -- dark blonde hair: druidbearkultiran_light
(@DireBearForm,    @KulTiran,   0, 2, @DruidBearKulTiranBrownDisplay), -- dark brown hair: druidbearkultiran_brown
(@DireBearForm,    @KulTiran,   1, 2, @DruidBearKulTiranDarkDisplay),  -- black hair: druidbearkultiran_dark
(@DireBearForm,    @KulTiran,   2, 2, @DruidBearKulTiranGreenDisplay), -- red hair: druidbearkultiran_green
(@DireBearForm,    @KulTiran,   3, 2, @DruidBearKulTiranGreenDisplay), -- light brown hair: druidbearkultiran_green
(@DireBearForm,    @KulTiran,   4, 2, @DruidBearKulTiranLightDisplay), -- grey hair: druidbearkultiran_light
(@DireBearForm,    @KulTiran,   5, 2, @DruidBearKulTiranLightDisplay), -- light blonde hair: druidbearkultiran_light
(@DireBearForm,    @KulTiran,   6, 2, @DruidBearKulTiranLightDisplay), -- dark blonde hair: druidbearkultiran_light
(@MoonkinForm,     @KulTiran,   0, 2, @DruidMoonkinKulTiranDisplay),      -- dark brown hair: kultiranmoonkin_noarmor
(@MoonkinForm,     @KulTiran,   1, 2, @DruidMoonkinKulTiranBlackDisplay), -- black hair: kultiranmoonkin_black
(@MoonkinForm,     @KulTiran,   2, 2, @DruidMoonkinKulTiranPaleDisplay),  -- red hair: kultiranmoonkin_red
(@MoonkinForm,     @KulTiran,   3, 2, @DruidMoonkinKulTiranPaleDisplay),  -- light brown hair: kultiranmoonkin_red
(@MoonkinForm,     @KulTiran,   4, 2, @DruidMoonkinKulTiranRedDisplay),   -- grey hair: kultiranmoonkin_pale
(@MoonkinForm,     @KulTiran,   5, 2, @DruidMoonkinKulTiranRedDisplay),   -- light blonde hair: kultiranmoonkin_pale
(@MoonkinForm,     @KulTiran,   6, 2, @DruidMoonkinKulTiranRedDisplay),   -- dark blonde hair: kultiranmoonkin_pale
(@SwiftFlightForm, @KulTiran,   0, 2, @DruidFlightKulTiranBrownDisplay), -- dark brown hair: druidflightkultiran_brown
(@SwiftFlightForm, @KulTiran,   1, 2, @DruidFlightKulTiranDarkDisplay),  -- black hair: druidflightkultiran_dark
(@SwiftFlightForm, @KulTiran,   2, 2, @DruidFlightKulTiranGreenDisplay), -- red hair: druidflightkultiran_green
(@SwiftFlightForm, @KulTiran,   3, 2, @DruidFlightKulTiranGreenDisplay), -- light brown hair: druidflightkultiran_green
(@SwiftFlightForm, @KulTiran,   4, 2, @DruidFlightKulTiranLightDisplay), -- grey hair: druidflightkultiran_light
(@SwiftFlightForm, @KulTiran,   5, 2, @DruidFlightKulTiranLightDisplay), -- light blonde hair: druidflightkultiran_light
(@SwiftFlightForm, @KulTiran,   6, 2, @DruidFlightKulTiranLightDisplay), -- dark blonde hair: druidflightkultiran_light
(@FlightForm,      @KulTiran,   0, 2, @DruidFlightKulTiranBrownDisplay), -- dark brown hair: druidflightkultiran_brown
(@FlightForm,      @KulTiran,   1, 2, @DruidFlightKulTiranDarkDisplay),  -- black hair: druidflightkultiran_dark
(@FlightForm,      @KulTiran,   2, 2, @DruidFlightKulTiranGreenDisplay), -- red hair: druidflightkultiran_green
(@FlightForm,      @KulTiran,   3, 2, @DruidFlightKulTiranGreenDisplay), -- light brown hair: druidflightkultiran_green
(@FlightForm,      @KulTiran,   4, 2, @DruidFlightKulTiranLightDisplay), -- grey hair: druidflightkultiran_light
(@FlightForm,      @KulTiran,   5, 2, @DruidFlightKulTiranLightDisplay), -- light blonde hair: druidflightkultiran_light
(@FlightForm,      @KulTiran,   6, 2, @DruidFlightKulTiranLightDisplay), -- dark blonde hair: druidflightkultiran_light
(@TravelForm,      @KulTiran,   0, 2, @DruidTravelKulTiranBlueDisplay),  -- dark brown hair: druidtravelkultiranblue
(@TravelForm,      @KulTiran,   1, 2, @DruidTravelKulTiranBrownDisplay), -- black hair: druidtravelkultiranbrown
(@TravelForm,      @KulTiran,   2, 2, @DruidTravelKulTiranGreenDisplay), -- red hair: druidtravelkultirangreen
(@TravelForm,      @KulTiran,   3, 2, @DruidTravelKulTiranGreenDisplay), -- light brown hair: druidtravelkultirangreen
(@TravelForm,      @KulTiran,   4, 2, @DruidTravelKulTiranWhiteDisplay), -- grey hair: druidtravelkultiranwhite
(@TravelForm,      @KulTiran,   5, 2, @DruidTravelKulTiranWhiteDisplay), -- light blonde hair: druidtravelkultiranwhite
(@TravelForm,      @KulTiran,   6, 2, @DruidTravelKulTiranWhiteDisplay), -- dark blonde hair: druidtravelkultiranwhite
(@AquaticForm,     @KulTiran,   0, 2, @DruidAquaticKulTiranBrownDisplay), -- dark brown hair: druidaquatickultiran_brown
(@AquaticForm,     @KulTiran,   1, 2, @DruidAquaticKulTiranDarkDisplay),  -- black hair: druidaquatickultiran_dark
(@AquaticForm,     @KulTiran,   2, 2, @DruidAquaticKulTiranGreenDisplay), -- red hair: druidaquatickultiran_green
(@AquaticForm,     @KulTiran,   3, 2, @DruidAquaticKulTiranGreenDisplay), -- light brown hair: druidaquatickultiran_green
(@AquaticForm,     @KulTiran,   4, 2, @DruidAquaticKulTiranLightDisplay), -- grey hair: druidaquatickultiran_light
(@AquaticForm,     @KulTiran,   5, 2, @DruidAquaticKulTiranLightDisplay), -- light blonde hair: druidaquatickultiran_light
(@AquaticForm,     @KulTiran,   6, 2, @DruidAquaticKulTiranLightDisplay), -- dark blonde hair: druidaquatickultiran_light
(@TreeForm,        @KulTiran, 255, 2, @DruidTreeKulTiranDisplay); -- Model ID: druidtreeformkultiran
