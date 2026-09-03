-- Horde default totems is the Orc ones.
SET @OgreFireTotem := 30758;
SET @OgreEarthTotem := 30757;
SET @OgreWaterTotem := 30759;
SET @OgreAirTotem := 30756;

-- Ogre
DELETE FROM player_totem_model WHERE RaceID IN (15);
INSERT INTO player_totem_model (TotemID, RaceID, ModelID) VALUES 
(1, @Ogre, @OgreFireTotem),
(2, @Ogre, @OgreEarthTotem),
(3, @Ogre, @OgreWaterTotem),
(4, @Ogre, @OgreAirTotem);

