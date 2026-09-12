/* Mag'har Orcs copy Orcs */
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`)
SELECT
  @MagharOrc, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`
FROM player_race_stats AS src
WHERE src.Race = @Orc
  AND NOT EXISTS (
    SELECT 1 FROM player_race_stats WHERE Race = @MagharOrc
  );
