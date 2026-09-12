/* Set starting stats for Worgen and Goblins */
DELETE FROM `player_race_stats` WHERE `Race` IN(@Goblin, @Worgen);
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(@Goblin, -3, 2, 0, 3, -2), -- goblin
(@Worgen, 3, 2, 0, -4, -1); -- worgen
