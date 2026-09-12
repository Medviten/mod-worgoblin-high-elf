-- I-248 — self-contained Buccaneer model: creaturemodeldata 90001.
--
-- The Bilgewater Buccaneer (display 26559) pointed at STOCK model 2915
-- (Creature\GoblinShredderMount\...), whose files are supplied by the base
-- client (low-res) and OVERRIDDEN by the optional HD pack PATCH-Q — meaning
-- (a) our anim-fixed M2 in PATCH-Z lost a per-file priority war with Q on the
-- user's client, and (b) non-HD clients mixed our HD-mesh M2 with stock skins
-- (corrupted render). Fix: a dedicated model path shipped COMPLETE in PATCH-Z
-- (M2 with the seq 5/6 -> 54 alias surgery, 4 skins, external 0123-00.anim,
-- red variation BLPs) under CREATURE\ZEPSHREDDERMOUNT\ — no other patch ships
-- that path, so priority cannot interfere. 90001 = clone of stock 2915 with
-- only the path changed. Other displays on 2915 (26558 green etc.) are
-- untouched. ID free (stock creaturemodeldata < 90001).
DELETE FROM creaturemodeldata WHERE id = 90001;
INSERT INTO creaturemodeldata SET
  id = 90001,
  flags = 2,
  model_path = 'Creature\\ZepShredderMount\\ZepShredderMount.mdx',
  size_class = 0,
  model_scale = 1,
  blood_id = 3,
  footprint_texture_id = 4,
  footprint_texture_length = 18,
  footprint_texture_width = 12,
  footprint_particle_scale = 1,
  foley_material_id = 0,
  footstep_shake_size = 0,
  death_thud_shake_size = 0,
  sound_data = 2754,
  collision_width = 0.6111000180244446,
  collision_height = 2.0309998989105225,
  mount_height = 0,
  geo_box_min_x = -1.3654060363769531,
  geo_box_min_y = -2.9613609313964844,
  geo_box_min_z = -0.15938900411129,
  geo_box_max_x = 3.531445026397705,
  geo_box_max_y = 2.684843063354492,
  geo_box_max_z = 4.671901226043701,
  world_effect_scale = 1,
  attached_effect_scale = 1,
  missile_collision_radius = 0,
  missile_collision_push = 0,
  missile_collision_raise = 0;
