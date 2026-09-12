-- Adjust waypoint for Rotlimb Cannibal (15655) / Plaguebone Pillager (15654) raiding Fairbreeze Village
    set @xoffset := - 4 * 533.33333;
    set @yoffset := 4 * 533.33333;

    UPDATE `waypoints` SET `position_x` = 8648.83 + @xoffset, `position_y` = -6790.43 + @yoffset WHERE `entry` = 1565501;