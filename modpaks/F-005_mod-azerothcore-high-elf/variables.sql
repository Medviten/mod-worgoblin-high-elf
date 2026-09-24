-- Race ID
SET @HighElf := @NextRace := @NextRace +1; -- default: 13
SET @HighElfMask = 1 << (@HighElf - 1);    -- race ID 13 → 4096
SET @HighElfHelmetMask = 1 << @HighElf;    -- race ID 13 → 8192

-- Important variable update
SET @AllianceMask     = @AllianceMask | @HighElfMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;
SET @BowHunters       = @BowHunters   | @HighElf;

-- Miscellaneous
SET @HighElfExplorationSound = @HumanExplorationSound;
SET @HighElfCinematicSequence = @HumanCinematicSequence;