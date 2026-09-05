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

/* Goblin Druid forms */
(@TravelForm, @Goblin, 255, 2, 45339); -- ModelID: DruidTravelHorde
