/* Set starting stats for Worgen and Goblins */
DELETE FROM `player_race_stats` WHERE `Race` IN(9, 12, 13);
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
(9, -3, 2, 0, 3, -2), -- goblin
(12, 3, 2, 0, -4, -1); -- worgen

/* High Elves copy Blood Elves */
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`)
SELECT
  13, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`
FROM player_race_stats AS src
WHERE src.Race = 10
  AND NOT EXISTS (
    SELECT 1 FROM player_race_stats WHERE Race = 13
  ); -- -3,2,0,3,-2 as of 2026
