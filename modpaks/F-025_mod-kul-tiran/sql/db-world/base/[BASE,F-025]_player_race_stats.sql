/* Set starting stats for Kul Tirans */
DELETE FROM `player_race_stats` WHERE `Race` = @KulTiran;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(@KulTiran, 3, 2, 0, -4, -1); -- Copied from Worgen
