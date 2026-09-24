-- Race ID
SET @AlliancePandaren := @NextRace := @NextRace +1;       -- default: 19
SET @AlliancePandarenMask = 1 << (@AlliancePandaren - 1); -- race ID 19 → 262144
SET @AlliancePandarenHelmetMask = 1 << @AlliancePandaren; -- race ID 19 → 524288

-- Important variable update
SET @AllianceMask     = @AllianceMask    | @AlliancePandarenMask;
SET @PlayableRaceMask = @AllianceMask    | @HordeMask;
SET @CrossbowHunters  = @CrossbowHunters | @AlliancePandarenMask;

-- Miscellaneous
SET @AlliancePandarenExplorationSound = @TaurenExplorationSound;
SET @AlliancePandarenCinematicSequence = @NightElfCinematicSequence;
