-- Race ID
SET @Vulpera := @NextRace := @NextRace +1; -- default: 18
SET @VulperaMask = 1 << (@Vulpera - 1);    -- race ID 18 → 131072
SET @VulperaHelmetMask = 1 << @Vulpera;    -- race ID 18 → 262144

-- Important variable update
SET @HordeMask = @HordeMask | @VulperaMask;
SET @BarrensBros = @HordeMask & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;

-- Miscellaneous
SET @VulperaExplorationSound = @TaurenExplorationSound;
SET @VulperaCinematicSequence = @TaurenCinematicSequence;
