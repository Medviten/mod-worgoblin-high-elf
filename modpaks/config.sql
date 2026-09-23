-- Miscellaneous
SET @Male                                      =    0;
SET @Female                                    =    1;
SET @Skin                                      =    0;
SET @Face                                      =    1;
SET @FacialHair                                =    2;
SET @Hair                                      =    3;
SET @Underwear                                 =    4;

-- CharSections
SET @CharacterCreateMask                        =   1;
SET @BarbershopMask                             =   2;
SET @DeathKnightTextureMask                     =   4;
SET @NPCSkinMask                                =   8;
SET @RegularMask                                =  16;

-- Reputation Level
SET @Exalted                                   =  128;

-- Playable Races
SET @Human                                     =    1;
SET @Orc                                       =    2;
SET @Dwarf                                     =    3;
SET @NightElf                                  =    4;
SET @Undead                                    =    5;
SET @Tauren                                    =    6;
SET @Gnome                                     =    7;
SET @Troll                                     =    8;
SET @Goblin                                    =    9;
SET @BloodElf                                  =   10;
SET @Draenei                                   =   11;
SET @NextRace     = 11;
/*
SET @Worgen                                    =   12;
SET @HighElf                                   =   13;
SET @MagharOrc                                 =   14;
SET @Ogre                                      =   15;
SET @DarkIronDwarf                             =   16;
SET @ZandalariTroll                            =   17;
SET @Vulpera                                   =   18;
SET @AlliancePandaren                          =   19;
SET @HordePandaren                             =   20;
SET @KulTiran                                  =   21;
*/
SET @Gilnean                                   =   23;

-- NPC Races
SET @FelOrc                                    =   32;
SET @Naga                                      =   33;
SET @Broken                                    =   34;
SET @Skeleton                                  =   35;
SET @Vrykul                                    =   36;
SET @Tuskarr                                   =   37;
SET @ForestTroll                               =   38;
SET @Taunka                                    =   39;
SET @NorthrendSkeleton                         =   40;
SET @IceTroll                                  =   41;

-- RaceMasks
SET @HumanMask                                 = 1 << (@Human            - 1);  -- race ID 1  → 1
SET @OrcMask                                   = 1 << (@Orc              - 1);  -- race ID 2  → 2
SET @DwarfMask                                 = 1 << (@Dwarf            - 1);  -- race ID 3  → 4
SET @NightElfMask                              = 1 << (@NightElf         - 1);  -- race ID 4  → 8
SET @UndeadMask                                = 1 << (@Undead           - 1);  -- race ID 5  → 16
SET @TaurenMask                                = 1 << (@Tauren           - 1);  -- race ID 6  → 32
SET @GnomeMask                                 = 1 << (@Gnome            - 1);  -- race ID 7  → 64
SET @TrollMask                                 = 1 << (@Troll            - 1);  -- race ID 8  → 128
-- SET @GoblinMask                                = 1 << (@Goblin           - 1);  -- race ID 9  → 256
SET @BloodElfMask                              = 1 << (@BloodElf         - 1);  -- race ID 10 → 512
SET @DraeneiMask                               = 1 << (@Draenei          - 1);  -- race ID 11 → 1024
/*
SET @WorgenMask                                = 1 << (@Worgen           - 1);  -- race ID 12 → 2048
SET @HighElfMask                               = 1 << (@HighElf          - 1);  -- race ID 13 → 4096
SET @MagharOrcMask                             = 1 << (@MagharOrc        - 1);  -- race ID 14 → 8192
SET @OgreMask                                  = 1 << (@Ogre             - 1);  -- race ID 15 → 16384
SET @DarkIronDwarfMask                         = 1 << (@DarkIronDwarf    - 1);  -- race ID 16 → 32768
SET @ZandalariTrollMask                        = 1 << (@ZandalariTroll   - 1);  -- race ID 17 → 65536
SET @VulperaMask                               = 1 << (@Vulpera          - 1);  -- race ID 18 → 131072
SET @AlliancePandarenMask                      = 1 << (@AlliancePandaren - 1);  -- race ID 19 → 262144
SET @HordePandarenMask                         = 1 << (@HordePandaren    - 1);  -- race ID 20 → 524288
SET @KulTiranMask                              = 1 << (@KulTiran         - 1);  -- race ID 21 → 1048576
*/
SET @GilneanMask                               = 1 << (@Gilnean          - 1);  -- race ID 23 → 4194304

-- Helmet RaceMasks
SET @HumanHelmetMask                           =    1 << @Human;            -- race ID 1  → 2
SET @OrcHelmetMask                             =    1 << @Orc;              -- race ID 2  → 4
SET @DwarfHelmetMask                           =    1 << @Dwarf;            -- race ID 3  → 8
SET @NightElfHelmetMask                        =    1 << @NightElf;         -- race ID 4  → 16
SET @UndeadHelmetMask                          =    1 << @Undead;           -- race ID 5  → 32
SET @TaurenHelmetMask                          =    1 << @Tauren;           -- race ID 6  → 64
SET @GnomeHelmetMask                           =    1 << @Gnome;            -- race ID 7  → 128
SET @TrollHelmetMask                           =    1 << @Troll;            -- race ID 8  → 256
-- SET @GoblinHelmetMask                          =    1 << @Goblin;           -- race ID 9  → 512
SET @BloodElfHelmetMask                        =    1 << @BloodElf;         -- race ID 10 → 1024
SET @DraeneiHelmetMask                         =    1 << @Draenei;          -- race ID 11 → 2048
/*
SET @WorgenHelmetMask                          =    1 << @Worgen;           -- race ID 12 → 4096
SET @HighElfHelmetMask                         =    1 << @HighElf;          -- race ID 13 → 8192
SET @MagharOrcHelmetMask                       =    1 << @MagharOrc;        -- race ID 14 → 16384
SET @OgreHelmetMask                            =    1 << @Ogre;             -- race ID 15 → 32768
SET @DarkIronDwarfHelmetMask                   =    1 << @DarkIronDwarf;    -- race ID 16 → 65536
SET @ZandalariTrollHelmetMask                  =    1 << @ZandalariTroll;   -- race ID 17 → 131072
SET @VulperaHelmetMask                         =    1 << @Vulpera;          -- race ID 18 → 262144
SET @AlliancePandarenHelmetMask                =    1 << @AlliancePandaren; -- race ID 19 → 524288
SET @HordePandarenHelmetMask                   =    1 << @HordePandaren;    -- race ID 20 → 1048576
SET @KulTiranHelmetMask                        =    1 << @KulTiran;         -- race ID 21 → 2097152
*/
SET @GilneanHelmetMask                         =    1 << @Gilnean;          -- race ID 23 → 8388608

-- New Race Models
SET @HobgoblinModel                            =   3194; -- Gobber (bank guy)
SET @WorgenMaleModel                           =   3141; -- bipedal
SET @WorgenFemaleModel                         =   3142; -- bipedal
SET @WorgenWildMaleModel                       =   3626; -- quadrupedal
SET @WorgenWildFemaleModel                     =   3627; -- quadrupedal
SET @GilneanMaleModel                          =     49; -- human
SET @GilneanFemaleModel                        =     50; -- human
SET @HighElfMaleModel                          =   2208; -- blood elf
SET @HighElfFemaleModel                        =   2209; -- blood elf
SET @MagharOrcMaleModel                        =     51; -- orc
SET @MagharOrcFemaleModel                      =     52; -- orc
SET @OgreMaleModel                             =   4892; -- one head (physical type)
SET @OgreFemaleModel                           =   4893; -- two heads (magic type)
SET @DarkIronDwarfMaleModel                    =  40000; -- backport from
SET @DarkIronDwarfFemaleModel                  =  40001; -- Shadowlands
SET @ZandalariTrollMaleModel                   =  40002; -- backport from
SET @ZandalariTrollFemaleModel                 =  40003; -- Shadowlands
SET @VulperaMaleModel                          =  40004;
SET @VulperaFemaleModel                        =  40005;
SET @PandarenMaleModel                         =  40006;
SET @PandarenFemaleModel                       =  40007;
SET @BrokenMaleModel                           =   2367;
SET @BrokenFemaleModel                         =   2368;
SET @KulTiranMaleModel                         =  40008;
SET @KulTiranFemaleModel                       =  40009;

