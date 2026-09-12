/* Ogres copy Tauren */
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`)
SELECT
  @Ogre, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`
FROM player_race_stats AS src
WHERE src.Race = @Tauren
  AND NOT EXISTS (
    SELECT 1 FROM player_race_stats WHERE `Race` = @Ogre
  );
