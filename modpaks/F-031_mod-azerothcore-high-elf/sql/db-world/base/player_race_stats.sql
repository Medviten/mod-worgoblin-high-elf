/* High Elves copy Blood Elf stats */
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`)
SELECT
  @HighElf, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`
FROM `player_race_stats` AS src
WHERE src.Race = @BloodElf
  AND NOT EXISTS (
    SELECT 1 FROM `player_race_stats` WHERE `Race` = @HighElf
  ); -- -3,2,0,3,-2 as of 2026
