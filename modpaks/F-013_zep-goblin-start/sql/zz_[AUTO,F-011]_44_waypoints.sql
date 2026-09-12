-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 waypoints (one file per table; rows carry final state)

DELETE FROM waypoints WHERE entry = 36608;
DELETE FROM waypoints WHERE entry = 37598;
DELETE FROM waypoints WHERE entry = 38111;
DELETE FROM waypoints WHERE entry = 38224;
DELETE FROM waypoints WHERE entry = 39582;
DELETE FROM waypoints WHERE entry = 75116;
DELETE FROM waypoints WHERE entry = 366080;
DELETE FROM waypoints WHERE entry = 3651300;
DELETE FROM waypoints WHERE entry = 3904200;
DELETE FROM waypoints WHERE entry = 3904201;
DELETE FROM waypoints WHERE entry = 7511600;
DELETE FROM waypoints WHERE entry = 7511601;

INSERT INTO waypoints (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `point_comment`) VALUES
  (36608, 1, 15.8577, -9539.44, -0.9749, NULL, 0, 'Doc Zapnozzle WP'),
  (36608, 2, 6.7867, -9529.18, -0.95, NULL, 0, 'Doc Zapnozzle WP'),
  (37598, 1, -8957.4233, -11456.43, 102.411, NULL, 0, 'F-011 escort path'),
  (37598, 2, -8957.4433, -11453.3, 104.663, NULL, 0, 'F-011 escort path'),
  (37598, 3, -8956.6633, -11435.93, 104.681, NULL, 0, 'F-011 escort path'),
  (38111, 1, 394.1597, -10467.48, 15.8205, NULL, 0, 'F-011 escort path'),
  (38111, 2, 382.2937, -10465.74, 10.3153, NULL, 0, 'F-011 escort path'),
  (38111, 3, 373.3067, -10465.8, 5.6695, NULL, 0, 'F-011 escort path'),
  (38111, 4, 370.2587, -10465.71, 5.0401, NULL, 0, 'F-011 escort path'),
  (38224, 1, 732.6067, -10400.44, 1.0004, NULL, 0, 'F-011 escort path'),
  (38224, 2, 729.1367, -10412.99, 1.2441, NULL, 0, 'F-011 escort path'),
  (38224, 3, 725.1967, -10425.25, 1.0534, NULL, 0, 'F-011 escort path'),
  (38224, 4, 717.7667, -10435.73, 1.1827, NULL, 0, 'F-011 escort path'),
  (38224, 5, 706.9867, -10444.87, 1.1837, NULL, 0, 'F-011 escort path'),
  (38224, 6, 695.0267, -10449.51, 0.8418, NULL, 0, 'F-011 escort path'),
  (38224, 7, 677.4167, -10461.78, 0.8388, NULL, 0, 'F-011 escort path'),
  (38224, 8, 668.2367, -10472.83, 0.9585, NULL, 0, 'F-011 escort path'),
  (38224, 9, 652.4067, -10481.73, 0.7548, NULL, 0, 'F-011 escort path'),
  (38224, 10, 637.5467, -10485.95, 0.5, NULL, 0, 'F-011 escort path'),
  (38224, 11, 624.4167, -10491.2, 0.6282, NULL, 0, 'F-011 escort path'),
  (38224, 12, 642.1067, -10485.68, 0.6775, NULL, 0, 'F-011 escort path'),
  (38224, 13, 664.4867, -10475.92, 1.0186, NULL, 0, 'F-011 escort path'),
  (38224, 14, 678.6367, -10466.02, 1.0286, NULL, 0, 'F-011 escort path'),
  (38224, 15, 687.4967, -10457.18, 1.3832, NULL, 0, 'F-011 escort path'),
  (38224, 16, 700.1367, -10450.77, 0.9757, NULL, 0, 'F-011 escort path'),
  (38224, 17, 714.4067, -10441.69, 1.3721, NULL, 0, 'F-011 escort path'),
  (38224, 18, 725.2267, -10428.55, 1.1473, NULL, 0, 'F-011 escort path'),
  (38224, 19, 727.9967, -10414.45, 1.2355, NULL, 0, 'F-011 escort path'),
  (38224, 20, 729.9567, -10400.25, 0.7908, NULL, 0, 'F-011 escort path'),
  (38224, 21, 732.1867, -10392.14, 0.597, NULL, 0, 'F-011 escort path'),
  (39582, 1, 1745.9667, -10378.87, 22.56, NULL, 0, 'F-011 escort path'),
  (75116, 1, 374.3657, -10565.46, 25.72, NULL, 0, 'F-011 escort path'),
  (75116, 2, 382.4757, -10485.74, 7.7717, NULL, 0, 'F-011 escort path'),
  (366080, 1, 22.3937, -9604.26, -1.0184, NULL, 0, 'Doc Zapnozzle WP'),
  (366080, 2, 25.4437, -9617.47, -1.0184, NULL, 0, 'Doc Zapnozzle WP'),
  (3651300, 1, 327.0587, -10050.91, 119.845, NULL, 0, 'F-011 escort path'),
  (3651300, 2, 331.6557, -10057.34, 121.856, NULL, 0, 'F-011 escort path'),
  (3651300, 3, 336.8567, -10056.07, 122.43, NULL, 0, 'F-011 escort path'),
  (3904200, 1, 1178.2167, -9934.49, 11.2611, NULL, 0, 'F-011 escort path'),
  (3904201, 1, 1323.0467, -10048.89, 15.15, NULL, 0, 'F-011 escort path'),
  (7511600, 1, 382.1607, -10562.52, 23.46, NULL, 0, 'F-011 escort path'),
  (7511600, 2, 385.3197, -10486.04, 7.792, NULL, 0, 'F-011 escort path'),
  (7511601, 1, 386.3177, -10562.08, 22.88, NULL, 0, 'F-011 escort path'),
  (7511601, 2, 388.7137, -10484.85, 7.584, NULL, 0, 'F-011 escort path');

