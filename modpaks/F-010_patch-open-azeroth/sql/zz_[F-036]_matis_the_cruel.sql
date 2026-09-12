SET @positionx_min = -6930;
SET @positiony_min = -15200;
SET @positionx_max = 526;
SET @positiony_max = -9067;

-- fix the waypoints for creature Matis the Cruel (17664)
UPDATE `waypoints` 
SET `position_x` = `position_x` + 9599.9999, 
    `position_y` = `position_y` + 18133.333 
WHERE `entry` = 17664 
  AND `position_x` BETWEEN @positionx_min AND @positionx_max
  AND `position_y` BETWEEN @positiony_min AND @positiony_max;