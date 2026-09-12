-- I-248 — Bilgewater Buccaneer (vehicle 582): full WotLK siege-aim config.
--
-- The Cata-ported row (owned by dbc/[AUTO,F-011]_vehicle.sql -> consolidated
-- UPDATE here) uses CATA flag semantics and Cata tuning, so the 3.3.5a client
-- never engaged the siege aim UI (green trajectory arc + big yellow impact
-- marker) and dest casts fell back to the ground-click reticle.
--
-- Per testing, flags + pitch alone were not enough — so adopt the stock SotA
-- demolisher (158, proven lobbed-projectile arc vehicle; WG demolisher 106 and
-- catapult 79 are near-identical) for EVERY aim/camera/marker field, leaving
-- only our own seat ids. Byte-diffed against the shipped Vehicle.dbc row 158:
--   flags 1594726007 (0x5f0d9677: ADJUST_AIM_ANGLE + pitch bits)
--   turn_speed 3.142 -> 1.047 (Cata rate spun 3x faster — twitchy aim)
--   pitch 0..1.047 (60deg loft for the rooftop goal), mouse-look offset 45deg
--   camera: fade scalars 1.0/1.5, pitch offset 0.2618, yaw offset 0.0349
--   impact marker: radius 6 -> 15 / tex radius 6 -> 15 / secondary ring 10
--     (the "big yellow target"; arc + marker art fields already matched stock)
--   ui_seat_indicator_type 0 -> 222 (stock demolisher seat indicator)
UPDATE vehicle SET
  flags = 1594726007,
  turn_speed = 1.0470000505447388,
  pitch_speed = 1.0470000505447388,
  pitch_min = 0,
  pitch_max = 1.0470000505447388,
  mouse_look_offset_pitch = 0.785398006439209,
  camera_fade_dist_scalar_min = 1,
  camera_fade_dist_scalar_max = 1.5,
  camera_pitch_offset = 0.2617993950843811,
  camera_yaw_offset = 0.0348999984562397,
  mssl_trgt_impact_radius_1 = 15,
  mssl_trgt_impact_radius_2 = 10,
  mssl_trgt_impact_tex_radius = 15,
  ui_seat_indicator_type = 222
WHERE id = 582;
