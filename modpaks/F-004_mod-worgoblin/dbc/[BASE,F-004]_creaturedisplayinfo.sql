-- creaturedisplayinfo: 9 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@WorgenMaleDisplay, @WorgenFemaleDisplay);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@WorgenMaleDisplay, @WorgenMaleModel, 0, @WorgenMaleDisplayExtra, '1.0000000000000000', 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@WorgenFemaleDisplay, @WorgenFemaleModel, 0, @WorgenFemaleDisplayExtra, '1.0000000000000000', 255, '', '', '', '', 3, 0, 0, 0, 0, 0);

DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@HobgoblinDisplay, @GoblinTrikeDisplay, @GoblinTurboTrikeDisplay, 36445, 36446, @MountainHorseDisplay, @SwiftMountainHorseDisplay);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@HobgoblinDisplay, @HobgoblinModel, 0, 0, '0.7500000000000000', 255, 'Hobgoblin1Red', 'Hobgoblin2', '', '', 0, 0, 0, 0, 0, 0), -- hobgoblin
(@GoblinTrikeDisplay, @GoblinTrikeModel, 0, 0, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- goblin trike
(@GoblinTurboTrikeDisplay, @GoblinTurboTrikeModel, 0, 0, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- goblin turbo-trike
(36445, @WorgenMaleModel, 0, 24081, '1.0000000000000000', 255, '', '', '', '', 3, 0, 0, 0, 0, 0), -- male worgen?
(36446, 831, 0, 24082, '1.0000000000000000', 255, '', '', '', '', 1, 0, 0, 0, 0, 0), -- ?
(@MountainHorseDisplay, 65, 0, 0, '1.0000000000000000', 255, 'HorseSkinBlack', '', '', '', 1, 0, 0, 0, 0, 0), -- black mountain horse
(@SwiftMountainHorseDisplay, 65, 0, 0, '1.0000000000000000', 255, 'HorseSkinBrown', '', '', '', 1, 0, 0, 0, 0, 0); -- brown mountain horse
