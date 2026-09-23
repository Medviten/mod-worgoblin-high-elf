-- Race ID
SET @Goblin = 9; -- default: 9
SET @GoblinMask = 1 << (@Goblin - 1); -- default: 256
SET @GoblinHelmetMask = 1 << @Goblin; -- default: 512

-- Important variable update
SET @HordeMask = @HordeMask | @GoblinMask;
SET @BarrensBros = @HordeMask & ~@UndercityMask;
SET @PlayableRaceMask = @AllianceMask | @HordeMask;

-- Miscellaneous
SET @GoblinExplorationSound = @OrcExplorationSound;
SET @GoblinCinematicSequence = @OrcCinematicSequence;

/*
-- Racials
SET @GoblinRacials = 790;
SET @GoblinRacial1 = 69041; -- Rocket Barrage
SET @GoblinRacial2 = 69042; -- Time is Money
SET @GoblinRacial3 = 69044; -- Best Deals Anywhere
SET @GoblinRacial4 = 69045; -- Better Living Through Chemistry
SET @GoblinRacial5 = 69046; -- Pack Hobgoblin
SET @GoblinRacial6 = 69070; -- Rocket Jump
SET @GoblinRacialSkillRaceClass = 972;

-- Models
SET @HobgoblinModel = 3194; -- Gobber (bank guy)
SET @GoblinTrikeModel = 3623;
SET @GoblinTurboTrikeModel = 3624;

-- Mount Display IDs
SET @HobgoblinDisplay = 32385;
SET @GoblinTrikeDisplay = 35249;
SET @GoblinTurboTrikeDisplay = 35250;

-- Creature IDs
SET @GobberCreatureID = 36613;
SET @GoblinTrikeCreatureID = 46754;
SET @GoblinTurboTrikeCreatureID = 46755;

-- Items
SET @GoblinTrikeItem = 62461;
SET @GoblinTurboTrikeItem = 62462;

-- Mount Spells
SET @GoblinTrike = 87090;
SET @GoblinTurboTrike = 87091;

-- Faction
SET @GoblinPlayer = 1162;
SET @GoblinFactionTemplate = 2238; -- References @GoblinPlayer
SET @GoblinFaction = 1164; -- Bilgewater Cartel
SET @GoblinFactionRepIndex = 105;

-- Achievement
SET @GoblinAchievement                     =  1429;
SET @GoblinCriteria1                       =  13471; -- Achievement 1005: Know Thy Enemy
SET @GoblinCriteria2                       =  13473; -- Achievement 2422: Shake Your Bunny-Maker
SET @GoblinCriteria3                       =  13475; -- Achievement 291: Check Your Head
SET @GoblinCriteria4                       =  13477; -- @GoblinAchievement: Realm First! Level 80 Goblin
*/