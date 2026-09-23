-- Race ID
SET @HordePandaren := @NextRace := @NextRace +1;    -- default: 20
SET @HordePandarenMask = 1 << (@HordePandaren - 1); -- race ID 20 → 524288
SET @HordePandarenHelmetMask = 1 << @HordePandaren; -- race ID 20 → 1048576

-- Important variable update
SET @HordeMask = @HordeMask | @HordePandarenMask;
SET @BarrensBros = @HordeMask & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;

-- Miscellaneous
SET @HordePandarenExplorationSound = @TaurenExplorationSound;
SET @HordePandarenCinematicSequence = @TaurenCinematicSequence;