-- Display IDs
SET @GoblinMaleDisplay                         =   6894;
SET @GoblinFemaleDisplay                       =   6895;
SET @HobgoblinDisplay                          =  32385;
SET @WorgenMaleDisplay                         =  29422;
SET @WorgenFemaleDisplay                       =  29423;
SET @WorgenWildMaleDisplay                     =  94133;
SET @WorgenWildFemaleDisplay                   =  94134;
SET @LordHarfordDisplay                        =  36445;
SET @GallyLumpstainDisplay                     =  36446;
SET @GilneanMaleDisplay                        =  94135;
SET @GilneanFemaleDisplay                      =  94136;
SET @HighElfMaleDisplay                        =  94222;
SET @HighElfFemaleDisplay                      =  94223;
SET @MagharOrcMaleDisplay                      =  94226;
SET @MagharOrcFemaleDisplay                    =  94227;
SET @OgreMaleDisplay                           =  62110;
SET @OgreFemaleDisplay                         =  62111;
SET @DarkIronDwarfMaleDisplay                  =  40000;
SET @DarkIronDwarfFemaleDisplay                =  40001;
SET @ZandalariTrollMaleDisplay                 =  40002;
SET @ZandalariTrollFemaleDisplay               =  40003;
SET @VulperaMaleDisplay                        =  40004;
SET @VulperaFemaleDisplay                      =  40005;
SET @AlliancePandarenMaleDisplay               =  40006;
SET @AlliancePandarenFemaleDisplay             =  40007;
SET @HordePandarenMaleDisplay                  =  40008;
SET @HordePandarenFemaleDisplay                =  40009;
SET @BrokenMaleDisplay                         =  21105;
SET @BrokenFemaleDisplay                       =  40010;
SET @KulTiranMaleDisplay                       =  40011;
SET @KulTiranFemaleDisplay                     =  40012;

-- CreatureDisplayInfoExtra
SET @WorgenMaleDisplayExtra                    =  45424;
SET @WorgenFemaleDisplayExtra                  =  45425;
SET @GilneanMaleDisplayExtra                   =  13749;
SET @GilneanFemaleDisplayExtra                 =  13750;
SET @HighElfMaleDisplayExtra                   =  45433;
SET @HighElfFemaleDisplayExtra                 =  45434;
SET @MagharOrcMaleDisplayExtra                 =  45437;
SET @MagharOrcFemaleDisplayExtra               =  45438;
SET @OgreMaleDisplayExtra                      =  45439;
SET @OgreFemaleDisplayExtra                    =  45440;
SET @DarkIronDwarfMaleDisplayExtra             =  45441;
SET @DarkIronDwarfFemaleDisplayExtra           =  45442;
SET @ZandalariTrollMaleDisplayExtra            =  45443;
SET @ZandalariTrollFemaleDisplayExtra          =  45444;
SET @VulperaMaleDisplayExtra                   =  45445;
SET @VulperaFemaleDisplayExtra                 =  45446;
SET @AlliancePandarenMaleDisplayExtra          =  45447;
SET @AlliancePandarenFemaleDisplayExtra        =  45448;
SET @HordePandarenMaleDisplayExtra             =  45449;
SET @HordePandarenFemaleDisplayExtra           =  45450;
SET @BrokenMaleDisplayExtra                    =  14150;
SET @BrokenFemaleDisplayExtra                  =  45451;
SET @KulTiranMaleDisplayExtra                  =  45452;
SET @KulTiranFemaleDisplayExtra                =  45453;

-- creature_template
SET @WorgenWildMaleTemplate                    =  55274;
SET @WorgenWildFemaleTemplate                  =  55275;
SET @GilneanMaleTemplate                       =  55276;
SET @GilneanFemaleTemplate                     =  55277;

-- Exploration Sounds
SET @HumanExplorationSound                     =   4140;
SET @OrcExplorationSound                       =   4141;
SET @DwarfExplorationSound                     =   4147;
SET @NightElfExplorationSound                  =   4145;
SET @UndeadExplorationSound                    =   4142;
SET @TaurenExplorationSound                    =   4143;
SET @GnomeExplorationSound                     =   4146;
SET @TrollExplorationSound                     =   4144;
SET @BloodElfExplorationSound                  = @UndeadExplorationSound; -- same as undead
SET @DraeneiExplorationSound                   = @HumanExplorationSound; -- same as human

/*
SET @GoblinExplorationSound                    = @OrcExplorationSound;
SET @WorgenExplorationSound                    = @TaurenExplorationSound;
SET @HighElfExplorationSound                   = @HumanExplorationSound;
SET @MagharOrcExplorationSound                 = @OrcExplorationSound;
SET @OgreExplorationSound                      = @OrcExplorationSound;
SET @DarkIronDwarfExplorationSound             = @DwarfExplorationSound;
SET @ZandalariTrollExplorationSound            = @TrollExplorationSound;
SET @VulperaExplorationSound                   = @TaurenExplorationSound;
SET @AlliancePandarenExplorationSound          = @TaurenExplorationSound;
SET @HordePandarenExplorationSound             = @TaurenExplorationSound;
*/

-- Cinematic Sequences
SET @HumanCinematicSequence                    =     81;
SET @OrcCinematicSequence                      =     21;
SET @DwarfCinematicSequence                    =     41;
SET @NightElfCinematicSequence                 =     61;
SET @UndeadCinematicSequence                   =      2;
SET @TaurenCinematicSequence                   =    141;
SET @GnomeCinematicSequence                    =    101;
SET @TrollCinematicSequence                    =    121;
SET @BloodElfCinematicSequence                 =    162;
SET @DraeneiCinematicSequence                  =    163;

/*
SET @GoblinCinematicSequence                   = @OrcCinematicSequence;
SET @WorgenCinematicSequence                   = @NightElfCinematicSequence;
SET @HighElfCinematicSequence                  = @HumanCinematicSequence;
SET @MagharOrcCinematicSequence                = @OrcCinematicSequence;
SET @OgreCinematicSequence                     = @OrcCinematicSequence;
SET @DarkIronDwarfCinematicSequence            = @DwarfCinematicSequence;
SET @ZandalariTrollCinematicSequence           = @TrollCinematicSequence;
SET @VulperaCinematicSequence                  = @TaurenCinematicSequence;
SET @AlliancePandarenCinematicSequence         = @NightElfCinematicSequence;
SET @HordePandarenCinematicSequence            = @TaurenCinematicSequence;
*/
-- SET @GilneanCinematicSequence                  = @NightElfCinematicSequence;

-- Racial skills
SET @WorgenRacials                             =    789;
SET @GoblinRacials                             =    790;
SET @HighElfRacials                            =    791;
SET @MagharOrcRacials                          =    792;
SET @OgreRacials                               =    793;
SET @DarkIronDwarfRacials                      =    794;
SET @ZandalariTrollRacials                     =    795;
SET @VulperaRacials                            =    796;
SET @PandarenRacials                           =    797;
SET @BrokenRacials                             =    798;
SET @KulTiranRacials                           =    799;

-- Racial spells
SET @WorgenRacial1                             =  68975; -- Viciousness
SET @WorgenRacial2                             =  68976; -- Aberration
SET @WorgenRacial3                             =  68978; -- Flayer
SET @WorgenRacial4                             =  68992; -- Darkflight
SET @TwoFormsMale                              =  68996;
SET @TwoFormsFemale                            =  68995;
SET @HumanFormMale                             =  68994;
SET @HumanFormFemale                           = 110020;
SET @RunningWildMale60                         =  87840; -- Running Wild: quadrupedal transform aura (male worgen) & +60% speed boost aura
SET @RunningWildFemale60                       =  87841; -- Running Wild: quadrupedal transform aura (female worgen) & +60% speed boost aura
SET @RunningWildMale100                        = 110010; -- Running Wild: quadrupedal transform aura (male worgen) & +100% speed boost aura
SET @RunningWildFemale100                      = 110011; -- Running Wild: quadrupedal transform aura (female worgen) & +100% speed boost aura
SET @GoblinRacial1                             =  69041; -- Rocket Barrage
SET @GoblinRacial2                             =  69042; -- Time is Money
SET @GoblinRacial3                             =  69044; -- Best Deals Anywhere
SET @GoblinRacial4                             =  69045; -- Better Living Through Chemistry
SET @GoblinRacial5                             =  69046; -- Pack Hobgoblin
SET @GoblinRacial6                             =  69070; -- Rocket Jump
SET @HighElfRacial1                            = 110005; -- Quel’dorei Meditation (non-DK)
SET @HighElfRacial2                            = 110006; -- Swiftness of the Rangers
SET @HighElfRacial3                            = 110007; -- Quel’dorei Meditation (DK)
SET @HighElfRacial4                            = 110008; -- Bow Specialization
SET @HighElfRacial5                            = 110009; -- Enchanting Specialization
SET @MagharOrcRacial1                          = 110001; -- Ancestral Call
SET @MagharOrcRacial2                          = 110002; -- Savage Blood
SET @MagharOrcRacial3                          = 110003; -- Sympathetic Vigor
SET @MagharOrcRacial4                          = 110004; -- Unwavering Will (maybe change to Open Skies: 10% mounted speed boost?)
-- SET @OgreRacial1
-- SET @DarkIronDwarfRacial1
-- SET @ZandalariTrollRacial1
-- SET @VulperaRacial1
-- SET @PandarenRacial1
-- SET @BrokenRacial1
-- SET @KulTiranRacial1

