-- Race ID
SET @Worgen                                := @NextRace := @NextRace +1; -- default: 12
SET @WorgenMask                            = 1 << (@Worgen - 1); -- default: 2048
SET @WorgenHelmetMask                      = 1 << @Worgen; -- default: 4096

-- Important variable update
SET @AllianceMask                          = @AllianceMask | @WorgenMask;
SET @PlayableRaceMask                      = @PlayableRaceMask | @WorgenMask;

-- Miscellaneous
SET @WorgenExplorationSound                = @TaurenExplorationSound;
SET @WorgenCinematicSequence               = @NightElfCinematicSequence;

/*
SET @WorgenPlayer                          =   1163;
SET @WorgenFactionTemplate                 =   2239; -- References @WorgenPlayer
SET @WorgenFaction                         =   1165; -- Gilneas
SET @WorgenFactionRepIndex                 =  106;
SET @WorgenAchievement                     =  1430;
SET @WorgenCriteria1                       =  13472; -- Achievement 246: Know Thy Enemy
SET @WorgenCriteria2                       =  13474; -- Achievement 2422: Shake Your Bunny-Maker
SET @WorgenCriteria3                       =  13476; -- Achievement 291: Check Your Head
SET @WorgenCriteria4                       =  13478; -- @WorgenAchievement: Realm First! Level 80 Worgen

SET @WorgenRacials                         =    789;
SET @WorgenRacial1                         =  68975; -- Viciousness
SET @WorgenRacial2                         =  68976; -- Aberration
SET @WorgenRacial3                         =  68978; -- Flayer
SET @WorgenRacial4                         =  68992; -- Darkflight
SET @RunningWildMale60                     =  87840; -- Running Wild: quadrupedal transform aura (male worgen) & +60% speed boost aura
SET @RunningWildFemale60                   =  87841; -- Running Wild: quadrupedal transform aura (female worgen) & +60% speed boost aura
SET @RunningWildMale100                    = 110010; -- Running Wild: quadrupedal transform aura (male worgen) & +100% speed boost aura
SET @RunningWildFemale100                  = 110011; -- Running Wild: quadrupedal transform aura (female worgen) & +100% speed boost aura

SET @MountainHorseDisplay                  =  39095; -- black
SET @SwiftMountainHorseDisplay             =  39096; -- brown
SET @MountainHorseCreatureID               =  55272;
SET @SwiftMountainHorseCreatureID          =  55273;
SET @MountainHorseItem                     = 73838;
SET @SwiftMountainHorseItem                = 73839;
SET @MountainHorse                         = 103195;
SET @SwiftMountainHorse                    = 103196;

SET @GilneanMaleModel                      =     49; -- human
SET @GilneanFemaleModel                    =     50; -- human
SET @GilneanMaleDisplay                    =  94135;
SET @GilneanFemaleDisplay                  =  94136;
SET @GilneanMaleDisplayExtra               =  13749;
SET @GilneanFemaleDisplayExtra             =  13750;
SET @GilneanMaleTemplate                   =  55276;
SET @GilneanFemaleTemplate                 =  55277;
SET @GilneanExplorationSound               = @TaurenExplorationSound;
SET @GilneanCinematicSequence              = @NightElfCinematicSequence;

SET @LordHarfordDisplay                    =  36445;
SET @GallyLumpstainDisplay                 =  36446;
*/