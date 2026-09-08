-- Miscellaneous
SET @Male                             =    0;
SET @Female                           =    1;
SET @Skin                             =    0;
SET @Face                             =    1;
SET @FacialHair                       =    2;
SET @Hair                             =    3;
SET @Underwear                        =    4;

-- Playable Races
SET @Human                            =    1;
SET @Orc                              =    2;
SET @Dwarf                            =    3;
SET @NightElf                         =    4;
SET @Undead                           =    5;
SET @Tauren                           =    6;
SET @Gnome                            =    7;
SET @Troll                            =    8;
SET @Goblin                           =    9;
SET @BloodElf                         =   10;
SET @Draenei                          =   11;
SET @Worgen                           =   12;
SET @HighElf                          =   13;
SET @MagharOrc                        =   14;
SET @Ogre                             =   15;
SET @DarkIronDwarf                    =   16;
SET @ZandalariTroll                   =   17;
SET @Gilnean                          =   23;

-- NPC Races
SET @FelOrc                           =   32;
SET @Naga                             =   33;
SET @Broken                           =   34;
SET @Skeleton                         =   35;
SET @Vrykul                           =   36;
SET @Tuskarr                          =   37;
SET @ForestTroll                      =   38;
SET @Taunka                           =   39;
SET @NorthrendSkeleton                =   40;
SET @IceTroll                         =   41;

-- RaceMasks
SET @HumanMask                        = 1 << (@Human          - 1);  -- race ID 1  → 1
SET @OrcMask                          = 1 << (@Orc            - 1);  -- race ID 2  → 2
SET @DwarfMask                        = 1 << (@Dwarf          - 1);  -- race ID 3  → 4
SET @NightElfMask                     = 1 << (@NightElf       - 1);  -- race ID 4  → 8
SET @UndeadMask                       = 1 << (@Undead         - 1);  -- race ID 5  → 16
SET @TaurenMask                       = 1 << (@Tauren         - 1);  -- race ID 6  → 32
SET @GnomeMask                        = 1 << (@Gnome          - 1);  -- race ID 7  → 64
SET @TrollMask                        = 1 << (@Troll          - 1);  -- race ID 8  → 128
SET @GoblinMask                       = 1 << (@Goblin         - 1);  -- race ID 9  → 256
SET @BloodElfMask                     = 1 << (@BloodElf       - 1);  -- race ID 10 → 512
SET @DraeneiMask                      = 1 << (@Draenei        - 1);  -- race ID 11 → 1024
SET @WorgenMask                       = 1 << (@Worgen         - 1);  -- race ID 12 → 2048
SET @HighElfMask                      = 1 << (@HighElf        - 1);  -- race ID 13 → 4096
SET @MagharOrcMask                    = 1 << (@MagharOrc      - 1);  -- race ID 14 → 8192
SET @OgreMask                         = 1 << (@Ogre           - 1);  -- race ID 15 → 16384
SET @DarkIronDwarfMask                = 1 << (@DarkIronDwarf  - 1);  -- race ID 16 → 32768
SET @ZandalariTrollMask               = 1 << (@ZandalariTroll - 1);  -- race ID 17 → 65536
SET @GilneanMask                      = 1 << (@Gilnean        - 1);  -- race ID 23 → 4194304

-- New Race Models
SET @WorgenMaleModel                  =  3141; -- bipedal
SET @WorgenFemaleModel                =  3142; -- bipedal
SET @WorgenWildMaleModel              =  3626; -- quadrupedal
SET @WorgenWildFemaleModel            =  3627; -- quadrupedal
SET @GilneanMaleModel                 =    49; -- human
SET @GilneanFemaleModel               =    50; -- human
SET @HighElfMaleModel                 =  2208; -- blood elf
SET @HighElfFemaleModel               =  2209; -- blood elf
SET @MagharOrcMaleModel               =    51; -- orc
SET @MagharOrcFemaleModel             =    52; -- orc
SET @OgreMaleModel                    =  4892; -- one head (physical type)
SET @OgreFemaleModel                  =  4893; -- two heads (magic type)
SET @DarkIronDwarfMaleModel           = 40000; -- backport from
SET @DarkIronDwarfFemaleModel         = 40001; -- Shadowlands
SET @ZandalariTrollMaleModel          = 40002; -- backport from
SET @ZandalariTrollFemaleModel        = 40003; -- Shadowlands