-- Other Relevant Spells
SET @ApprenticeSkinning                         =  8613;
SET @JourneymanSkinning                         =  8617;
SET @ExpertSkinning                             =  8618;
SET @ArtisanSkinning                            = 10768;
SET @Skinning1                                  = 13697;
SET @MasterSkinning                             = 32678;
SET @GrandMasterSkinning                        = 50305;
SET @Skinning2                                  = 52158;

-- Druid Form Models
SET @DruidBearWorgenModel                      =  3516; -- Cataclysm ID
SET @DruidBearTrollModel                       =  3517; -- Cataclysm ID
SET @DruidCatWorgenModel                       =  3518; -- Cataclysm ID
SET @DruidCatTrollModel                        =  3519; -- Cataclysm ID
SET @DruidTreeFormModel                        =  3805; -- Cataclysm ID
SET @DruidFlightWorgenModel                    =  3845; -- Cataclysm ID
SET @DruidFlightTrollModel                     =  3846; -- Cataclysm ID
SET @DruidTravelAllianceModel                  =  4870;
SET @DruidTravelHordeModel                     =  4871;
SET @DruidFlightHighmountainTaurenModel        =  4872;
SET @DruidBearZandalariTrollModel              =  4873;
SET @DruidCatZandalariTrollModel               =  4874;
SET @DruidFlightZandalariTrollModel            =  4875;
SET @DruidMoonkinZandalariTrollModel           =  4876;
SET @DruidTravelZandalariTrollModel            =  4877;
SET @DruidAquaticZandalariTrollModel           =  4878;
SET @DruidBearHighmountainTaurenModel          =  4879;
SET @DruidCatHighmountainTaurenModel           =  4880;
SET @DruidMoonkinHighmountainTaurenModel       =  4881;
SET @DruidBearKulTiranModel                    =  4882;
SET @DruidCatKulTiranModel                     =  4883;
SET @DruidFlightKulTiranModel                  =  4884;
SET @DruidMoonkinKulTiranModel                 =  4885;
SET @DruidTravelKulTiranModel                  =  4886;
SET @DruidAquaticKulTiranModel                 =  4887;

-- Druid Form Display IDs
SET @DruidBearWorgenDisplay                    = 33650;
SET @DruidBearWorgenBlackDisplay               = 33651;
SET @DruidBearWorgenBrownDisplay               = 33652;
SET @DruidBearWorgenTanDisplay                 = 33653;
SET @DruidBearWorgenWhiteDisplay               = 33654;
SET @DruidBearTrollBlueDisplay                 = 33655;
SET @DruidBearTrollPurpleDisplay               = 33656;
SET @DruidBearTrollRedDisplay                  = 33657;
SET @DruidBearTrollWhiteDisplay                = 33658;
SET @DruidBearTrollYellowDisplay               = 33659;
SET @DruidCatSkinWorgenDisplay                 = 33660;
SET @DruidCatSkinWorgenBlackDisplay            = 33661;
SET @DruidCatSkinWorgenBrownDisplay            = 33662;
SET @DruidCatSkinWorgenWhiteDisplay            = 33663;
SET @DruidCatSkinWorgenYellowDisplay           = 33664;
SET @DruidCatTrollSkinBlackDisplay             = 33665;
SET @DruidCatTrollSkinBlueDisplay              = 33666;
SET @DruidCatTrollSkinGreenDisplay             = 33667;
SET @DruidCatTrollSkinRedDisplay               = 33668;
SET @DruidCatTrollSkinWhiteDisplay             = 33669;
SET @DruidCatSkinPurpleDisplay                 = 34521;
SET @DruidTreeFormGreenDisplay                 = 37163;
SET @DruidTreeFormRedDisplay                   = 37164;
SET @DruidTreeFormPurpleDisplay                = 37165;
SET @DruidTreeFormOrangeDisplay                = 37166;
SET @DruidOwlBearBlackSkinDisplay              = 37173;
SET @DruidOwlBearRedSkinDisplay                = 37174;
SET @StormCrowDruidSkinDisplay                 = 37727;
SET @EpicDruidFlightWorgenDisplay              = 37729;
SET @EpicDruidFlightTrollDisplay               = 37730;
SET @DruidFlightTrollDisplay                   = 94216;
SET @DruidTravelAllianceDisplay                = 40816;
SET @DruidTravelHordeDisplay                   = 45339;
SET @DruidFlightHighmountainTaurenDisplay      = 94160;
SET @DruidBearZandalariTrollBlueDisplay        = 94161;
SET @DruidBearZandalariTrollDarkDisplay        = 94162;
SET @DruidBearZandalariTrollGreenDisplay       = 94163;
SET @DruidBearZandalariTrollWhiteDisplay       = 94164;
SET @DruidCatZandalariTrollBlackDisplay        = 94165;
SET @DruidCatZandalariTrollBlueDisplay         = 94166;
SET @DruidCatZandalariTrollGreenDisplay        = 94167;
SET @DruidCatZandalariTrollWhiteDisplay        = 94168;
SET @DruidFlightZandalariTrollDisplay          = 94169;
SET @DruidMoonkinZandalariTrollDisplay         = 94170;
SET @DruidTravelZandalariTrollDisplay          = 94171;
SET @DruidTreeZandalariTrollDisplay            = 94172;
SET @DruidAquaticZandalariTrollTealDisplay     = 94173;
SET @DruidAquaticZandalariTrollDarkDisplay     = 94174;
SET @DruidAquaticZandalariTrollGreenDisplay    = 94175;
SET @DruidAquaticZandalariTrollLightDisplay    = 94176;
SET @DruidBearHighmountainTaurenBlackDisplay   = 94177;
SET @DruidBearHighmountainTaurenBrownDisplay   = 94178;
SET @DruidBearHighmountainTaurenSilverDisplay  = 94179;
SET @DruidBearHighmountainTaurenWhiteDisplay   = 94180;
SET @DruidBearHighmountainTaurenYellowDisplay  = 94181;
SET @DruidCatHighmountainTaurenBlackDisplay    = 94182;
SET @DruidCatHighmountainTaurenBrownDisplay    = 94183;
SET @DruidCatHighmountainTaurenRedDisplay      = 94184;
SET @DruidCatHighmountainTaurenWhiteDisplay    = 94185;
SET @DruidMoonkinHighmountainTaurenDisplay     = 94186;
SET @DruidBearKulTiranBrownDisplay             = 94187;
SET @DruidBearKulTiranDarkDisplay              = 94188;
SET @DruidBearKulTiranGreenDisplay             = 94189;
SET @DruidBearKulTiranLightDisplay             = 94190;
SET @DruidCatKulTiranBrownDisplay              = 94191;
SET @DruidCatKulTiranDarkDisplay               = 94192;
SET @DruidCatKulTiranGreenDisplay              = 94193;
SET @DruidCatKulTiranLightDisplay              = 94194;
SET @DruidFlightKulTiranBrownDisplay           = 94195;
SET @DruidFlightKulTiranDarkDisplay            = 94196;
SET @DruidFlightKulTiranGreenDisplay           = 94197;
SET @DruidFlightKulTiranLightDisplay           = 94198;
SET @DruidMoonkinKulTiranDisplay               = 94199;
SET @DruidMoonkinKulTiranBlackDisplay          = 94200;
SET @DruidMoonkinKulTiranPaleDisplay           = 94201;
SET @DruidMoonkinKulTiranRedDisplay            = 94202;
SET @DruidTravelKulTiranBlueDisplay            = 94203;
SET @DruidTravelKulTiranBrownDisplay           = 94204;
SET @DruidTravelKulTiranGreenDisplay           = 94205;
SET @DruidTravelKulTiranWhiteDisplay           = 94206;
SET @DruidAquaticKulTiranBrownDisplay          = 94207;
SET @DruidAquaticKulTiranDarkDisplay           = 94208;
SET @DruidAquaticKulTiranGreenDisplay          = 94209;
SET @DruidAquaticKulTiranLightDisplay          = 94210;
SET @DruidTreeKulTiranDisplay                  = 94214;

-- Weapon Skills
SET @AxeSkill                                  =     44;
SET @BowSkill                                  =     45;
SET @GunSkill                                  =     46;
SET @MaceSkill                                 =     54;
SET @2HMaceSkill                               =    160;
SET @DaggerSkill                               =    173;

-- Gear Skills
SET @PlateMailSkill                            =    293;
SET @MailSkill                                 =    413;
SET @LeatherSkill                              =    414;
SET @ClothSkill                                =    415;
SET @ShieldSkill                               =    433;

