DELETE FROM `player_race_stats` WHERE `Race` = @DarkIronDwarf;
INSERT INTO `player_race_stats` (`Race`,`Strength`,`Agility`,`Stamina`,`Intellect`,`Spirit`)
SELECT @DarkIronDwarf,`Strength`,`Agility`,`Stamina`,`Intellect`,`Spirit` FROM `player_race_stats` WHERE `Race` = @Dwarf LIMIT 1;