-- Display IDs
SET @WorgenMaleDisplay                =  29422;
SET @WorgenFemaleDisplay              =  29423;
SET @WorgenWildMaleDisplay            =  94133;
SET @WorgenWildFemaleDisplay          =  94134;
SET @GilneanMaleDisplay               =  94135;
SET @GilneanFemaleDisplay             =  94136;
SET @HighElfMaleDisplay               =  94222;
SET @HighElfFemaleDisplay             =  94223;
SET @MagharOrcMaleDisplay             =  94226;
SET @MagharOrcFemaleDisplay           =  94227;
SET @OgreMaleDisplay                  =  62110;
SET @OgreFemaleDisplay                =  62111;
SET @DarkIronDwarfMaleDisplay         =  40000;
SET @DarkIronDwarfFemaleDisplay       =  40001;
SET @ZandalariTrollMaleDisplay        =  40002;
SET @ZandalariTrollFemaleDisplay      =  40003;

-- CreatureDisplayInfoExtra
SET @WorgenMaleDisplayExtra           =  45424;
SET @WorgenFemaleDisplayExtra         =  45425;
SET @GilneanMaleDisplayExtra          =  13749;
SET @GilneanFemaleDisplayExtra        =  13750;
SET @HighElfMaleDisplayExtra          =  45433;
SET @HighElfFemaleDisplayExtra        =  45434;
SET @MagharOrcMaleDisplayExtra        =  45437;
SET @MagharOrcFemaleDisplayExtra      =  45438;
SET @OgreMaleDisplayExtra             =  45439;
SET @OgreFemaleDisplayExtra           =  45440;
SET @DarkIronDwarfMaleDisplayExtra    =  45441;
SET @DarkIronDwarfFemaleDisplayExtra  =  45442;
SET @ZandalariTrollMaleDisplayExtra   =  45441;
SET @ZandalariTrollFemaleDisplayExtra =  45442;

-- creature_template
SET @WorgenWildMaleTemplate           =  55274;
SET @WorgenWildFemaleTemplate         =  55275;
SET @GilneanMaleTemplate              =  55276;
SET @GilneanFemaleTemplate            =  55277;

-- Racial skills
SET @WorgenRacials                    =    789;
SET @GoblinRacials                    =    790;
SET @HighElfRacials                   =    791;
SET @MagharOrcRacials                 =    792;
SET @OgreRacials                      =    793;
SET @DarkIronDwarfRacials             =    794;
SET @ZandalariTrollRacials            =    795;

-- Racial spells
SET @WorgenRacial1                    =  68975; -- Viciousness
SET @WorgenRacial2                    =  68976; -- Aberration
SET @WorgenRacial3                    =  68978; -- Flayer
SET @WorgenRacial4                    =  68992; -- Darkflight
SET @GoblinRacial1                    =  69041; -- Rocket Barrage
SET @GoblinRacial2                    =  69042; -- Time is Money
SET @GoblinRacial3                    =  69044; -- Best Deals Anywhere
SET @GoblinRacial4                    =  69045; -- Better Living Through Chemistry
SET @GoblinRacial5                    =  69046; -- Pack Hobgoblin
SET @GoblinRacial6                    =  69070; -- Rocket Jump
SET @HighElfRacial1                   = 110005; -- Quel’dorei Meditation (non-DK)
SET @HighElfRacial2                   = 110006; -- Swiftness of the Rangers
SET @HighElfRacial3                   = 110007; -- Quel’dorei Meditation (DK)
SET @HighElfRacial4                   = 110008; -- Bow Specialization
SET @HighElfRacial5                   = 110009; -- Enchanting Specialization
SET @MagharOrcRacial1                 = 110001; -- Ancestral Call
SET @MagharOrcRacial2                 = 110002; -- Savage Blood
SET @MagharOrcRacial3                 = 110003; -- Sympathetic Vigor
SET @MagharOrcRacial4                 = 110004; -- Unwavering Will (maybe change to Open Skies: 10% mounted speed boost?)
-- SET @OgreRacial1
-- SET @DarkIronDwarfRacial1
-- SET @ZandalariTrollRacial1

