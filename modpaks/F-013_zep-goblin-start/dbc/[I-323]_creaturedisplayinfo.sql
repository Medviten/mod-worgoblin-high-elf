-- I-323 -- Mechachicken (creature 38224, display 30997) model swap.
--
-- The F-011 port pointed 30997 at model 2674 (Creature\RocketChicken\RocketChicken.mdx),
-- faithfully copying the 4.3.4 donor. Creature\mechanicalchicken\mechanicalchicken.mdx
-- (model 5044) is the better fit for this NPC, so repoint the display.
--
-- The HD pack replaces mechanicalchicken.m2 with a model whose only body texture is
-- slot type 11 with an EMPTY embedded name, so texture_variation_1 must be supplied or
-- the mesh renders untextured -- the same trap that caused the original green report.
-- 'ChickenSkinRobot' is the proven value: stock displays 6909 and 7920 use it on this
-- same model and CREATURE\MECHANICALCHICKEN\CHICKENSKINROBOT.BLP ships in PATCH-Q.
-- The HD model has no type 12/13 slot, so texture_variation_2 is cleared.
--
-- creature_model_scale stays 15.0 (the donor value): the two meshes are the same height
-- (RocketChicken Z max 0.45, mechanicalchicken 0.44), so the NPC keeps its intended size.
--
-- Sorts after [AUTO,F-011]_creaturedisplayinfo.sql (which INSERTs this row) and after
-- [F-011]_fallback_texfix.sql, so this file owns the final state of display 30997.

-- =========================================================================
-- Model row 900008 — Mechachicken's private copy of the HD mechanical chicken
-- =========================================================================
-- The display renders at scale 15, and the client scales locomotion playback by
-- (actual speed / the sequence's authored pace) with no knowledge of model scale, so a
-- 15x model takes proportionally smaller steps for its size and reads sluggish — the
-- knock-on I-318 recorded in Defect 12 at 1.5x. Fixing that from the server needs
-- speed_walk 15 (37.5 yd/s, 5x player run), because ground per cycle is
-- 1000ms * authored and is invariant at every speed (I-318 Defect 11). So the scale is
-- baked into the model instead: authored Walk 2.5 -> 0.166667 and Run 6.9444 -> 0.462963
-- (both /15, all sub-variants), which raises the playback rate by 15 and drops the
-- ground per cycle by 15, leaving visual stride == ground covered at the bird's
-- unchanged 2.5 yd/s walk.
--
-- It must be a CLONE: model 5044 is shipped by patch-hd-everything and shared with stock
-- displays 6909/7920 (the Mechanical Chicken pet at scale 3.0 and 1.0), which an in-place
-- edit would wreck — and repair_m2_movespeed.py's scope rule forbids rewriting HD models
-- in other zpaks. Only display 30997 points here.
--
-- The binary is built by zep-goblin-start/build_mechachicken_m2.py (the M2/SKIN/BLP are
-- gitignored, so that script is the version-controlled record — re-run after any asset
-- re-extract). CHICKENSKINROBOT.BLP ships beside the M2 because the type-11 body texture
-- resolves from the M2's own directory + texture_variation_1.
--
-- All other columns are model 5044's verbatim: same mesh, same collision and geo box, so
-- bounding/mount/footprint behaviour is unchanged.
DELETE FROM creaturemodeldata WHERE id = 900008;
INSERT INTO creaturemodeldata SET
  `id` = 900008,
  `flags` = 0,
  `model_path` = 'Creature\\Mechachicken\\Mechachicken.mdx',
  `size_class` = 0,
  `model_scale` = 1.0,
  `blood_id` = 1,
  `footprint_texture_id` = 5,
  `footprint_texture_length` = 4.0,
  `footprint_texture_width` = 3.0,
  `footprint_particle_scale` = 1.0,
  `foley_material_id` = 0,
  `footstep_shake_size` = 0,
  `death_thud_shake_size` = 0,
  `sound_data` = 111,
  `collision_width` = 0.6111000180244446,
  `collision_height` = 2.0309998989105225,
  `mount_height` = 0.2690919935703278,
  `geo_box_min_x` = -0.2689830064773560,
  `geo_box_min_y` = -0.1959719955921173,
  `geo_box_min_z` = -0.0023650000803173,
  `geo_box_max_x` = 0.2627550065517426,
  `geo_box_max_y` = 0.1860110014677048,
  `geo_box_max_z` = 0.4411030113697052,
  `world_effect_scale` = 1.0,
  `attached_effect_scale` = 1.0,
  `missile_collision_radius` = 0.0,
  `missile_collision_push` = 0.0,
  `missile_collision_raise` = 0.0;

UPDATE creaturedisplayinfo SET
  model_id = 900008,
  texture_variation_1 = 'ChickenSkinRobot',
  texture_variation_2 = ''
WHERE id = 30997;
