DELETE FROM `player_race_stats` WHERE `Race` = @ZandalariTroll;
INSERT INTO `player_race_stats` (`Race`,`Strength`,`Agility`,`Stamina`,`Intellect`,`Spirit`)
SELECT @ZandalariTroll,`Strength`,`Agility`,`Stamina`,`Intellect`,`Spirit` FROM `player_race_stats` WHERE `Race` = @Troll LIMIT 1;
