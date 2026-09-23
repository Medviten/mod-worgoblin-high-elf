-- Race ID
SET @DarkIronDwarf := @NextRace := @NextRace +1;    -- default: 16
SET @DarkIronDwarfMask = 1 << (@DarkIronDwarf - 1); -- race ID 16 → 32768
SET @DarkIronDwarfHelmetMask = 1 << @DarkIronDwarf; -- race ID 16 → 65536

-- Important variable update
SET @AllianceMask = @AllianceMask | @DarkIronDwarfMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;

-- Miscellaneous
SET @DarkIronDwarfExplorationSound = @DwarfExplorationSound;
SET @DarkIronDwarfCinematicSequence = @DwarfCinematicSequence;
