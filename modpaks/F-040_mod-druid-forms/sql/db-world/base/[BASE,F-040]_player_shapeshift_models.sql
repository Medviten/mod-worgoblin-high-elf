-- Moved from Worgoblin (not really relevant to that module)
REPLACE INTO `player_shapeshift_model` (
    `ShapeshiftID`, -- ID from SpellShapeshiftForm.dbc or spellshapeshiftform_dbc
    `RaceID`, -- ID from ChrRaces.dbc or chrraces_dbc
    `CustomizationID`, -- hair colour or skin colour
    `GenderID`, -- 0: male, 1: female, 2: both
    `ModelID` -- ID from CreatureDisplayInfo.dbc or creaturedisplayinfo_dbc (*not* from CreatureModelData.dbc!)
) VALUES

/* Human Druid forms */
(@TravelForm,      @Human,     255,       2, 40816), -- ModelID: DruidTravelAlliance

/* Orc Druid forms */
(@TravelForm,      @Orc,       255,       2, 45339), -- ModelID: DruidTravelHorde

/* Dwarf Druid forms */
(@TravelForm,      @Dwarf,     255,       2, 40816), -- ModelID: DruidTravelAlliance

/* Night Elf Druid forms */
(@TravelForm,      @NightElf,  255,       2, 40816), -- ModelID: DruidTravelAlliance

/* Undead Druid Forms */
(@TreeForm,        @Undead,    255,   @Male, 94144), -- ModelID: EntSkinDead
(@TreeForm,        @Undead,    255, @Female, 94141), -- ModelID: EntSkinDiseased
(@BearForm,        @Undead,    255,       2, 94139), -- ModelID: BearSkinBrownDiseased
(@BearForm,        @Undead,      0,       2, 94140), -- ModelID: BearSkinWhiteDiseased
(@AquaticForm,     @Undead,    255,       2, 94143), -- ModelID: SharkSkinPurple
(@FlightForm,      @Undead,    255,       2, 10007), -- ModelID: DragonWhelpSkinDiseased
(@SwiftFlightForm, @Undead,    255,       2, 10007), -- ModelID: DragonWhelpSkinDiseased
(@TravelForm,      @Undead,    255,       2, 45339), -- ModelID: DruidTravelHorde

/* Tauren Druid forms */
(@TravelForm,      @Tauren,   255,        2, 45339), -- ModelID: DruidTravelHorde

/* Gnome Druid Forms */
(@TreeForm,        @Gnome,      1,        2, 94146), -- brown hair: LasherOrchidSkinBrown
(@TreeForm,        @Gnome,      2,        2, 94146), -- gray hair: LasherOrchidSkinBrown
(@TreeForm,        @Gnome,      3,        2, 94146), -- white hair: LasherOrchidSkinBrown
(@TreeForm,        @Gnome,      4,        2, 94146), -- gray hair: LasherOrchidSkinBrown
(@TreeForm,        @Gnome,      5,        2, 94147), -- red hair: LasherOrchidSkinPurple
(@TreeForm,        @Gnome,      8,        2, 94147), -- pink hair: LasherOrchidSkinPurple
(@TreeForm,        @Gnome,      9,        2, 94147), -- black hair: LasherOrchidSkinPurple
(@TreeForm,        @Gnome,    255,        2, 94145), -- ModelID: LasherOrchidSkinGreen
(@BearForm,        @Gnome,    255,        2, 23946), -- ModelID: PolarBearCubSkin
(@DireBearForm,    @Gnome,    255,        2, 23946), -- ModelID: PolarBearCubSkin
(@MoonkinForm,     @Gnome,    255,        2, 24978), -- ModelID: NorthrendPenguin01
(@TravelForm,      @Gnome,    255,        2, 40816), -- ModelID: DruidTravelAlliance