-- Faction Masks
SET @BaseAllianceMask                 = @HumanMask        | @DwarfMask  | @NightElfMask  | @GnomeMask  | @DraeneiMask;
SET @BaseHordeMask                    = @OrcMask          | @UndeadMask | @TaurenMask    | @TrollMask  | @BloodElfMask;
SET @AllianceMask                     = @BaseAllianceMask | @WorgenMask | @HighElfMask   | @DarkIronDwarfMask;
SET @HordeMask                        = @BaseHordeMask    | @GoblinMask | @MagharOrcMask | @OgreMask   | @ZandalariTrollMask;
SET @UndercityMask                    = @UndeadMask   | @BloodElfMask; -- Mostly for easy reputation split
SET @BarrensBros                      = @HordeMask    & ~@UndercityMask; -- Mostly for easy reputation split
SET @PlayableRaceMask                 = @AllianceMask | @HordeMask;

-- PLAYER factions
SET @HumanPlayer                      =    1;
SET @OrcPlayer                        =    2;
SET @DwarfPlayer                      =    3;
SET @NightElfPlayer                   =    4;
SET @UndeadPlayer                     =    5;
SET @TaurenPlayer                     =    6;
SET @GnomePlayer                      =    8;
SET @TrollPlayer                      =    9;
SET @BloodElfPlayer                   =  914;
SET @DraeneiPlayer                    =  927;
SET @GoblinPlayer                     = 1162;
SET @WorgenPlayer                     = 1163;
SET @HighElfPlayer                    = 1161;
SET @MagharOrcPlayer                  = 1166;
SET @OgrePlayer                       = 1169;
SET @DarkIronDwarfPlayer              = 1172;
SET @ZandalariTrollPlayer             = 1174;

-- Faction templates
SET @GoblinFactionTemplate            = 2238; -- References @GoblinPlayer
SET @WorgenFactionTemplate            = 2239; -- References @WorgenPlayer
SET @HighElfFactionTemplate           = 2237; -- References @HighElfPlayer
SET @MagharOrcFactionTemplate         = 2240; -- References @MagharOrcPlayer
SET @OgreFactionTemplate              = 2241; -- References @OgrePlayer
SET @DarkIronDwarfFactionTemplate     = 2242; -- References @DarkIronDwarfPlayer
SET @ZandalariTrollFactionTemplate    = 2243; -- References @ZandalariTrollPlayer

-- Race factions
SET @HumanFaction                     =   72; -- Stormwind
SET @OrcFaction                       =   76; -- Orgrimmar
SET @DwarfFaction                     =   47; -- Ironforge
SET @NightElfFaction                  =   69; -- Darnassus
SET @UndeadFaction                    =   68; -- Undercity
SET @TaurenFaction                    =   81; -- Thunder Bluff
SET @GnomeFaction                     =   54; -- Gnomeregan Exiles
SET @TrollFaction                     =  530; -- Darkspear Trolls
SET @BloodElfFaction                  =  911; -- Silvermoon City
SET @DraeneiFaction                   =  930; -- Exodar
SET @GoblinFaction                    = 1164; -- Bilgewater Cartel
SET @WorgenFaction                    = 1165; -- Gilneas
SET @HighElfFaction                   = 1167; -- High Elf Loyalists
SET @MagharOrcFaction                 = 1168; -- Mag'har of the Horde
SET @OgreFaction                      = 1170; -- Stonemaul Clan
SET @DarkIronDwarfFaction             = 1171; -- Shadowforge City
SET @ZandalariTrollFaction            = 1173; -- Zuldazar

-- Reputation Indices
SET @GoblinFactionRepIndex            = 105;
SET @WorgenFactionRepIndex            = 106;
SET @HighElfFactionRepIndex           = 107;
SET @MagharOrcFactionRepIndex         = 108;
SET @OgreFactionRepIndex              = 109;
SET @DarkIronDwarfFactionRepIndex     = 110;
SET @ZandalariTrollFactionRepIndex    = 111;

