-- Race ID
SET @ZandalariTroll := @NextRace := @NextRace +1;     -- default: 17
SET @ZandalariTrollMask = 1 << (@ZandalariTroll - 1); -- race ID 17 → 65536
SET @ZandalariTrollHelmetMask = 1 << @ZandalariTroll; -- race ID 17 → 131072

-- Important variable update
SET @HordeMask        = @HordeMask | @ZandalariTrollMask;
SET @BarrensBros      = @HordeMask & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;
SET @BowHunters       = @BowHunters   | @ZandalariTrollMask;

-- Miscellaneous
SET @ZandalariTrollExplorationSound = @TrollExplorationSound;
SET @ZandalariTrollCinematicSequence = @TrollCinematicSequence;
