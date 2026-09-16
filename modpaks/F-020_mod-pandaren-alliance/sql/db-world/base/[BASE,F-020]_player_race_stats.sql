/* Set starting stats for Alliance Pandaren */
DELETE FROM `player_race_stats` WHERE `Race` IN(@AlliancePandaren);
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(@AlliancePandaren, 3, 2, 0, -4, -1); -- copied from Worgen
