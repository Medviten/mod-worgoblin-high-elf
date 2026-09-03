-- [F-032] mod-maghar: creaturedisplayinfo: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` = @MagharOrcMaleDisplay; -- male unspecified mag'har orc
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES (@MagharOrcMaleDisplay, @MagharOrcMaleModel, 0, @MagharOrcMaleDisplayExtra, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0);
DELETE FROM `creaturedisplayinfo` WHERE `id` = @MagharOrcFemaleDisplay; -- female unspecified mag'har orc
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES (@MagharOrcFemaleDisplay, @MagharOrcFemaleModel, 0, @MagharOrcFemaleDisplayExtra, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0);
