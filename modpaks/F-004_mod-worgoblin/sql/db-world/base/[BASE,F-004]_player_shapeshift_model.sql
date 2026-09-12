REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES
/* Cataclysm Druid forms */
/* Worgen Druid forms */
(@CatForm, @Worgen, 0, 2, 33661), -- black hair: DruidCatSkinWorgenBlack
(@CatForm, @Worgen, 1, 2, 33660), -- light brown hair: DruidCatSkinWorgen
(@CatForm, @Worgen, 2, 2, 33662), -- brown hair: DruidCatSkinWorgenBrown
(@CatForm, @Worgen, 3, 2, 33663), -- red hair: DruidCatSkinWorgenWhite
(@CatForm, @Worgen, 4, 2, 33664), -- dark blonde hair: DruidCatSkinWorgenYellow
(@BearForm, @Worgen, 0, 2, 33651), -- black hair: DruidBearWorgenBlack
(@BearForm, @Worgen, 1, 2, 33650), -- light brown hair: DruidBearWorgen
(@BearForm, @Worgen, 2, 2, 33652), -- brown hair: DruidBearWorgenBrown
(@BearForm, @Worgen, 3, 2, 33654), -- red hair: DruidBearWorgenWhite
(@BearForm, @Worgen, 4, 2, 33653), -- dark blonde hair: DruidBearWorgenTan
(@DireBearForm, @Worgen, 0, 2, 33651), -- black hair: DruidBearWorgenBlack
(@DireBearForm, @Worgen, 1, 2, 33650), -- light brown hair: DruidBearWorgen
(@DireBearForm, @Worgen, 2, 2, 33652), -- brown hair: DruidBearWorgenBrown
(@DireBearForm, @Worgen, 3, 2, 33654), -- red hair: DruidBearWorgenWhite
(@DireBearForm, @Worgen, 4, 2, 33653), -- dark blonde hair: DruidBearWorgenTan
(@MoonkinForm, @Worgen, 255, 2, 37173), -- ModelID: DruidOwlBearBlackSkin, DruidOwlBearBlackSkin2
(@SwiftFlightForm, @Worgen, 255, 2, 37729), -- ModelID: StormCrowDruidSkin
(@FlightForm, @Worgen, 255, 2, 37729); -- ModelID: StormCrowDruidSkin
