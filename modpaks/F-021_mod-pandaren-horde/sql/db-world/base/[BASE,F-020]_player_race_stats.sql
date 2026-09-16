/* Set starting stats for Horde Pandaren */
DELETE FROM `player_race_stats` WHERE `Race` IN(@Goblin, @HordePandaren);
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(@HordePandaren, 3, 2, 0, -4, -1); -- copied from Worgen
