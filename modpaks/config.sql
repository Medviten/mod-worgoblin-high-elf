-- Miscellaneous
SET @Male                      =    0;
SET @Female                    =    1;
SET @Skin                      =    0;
SET @Face                      =    1;
SET @FacialHair                =    2;
SET @Hair                      =    3;
SET @Underwear                 =    4;

-- Playable Races
SET @Human                     =    1;
SET @Orc                       =    2;
SET @Dwarf                     =    3;
SET @NightElf                  =    4;
SET @Undead                    =    5;
SET @Tauren                    =    6;
SET @Gnome                     =    7;
SET @Troll                     =    8;
SET @Goblin                    =    9;
SET @BloodElf                  =   10;
SET @Draenei                   =   11;
SET @Worgen                    =   12;
SET @HighElf                   =   13;
SET @MagharOrc                 =   14;
SET @Ogre                      =   15;
SET @Gilnean                   =   23;

-- NPC Races
SET @FelOrc                    =   32;
SET @Naga                      =   33;
SET @Broken                    =   34;
SET @Skeleton                  =   35;
SET @Vrykul                    =   36;
SET @Tuskarr                   =   37;
SET @ForestTroll               =   38;
SET @Taunka                    =   39;
SET @NorthrendSkeleton         =   40;
SET @IceTroll                  =   41;

-- RaceMasks
SET @HumanMask                 = 1 << (1 - 1);   -- race ID 1  → 1
SET @OrcMask                   = 1 << (2 - 1);   -- race ID 2  → 2
SET @DwarfMask                 = 1 << (3 - 1);   -- race ID 3  → 4
SET @NightElfMask              = 1 << (4 - 1);   -- race ID 4  → 8
SET @UndeadMask                = 1 << (5 - 1);   -- race ID 5  → 16
SET @TaurenMask                = 1 << (6 - 1);   -- race ID 6  → 32
SET @GnomeMask                 = 1 << (7 - 1);   -- race ID 7  → 64
SET @TrollMask                 = 1 << (8 - 1);   -- race ID 8  → 128
SET @GoblinMask                = 1 << (9 - 1);   -- race ID 9  → 256
SET @GoblinMask                = 1 << (10 - 1);  -- race ID 10 → 512
SET @DraeneiMask               = 1 << (11 - 1);  -- race ID 11 → 1024
SET @WorgenMask                = 1 << (12 - 1);  -- race ID 12 → 2048
SET @HighElfMask               = 1 << (13 - 1);  -- race ID 13 → 4096
SET @MagharOrcMask             = 1 << (14 - 1);  -- race ID 14 → 8192
SET @OgreMask                  = 1 << (15 - 1);  -- race ID 15 → 16384

-- New Race Models
SET @HighElfMaleModel          = 2208; -- blood elf
SET @HighElfFemaleModel        = 2209; -- blood elf

-- Display IDs
SET @HighElfMaleDisplay        = 94222;
SET @HighElfFemaleDisplay      = 94223;

-- Unspecified Display
SET @HighElfMaleDisplayExtra   = 45433;
SET @HighElfFemaleDisplayExtra = 45434;

-- Racial skills
SET @HighElfRacials            = 791;

-- Racial spells
SET @HighElfRacial1            = 110005; -- Quel’dorei Meditation (non-DK)
SET @HighElfRacial2            = 110006; -- Swiftness of the Rangers
SET @HighElfRacial3            = 110007; -- Quel’dorei Meditation (DK)
SET @HighElfRacial4            = 110008; -- Bow Specialization
SET @HighElfRacial5            = 110009; -- Enchanting Specialization

-- Factions
SET @AllianceMask              = @HumanMask    | @DwarfMask  | @NightElfMask | @GnomeMask  | @DraeneiMask   | @WorgenMask   | @HighElfMask;
SET @HordeMask                 = @OrcMask      | @UndeadMask | @TaurenMask   | @TrollMask  | @GoblinMask    | @BloodElfMask | @MagharOrcMask | @OgreMask;
SET @UndercityMask             = @UndeadMask   | @BloodElfMask; -- Mostly for easy reputation split
SET @BarrensBros               = @HordeMask    & ~@UndercityMask; -- Mostly for easy reputation split
SET @PlayableRaceMask          = @AllianceMask | @HordeMask;

-- PLAYER faction
SET @GoblinPlayer              = 1162;
SET @WorgenPlayer              = 1163;
SET @HighElfPlayer             = 1161;
SET @MagharOrcPlayer           = 1166;
SET @OgrePlayer                = 1169;

