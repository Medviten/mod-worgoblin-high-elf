/* Set starting stats for Worgen and Goblins */
DELETE FROM `player_race_stats` WHERE `Race` = @Worgen;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(@Worgen, 3, 2, 0, -4, -1);
