-- Race ID
SET @Ogre := @NextRace := @NextRace +1; -- default: 15
SET @OgreMask = 1 << (@Ogre - 1);       -- race ID 15 → 16384
SET @OgreHelmetMask = 1 << @Ogre;       -- race ID 15 → 32768

-- Important variable update
SET @HordeMask        = @HordeMask    | @OgreMask;
SET @BarrensBros      = @HordeMask    & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;
SET @BowHunters       = @BowHunters   | @OgreMask;

-- Miscellaneous
SET @OgreExplorationSound = @OrcExplorationSound;
SET @OgreCinematicSequence = @OrcCinematicSequence;
