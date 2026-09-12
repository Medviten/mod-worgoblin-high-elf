-- I-337 — B.C. Eliminator (vehicle 640): rooted-cannon aim config.
--
-- SUPERSEDES a wrong earlier cut of this file, which copied the stock SotA **demolisher**
-- (vehicle 158) wholesale on the strength of I-248 having done that for the shredder. The
-- shredder IS a demolisher-class driveable vehicle; this is a bolted-down gun emplacement.
-- Result in-game: the turret started driving around and the aim arc still did not appear.
--
-- What the right donor is. Three stock 3.3.5a ROOTED cannons exist, all with a working aim
-- UI and all using our very own spell family / SpellVisual 12925:
--   160 Antipersonnel Cannon (SotA, 27894)   seat 2029
--   244 Wintergrasp Tower Cannon (28366)     seat 2283
--   510 Keep Cannon (IoC, 34944)             seat 5786
-- Diffing 640 against them shows the row was **already modelled on 244**: mouse_look_offset_-
-- pitch 0.6109, camera_pitch_offset 0.2967, camera_yaw_offset 0.0698, arc_speed 2,
-- impact_radius 10/1, turn_speed 2.094 and ui_seat_indicator_type 0 are 244's values exactly.
-- Almost nothing was wrong with it.
--
-- Why the turret moved. AC defines only eight vehicle flags (VehicleDefines.h:38) and ALL
-- FOUR rows — 158, 160, 244, 510 — carry the identical known set including
-- VEHICLE_FLAG_ADJUST_AIM_ANGLE 0x400, so vehicle flags were never the aim-UI blocker. The
-- differences live in client-only bits. Bit 21 (0x200000) is present in all three rooted
-- cannons AND in 640's own value, and absent from the demolisher 158 — so overwriting 640's
-- flags with 158's dropped it and the emplacement became driveable. 640's original flags are
-- restored here and must stay.
--
-- One deliberate adoption from the stock rooted cannons:
--   * pitch_min 0 -> -0.5236 (30deg of depression), as all three stock cannons have, and the
--     same value missile 582 carries as its own default_pitch_min (see [I-337]_spell.sql) —
--     vehicle and missile agree on the stock cannon's depression envelope. Functional here
--     too: the warriors spawn and charge from 100-140yd DOWNHILL of the turret, so a gun that
--     cannot aim below horizontal cannot engage them.
-- Every other field returns to its shipped value, INCLUDING facing_limit_right/left, which an
-- earlier cut widened 0.4363 (25deg) -> 1.745329 on the theory that the tight Cata traverse
-- was blocking the aim UI. It was not — the aim UI was blocked by spell_missile_id = 0
-- ([I-337]_spell.sql), so the authentic 25deg emplacement arc is restored.
--
-- The row belongs to dbc/[AUTO,F-011]_vehicle.sql, so it is edited in place below.

UPDATE vehicle SET
  `flags` = 1730950775,
  `turn_speed` = 2.094,
  `pitch_speed` = 1.047,
  `pitch_min` = -0.5235999822616577,
  `pitch_max` = 1.047,
  `mouse_look_offset_pitch` = 0.6109,
  `camera_pitch_offset` = 0.2967,
  `camera_yaw_offset` = 0.0698,
  `facing_limit_right` = 0.4363,
  `facing_limit_left` = 0.4363,
  `mssl_trgt_arc_speed` = 2,
  `mssl_trgt_arc_width` = 1.6,
  `mssl_trgt_impact_radius_1` = 10,
  `mssl_trgt_impact_radius_2` = 1,
  `mssl_trgt_impact_tex_radius` = 15,
  `ui_seat_indicator_type` = 0
WHERE `id` = 640;
