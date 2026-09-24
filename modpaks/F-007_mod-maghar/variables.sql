-- Race ID
SET @MagharOrc := @NextRace := @NextRace +1; -- default: 14
SET @MagharOrcMask = 1 << (@MagharOrc - 1);  -- race ID 14 → 8192
SET @MagharOrcHelmetMask = 1 << @MagharOrc;  -- race ID 14 → 16384

-- Important variable update
SET @HordeMask        = @HordeMask    |  @MagharOrcMask;
SET @BarrensBros      = @HordeMask    & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask |  @HordeMask;
SET @BowHunters       = @BowHunters   |  @MagharOrcMask;

-- Miscellaneous
SET @MagharOrcExplorationSound             = @OrcExplorationSound;
SET @MagharOrcCinematicSequence            = @OrcCinematicSequence;