-- Helmet RaceMasks
SET @HumanHelmetMask                  = 1 << @Human;          -- race ID 1  → 2
SET @OrcHelmetMask                    = 1 << @Orc;            -- race ID 2  → 4
SET @DwarfHelmetMask                  = 1 << @Dwarf;          -- race ID 3  → 8
SET @NightElfHelmetMask               = 1 << @NightElf;       -- race ID 4  → 16
SET @UndeadHelmetMask                 = 1 << @Undead;         -- race ID 5  → 32
SET @TaurenHelmetMask                 = 1 << @Tauren;         -- race ID 6  → 64
SET @GnomeHelmetMask                  = 1 << @Gnome;          -- race ID 7  → 128
SET @TrollHelmetMask                  = 1 << @Troll;          -- race ID 8  → 256
SET @GoblinHelmetMask                 = 1 << @Goblin;         -- race ID 9  → 512
SET @BloodElfHelmetMask               = 1 << @BloodElf;       -- race ID 10 → 1024
SET @DraeneiHelmetMask                = 1 << @Draenei;        -- race ID 11 → 2048
SET @WorgenHelmetMask                 = 1 << @Worgen;         -- race ID 12 → 4096
SET @HighElfHelmetMask                = 1 << @HighElf;        -- race ID 13 → 8192
SET @MagharOrcHelmetMask              = 1 << @MagharOrc;      -- race ID 14 → 16384
SET @OgreHelmetMask                   = 1 << @Ogre;           -- race ID 15 → 32768
SET @DarkIronDwarfHelmetMask          = 1 << @DarkIronDwarf;  -- race ID 16 → 65536
SET @ZandalariTrollHelmetMask         = 1 << @ZandalariTroll; -- race ID 17 → 131072
SET @GilneanHelmetMask                = 1 << @Gilnean;        -- race ID 23 → 8388608

-- Achievements
SET @KnowThyEnemyAlliance             =   246;
SET @KnowThyEnemyHorde                =  1005;
SET @ShakeYourBunnyMaker              =  2422;
SET @CheckYourHead                    =   291;
SET @GoblinAchievement                =  1429;
SET @WorgenAchievement                =  1430;
SET @HighElfAchievement               =  1431;
SET @MagharOrcAchievement             =  1432;
SET @OgreAchievement                  =  1433;
SET @DarkIronDwarfAchievement         =  1434;
SET @ZandalariTrollAchievement        =  1435;

-- Achievement Criteria
SET @GoblinCriteria1                  = 13471; -- Achievement 1005: Know Thy Enemy
SET @WorgenCriteria1                  = 13472; -- Achievement 246: Know Thy Enemy
SET @GoblinCriteria2                  = 13473; -- Achievement 2422: Shake Your Bunny-Maker
SET @WorgenCriteria2                  = 13474; -- Achievement 2422: Shake Your Bunny-Maker
SET @GoblinCriteria3                  = 13475; -- Achievement 291: Check Your Head
SET @WorgenCriteria3                  = 13476; -- Achievement 291: Check Your Head
SET @GoblinCriteria4                  = 13477; -- @GoblinAchievement: Realm First! Level 80 Goblin
SET @WorgenCriteria4                  = 13478; -- @WorgenAchievement: Realm First! Level 80 Worgen
SET @HighElfCriteria1                 = 13484; -- Achievement 246: Know Thy Enemy
SET @HighElfCriteria2                 = 13485; -- Achievement 2422: Shake Your Bunny-Maker
SET @HighElfCriteria3                 = 19215; -- Achievement 291: Check Your Head
SET @HighElfCriteria4                 = 19216; -- @HighElfAchievement: Realm First! Level 80 High Elf
SET @MagharOrcCriteria1               = 13498; -- Achievement 1005: Know Thy Enemy
SET @MagharOrcCriteria2               = 13499; -- Achievement 2422: Shake Your Bunny-Maker
SET @MagharOrcCriteria3               = 13500; -- Achievement 291: Check Your Head
SET @MagharOrcCriteria4               = 19217; -- @HighElfAchievement: Realm First! Level 80 High Elf
SET @OgreCriteria1                    = 19218; -- Achievement 1005: Know Thy Enemy
SET @OgreCriteria2                    = 19219; -- Achievement 2422: Shake Your Bunny-Maker
SET @OgreCriteria3                    = 19220; -- Achievement 291: Check Your Head
SET @OgreCriteria4                    = 19221; -- @OgreAchievement: Realm First! Level 80 Ogre
SET @DarkIronDwarfCriteria1            = 19222; -- Achievement 1005: Know Thy Enemy
SET @DarkIronDwarfCriteria2            = 19223; -- Achievement 2422: Shake Your Bunny-Maker
SET @DarkIronDwarfCriteria3            = 19224; -- Achievement 291: Check Your Head
SET @DarkIronDwarfCriteria4            = 19225; -- @DarkIronDwarfAchievement: Realm First! Level 80 Dark Iron Dwarf
SET @ZandalariTrollCriteria1          = 19226; -- Achievement 1005: Know Thy Enemy
SET @ZandalariTrollCriteria2          = 19227; -- Achievement 2422: Shake Your Bunny-Maker
SET @ZandalariTrollCriteria3          = 19228; -- Achievement 291: Check Your Head
SET @ZandalariTrollCriteria4          = 19229; -- @ZandalariTrollAchievement: Realm First! Level 80 Zandalari Troll

