-- Adjust waypoints for Ranger Lilatha (16295) by Altar of Tidal Mastery (181157) for quest Escape from the Catacombs (9212)
    set @xoffset := - 4 * 533.33333;
    set @yoffset := 4 * 533.33333;

    DELETE FROM `script_waypoint` WHERE `entry` = 16295;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `location_x` = 7545.07 + @xoffset,
        `location_y` = -7359.87 + @yoffset,
        `location_z` = 162.354,
        `waittime` = 4000,
        `point_comment` = 'SAY_START';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 1,
        `location_x` = 7550.05 + @xoffset,
        `location_y` = -7362.24 + @yoffset,
        `location_z` = 162.236;


    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 2,
        `location_x` = 7566.98 + @xoffset,
        `location_y` = -7364.32 + @yoffset,
        `location_z` = 161.739;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 3,
        `location_x` = 7578.83 + @xoffset,
        `location_y` = -7361.68 + @yoffset,
        `location_z` = 161.739;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 4,
        `location_x` = 7590.97 + @xoffset,
        `location_y` = -7359.05 + @yoffset,
        `location_z` = 162.258;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 5,
        `location_x` = 7598.35 + @xoffset,
        `location_y` = -7362.82 + @yoffset,
        `location_z` = 162.257,
        `waittime` = 4000,
        `point_comment` = 'SAY_PROGRESS_1';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 6,
        `location_x` = 7605.86 + @xoffset,
        `location_y` = -7380.42 + @yoffset,
        `location_z` = 161.937;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 7,
        `location_x` = 7605.3 + @xoffset,
        `location_y` = -7387.38 + @yoffset,
        `location_z` = 157.254;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 8,
        `location_x` = 7606.13 + @xoffset,
        `location_y` = -7393.89 + @yoffset,
        `location_z` = 156.942;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 9,
        `location_x` = 7615.21 + @xoffset,
        `location_y` = -7400.19 + @yoffset,
        `location_z` = 157.143;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 10,
        `location_x` = 7618.96 + @xoffset,
        `location_y` = -7402.65 + @yoffset,
        `location_z` = 158.202;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 11,
        `location_x` = 7636.85 + @xoffset,
        `location_y` = -7401.76 + @yoffset,
        `location_z` = 162.145,
        `point_comment` = 'SAY_PROGRESS_2';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 12,
        `location_x` = 7637.06 + @xoffset,
        `location_y` = -7404.94 + @yoffset,
        `location_z` = 162.207,
        `waittime` = 4000;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 13,
        `location_x` = 7636.91 + @xoffset,
        `location_y` = -7412.59 + @yoffset,
        `location_z` = 162.366;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 14,
        `location_x` = 7637.61 + @xoffset,
        `location_y` = -7425.59 + @yoffset,
        `location_z` = 162.631;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 15,
        `location_x` = 7637.82 + @xoffset,
        `location_y` = -7459.06 + @yoffset,
        `location_z` = 163.303;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 16,
        `location_x` = 7638.86 + @xoffset,
        `location_y` = -7470.9 + @yoffset,
        `location_z` = 162.517;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 17,
        `location_x` = 7641.4 + @xoffset,
        `location_y` = -7488.22 + @yoffset,
        `location_z` = 157.381;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 18,
        `location_x` = 7634.46 + @xoffset,
        `location_y` = -7505.45 + @yoffset,
        `location_z` = 154.682,
        `point_comment` = 'SAY_PROGRESS_3';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 19,
        `location_x` = 7631.91 + @xoffset,
        `location_y` = -7516.95 + @yoffset,
        `location_z` = 153.597;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 20,
        `location_x` = 7622.23 + @xoffset,
        `location_y` = -7537.04 + @yoffset,
        `location_z` = 151.587;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 21,
        `location_x` = 7610.92 + @xoffset,
        `location_y` = -7550.67 + @yoffset,
        `location_z` = 149.639;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 22,
        `location_x` = 7598.23 + @xoffset,
        `location_y` = -7562.55 + @yoffset,
        `location_z` = 145.954;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 23,
        `location_x` = 7588.51 + @xoffset,
        `location_y` = -7577.76 + @yoffset,
        `location_z` = 148.294;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 24,
        `location_x` = 7567.34 + @xoffset,
        `location_y` = -7608.46 + @yoffset,
        `location_z` = 146.006;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 25,
        `location_x` = 7562.55 + @xoffset,
        `location_y` = -7617.42 + @yoffset,
        `location_z` = 148.098;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 26,
        `location_x` = 7561.51 + @xoffset,
        `location_y` = -7645.06 + @yoffset,
        `location_z` = 151.245;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 27,
        `location_x` = 7563.34 + @xoffset,
        `location_y` = -7654.65 + @yoffset,
        `location_z` = 151.227;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 28,
        `location_x` = 7565.53 + @xoffset,
        `location_y` = -7658.3 + @yoffset,
        `location_z` = 151.249;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 30,
        `location_x` = 7579.12 + @xoffset,
        `location_y` = -7662.21 + @yoffset,
        `location_z` = 151.652,
        `point_comment` = 'quest complete';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 31,
        `location_x` = 7603.77 + @xoffset,
        `location_y` = -7667.0 + @yoffset,
        `location_z` = 153.998;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 32,
        `location_x` = 7603.77 + @xoffset,
        `location_y` = -7667.0 + @yoffset,
        `location_z` = 153.998,
        `waittime` = 4000,
        `point_comment` = 'SAY_END_1';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 33,
        `location_x` = 7603.77 + @xoffset,
        `location_y` = -7667.0 + @yoffset,
        `location_z` = 153.998,
        `waittime` = 8000,
        `point_comment` = 'SAY_END_2';

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 34,
        `location_x` = 7603.77 + @xoffset,
        `location_y` = -7667.0 + @yoffset,
        `location_z` = 153.998;

    INSERT INTO `script_waypoint` SET
        `entry` = 16295,
        `pointid` = 39,
        `location_x` = 7571.16 + @xoffset,
        `location_y` = -7659.12 + @yoffset,
        `location_z` = 151.245;