-- Language Skills
SET @CommonSkill                               =     98;
SET @OrcishSkill                               =    109;
SET @DraconicSkill                             =    138;
SET @DemonTongueSkill                          =    139;
SET @TitanSkill                                =    140;
SET @OldTongueSkill                            =    141;

-- Profession Skills
SET @SurvivalSkill                             =    142;
SET @AlchemySkill                              =    171;
SET @BlacksmithingSkill                        =    164;
SET @LeatherworkingSkill                       =    165;
SET @HerbalismSkill                            =    182;
SET @CookingSkill                              =    185;
SET @MiningSkill                               =    186;
SET @TailoringSkill                            =    197;
SET @EngineeringSkill                          =    202;
SET @EnchantingSkill                           =    333;
SET @FishingSkill                              =    356;
SET @SkinningSkill                             =    393;
SET @JewelcraftingSkill                        =    755;

-- Language SkillLineAbility
SET @OrcishSkillLineAbilityHorde               =    592;

-- Teleport SkillLineAbility
SET @TeleportOrgrimmarSkillLineAbility         =   3271;
SET @TeleportThunderBluffSkillLineAbility      =   3273;
SET @TeleportUndercitySkillLineAbility         =   3274;
SET @TeleportSilvermoonSkillLineAbility        =  14816;
SET @TeleportShattrathSkillLineAbility         =  15606;
SET @TeleportStonardSkillLineAbility           =  17000;

-- Portal SkillLineAbility
SET @PortalOrgrimmarSkillLineAbility           =   5991;
SET @PortalThunderBluffSkillLineAbility        =   5993;
SET @PortalUndercitySkillLineAbility           =   5994;
SET @PortalSilvermoonSkillLineAbility          =  14818;
SET @PortalShattrathSkillLineAbility           =  15607;
SET @PortalStonardSkillLineAbility             =  17003;

-- Miscellaneous SkillLineAbility
SET @BloodlustSkillLineAbility                 =  13151;
SET @MechanoHogSkillLineAbility1               =  20110;
SET @MechanoHogSkillLineAbility2               =  20290;
SET @FlameShockPassiveSkillLineAbility         =  21724;

-- Racial SkillRaceClass
SET @WorgenRacialSkillRaceClass                =    971;
SET @GoblinRacialSkillRaceClass                =    972;

-- Weapon SkillRaceClass
SET @GunsSkillRaceClass                        =    133;
SET @2HMaceSkillRaceClassDK                    =    624;
SET @2HMaceSkillRaceClass                      =    625;

-- Gear SkillRaceClass
SET @PlateMailSkillRaceClass                   =     21;
SET @Mail40SkillRaceClass                      =    145;
SET @MailSkillRaceClass                        =    146;
SET @LeatherSkillRaceClass                     =    147;
SET @ClothSkillRaceClass                       =    148;
SET @ShieldSkillRaceClass                      =    246;

-- Language SkillRaceClass
SET @CommonSkillRaceClassHorde                 =     41;
SET @OrcishSkillRaceClassHorde                 =     48;
SET @DemonTongueSkillRaceClass                 =     84;
SET @DraconicSkillRaceClass                    =     85;
SET @OldTongueSkillRaceClass                   =     88;
SET @TitanSkillRaceClass                       =     93;

-- Profession SkillRaceClass
SET @FishingSkillRaceClass                     =     27;
SET @HerbalismSkillRaceClass                   =     28;
SET @MiningSkillRaceClass                      =     29;
SET @SkinningSkillRaceClass                    =     30;
SET @AlchemySkillRaceClass                     =    241;
SET @BlacksmithingSkillRaceClass               =    243;
SET @EngineeringSkillRaceClass                 =    244;
SET @EnchantingSkillRaceClass                  =    281;
SET @CookingSkillRaceClass                     =    282;
SET @TailoringSkillRaceClass                   =    284;
SET @SurvivalSkillRaceClass                    =    865;
SET @JewelcraftingSkillRaceClass               =    866;
SET @LeatherworkingSkillRaceClass              =    899;

-- Mount Models
SET @GoblinTrikeModel                          =   3623;
SET @GoblinTurboTrikeModel                     =   3624;

-- Mount Display IDs
SET @GoblinTrikeDisplay                        =  35249;
SET @GoblinTurboTrikeDisplay                   =  35250;
SET @MountainHorseDisplay                      =  39095; -- black
SET @SwiftMountainHorseDisplay                 =  39096; -- brown

-- Creature IDs
SET @GobberCreatureID                          =  36613;
SET @GoblinTrikeCreatureID                     =  46754;
SET @GoblinTurboTrikeCreatureID                =  46755;
SET @MountainHorseCreatureID                   =  55272;
SET @SwiftMountainHorseCreatureID              =  55273;

-- Mount Items
SET @GoblinTrikeItem                           = 62461;
SET @GoblinTurboTrikeItem                      = 62462;
SET @MountainHorseItem                         = 73838;
SET @SwiftMountainHorseItem                    = 73839;

-- Mount Spells
SET @GoblinTrike                               =  87090;
SET @GoblinTurboTrike                          =  87091;
SET @MountainHorse                             = 103195;
SET @SwiftMountainHorse                        = 103196;
SET @CaravanHyena                              = 110021;
SET @CaravanHyenaAlt                           = 110021;

-- Faction Masks
SET @BaseAllianceMask                          = @HumanMask        | @DwarfMask  | @NightElfMask  | @GnomeMask         | @DraeneiMask;
SET @BaseHordeMask                             = @OrcMask          | @UndeadMask | @TaurenMask    | @TrollMask         | @BloodElfMask;
SET @AllianceMask                              = @BaseAllianceMask; -- | @WorgenMask | @HighElfMask   | @DarkIronDwarfMask | @AlliancePandarenMask | @KulTiranMask;
SET @HordeMask                                 = @BaseHordeMask;    -- | @GoblinMask | @MagharOrcMask | @OgreMask          | @ZandalariTrollMask | @VulperaMask;
SET @UndercityMask                             = @UndeadMask       | @BloodElfMask; -- Mostly for easy reputation split
SET @BarrensBros                               = @HordeMask        & ~@UndercityMask; -- Mostly for easy reputation split
SET @PlayableRaceMask                          = @AllianceMask     | @HordeMask;

-- Race and PLAYER factions
SET @HumanFaction                              =   72; -- Stormwind
SET @HumanPlayer                               =    1;
SET @OrcFaction                                =   76; -- Orgrimmar
SET @OrcPlayer                                 =    2;
SET @DwarfFaction                              =   47; -- Ironforge
SET @DwarfPlayer                               =    3;
SET @NightElfFaction                           =   69; -- Darnassus
SET @NightElfPlayer                            =    4;
SET @UndeadFaction                             =   68; -- Undercity
SET @UndeadPlayer                              =    5;
SET @TaurenFaction                             =   81; -- Thunder Bluff
SET @TaurenPlayer                              =    6;
SET @GnomeFaction                              =   54; -- Gnomeregan Exiles
SET @GnomePlayer                               =    8;
SET @TrollFaction                              =  530; -- Darkspear Trolls
SET @TrollPlayer                               =    9;
SET @BloodElfFaction                           =  911; -- Silvermoon City
SET @BloodElfPlayer                            =  914;
SET @DraeneiFaction                            =  930; -- Exodar
SET @DraeneiPlayer                             =  927;

SET @GoblinFaction                             =   1133; -- Bilgewater Cartel (Cataclysm ID)
SET @GoblinPlayer                              =   1152;
SET @WorgenFaction                             =   1134; -- Gilneas (Cataclysm ID)
SET @WorgenPlayer                              =   1153;
SET @HighElfFaction                            =   1167; -- High Elf Loyalists
SET @HighElfPlayer                             =   1161;
SET @MagharOrcFaction                          =   1168; -- Mag'har of the Horde
SET @MagharOrcPlayer                           =   1166;
SET @OgreFaction                               =   1170; -- Stonemaul Clan
SET @OgrePlayer                                =   1169;
SET @DarkIronDwarfFaction                      =   1171; -- Shadowforge City
SET @DarkIronDwarfPlayer                       =   1172;
SET @ZandalariTrollFaction                     =   2103; -- Zandalari Empire (BfA ID)
SET @ZandalariTrollPlayer                      =   1174;
SET @VulperaFaction                            =   2158; -- Voldunai (BfA ID)
SET @VulperaPlayer                             =   1176;
SET @AlliancePandarenFaction                   =   1353; -- Tushui Pandaren (MoP ID)
SET @AlliancePandarenPlayer                    =   1178;
SET @HordePandarenFaction                      =   1352; -- Huojin Pandaren (MoP ID)
SET @HordePandarenPlayer                       =   1180;
SET @BrokenFaction                             =   1181;
SET @BrokenPlayer                              =   1182;
SET @KulTiranFaction                           =   1183; -- Kul Tiras
SET @KulTiranPlayer                            =   1184;

