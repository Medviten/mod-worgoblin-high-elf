-- I-323 spell 71657 "Deadly Egg Barrage" — the Mechachicken's volley was invisible.
--
-- SYMPTOM (reported in game): "the egg volley seems to have no impact on me."
--
-- The damage was never the problem and is NOT changed here. The 4.3.4 SpellEffect row
-- was parsed directly and ours is identical to it (effect 2 SCHOOL_DAMAGE, base 13 /
-- die 8 = 14-21 fire, radius index 8 = 5 yards, targets 53/16) — that is the retail
-- value. What was wrong is that the spell rendered NOTHING: `spell_visual_1` = 15152
-- exists in the 4.3.4 SpellVisual.dbc and was absent from ours, one of 95 dangling
-- visuals on ported spells (see reference_cata_spellvisual_port).
--
-- These rows are HARVESTED from `zep goblin gen spellvisuals`, not hand-authored — the
-- emitter resolves kit payloads by asset identity. They are shipped as an [I-323]
-- override rather than by applying the AUTO files, because that full run also rewrote
-- 9 unrelated AUTO files from another session's in-flight emitter code (reverted), so
-- the AUTO spellvisual set is not a coherent shippable unit right now. A later clean
-- full gen should emit and apply all 95; this file makes the megachook's volley visible
-- today and will be redundant (and harmless) when that lands.
--
-- ONE emitter gap is repaired by hand below, in the 90xxx custom block the emitter
-- skips by convention.

-- =========================================================================
-- 1. The missile model — effectname 90101
-- =========================================================================
-- The emitter zeroed `missile_model` because Cata effectname 6246 is "NOT resolvable in
-- 3.3.5a": no existing `spellvisualeffectname` row points at its .mdx. But resolvability
-- was judged against that table alone, and the ASSET itself ships — 
-- `world\generic\passivedoodads\eastereggs\easteregg05.mdx` is the model behind
-- gameobjectdisplayinfo 1411, which is the very object this creature drops on death
-- (GO 201977, see sql/zz_[I-323]_biggest_egg_ever.sql). The megachook pelts you with
-- giant Easter eggs and then lays one when it dies; both ends use the same mesh.
--
-- `has_missile` = 1 with `missile_model` = 0 is an INVISIBLE projectile, so the zeroed
-- slot would have left the volley just as unseeable as the missing visual did.
--
-- Values are the 4.3.4 row for 6246 verbatim (scale 0.70 — twice stock EasterEgg01's
-- 0.35 — area size 1.0, min/max allowed scale 0.01/100). Note min/max are NOT 0/0:
-- that clamp renders the model invisible (reference_item_cast_spellvisual_kit).
-- Custom id 90101 follows 90100; 90xxx is the hand-authored block the emitter skips.
DELETE FROM spellvisualeffectname WHERE id = 90101;
INSERT INTO spellvisualeffectname SET
  `id` = 90101,
  `name` = 'Missile: EasterEgg05 (I-323 Deadly Egg Barrage)',
  `file_name` = 'world\\generic\\passivedoodads\\eastereggs\\easteregg05.mdx',
  `area_effect_size` = 1.0,
  `scale` = 0.7,
  `min_allowed_scale` = 0.01,
  `max_allowed_scale` = 100.0;

-- =========================================================================
-- 2. The kits — emitter output, unmodified
-- =========================================================================
-- 19510 is the impact kit, 19509 the impact-AREA kit. Cata-only shake id 3 on 19509 was
-- dropped to 0 by the emitter (no 3.3.5a equivalent). char_proc_1-4 stay 4294967295 (-1).

