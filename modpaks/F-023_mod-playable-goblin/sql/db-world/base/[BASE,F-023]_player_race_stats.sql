/* Set starting stats for Goblins */
DELETE FROM `player_race_stats` WHERE `Race` = @Goblin;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(@Goblin, -3, 2, 0, 3, -2);
