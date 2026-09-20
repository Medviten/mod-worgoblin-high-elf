-- creaturedisplayinfo: 3 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@HobgoblinDisplay, @GoblinTrikeDisplay, @GoblinTurboTrikeDisplay);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@HobgoblinDisplay,        @HobgoblinModel,        0, 0, '0.7500000000000000', 255, 'Hobgoblin1Red', 'Hobgoblin2', '', '', 0, 0, 0, 0, 0, 0),
(@GoblinTrikeDisplay,      @GoblinTrikeModel,      0, 0, '1.0000000000000000', 255, '',              '',           '', '', 0, 0, 0, 0, 0, 0),
(@GoblinTurboTrikeDisplay, @GoblinTurboTrikeModel, 0, 0, '1.0000000000000000', 255, '',              '',           '', '', 0, 0, 0, 0, 0, 0);