DELETE FROM spellvisualkit WHERE id = 19509;
INSERT INTO spellvisualkit SET
  `id` = 19509,
  `start_anim_id` = 4294967295,
  `anim_id` = 4294967295,
  `head_effect` = 0,
  `chest_effect` = 0,
  `base_effect` = 4865,
  `left_hand_effect` = 0,
  `right_hand_effect` = 0,
  `breath_effect` = 0,
  `left_weapon_effect` = 0,
  `right_weapon_effect` = 0,
  `special_effect_1` = 0,
  `special_effect_2` = 0,
  `special_effect_3` = 0,
  `world_effect` = 0,
  `sound_id` = 0,
  `shake_id` = 0,
  `char_proc_1` = 4294967295,
  `char_proc_2` = 4294967295,
  `char_proc_3` = 4294967295,
  `char_proc_4` = 4294967295,
  `char_param_0_1` = 0,
  `char_param_0_2` = 0,
  `char_param_0_3` = 0,
  `char_param_0_4` = 0,
  `char_param_1_1` = 0,
  `char_param_1_2` = 0,
  `char_param_1_3` = 0,
  `char_param_1_4` = 0,
  `char_param_2_1` = 0,
  `char_param_2_2` = 0,
  `char_param_2_3` = 0,
  `char_param_2_4` = 0,
  `char_param_3_1` = 0,
  `char_param_3_2` = 0,
  `char_param_3_3` = 0,
  `char_param_3_4` = 0,
  `flags` = 0;

DELETE FROM spellvisualkit WHERE id = 19510;
INSERT INTO spellvisualkit SET
  `id` = 19510,
  `start_anim_id` = 4294967295,
  `anim_id` = 4294967295,
  `head_effect` = 0,
  `chest_effect` = 3227,
  `base_effect` = 0,
  `left_hand_effect` = 0,
  `right_hand_effect` = 0,
  `breath_effect` = 0,
  `left_weapon_effect` = 0,
  `right_weapon_effect` = 0,
  `special_effect_1` = 0,
  `special_effect_2` = 0,
  `special_effect_3` = 0,
  `world_effect` = 0,
  `sound_id` = 0,
  `shake_id` = 0,
  `char_proc_1` = 4294967295,
  `char_proc_2` = 4294967295,
  `char_proc_3` = 4294967295,
  `char_proc_4` = 4294967295,
  `char_param_0_1` = 0,
  `char_param_0_2` = 0,
  `char_param_0_3` = 0,
  `char_param_0_4` = 0,
  `char_param_1_1` = 0,
  `char_param_1_2` = 0,
  `char_param_1_3` = 0,
  `char_param_1_4` = 0,
  `char_param_2_1` = 0,
  `char_param_2_2` = 0,
  `char_param_2_3` = 0,
  `char_param_2_4` = 0,
  `char_param_3_1` = 0,
  `char_param_3_2` = 0,
  `char_param_3_3` = 0,
  `char_param_3_4` = 0,
  `flags` = 0;

-- =========================================================================
-- 3. The visual itself
-- =========================================================================
-- Emitter output with the one repaired slot. `missile_sound` 14336 is the emitter
-- correctly resolving the donor's 23820 `RocketMultipleMissilesLoop.ogg` to our stock
-- `RocketMultipleMissilesLoop.wav` — same clip, different container, the .wav/.ogg stem
-- trap that would otherwise have zeroed a perfectly stock sound.

DELETE FROM spellvisual WHERE id = 15152;
INSERT INTO spellvisual SET
  `id` = 15152,
  `precast_kit` = 60,
  `cast_kit` = 0,
  `impact_kit` = 19510,
  `state_kit` = 0,
  `state_done_kit` = 0,
  `channel_kit` = 0,
  `has_missile` = 1,
  `missile_model` = 90101,   -- was 0: emitter could not resolve effectname 6246
  `missile_path_type` = 0,
  `missile_dest_attachment` = 1,
  `missile_sound` = 14336,
  `anim_event_sound_id` = 0,
  `flags` = 1,
  `caster_impact_kit` = 0,
  `target_impact_kid` = 0,
  `missile_attachment` = 1,
  `missile_follow_ground_height` = 0,
  `missile_follow_drop_speed` = 300,
  `missile_follow_approach` = 750,
  `missile_follow_ground_flags` = 4,
  `missile_motion` = 1041,
  `missile_targeting_kit` = 0,
  `instant_area_kit` = 0,
  `impact_area_kit` = 19509,
  `persistent_area_kit` = 0,
  `missile_cast_offset_x` = 0,
  `missile_cast_offset_y` = 0,
  `missile_cast_offset_z` = 0,
  `missile_impact_offset_x` = 0,
  `missile_impact_offset_y` = 0,
  `missile_impact_offset_z` = 0;