-- Faction templates
SET @GoblinFactionTemplate                     =   2238; -- References @GoblinPlayer
SET @WorgenFactionTemplate                     =   2239; -- References @WorgenPlayer
SET @HighElfFactionTemplate                    =   2237; -- References @HighElfPlayer
SET @MagharOrcFactionTemplate                  =   2240; -- References @MagharOrcPlayer
SET @OgreFactionTemplate                       =   2241; -- References @OgrePlayer
SET @DarkIronDwarfFactionTemplate              =   2242; -- References @DarkIronDwarfPlayer
SET @ZandalariTrollFactionTemplate             =   2243; -- References @ZandalariTrollPlayer
SET @VulperaFactionTemplate                    =   2244; -- References @VulperaPlayer
SET @AlliancePandarenFactionTemplate           =   2245; -- References @AlliancePandarenPlayer
SET @HordePandarenFactionTemplate              =   2246; -- References @HordePandarenPlayer
SET @BrokenFactionTemplate                     =   2247; -- References @BrokenPlayer
SET @KulTiranFactionTemplate                   =   2248; -- References @KulTiranPlayer

-- Reputation Indices
SET @GoblinFactionRepIndex                     =  105;
SET @WorgenFactionRepIndex                     =  106;
SET @HighElfFactionRepIndex                    =  107;
SET @MagharOrcFactionRepIndex                  =  108;
SET @OgreFactionRepIndex                       =  109;
SET @DarkIronDwarfFactionRepIndex              =  110;
SET @ZandalariTrollFactionRepIndex             =  111;
SET @VulperaFactionRepIndex                    =  112;
SET @AlliancePandarenFactionRepIndex           =  113;
SET @HordePandarenFactionRepIndex              =  114;
SET @BrokenFactionRepIndex                     =  115;
SET @KulTiranFactionRepIndex                   =  116;

-- Achievements
SET @KnowThyEnemyAlliance                      =   246;
SET @KnowThyEnemyHorde                         =  1005;
SET @ShakeYourBunnyMaker                       =  2422;
SET @CheckYourHead                             =   291;
SET @GoblinAchievement                         =  1429;
SET @WorgenAchievement                         =  1430;
SET @HighElfAchievement                        =  1431;
SET @MagharOrcAchievement                      =  1432;
SET @OgreAchievement                           =  1433;
SET @DarkIronDwarfAchievement                  =  1434;
SET @ZandalariTrollAchievement                 =  1435;
SET @VulperaAchievement                        =  1436;
SET @AlliancePandarenAchievement               =  1437;
SET @HordePandarenAchievement                  =  1438;
SET @BrokenAchievement                         =  1439;
SET @KulTiranAchievement                       =  1440;

-- Achievement Criteria
SET @GoblinCriteria1                           =  13471; -- Achievement 1005: Know Thy Enemy
SET @GoblinCriteria2                           =  13473; -- Achievement 2422: Shake Your Bunny-Maker
SET @GoblinCriteria3                           =  13475; -- Achievement 291: Check Your Head
SET @GoblinCriteria4                           =  13477; -- @GoblinAchievement: Realm First! Level 80 Goblin
SET @WorgenCriteria1                           =  13472; -- Achievement 246: Know Thy Enemy
SET @WorgenCriteria2                           =  13474; -- Achievement 2422: Shake Your Bunny-Maker
SET @WorgenCriteria3                           =  13476; -- Achievement 291: Check Your Head
SET @WorgenCriteria4                           =  13478; -- @WorgenAchievement: Realm First! Level 80 Worgen
SET @HighElfCriteria1                          =  13484; -- Achievement 246: Know Thy Enemy
SET @HighElfCriteria2                          =  13485; -- Achievement 2422: Shake Your Bunny-Maker
SET @HighElfCriteria3                          =  19215; -- Achievement 291: Check Your Head
SET @HighElfCriteria4                          =  19216; -- @HighElfAchievement: Realm First! Level 80 High Elf
SET @MagharOrcCriteria1                        =  13498; -- Achievement 1005: Know Thy Enemy
SET @MagharOrcCriteria2                        =  13499; -- Achievement 2422: Shake Your Bunny-Maker
SET @MagharOrcCriteria3                        =  13500; -- Achievement 291: Check Your Head
SET @MagharOrcCriteria4                        =  19217; -- @MagharOrcAchievement: Realm First! Level 80 Mag'har Orc
SET @OgreCriteria1                             =  19218; -- Achievement 1005: Know Thy Enemy
SET @OgreCriteria2                             =  19219; -- Achievement 2422: Shake Your Bunny-Maker
SET @OgreCriteria3                             =  19220; -- Achievement 291: Check Your Head
SET @OgreCriteria4                             =  19221; -- @OgreAchievement: Realm First! Level 80 Ogre
SET @DarkIronDwarfCriteria1                    =  19222; -- Achievement 246: Know Thy Enemy
SET @DarkIronDwarfCriteria2                    =  19223; -- Achievement 2422: Shake Your Bunny-Maker
SET @DarkIronDwarfCriteria3                    =  19224; -- Achievement 291: Check Your Head
SET @DarkIronDwarfCriteria4                    =  19225; -- @DarkIronDwarfAchievement: Realm First! Level 80 Dark Iron Dwarf
SET @ZandalariTrollCriteria1                   =  19226; -- Achievement 1005: Know Thy Enemy
SET @ZandalariTrollCriteria2                   =  19227; -- Achievement 2422: Shake Your Bunny-Maker
SET @ZandalariTrollCriteria3                   =  19228; -- Achievement 291: Check Your Head
SET @ZandalariTrollCriteria4                   =  19229; -- @ZandalariTrollAchievement: Realm First! Level 80 Zandalari Troll
SET @VulperaCriteria1                          =  19230; -- Achievement 1005: Know Thy Enemy
SET @VulperaCriteria2                          =  19231; -- Achievement 2422: Shake Your Bunny-Maker
SET @VulperaCriteria3                          =  19232; -- Achievement 291: Check Your Head
SET @VulperaCriteria4                          =  19233; -- @VulperaAchievement: Realm First! Level 80 Vulpera
SET @AlliancePandarenCriteria1                 =  19234; -- Achievement 246: Know Thy Enemy
SET @AlliancePandarenCriteria2                 =  19235; -- Achievement 2422: Shake Your Bunny-Maker
SET @AlliancePandarenCriteria3                 =  19236; -- Achievement 291: Check Your Head
SET @AlliancePandarenCriteria4                 =  19237; -- @AlliancePandarenAchievement: Realm First! Level 80 Pandaren (Alliance)
SET @HordePandarenCriteria1                    =  19238; -- Achievement 1005: Know Thy Enemy
SET @HordePandarenCriteria2                    =  19239; -- Achievement 2422: Shake Your Bunny-Maker
SET @HordePandarenCriteria3                    =  19240; -- Achievement 291: Check Your Head
SET @HordePandarenCriteria4                    =  19241; -- @HordePandarenAchievement: Realm First! Level 80 Pandaren (Horde)
SET @BrokenCriteria1                           =  19234; -- Achievement 246: Know Thy Enemy
SET @BrokenCriteria2                           =  19235; -- Achievement 2422: Shake Your Bunny-Maker
SET @BrokenCriteria3                           =  19236; -- Achievement 291: Check Your Head
SET @BrokenCriteria4                           =  19237; -- @BrokenAchievement: Realm First! Level 80 Broken
SET @KulTiranCriteria1                         =  19234; -- Achievement 246: Know Thy Enemy
SET @KulTiranCriteria2                         =  19235; -- Achievement 2422: Shake Your Bunny-Maker
SET @KulTiranCriteria3                         =  19236; -- Achievement 291: Check Your Head
SET @KulTiranCriteria4                         =  19237; -- @KulTiranAchievement: Realm First! Level 80 Kul Tiran

-- Classes
SET @Warrior                                   =    1;
SET @Paladin                                   =    2;
SET @Hunter                                    =    3;
SET @Rogue                                     =    4;
SET @Priest                                    =    5;
SET @DeathKnight                               =    6;
SET @Shaman                                    =    7;
SET @Mage                                      =    8;
SET @Warlock                                   =    9;
-- SET @Monk                                      =   10;
SET @Druid                                     =   11;

