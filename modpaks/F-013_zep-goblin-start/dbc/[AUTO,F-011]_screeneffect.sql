-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 screeneffect (one file per table; rows carry final state)

-- 623 <- spell 68376
DELETE FROM screeneffect WHERE id = 623;
INSERT INTO screeneffect SET
  `id` = 623,
  `name` = 'The Lost Isles - Infrared Heatfocals',
  `type` = 3,
  `colour` = 3355377664,
  `screen_edge_size` = 3,
  `black_white_value` = 10,
  `unknown` = 0,
  `light_id` = 0,
  `sound_ambience_id` = 0,
  `sound_music_id` = 0;

-- 722 <- spell 70649
DELETE FROM screeneffect WHERE id = 722;
INSERT INTO screeneffect SET
  `id` = 722,
  `name` = 'The Lost Isles - "Capturing The Unknown"',
  `type` = 3,
  `colour` = 0,
  `screen_edge_size` = 1,
  `black_white_value` = 100,
  `unknown` = 0,
  `light_id` = 0,
  `sound_ambience_id` = 0,
  `sound_music_id` = 0;

-- 762 <- spell 74025
DELETE FROM screeneffect WHERE id = 762;
INSERT INTO screeneffect SET
  `id` = 762,
  `name` = 'The Lost Isles - Phase 8+ Skybox',
  `type` = 0,
  `colour` = 0,
  `screen_edge_size` = 0,
  `black_white_value` = 0,
  `unknown` = 0,
  `light_id` = 907,
  `sound_ambience_id` = 0,
  `sound_music_id` = 0;

