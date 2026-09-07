REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES
/* Ogres copy Tauren */
(@CatForm, @Ogre, 255, 2, 8571), -- ModelID
(@BearForm, @Ogre, 255,	2, 2289), -- ModelID
(@DireBearForm, @Ogre, 255, 2, 2289), -- ModelID
(@SwiftFlightForm, @Ogre, 255, 2, 21244), -- ModelID
(@FlightForm, @Ogre, 255, 2, 20872), -- ModelID
(@TravelForm, @Ogre, 255, 2, 45339); -- ModelID: DruidTravelHorde
