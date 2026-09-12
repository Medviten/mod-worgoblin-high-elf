-- ============================================================
-- I-286  Quest 14031 "Capturing the Unknown" — client data (consolidated)
-- ============================================================
-- CONSOLIDATED file: replaces the former [I-289]_creaturedisplayinfo/
-- creaturemodeldata, [I-296]_creaturemodeldata, [I-297]_gameobjectdisplayinfo,
-- [I-300]_orb_display / camera_flash_visual, [I-286]_snapflash_spell and
-- [I-303]_detect_no_dismiss_pet. History in the Joplin note
-- "I-286 Quest 14031 Capturing the Unknown (F-011)".
--
-- Assets (zep-goblin-start mpq/, hand-added M2s live in parsed-assets too and
-- PATCH-Z is built with `-p Z --build` — `--parse-build` drops them, I-248):
--   Item\ObjectComponents\Weapon\MISC_1H_SELFIECAMERA_A_01.M2 (+_SPIN copy with
--     rotation + vertical bob baked into Stand on an added origin root bone,
--     flags 0x200), skins + BLPs alongside.
--   Spells\MONK_FORCESPERE_ORB.M2, Spells\CFX_PALADIN_FLASHOFLIGHT_IMPACTBASE.M2
--     — retroported MoP/Legion particle models; textures injected, emitters fixed
--     to WotLK layout, but they still DO NOT RENDER in-game (see note post-mortems
--     and the test-rig goobers below).

-- ---------------------------------------------------------------
-- 1. Camera marker model + display (bunnies wear display 900201).
-- 900201 = static camera (kept as the untouched original), 900202 = spin+bob copy;
-- the display points at the spin model. Scale 3: the source is a one-hand item
-- model, far too small at 1.0 to read as a world marker.
-- ---------------------------------------------------------------
DELETE FROM `creaturemodeldata` WHERE `id` = 900201;
INSERT INTO `creaturemodeldata` SET
  `id` = 900201,
  `flags` = 0,
  `model_path` = 'Item\\ObjectComponents\\Weapon\\Misc_1H_SelfieCamera_A_01.mdx',
  `size_class` = 1, `model_scale` = 1, `blood_id` = 0,
  `footprint_texture_id` = 0, `footprint_texture_length` = 0, `footprint_texture_width` = 0,
  `footprint_particle_scale` = 0, `foley_material_id` = 0, `footstep_shake_size` = 0,
  `death_thud_shake_size` = 0, `sound_data` = 0, `collision_width` = 0, `collision_height` = 0,
  `mount_height` = 0, `geo_box_min_x` = 0, `geo_box_min_y` = 0, `geo_box_min_z` = 0,
  `geo_box_max_x` = 0, `geo_box_max_y` = 0, `geo_box_max_z` = 0, `world_effect_scale` = 0,
  `attached_effect_scale` = 0, `missile_collision_radius` = 0, `missile_collision_push` = 0,
  `missile_collision_raise` = 0;

DELETE FROM `creaturemodeldata` WHERE `id` = 900202;
INSERT INTO `creaturemodeldata` SET
  `id` = 900202,
  `flags` = 0,
  `model_path` = 'Item\\ObjectComponents\\Weapon\\Misc_1H_SelfieCamera_A_01_Spin.mdx',
  `size_class` = 1, `model_scale` = 1, `blood_id` = 0,
  `footprint_texture_id` = 0, `footprint_texture_length` = 0, `footprint_texture_width` = 0,
  `footprint_particle_scale` = 0, `foley_material_id` = 0, `footstep_shake_size` = 0,
  `death_thud_shake_size` = 0, `sound_data` = 0, `collision_width` = 0, `collision_height` = 0,
  `mount_height` = 0, `geo_box_min_x` = 0, `geo_box_min_y` = 0, `geo_box_min_z` = 0,
  `geo_box_max_x` = 0, `geo_box_max_y` = 0, `geo_box_max_z` = 0, `world_effect_scale` = 0,
  `attached_effect_scale` = 0, `missile_collision_radius` = 0, `missile_collision_push` = 0,
  `missile_collision_raise` = 0;

DELETE FROM `creaturedisplayinfo` WHERE `id` = 900201;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900201,
  `model_id` = 900202,
  `sound_id` = 0,
  `extended_display_info_id` = 0,   -- object model: no CharSection bake needed
  `creature_model_scale` = 3,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '', `texture_variation_2` = '', `texture_variation_3` = '',
  `portrait_texture_name` = '', `blood_level` = 0, `blood_id` = 0, `npc_sound_id` = 0,
  `praticle_color_id` = 0, `creature_geoset_data` = 0, `obj_effect_package_id` = 0;