/* Troll Druid forms */
(@CatForm,         @Troll,      0,        2, 33665), -- pink hair: DruidCatTrollSkinBlack
(@CatForm,         @Troll,      1,        2, 33668), -- red hair: DruidCatTrollSkinRed
(@CatForm,         @Troll,      2,        2, 33668), -- orange hair: DruidCatTrollSkinRed
(@CatForm,         @Troll,      3,        2, 33667), -- yellow hair: DruidCatTrollSkinGreen
(@CatForm,         @Troll,      4,        2, 33666), -- green hair: DruidCatTrollSkinBlue
(@CatForm,         @Troll,      5,        2, 33666), -- blue-green hair: DruidCatTrollSkinBlue
(@CatForm,         @Troll,      6,        2, 33666), -- blue hair: DruidCatTrollSkinBlue
(@CatForm,         @Troll,      7,        2, 33666), -- purple hair: DruidCatTrollSkinBlue
(@CatForm,         @Troll,      8,        2, 33669), -- gray hair: DruidCatTrollSkinWhite
(@CatForm,         @Troll,      9,        2, 33669), -- white hair: DruidCatTrollSkinWhite
(@BearForm,        @Troll,      0,        2, 33656), -- pink hair: DruidBearTrollPurple
(@BearForm,        @Troll,      1,        2, 33657), -- red hair: DruidBearTrollRed
(@BearForm,        @Troll,      2,        2, 33657), -- orange hair: DruidBearTrollRed
(@BearForm,        @Troll,      3,        2, 33659), -- yellow hair: DruidBearTrollYellow
(@BearForm,        @Troll,      4,        2, 33655), -- green hair: DruidBearTrollBlue
(@BearForm,        @Troll,      5,        2, 33655), -- blue-green hair: DruidBearTrollBlue
(@BearForm,        @Troll,      6,        2, 33655), -- blue hair: DruidBearTrollBlue
(@BearForm,        @Troll,      7,        2, 33655), -- purple hair: DruidBearTrollBlue
(@BearForm,        @Troll,      8,        2, 33658), -- gray hair: DruidBearTrollWhite
(@BearForm,        @Troll,      9,        2, 33658), -- white hair: DruidBearTrollWhite
(@DireBearForm,    @Troll,      0,        2, 33656), -- pink hair: DruidBearTrollPurple
(@DireBearForm,    @Troll,      1,        2, 33657), -- red hair: DruidBearTrollRed
(@DireBearForm,    @Troll,      2,        2, 33657), -- orange hair: DruidBearTrollRed
(@DireBearForm,    @Troll,      3,        2, 33659), -- yellow hair: DruidBearTrollYellow
(@DireBearForm,    @Troll,      4,        2, 33655), -- green hair: DruidBearTrollBlue
(@DireBearForm,    @Troll,      5,        2, 33655), -- blue-green hair: DruidBearTrollBlue
(@DireBearForm,    @Troll,      6,        2, 33655), -- blue hair: DruidBearTrollBlue
(@DireBearForm,    @Troll,      7,        2, 33655), -- purple hair: DruidBearTrollBlue
(@DireBearForm,    @Troll,      8,        2, 33658), -- gray hair: DruidBearTrollWhite
(@DireBearForm,    @Troll,      9,        2, 33658), -- white hair: DruidBearTrollWhite
(@TreeForm,        @Troll,    255,        2, 37166), -- ModelID: DruidTreeFormOrange
(@MoonkinForm,     @Troll,    255,        2, 37174), -- ModelID: DruidOwlBearRedSkin, DruidOwlBearRedSkin2
(@FlightForm,      @Troll,    255,        2, 94216), -- ModelID: DruidFlightTroll1, DruidFlightTroll2
(@SwiftFlightForm, @Troll,    255,        2, 37730), -- ModelID: EpicDruidFlightTroll1, EpicDruidFlightTroll2
(@TravelForm,      @Troll,    255,        2, 45339), -- ModelID: DruidTravelHorde

/* Goblin Druid forms */
(@TravelForm,      @Goblin,   255,        2, 45339), -- ModelID: DruidTravelHorde

/* Blood Elf Druid forms */
(@TravelForm,      @BloodElf, 255,        2, 45339), -- ModelID: DruidTravelHorde

/* Draenei Druid forms */
(@TravelForm,      @Draenei,  255,        2, 40816), -- ModelID: DruidTravelAlliance

/* Worgen Druid forms */
(@TravelForm,      @Worgen,   255,        2, 40816), -- ModelID: DruidTravelAlliance

/* High Elf Druid forms */
(@TravelForm,      @HighElf,  255,        2, 40816), -- ModelID: DruidTravelAlliance
