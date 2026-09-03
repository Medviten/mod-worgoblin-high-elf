REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES
/* Cataclysm Druid forms */
/* Worgen Druid forms */
(@TreeForm, @Worgen, 255, 2, 37164), -- ModelID: DruidTreeFormRed
(@TravelForm, @Worgen, 255, 2, 40816), -- ModelID: DruidTravelAlliance

/* Troll Druid forms */
(@CatForm, @Troll, 0, 2, 33665), -- pink hair: DruidCatTrollSkinBlack
(@CatForm, @Troll, 1, 2, 33668), -- red hair: DruidCatTrollSkinRed
(@CatForm, @Troll, 2, 2, 33668), -- orange hair: DruidCatTrollSkinRed
(@CatForm, @Troll, 3, 2, 33667), -- yellow hair: DruidCatTrollSkinGreen
(@CatForm, @Troll, 4, 2, 33666), -- green hair: DruidCatTrollSkinBlue
(@CatForm, @Troll, 5, 2, 33666), -- blue-green hair: DruidCatTrollSkinBlue
(@CatForm, @Troll, 6, 2, 33666), -- blue hair: DruidCatTrollSkinBlue
(@CatForm, @Troll, 7, 2, 33666), -- purple hair: DruidCatTrollSkinBlue
(@CatForm, @Troll, 8, 2, 33669), -- gray hair: DruidCatTrollSkinWhite
(@CatForm, @Troll, 9, 2, 33669), -- white hair: DruidCatTrollSkinWhite
(@BearForm, @Troll, 0, 2, 33656), -- pink hair: DruidBearTrollPurple
(@BearForm, @Troll, 1, 2, 33657), -- red hair: DruidBearTrollRed
(@BearForm, @Troll, 2, 2, 33657), -- orange hair: DruidBearTrollRed
(@BearForm, @Troll, 3, 2, 33659), -- yellow hair: DruidBearTrollYellow
(@BearForm, @Troll, 4, 2, 33655), -- green hair: DruidBearTrollBlue
(@BearForm, @Troll, 5, 2, 33655), -- blue-green hair: DruidBearTrollBlue
(@BearForm, @Troll, 6, 2, 33655), -- blue hair: DruidBearTrollBlue
(@BearForm, @Troll, 7, 2, 33655), -- purple hair: DruidBearTrollBlue
(@BearForm, @Troll, 8, 2, 33658), -- gray hair: DruidBearTrollWhite
(@BearForm, @Troll, 9, 2, 33658), -- white hair: DruidBearTrollWhite
(@DireBearForm, @Troll, 0, 2, 33656), -- pink hair: DruidBearTrollPurple
(@DireBearForm, @Troll, 1, 2, 33657), -- red hair: DruidBearTrollRed
(@DireBearForm, @Troll, 2, 2, 33657), -- orange hair: DruidBearTrollRed
(@DireBearForm, @Troll, 3, 2, 33659), -- yellow hair: DruidBearTrollYellow
(@DireBearForm, @Troll, 4, 2, 33655), -- green hair: DruidBearTrollBlue
(@DireBearForm, @Troll, 5, 2, 33655), -- blue-green hair: DruidBearTrollBlue
(@DireBearForm, @Troll, 6, 2, 33655), -- blue hair: DruidBearTrollBlue
(@DireBearForm, @Troll, 7, 2, 33655), -- purple hair: DruidBearTrollBlue
(@DireBearForm, @Troll, 8, 2, 33658), -- gray hair: DruidBearTrollWhite
(@DireBearForm, @Troll, 9, 2, 33658), -- white hair: DruidBearTrollWhite
(@MoonkinForm, @Troll, 255, 2, 37174), -- ModelID: DruidOwlBearRedSkin, DruidOwlBearRedSkin2
(@SwiftFlightForm, @Troll, 255, 2, 37730), -- ModelID: EpicDruidFlightTroll1, EpicDruidFlightTroll2
(@FlightForm, @Troll, 255, 2, 94216), -- ModelID: DruidFlightTroll1, DruidFlightTroll2
(@TreeForm, @Troll, 255, 2, 37166), -- ModelID: DruidTreeFormOrange
(@TravelForm, @Troll, 255, 2, 45339), -- ModelID: DruidTravelHorde

/* Goblin Druid forms */
(@TravelForm, @Goblin, 255, 2, 45339); -- ModelID: DruidTravelHorde
