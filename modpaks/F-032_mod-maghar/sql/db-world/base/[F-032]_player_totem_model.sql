-- Horde default totems is the Orc ones.
SET @MagharOrcFireTotem := 30758;
SET @MagharOrcEarthTotem := 30757;
SET @MagharOrcWaterTotem := 30759;
SET @MagharOrcAirTotem := 30756;

-- Mag'har Orc
DELETE FROM player_totem_model WHERE RaceID IN (14);
INSERT INTO player_totem_model (TotemID, RaceID, ModelID) VALUES 
(1, @MagharOrc, @MagharOrcFireTotem),
(2, @MagharOrc, @MagharOrcEarthTotem),
(3, @MagharOrc, @MagharOrcWaterTotem),
(4, @MagharOrc, @MagharOrcAirTotem);
