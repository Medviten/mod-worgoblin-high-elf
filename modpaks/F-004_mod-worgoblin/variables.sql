-- Race ID
SET @Goblin = 9;                          -- default: 9
SET @GoblinMask = 1 << (@Goblin - 1);     -- default: 256
SET @GoblinHelmetMask = 1 << @Goblin;     -- default: 512
SET @Worgen := @NextRace := @NextRace +1; -- default: 12
SET @WorgenMask = 1 << (@Worgen - 1);     -- default: 2048
SET @WorgenHelmetMask = 1 << @Worgen;     -- default: 4096

-- Important variable update
SET @AllianceMask     = @AllianceMask |  @WorgenMask;
SET @HordeMask        = @HordeMask    |  @GoblinMask;
SET @BarrensBros      = @HordeMask    & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask |  @HordeMask;
SET @GunHunters       = @GunHunters   |  @WorgenMask | @GoblinMask;

-- Miscellaneous
SET @WorgenExplorationSound = @TaurenExplorationSound;
SET @WorgenCinematicSequence = @NightElfCinematicSequence;
SET @GoblinExplorationSound = @OrcExplorationSound;
SET @GoblinCinematicSequence = @OrcCinematicSequence;