-- ---------------------------------------------------------------
-- 2. Orb display for the marker companion creature 900301: the STOCK Ulduar swirl
-- cloud (World\Expansion02 doodad, ships with every client). The WXL monk orb
-- rendered but was too intense to see the camera inside it. The doodad is HUGE
-- (bounds ~±35 yd, r=56) so the display scale is tiny — tune scale here if the
-- swirl reads too big/small around the camera.
-- ---------------------------------------------------------------
DELETE FROM `creaturemodeldata` WHERE `id` = 900203;
INSERT INTO `creaturemodeldata` SET
  `id` = 900203, `flags` = 0,
  `model_path` = 'World\\Expansion02\\Doodads\\Ulduar\\UL_Swirl_Orb_Cloud.mdx',
  `size_class` = 1, `model_scale` = 1, `blood_id` = 0,
  `footprint_texture_id` = 0, `footprint_texture_length` = 0, `footprint_texture_width` = 0,
  `footprint_particle_scale` = 0, `foley_material_id` = 0, `footstep_shake_size` = 0,
  `death_thud_shake_size` = 0, `sound_data` = 0, `collision_width` = 0, `collision_height` = 0,
  `mount_height` = 0, `geo_box_min_x` = 0, `geo_box_min_y` = 0, `geo_box_min_z` = 0,
  `geo_box_max_x` = 0, `geo_box_max_y` = 0, `geo_box_max_z` = 0, `world_effect_scale` = 0,
  `attached_effect_scale` = 0, `missile_collision_radius` = 0, `missile_collision_push` = 0,
  `missile_collision_raise` = 0;

DELETE FROM `creaturedisplayinfo` WHERE `id` = 900203;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900203, `model_id` = 900203, `sound_id` = 0, `extended_display_info_id` = 0,
  `creature_model_scale` = 0.05, `creature_model_alpha` = 255,
  `texture_variation_1` = '', `texture_variation_2` = '', `texture_variation_3` = '',
  `portrait_texture_name` = '', `blood_level` = 0, `blood_id` = 0, `npc_sound_id` = 0,
  `praticle_color_id` = 0, `creature_geoset_data` = 0, `obj_effect_package_id` = 0;

-- ---------------------------------------------------------------
-- 3. GameObject displays. 10500 = spin camera (kept from the retired I-297 goober
-- experiment; a GO display needs its own row, CreatureDisplayInfo is not
-- interchangeable). 10501/10502 were the temporary I-286 test-rig displays —
-- retired with the Dampwick test goobers (world file section 9).
-- ---------------------------------------------------------------
DELETE FROM `gameobjectdisplayinfo` WHERE `id` IN (10500, 10501, 10502);
INSERT INTO `gameobjectdisplayinfo` SET
  `id` = 10500,
  `model_name` = 'Item\\ObjectComponents\\Weapon\\Misc_1H_SelfieCamera_A_01_Spin.mdx',
  `sound_1` = 0, `sound_2` = 0, `sound_3` = 0, `sound_4` = 0, `sound_5` = 0,
  `sound_6` = 0, `sound_7` = 0, `sound_8` = 0, `sound_9` = 0, `sound_10` = 0,
  `geo_box_min_x` = -0.5, `geo_box_min_y` = -0.5, `geo_box_min_z` = -0.5,
  `geo_box_max_x` = 0.5, `geo_box_max_y` = 0.5, `geo_box_max_z` = 0.5,
  `object_effect_package_id` = 0;