-- ClassMasks
SET @WarriorMask                               = 1 << (@Warrior     - 1);  -- class ID 1  → 1
SET @PaladinMask                               = 1 << (@Paladin     - 1);  -- class ID 2  → 2
SET @HunterMask                                = 1 << (@Hunter      - 1);  -- class ID 3  → 4
SET @RogueMask                                 = 1 << (@Rogue       - 1);  -- class ID 4  → 8
SET @PriestMask                                = 1 << (@Priest      - 1);  -- class ID 5  → 16
SET @DeathKnightMask                           = 1 << (@DeathKnight - 1);  -- class ID 6  → 32
SET @ShamanMask                                = 1 << (@Shaman      - 1);  -- class ID 7  → 64
SET @MageMask                                  = 1 << (@Mage        - 1);  -- class ID 8  → 128
SET @WarlockMask                               = 1 << (@Warlock     - 1);  -- class ID 9  → 256
-- SET @MonkMask                                  = 1 << (@Monk        - 1); -- class ID 10 → 512
SET @DruidMask                                 = 1 << (@Druid       - 1); -- class ID 11 → 1024

SET @AllClassMask                              = @WarriorMask  | @PaladinMask | @HunterMask | @RogueMask | @PriestMask | @DeathKnightMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask;
SET @ManaClassMask                             = @PaladinMask  | @HunterMask | @PriestMask | @ShamanMask | @MageMask | @WarlockMask | @DruidMask;
SET @NonDKMask                                 = @AllClassMask & ~@DeathKnightMask;

-- Druid Forms
SET @CatForm                                   =         1;
SET @TreeForm                                  =         2;
SET @TravelForm                                =         3;
SET @AquaticForm                               =         4;
SET @BearForm                                  =         5;
SET @DireBearForm                              =         8;
SET @SwiftFlightForm                           =        27;
SET @FlightForm                                =        29;
SET @MoonkinForm                               =        31;

SET @AllianceTravelForm                        =     40816;
SET @HordeTravelForm                           =     45339;

-- Default totems Alliance (Dwarf)
SET @AllianceFireTotem                         =     30754;
SET @AllianceEarthTotem                        =     30753;
SET @AllianceWaterTotem                        =     30755;
SET @AllianceAirTotem                          =     30736;

-- Default totems Horde (Orc)
SET @HordeFireTotem                            =     30758;
SET @HordeEarthTotem                           =     30757;
SET @HordeWaterTotem                           =     30759;
SET @HordeAirTotem                             =     30756;


-- Locations
SET @EasternKingdoms                           =         0;
SET @DunMorogh                                 =         1;
SET @ElwynnForest                              =        12;
SET @TirisfalGlades                            =        85;
SET @Gilneas                                   =      4714; -- Open Azeroth
SET @GilneasCity                               =      4755; -- Open Azeroth

SET @Kalimdor                                  =         1;
SET @Durotar                                   =        14;
SET @Teldrassil                                =       141;
SET @Mulgore                                   =       215;
SET @Kezan                                     =      4737; -- Open Azeroth
SET @LostIsles                                 =      4720; -- Open Azeroth

SET @Outland                                   =       530;
SET @AzuremystIsle                             =      3526; -- Outland map
SET @EversongWoods                             =      3431; -- Outland map

SET @Northrend                                 =       609;
SET @ScarletEnclave                            =      4298;

-- Start coordinates

SET @HumanStartX                                = -8949.95;
SET @HumanStartY                                = -132.493;
SET @HumanStartZ                                =  83.5312;
SET @HumanStartO                                =        0;

SET @OrcStartX                                  = -618.518;
SET @OrcStartY                                  = -4251.67;
SET @OrcStartZ                                  =   38.718;
SET @OrcStartO                                  =        0;

SET @DwarfStartX                                = -6240.32;
SET @DwarfStartY                                =  331.033;
SET @DwarfStartZ                                =  382.758;
SET @DwarfStartO                                =  6.17716;

SET @NightElfStartX                             =  10311.3;
SET @NightElfStartY                             =  832.463;
SET @NightElfStartZ                             =  1326.41;
SET @NightElfStartO                             =  5.69632;

SET @UndeadStartX                               =  1676.71;
SET @UndeadStartY                               =  1678.31;
SET @UndeadStartZ                               =   121.67;
SET @UndeadStartO                               =  2.70526;

SET @TaurenStartX                               = -2917.58;
SET @TaurenStartY                               =  -257.98;
SET @TaurenStartZ                               =  52.9968;
SET @TaurenStartO                               =        0;

SET @BloodElfStartX                             =  10349.6;
SET @BloodElfStartY                             = -6357.29;
SET @BloodElfStartZ                             =  33.4026;
SET @BloodElfStartO                             =  5.31605;

SET @DraeneiStartX                              = -3961.64;
SET @DraeneiStartY                              = -13931.2;
SET @DraeneiStartZ                              =  100.615;
SET @DraeneiStartO                              =  2.08364;

SET @DKStartX                                   =  2358.44;
SET @DKStartY                                   =  -5666.9;
SET @DKStartZ                                   =  426.023;
SET @DKStartO                                   =  3.65997;

-- TaxiNodes
SET @TaxiNodeAuberdine                         =       26;
SET @TaxiNodeExodar                            =       94;

-- New TaxiPathNodes
SET @TaxiPathID          = (SELECT COALESCE(MAX(id), 0) FROM `dbc_db`.`taxipath`);
SET @TaxiAuberdineExodar       := @TaxiPathID       := @TaxiPathID +1;
SET @TaxiExodarAuberdine       := @TaxiPathID       := @TaxiPathID +1;

-- Talents
SET @MageFire                                  =      41;
SET @MageFrost                                 =      61;
SET @MageArcane                                =      81;
SET @WarriorArms                               =     161;
SET @WarriorProtection                         =     163;
SET @WarriorFury                               =     164;
SET @RogueCombat                               =     181;
SET @RogueAssassination                        =     182;
SET @RogueSubtlety                             =     183;
SET @PriestDiscipline                          =     201;
SET @PriestHoly                                =     202;
SET @PriestShadow                              =     203;
SET @ShamanElementalCombat                     =     261;
SET @ShamanRestoration                         =     262;
SET @ShamanEnhancement                         =     263;
SET @DruidFeralCombat                          =     281;
SET @DruidRestoration                          =     282;
SET @DruidBalance                              =     283;
SET @WarlockDestruction                        =     301;
SET @WarlockCurses                             =     302;
SET @WarlockDemonology                         =     303;
SET @HunterBeastMastery                        =     361;
SET @HunterSurvival                            =     362;
SET @HunterMarksmanship                        =     363;
SET @PaladinRetribution                        =     381;
SET @PaladinHoly                               =     382;
SET @PaladinProtection                         =     383;
SET @DKBlood                                   =     398;
SET @DKFrost                                   =     399;
SET @DKUnholy                                  =     400;
SET @HunterPetTenacity                         =     409;
SET @HunterPetFerocity                         =     410;
SET @HunterPetCunning                          =     411;

