-- Race ID
SET @KulTiran := @NextRace := @NextRace +1; -- default: 21
SET @KulTiranMask = 1 << (@KulTiran - 1); -- race ID 21 → 1048576
SET @KulTiranHelmetMask = 1 << @KulTiran; -- race ID 21 → 2097152

-- Important variable update
SET @AllianceMask = @AllianceMask | @KulTiranMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;

-- Miscellaneous
SET @KulTiranExplorationSound = @HumanExplorationSound;
SET @KulTiranCinematicSequence = @HumanCinematicSequence;