-- ---------------------------------------------------------------
-- 4. The camera flash as a native spell visual:
--   spellvisualeffectname 90100 -> the WXL-downported cone M2, which carries a
--     STATIC 90-degree rotation on an added root bone so the cone lies along the
--     caster's facing axis (Cone of Cold style) — the M2's own grow animation IS
--     the flash "movement"; a missile was tried and rejected (round 8).
--   spellvisualkit        90100 -> base effect 90100 + anim 63 UseStanding: cone
--     fires from the player toward the camera, hands anim plays, one packet.
--   spellvisual           90100 -> kit 90100 as its CAST kit (kept for reference,
--     but the LIVE trigger is server-side: 68280 is cast FROM AN ITEM and the cast
--     packets carry the item guid, so the client never attaches the cast kit to
--     the player — SAI 229 in zz_[I-286] plays the kit on the player's guid).
-- Schema trap: spellvisualkit start_anim_id/anim_id/char_proc_* are UNSIGNED —
-- write 4294967295 for -1.
-- ---------------------------------------------------------------
DELETE FROM `spellvisualeffectname` WHERE `id` = 90100;
INSERT INTO `spellvisualeffectname` SET
  `id` = 90100,
  `name` = 'KTC Snapflash Cone',
  `file_name` = 'Spells\\Cfx_Paladin_FlashOfLight_ImpactBase.mdx',
  `area_effect_size` = 1,
  `scale` = 1,
  -- EVERY stock row is min 0.01 / max 100. 0/0 clamps the attached-effect scale
  -- to ZERO -> the kit's model rendered at scale 0 = invisible (rounds 9-11!)
  `min_allowed_scale` = 0.01,
  `max_allowed_scale` = 100;

DELETE FROM `spellvisualkit` WHERE `id` = 90100;
INSERT INTO `spellvisualkit` SET
  `id` = 90100,
  `start_anim_id` = 4294967295,
  `anim_id` = 63,               -- UseStanding: the hands anim, synced with the cast
  `head_effect` = 0, `chest_effect` = 0,
  `base_effect` = 90100,        -- the rotated cone fires from the caster, facing-aligned
  `left_hand_effect` = 0, `right_hand_effect` = 0, `breath_effect` = 0,
  `left_weapon_effect` = 0, `right_weapon_effect` = 0,
  `special_effect_1` = 0, `special_effect_2` = 0, `special_effect_3` = 0,
  `world_effect` = 0, `sound_id` = 0, `shake_id` = 0,
  `char_proc_1` = 4294967295, `char_proc_2` = 4294967295, `char_proc_3` = 4294967295, `char_proc_4` = 4294967295,
  `char_param_0_1` = 0, `char_param_0_2` = 0, `char_param_0_3` = 0, `char_param_0_4` = 0,
  `char_param_1_1` = 0, `char_param_1_2` = 0, `char_param_1_3` = 0, `char_param_1_4` = 0,
  `char_param_2_1` = 0, `char_param_2_2` = 0, `char_param_2_3` = 0, `char_param_2_4` = 0,
  `char_param_3_1` = 0, `char_param_3_2` = 0, `char_param_3_3` = 0, `char_param_3_4` = 0,
  `flags` = 0;

DELETE FROM `spellvisual` WHERE `id` = 90100;
INSERT INTO `spellvisual` SET
  `id` = 90100,
  `precast_kit` = 0,
  `cast_kit` = 90100,
  `impact_kit` = 0,
  `state_kit` = 0,
  `state_done_kit` = 0,
  `channel_kit` = 0,
  `has_missile` = 0,
  `missile_model` = 0,
  `missile_path_type` = 0,
  `missile_dest_attachment` = 0,
  `missile_sound` = 0,
  `anim_event_sound_id` = 0,
  `flags` = 0,
  `caster_impact_kit` = 0,
  `target_impact_kid` = 0,
  `missile_attachment` = 0,
  `missile_follow_ground_height` = 0,
  `missile_follow_drop_speed` = 0,
  `missile_follow_approach` = 0,
  `missile_follow_ground_flags` = 0,
  `missile_motion` = 0,
  `missile_targeting_kit` = 0,
  `instant_area_kit` = 0,
  `impact_area_kit` = 0,
  `persistent_area_kit` = 0,
  `missile_cast_offset_x` = 0,
  `missile_cast_offset_y` = 0,
  `missile_cast_offset_z` = 0,
  `missile_impact_offset_x` = 0,
  `missile_impact_offset_y` = 0,
  `missile_impact_offset_z` = 0;

-- ---------------------------------------------------------------
-- 5. Spell 68280 "KTC Snapflash" (ported row, owned by [AUTO,F-011]_spell.sql ->
-- one consolidated UPDATE):
--   * spell_visual_1 90100: cone + hands anim play natively on cast
--   * targeting 22/7 (src-area-entry) -> 38 NEARBY_ENTRY: cast FAILS with
--     "Invalid target" unless a marker is nearby (the area form silently hit
--     nothing). Same type-13 conditions match the four bunny entries; the
--     SPELLHIT credit path is unchanged.
--   * range_index 1 (self) -> 3 (0-20 yd): nearby-entry searches by spell RANGE;
--     20 yd matches the old effect radius (index 9).
-- ---------------------------------------------------------------
UPDATE `spell` SET
  `spell_visual_1` = 0,         -- kit is played server-side (SAI 229); see above
  `effect_implicit_target_a_1` = 38,
  `effect_implicit_target_b_1` = 0,
  `range_index` = 3,
  `speed` = 0                   -- instant: the cone's own grow anim is the "travel"
WHERE `id` = 68280;

-- ---------------------------------------------------------------
-- 6. The four "See Invis Target Bunny" detects granted on quest accept carry
-- SPELL_ATTR1_DISMISS_PET (0x1) in the source — accepting the quest dismissed the
-- player's pet. Ported rows -> one consolidated UPDATE clearing only that bit.
-- ---------------------------------------------------------------
UPDATE `spell` SET `attributes_ex_1` = `attributes_ex_1` & ~1
WHERE `id` IN (70661, 70678, 70680, 70681);