-- Other Factions
SET @FactionCreature                           =       7;
SET @FactionMonster                            =      14;
SET @FactionDefiasBrotherhood                  =      15;
SET @FactionGnollRiverpaw                      =      16;
SET @FactionGnollRedridge                      =      17;
SET @FactionGnollShadowhide                    =      18;
SET @FactionMurloc                             =      19;
SET @FactionScourge                            =      20;
SET @FactionBootyBay                           =      21;
SET @FactionBeastSpider                        =      22;
SET @FactionBeastBoar                          =      23;
SET @FactionEnemyWorgen                        =      24;
SET @FactionKobold                             =      25;
SET @FactionTrollBloodscalp                    =      26;
SET @FactionTrollSkullsplitter                 =      27;
SET @FactionPrey                               =      28;
SET @FactionBeastWolf                          =      29;
SET @FactionDefiasBrotherhoodTraitor           =      30;
SET @FactionFriendly                           =      31;
SET @FactionTrogg                              =      32;
SET @FactionTrollFrostmane                     =      33;
SET @FactionOrcBlackrock                       =      34;
SET @FactionVillian                            =      35;
SET @FactionVictim                             =      36;
SET @FactionBeastBear                          =      37;
SET @FactionOgre                               =      38;
SET @FactionKurzensMercenaries                 =      39;
SET @FactionEscortee                           =      40;
SET @FactionVentureCompany                     =      41;
SET @FactionBeastRaptor                        =      42;
SET @FactionBasilisk                           =      43;
SET @FactionDragonflightGreen                  =      44;
SET @FactionLostOnes                           =      45;
SET @FactionBlacksmithingArmorsmithing         =      46;
SET @FactionIronforge                          =      47;
SET @FactionDarkIronDwarves                    =      48;
SET @FactionHumanNightWatch                    =      49;
SET @FactionDragonflightRed                    =      50;
SET @FactionGnollMosshide                      =      51;
SET @FactionOrcDragonmaw                       =      52;
SET @FactionGnomeLeper                         =      53;
SET @FactionGnomereganExiles                   =      54;
SET @FactionLeopard                            =      55;
SET @FactionScarletCrusade                     =      56;
SET @FactionGnollRothide                       =      57;
SET @FactionBeastGorilla                       =      58;
SET @FactionThoriumBrotherhood                 =      59;
SET @FactionNaga                               =      60;
SET @FactionDalaran                            =      61;
SET @FactionForlornSpirit                      =      62;
SET @FactionDarkhowl                           =      63;
SET @FactionGrell                              =      64;
SET @FactionFurbolg                            =      65;
SET @FactionHordeGeneric                       =      66;
SET @FactionHorde                              =      67;
SET @FactionUndercity                          =      68;
SET @FactionDarnassus                          =      69;
SET @FactionSyndicate                          =      70;
SET @FactionHillsbradMilitia                   =      71;
SET @FactionStormwind                          =      72;
SET @FactionDemon                              =      73;
SET @FactionElemental                          =      74;
SET @FactionSpirit                             =      75;
SET @FactionOrgrimmar                          =      76;
SET @FactionTreasure                           =      77;
SET @FactionGnollMudsnout                      =      78;
SET @FactionHIllsbradSouthshoreMayor           =      79;
SET @FactionDragonflightBlack                  =      80;
SET @FactionThunderBluff                       =      81;
SET @FactionTrollWitherbark                    =      82;
SET @FactionLeatherworkingElemental            =      83;
SET @FactionQuilboarRazormane                  =      84;
SET @FactionQuilboarBristleback                =      85;
SET @FactionLeatherworkingDragonscale          =      86;
SET @FactionBloodsailBuccaneers                =      87;
SET @FactionBlackfathom                        =      88;
SET @FactionMakrura                            =      89;
SET @FactionCentaurKolkar                      =      90;
SET @FactionCentaurGalak                       =      91;
SET @FactionGelkisClanCentaur                  =      92;
SET @FactionMagramClanCentaur                  =      93;
SET @FactionMaraudine                          =      94;
SET @FactionTheramore                          =     108;
SET @FactionQuilboarRazorfen                   =     109;
SET @FactionQuilboarRazormane2                 =     110;
SET @FactionQuilboarDeathshead                 =     111;
SET @FactionEnemy                              =     128;
SET @FactionAmbient                            =     148;
SET @FactionNethergardeCaravan                 =     168;
SET @FactionSteamwheedleCartel                 =     169;
SET @FactionAllianceGeneric                    =     189;
SET @FactionNethergarde                        =     209;
SET @FactionWailingCaverns                     =     229;
SET @FactionSilithid                           =     249;
SET @FactionSilvermoonRemnant                  =     269;
SET @FactionZandalarTribe                      =     270;
SET @FactionBlacksmithingWeaponsmithing        =     289;
SET @FactionScorpid                            =     309;
SET @FactionBeastBat                           =     310;
SET @FactionTitan                              =     311;
SET @FactionTaskmasterFizzule                  =     329;
SET @FactionRavenholdt                         =     349;
SET @FactionGadgetzan                          =     369;
SET @FactionGnomereganBug                      =     389;
SET @FactionHarpy                              =     409;
SET @FactionBurningBlade                       =     429;
SET @FactionShadowsilkPoacher                  =     449;
SET @FactionSearingSpider                      =     450;
SET @FactionAlliance                           =     469;
SET @FactionRatchet                            =     470;
SET @FactionWildhammerClan                     =     471;
SET @FactionGoblinDarkIronBarPatron            =     489;
SET @FactionTheLeagueofArathor                 =     509;
SET @FactionTheDefilers                        =     510;
SET @FactionGiant                              =     511;
SET @FactionArgentDawn                         =     529;
SET @FactionDarkspearTrolls                    =     530;
SET @FactionDragonflightBronze                 =     531;
SET @FactionDragonflightBlue                   =     532;
SET @FactionLeatherworkingTribal               =     549;
SET @FactionEngineeringGoblin                  =     550;
SET @FactionEngineeringGnome                   =     551;
SET @FactionBlacksmithingHammersmithing        =     569;
SET @FactionBlacksmithingAxesmithing           =     570;
SET @FactionBlacksmithingSwordsmithing         =     571;
SET @FactionTrollVilebranch                    =     572;
SET @FactionSouthseaFreebooters                =     573;
SET @FactionCaerDarrow                         =     574;
SET @FactionFurbolgUncorrupted                 =     575;
SET @FactionTimbermawHold                      =     576;
SET @FactionEverlook                           =     577;
SET @FactionWintersaberTrainers                =     589;
SET @FactionCenarionCircle                     =     609;
SET @FactionShatterspearTrolls                 =     629;
SET @FactionRavasaurTrainers                   =     630;
SET @FactionMajordomoExecutus                  =     649;
SET @FactionBeastCarrionBird                   =     669;
SET @FactionBeastCat                           =     670;
SET @FactionBeastCrab                          =     671;
SET @FactionBeastCrocilisk                     =     672;
SET @FactionBeastHyena                         =     673;
SET @FactionBeastOwl                           =     674;
SET @FactionBeastScorpid                       =     675;
SET @FactionBeastTallstrider                   =     676;
SET @FactionBeastTurtle                        =     677;
SET @FactionBeastWindSerpent                   =     678;
SET @FactionTrainingDummy                      =     679;
SET @FactionDragonflightBlackBait              =     689;
SET @FactionBattlegroundNeutral                =     709;
SET @FactionFrostwolfClan                      =     729;
SET @FactionStormpikeGuard                     =     730;
SET @FactionHydraxianWaterlords                =     749;
SET @FactionSulfuronFirelords                  =     750;
SET @FactionGizlocksDummy                      =     769;
SET @FactionGizlocksCharm                      =     770;
SET @FactionGizlock                            =     771;
SET @FactionMorogai                            =     789;
SET @FactionSpiritGuideAlliance                =     790;
SET @FactionShendralar                         =     809;
SET @FactionOgreCaptainKromcrush               =     829;
SET @FactionSpiritGuideHorde                   =     849;
SET @FactionJaedenar                           =     869;
SET @FactionWarsongOutriders                   =     889;
SET @FactionSilverwingSentinels                =     890;
SET @FactionAllianceForces                     =     891;
SET @FactionHordeForces                        =     892;
SET @FactionRevantuskTrolls                    =     893;
SET @FactionDarkmoonFaire                      =     909;
SET @FactionBroodofNozdormu                    =     910;
SET @FactionSilvermoonCity                     =     911;
SET @FactionMightofKalimdor                    =     912;
SET @FactionPLAYERBloodElf                     =     914;
SET @FactionArmiesofCThun                      =     915;
SET @FactionSilithidAttackers                  =     916;
SET @FactionTheIronforgeBrigade                =     917;
SET @FactionRCEnemies                          =     918;
SET @FactionRCObjects                          =     919;
SET @FactionRed                                =     920;
SET @FactionBlue                               =     921;
SET @FactionTranquillien                       =     922;
SET @FactionFarstriders                        =     923;
SET @FactionDEPRECATED                         =     924;
SET @FactionSunstriders                        =     925;
SET @FactionMagistersGuild                     =     926;
SET @FactionPLAYERDraenei                      =     927;
SET @FactionScourgeInvaders                    =     928;
SET @FactionBloodmaulClan                      =     929;
SET @FactionExodar                             =     930;
SET @FactionTestFactionNotARealFaction         =     931;
SET @FactionTheAldor                           =     932;
SET @FactionTheConsortium                      =     933;
SET @FactionTheScryers                         =     934;
SET @FactionTheShatar                          =     935;
SET @FactionShattrathCity                      =     936;
SET @FactionTrollForest                        =     937;
SET @FactionTheOmenai                          =     938;
SET @FactionDEPRECATED                         =     939;
SET @FactionTheSonsofLothar                    =     940;
SET @FactionTheMaghar                          =     941;
SET @FactionCenarionExpedition                 =     942;
SET @FactionFelOrc                             =     943;
SET @FactionFelOrcGhost                        =     944;
SET @FactionSonsofLotharGhosts                 =     945;
SET @FactionHonorHold                          =     946;
SET @FactionThrallmar                          =     947;
SET @FactionTestFaction2                       =     948;
SET @FactionTestFaction1                       =     949;
SET @FactionToWoWFlag                          =     950;
SET @FactionToWoWFlagTriggerAllianceDND        =     951;
SET @FactionTestFaction3                       =     952;
SET @FactionTestFaction4                       =     953;
SET @FactionToWoWFlagTriggerHordeDND           =     954;
SET @FactionBroken                             =     955;
SET @FactionEthereum                           =     956;
SET @FactionEarthElemental                     =     957;
SET @FactionFightingRobots                     =     958;
SET @FactionActorGood                          =     959;
SET @FactionActorEvil                          =     960;
SET @FactionStillpineFurbolg                   =     961;
SET @FactionCrazedOwlkin                       =     962;
SET @FactionChessAlliance                      =     963;
SET @FactionChessHorde                         =     964;
SET @FactionMonsterSpar                        =     965;
SET @FactionMonsterSparBuddy                   =     966;
SET @FactionTheVioletEye                       =     967;
SET @FactionSunhawks                           =     968;
SET @FactionHandofArgus                        =     969;
SET @FactionSporeggar                          =     970;
SET @FactionFungalGiant                        =     971;
SET @FactionSporeBat                           =     972;
SET @FactionMonsterPredator                    =     973;
SET @FactionMonsterPrey                        =     974;
SET @FactionVoidAnomaly                        =     975;
SET @FactionHyjalDefenders                     =     976;
SET @FactionHyjalInvaders                      =     977;
SET @FactionKurenai                            =     978;
SET @FactionEarthenRing                        =     979;
SET @FactionTheBurningCrusade                  =     980;
SET @FactionArakkoa                            =     981;
SET @FactionZangarmarshBannerAlliance          =     982;
SET @FactionZangarmarshBannerHorde             =     983;
SET @FactionZangarmarshBannerNeutral           =     984;
SET @FactionCavernsofTimeThrall                =     985;
SET @FactionCavernsofTimeDurnholde             =     986;
SET @FactionCavernsofTimeSouthshoreGuards      =     987;
SET @FactionShadowCouncilCovert                =     988;
SET @FactionKeepersofTime                      =     989;
SET @FactionTheScaleoftheSands                 =     990;
SET @FactionDarkPortalDefenderAlliance         =     991;
SET @FactionDarkPortalDefenderHorde            =     992;
SET @FactionDarkPortalAttackerLegion           =     993;
SET @FactionInciterTrigger                     =     994;
SET @FactionInciterTrigger2                    =     995;
SET @FactionInciterTrigger3                    =     996;
SET @FactionInciterTrigger4                    =     997;
SET @FactionInciterTrigger5                    =     998;
SET @FactionManaCreature                       =     999;
SET @FactionKhadgarsServant                    =    1000;
SET @FactionBladespireClan                     =    1001;
SET @FactionEthereumSparbuddy                  =    1002;
SET @FactionProtectorate                       =    1003;
SET @FactionArcaneAnnihilatorDNR               =    1004;
SET @FactionFriendlyHidden                     =    1005;
SET @FactionKirinVarDathric                    =    1006;
SET @FactionKirinVarBelmara                    =    1007;
SET @FactionKirinVarLuminrath                  =    1008;
SET @FactionKirinVarCohlien                    =    1009;
SET @FactionServantofIllidan                   =    1010;
SET @FactionLowerCity                          =    1011;
SET @FactionAshtongueDeathsworn                =    1012;
SET @FactionSpiritsofShadowmoon1               =    1013;
SET @FactionSpiritsofShadowmoon2               =    1014;
SET @FactionNetherwing                         =    1015;
SET @FactionWyrmcult                           =    1016;
SET @FactionTreant                             =    1017;
SET @FactionLeotherasDemonI                    =    1018;
SET @FactionLeotherasDemonII                   =    1019;
SET @FactionLeotherasDemonIII                  =    1020;
SET @FactionLeotherasDemonIV                   =    1021;
SET @FactionLeotherasDemonV                    =    1022;
SET @FactionAzaloth                            =    1023;
SET @FactionRockFlayer                         =    1024;
SET @FactionFlayerHunter                       =    1025;
SET @FactionShadowmoonShade                    =    1026;
SET @FactionLegionCommunicator                 =    1027;
SET @FactionRavenswoodAncients                 =    1028;
SET @FactionChessFriendlytoAllChess            =    1029;
SET @FactionBlackTempleGatesIllidari           =    1030;
SET @FactionShatariSkyguard                    =    1031;
SET @FactionArea52                             =    1032;
SET @FactionMaiev                              =    1033;
SET @FactionSkettisShadowyArakkoa              =    1034;
SET @FactionSkettisArakkoa                     =    1035;
SET @FactionDragonmawEnemy                     =    1036;
SET @FactionAllianceVanguard                   =    1037;
SET @FactionOgrila                             =    1038;
SET @FactionRavager                            =    1039;
SET @FactionFrenzy                             =    1041;
SET @FactionSkyguardEnemy                      =    1042;
SET @FactionSkunkPetunia                       =    1043;
SET @FactionTheramoreDeserter                  =    1044;
SET @FactionVrykul                             =    1045;
SET @FactionNorthseaPirates                    =    1046;
SET @FactionTuskarr                            =    1047;
SET @FactionTrollAmani                         =    1049;
SET @FactionValianceExpedition                 =    1050;
SET @FactionHordeExpedition                    =    1052;
SET @FactionWestguard                          =    1053;
SET @FactionSpottedGryphon                     =    1054;
SET @FactionTamedPlaguehound                   =    1055;
SET @FactionVrykulAncientSpirit1               =    1056;
SET @FactionVrykulAncientSpirit2               =    1057;
SET @FactionVrykulAncientSpirit3               =    1058;
SET @FactionCTFFlagAlliance                    =    1059;
SET @FactionVrykul                             =    1061;
SET @FactionVrykulGladiator                    =    1062;
SET @FactionValgardeCombatant                  =    1063;
SET @FactionTheTaunka                          =    1064;
SET @FactionMonsterZoneForceReaction1          =    1065;
SET @FactionMonsterZoneForceReaction2          =    1066;
SET @FactionTheHandofVengeance                 =    1067;
SET @FactionExplorersLeague                    =    1068;
SET @FactionRamRacingPowerupDND                =    1069;
SET @FactionRamRacingTrapDND                   =    1070;
SET @FactionCraigsSquirrels                    =    1071;
SET @FactionTheKaluak                          =    1073;
SET @FactionHolidayWaterBarrel                 =    1074;
SET @FactionHolidayGeneric                     =    1075;
SET @FactionIronDwarves                        =    1076;
SET @FactionShatteredSunOffensive              =    1077;
SET @FactionFightingVanityPet                  =    1078;
SET @FactionMurlocWinterfin                    =    1079;
SET @FactionFriendlyForceReaction              =    1080;
SET @FactionObjectForceReaction                =    1081;
SET @FactionVrykulSea                          =    1084;
SET @FactionWarsongOffensive                   =    1085;
SET @FactionPoacher                            =    1086;
SET @FactionHolidayMonster                     =    1087;
SET @FactionFurbolgRedfang                     =    1088;
SET @FactionFurbolgFrostpaw                    =    1089;
SET @FactionKirinTor                           =    1090;
SET @FactionTheWyrmrestAccord                  =    1091;
SET @FactionAzjolNerub                         =    1092;
SET @FactionTheSilverCovenant                  =    1094;
SET @FactionGrizzlyHillsTrapper                =    1095;
SET @FactionWrathoftheLichKing                 =    1097;
SET @FactionKnightsoftheEbonBlade              =    1098;
SET @FactionWrathgateScourge                   =    1099;
SET @FactionWrathgateAlliance                  =    1100;
SET @FactionWrathgateHorde                     =    1101;
SET @FactionCTFFlagHorde                       =    1102;
SET @FactionCTFFlagNeutral                     =    1103;
SET @FactionFrenzyheartTribe                   =    1104;
SET @FactionTheOracles                         =    1105;
SET @FactionArgentCrusade                      =    1106;
SET @FactionTrollDrakkari                      =    1107;
SET @FactionCoTArthas                          =    1108;
SET @FactionCoTStratholmeCitizen               =    1109;
SET @FactionCoTScourge                         =    1110;
SET @FactionFreya                              =    1111;
SET @FactionMountTaxiAlliance                  =    1112;
SET @FactionMountTaxiHorde                     =    1113;
SET @FactionMountTaxiNeutral                   =    1114;
SET @FactionElementalWater                     =    1115;
SET @FactionElementalAir                       =    1116;
SET @FactionSholazarBasin                      =    1117;
SET @FactionClassic                            =    1118;
SET @FactionTheSonsofHodir                     =    1119;
SET @FactionIronGiants                         =    1120;
SET @FactionFrostVrykul                        =    1121;
SET @FactionEarthen                            =    1122;
SET @FactionMonsterReferee                     =    1123;
SET @FactionTheSunreavers                      =    1124;
SET @FactionHyldsmeet                          =    1125;
SET @FactionTheFrostborn                       =    1126;
SET @FactionOrgrimmarAlexTest                  =    1127;
SET @FactionBilgewaterCartel                   =    1133;
SET @FactionGilneas                            =    1134;
SET @FactionTranquillienConversion             =    1136;
SET @FactionWintersaberConversion              =    1137;
SET @FactionHatesEverything                    =    1145;
SET @FactionSilverCovenantConversion           =    1154;
SET @FactionSunreaversConversion               =    1155;
SET @FactionTheAshenVerdict                    =    1156;
SET @FactionCTFFlagAlliance2                   =    1159;
SET @FactionCTFFlagHorde2                      =    1160;
