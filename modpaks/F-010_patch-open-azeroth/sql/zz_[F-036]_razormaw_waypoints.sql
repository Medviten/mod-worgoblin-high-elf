-- fix the event creature spawn for Razormaw (17592) by object Ever-burning Pyre (181988)
UPDATE `event_scripts` SET `x` = 8478, `y` = 5532 WHERE `id` = 11087;

-- fix the waypoints for creature Razormaw (17592)
UPDATE `waypoints` SET `position_x` = -1167.07 + 9599.9999, `position_y` = -12594.7 + 18133.333 WHERE (entry = 17592 AND `pointid` = 1);
UPDATE `waypoints` SET `position_x` = -1200.9 + 9599.9999, `position_y` = -12554.5 + 18133.333 WHERE (entry = 17592 AND `pointid` = 2);
UPDATE `waypoints` SET `position_x` = -1208.03 + 9599.9999, `position_y` = -12469.6 + 18133.333 WHERE (entry = 17592 AND `pointid` = 3);
