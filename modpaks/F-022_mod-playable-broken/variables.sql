-- Race ID
SET @Broken := @NextRace := @NextRace +1;
SET @BrokenMask = 1 << (@Broken - 1);
SET @BrokenHelmetMask = 1 << @Broken;

-- Important variable update
SET @AllianceMask = @AllianceMask | @BrokenMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;

-- Miscellaneous
SET @BrokenExplorationSound = @DraeneiExplorationSound;
SET @BrokenCinematicSequence = @DraeneiCinematicSequence;
