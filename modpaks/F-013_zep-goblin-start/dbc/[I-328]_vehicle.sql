-- I-328 "A Goblin in Shark's Clothing" (quest 24817) — Mechashark X-Steam vehicle 628.
-- The Cata Vehicle.dbc row never shipped: creature 38318 reached creature_template
-- through the quest_npcs objective-proxy path (reduced column set, no VehicleId), so
-- vehicles.py — which only ports vehicles for collected creatures with VehicleId != 0 —
-- never saw it. Ported verbatim from the 4.3.4 client Vehicle.dbc (same 40 fields both
-- builds), single seat 7527 ([I-328]_vehicleseat.sql).
-- Row is ours (absent from the AUTO file) -> DELETE + INSERT.
-- Server reads data/dbc/Vehicle.dbc, client reads PATCH-Z: dbc apply -> PATCH-Z build
-- -> worldserver restart.
DELETE FROM vehicle WHERE id = 628;
INSERT INTO vehicle SET
  `id` = 628,
  `flags` = 1610657807,
  `turn_speed` = 3.142,
  `pitch_speed` = 3.142,
  `pitch_min` = 0,
  `pitch_max` = 0,
  `seat_id_1` = 7527,
  `seat_id_2` = 0,
  `seat_id_3` = 0,
  `seat_id_4` = 0,
  `seat_id_5` = 0,
  `seat_id_6` = 0,
  `seat_id_7` = 0,
  `seat_id_8` = 0,
  `mouse_look_offset_pitch` = 0.785398,
  `camera_fade_dist_scalar_min` = 1,
  `camera_fade_dist_scalar_max` = 1.5,
  `camera_pitch_offset` = 0.261799,
  `facing_limit_right` = 0,
  `facing_limit_left` = 0,
  `mssl_trgt_turn_lingering` = 0,
  `mssl_trgt_pitch_lingering` = 0,
  `mssl_trgt_mouse_lingering` = 0,
  `mssl_trgt_end_opacity` = 0,
  `mssl_trgt_arc_speed` = 0,
  `mssl_trgt_arc_repeat` = 0,
  `mssl_trgt_arc_width` = 0,
  `mssl_trgt_impact_radius_1` = 0,
  `mssl_trgt_impact_radius_2` = 0,
  `mssl_trgt_arc_texture` = '',
  `mssl_trgt_impact_texture` = '',
  `mssl_trgt_impact_model_1` = '',
  `mssl_trgt_impact_model_2` = '',
  `camera_yaw_offset` = 0,
  `ui_locomotion_type` = 0,
  `mssl_trgt_impact_tex_radius` = 0,
  `ui_seat_indicator_type` = 0,
  `power_display_1` = 0,
  `power_display_2` = 0,
  `power_display_3` = 0;
