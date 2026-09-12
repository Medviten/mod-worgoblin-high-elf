-- creaturedisplayinfo: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@OgreMaleDisplay, @OgreFemaleDisplay);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@OgreMaleDisplay, @OgreMaleModel, 0, @OgreMaleDisplayExtra, '1.1699999570846558', 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@OgreFemaleDisplay, @OgreFemaleModel, 0, @OgreFemaleDisplayExtra, '1.1699999570846558', 255, '', '', '', '', 3, 0, 0, 0, 0, 0);