-- Extra faction templates
SET @GoblinFactionTemplate     = 2238; -- References @GoblinPlayer
SET @WorgenFactionTemplate     = 2239; -- References @WorgenPlayer
SET @HighElfFactionTemplate    = 2237; -- References @HighElfPlayer
SET @MagharOrcFactionTemplate  = 2240; -- References @MagharOrcPlayer
SET @OgreFactionTemplate       = 2241; -- References @OgrePlayer

-- Extra race factions
SET @GoblinFaction             = 1164; -- Bilgewater Cartel
SET @WorgenFaction             = 1165; -- Gilneas
SET @HighElfFaction            = 1167; -- High Elf Loyalists
SET @MagharOrcFaction          = 1168; -- Mag'har of the Horde
SET @OgreFaction               = 1170; -- Stonemaul Clan

-- Helmet RaceMasks
SET @HumanHelmetMask           = 1 << 1;   -- race ID 1  → 2
SET @OrcHelmetMask             = 1 << 2;   -- race ID 2  → 4
SET @DwarfHelmetMask           = 1 << 3;   -- race ID 3  → 8
SET @NightElfHelmetMask        = 1 << 4;   -- race ID 4  → 16
SET @UndeadHelmetMask          = 1 << 5;   -- race ID 5  → 32
SET @TaurenHelmetMask          = 1 << 6;   -- race ID 6  → 64
SET @GnomeHelmetMask           = 1 << 7;   -- race ID 7  → 128
SET @TrollHelmetMask           = 1 << 8;   -- race ID 8  → 256
SET @GoblinHelmetMask          = 1 << 9;   -- race ID 9  → 512
SET @GoblinHelmetMask          = 1 << 10;  -- race ID 10 → 1024
SET @DraeneiHelmetMask         = 1 << 11;  -- race ID 11 → 2048
SET @WorgenHelmetMask          = 1 << 12;  -- race ID 12 → 4096
SET @HighElfHelmetMask         = 1 << 13;  -- race ID 13 → 8192
SET @MagharOrcHelmetMask       = 1 << 14;  -- race ID 14 → 16384
SET @OgreHelmetMask            = 1 << 15;  -- race ID 15 → 32768

-- Classes
SET @Warrior                 =    1;
SET @Paladin                 =    2;
SET @Hunter                  =    4;
SET @Rogue                   =    8;
SET @Priest                  =   16;
SET @DeathKnight             =   32;
SET @Shaman                  =   64;
SET @Mage                    =  128;
SET @Warlock                 =  256;
-- SET @Monk                    = 512;
SET @Druid                   = 1024;

-- ClassMasks
SET @WarriorMask             = 1 << (@Warrior     - 1);  -- class ID 1  → 1
SET @PaladinMask             = 1 << (@Paladin     - 1);  -- class ID 2  → 2
SET @HunterMask              = 1 << (@Hunter      - 1);  -- class ID 3  → 4
SET @RogueMask               = 1 << (@Rogue       - 1);  -- class ID 4  → 8
SET @PriestMask              = 1 << (@Priest      - 1);  -- class ID 5  → 16
SET @DeathKnightMask         = 1 << (@DeathKnight - 1);  -- class ID 6  → 32
SET @ShamanMask              = 1 << (@Shaman      - 1);  -- class ID 7  → 64
SET @MageMask                = 1 << (@Mage        - 1);  -- class ID 8  → 128
SET @WarlockMask             = 1 << (@Warlock     - 1);  -- class ID 9  → 256
-- SET @MonkMask                = 1 << (@Monk        - 1); -- class ID 10 → 512
SET @DruidMask               = 1 << (@Druid       - 1); -- class ID 11 → 1024

SET @AllClassMask            = @WarriorMask  | @PaladinMask | @HunterMask | @RogueMask | @PriestMask | @DeathKnightMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask;
SET @ManaClassMask           = @PaladinMask  | @HunterMask | @PriestMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask;
SET @NonDKMask               = @AllClassMask & ~@DeathKnightMask;

-- Druid Forms
SET @CatForm                 =  1;
SET @TravelForm              =  3;
SET @BearForm                =  5;
SET @DireBearForm            =  8;
SET @SwiftFlightForm         = 27;
SET @FlightForm              = 29;
SET @MoonkinForm             = 31;

-- Locations
SET @EasternKingdoms        =    0;
SET @DunMorogh              =    1;
SET @ElwynnForest           =   12;
SET @TirisfalGlades         =   85;

SET @Kalimdor               =    1;
SET @Durotar                =   14;
SET @Teldrassil             =  141;
SET @Mulgore                =  215;

SET @Outland                =  530;
SET @AzuremystIsle          = 3524;
SET @EversongWoods          = 3430;

SET @Northrend              =  609;
SET @ScarletEnclave         = 4298;
