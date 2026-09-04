-- Alliance default totems is the Dwarf ones
SET @HumanFireTotem := 30754;
SET @HumanEarthTotem := 30753;
SET @HumanWaterTotem := 30755;
SET @HumanAirTotem := 30736;

SET @NightElfFireTotem := 30754;
SET @NightElfEarthTotem := 30753;
SET @NightElfWaterTotem := 30755;
SET @NightElfAirTotem := 30736;

SET @GnomeFireTotem := 30754;
SET @GnomeEarthTotem := 30753;
SET @GnomeWaterTotem := 30755;
SET @GnomeAirTotem := 30736;

-- Horde default totems is the Orc ones.
SET @UndeadFireTotem := 30758;
SET @UndeadEarthTotem := 30757;
SET @UndeadWaterTotem := 30759;
SET @UndeadAirTotem := 30756;

SET @BloodElfFireTotem := 30758;
SET @BloodElfEarthTotem := 30757;
SET @BloodElfWaterTotem := 30759;
SET @BloodElfAirTotem := 30756;

-- Human, Night Elf, Undead, Gnome and Blood Elf
DELETE FROM player_totem_model WHERE RaceID IN (1,4,5,7,10);
INSERT INTO player_totem_model (TotemID, RaceID, ModelID) VALUES 
(1, @Human, @HumanFireTotem),
(2, @Human, @HumanEarthTotem),
(3, @Human, @HumanWaterTotem),
(4, @Human, @HumanAirTotem),

(1, @NightElf, @NightElfFireTotem),
(2, @NightElf, @NightElfEarthTotem),
(3, @NightElf, @NightElfWaterTotem),
(4, @NightElf, @NightElfAirTotem),

(1, @Undead, @UndeadFireTotem),
(2, @Undead, @UndeadEarthTotem),
(3, @Undead, @UndeadWaterTotem),
(4, @Undead, @UndeadAirTotem),

(1, @Gnome, @GnomeFireTotem),
(2, @Gnome, @GnomeEarthTotem),
(3, @Gnome, @GnomeWaterTotem),
(4, @Gnome, @GnomeAirTotem),

(1, @BloodElf, @BloodElfFireTotem),
(2, @BloodElf, @BloodElfEarthTotem),
(3, @BloodElf, @BloodElfWaterTotem),
(4, @BloodElf, @BloodElfAirTotem);