-- Classes
SET @Warrior                          =    1;
SET @Paladin                          =    2;
SET @Hunter                           =    3;
SET @Rogue                            =    4;
SET @Priest                           =    5;
SET @DeathKnight                      =    6;
SET @Shaman                           =    7;
SET @Mage                             =    8;
SET @Warlock                          =    9;
-- SET @Monk                             =   10;
SET @Druid                            =   11;

-- ClassMasks
SET @WarriorMask                      = 1 << (@Warrior     - 1);  -- class ID 1  → 1
SET @PaladinMask                      = 1 << (@Paladin     - 1);  -- class ID 2  → 2
SET @HunterMask                       = 1 << (@Hunter      - 1);  -- class ID 3  → 4
SET @RogueMask                        = 1 << (@Rogue       - 1);  -- class ID 4  → 8
SET @PriestMask                       = 1 << (@Priest      - 1);  -- class ID 5  → 16
SET @DeathKnightMask                  = 1 << (@DeathKnight - 1);  -- class ID 6  → 32
SET @ShamanMask                       = 1 << (@Shaman      - 1);  -- class ID 7  → 64
SET @MageMask                         = 1 << (@Mage        - 1);  -- class ID 8  → 128
SET @WarlockMask                      = 1 << (@Warlock     - 1);  -- class ID 9  → 256
-- SET @MonkMask                         = 1 << (@Monk        - 1); -- class ID 10 → 512
SET @DruidMask                        = 1 << (@Druid       - 1); -- class ID 11 → 1024

SET @AllClassMask                     = @WarriorMask  | @PaladinMask | @HunterMask | @RogueMask | @PriestMask | @DeathKnightMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask;
SET @ManaClassMask                    = @PaladinMask  | @HunterMask | @PriestMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask;
SET @NonDKMask                        = @AllClassMask & ~@DeathKnightMask;

-- Druid Forms
SET @CatForm                          =  1;
SET @TreeForm                         =  2;
SET @TravelForm                       =  3;
SET @AquaticForm                      =  4;
SET @BearForm                         =  5;
SET @DireBearForm                     =  8;
SET @SwiftFlightForm                  = 27;
SET @FlightForm                       = 29;
SET @MoonkinForm                      = 31;

-- Locations
SET @EasternKingdoms                  =    0;
SET @DunMorogh                        =    1;
SET @ElwynnForest                     =   12;
SET @TirisfalGlades                   =   85;
SET @Gilneas                          = 4714;
SET @GilneasCity                      = 4755;

SET @Kalimdor                         =    1;
SET @Durotar                          =   14;
SET @Teldrassil                       =  141;
SET @Mulgore                          =  215;
SET @Kezan                            = 4737;
SET @LostIsles                        = 4720;

SET @Outland                          =  530;
SET @AzuremystIsle                    = 3526;
SET @EversongWoods                    = 3431;

SET @Northrend                        =  609;
SET @ScarletEnclave                   = 4298;
