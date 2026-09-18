DELETE FROM `player_race_stats` WHERE `Race` = @Broken;
INSERT INTO `player_race_stats` (`Race`,`Strength`,`Agility`,`Stamina`,`Intellect`,`Spirit`)
SELECT @Broken,`Strength`,`Agility`,`Stamina`,`Intellect`,`Spirit` FROM `player_race_stats` WHERE `Race` = @Draenei LIMIT 1;
