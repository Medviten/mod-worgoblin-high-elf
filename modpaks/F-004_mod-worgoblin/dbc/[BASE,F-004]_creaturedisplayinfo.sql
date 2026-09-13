-- creaturedisplayinfo: 9 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (@WorgenMaleDisplay, @WorgenFemaleDisplay);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(@WorgenMaleDisplay, @WorgenMaleModel, 0, @WorgenMaleDisplayExtra, '1.0000000000000000', 255, '', '', '', '', 3, 0, 0, 0, 0, 0),
(@WorgenFemaleDisplay, @WorgenFemaleModel, 0, @WorgenFemaleDisplayExtra, '1.0000000000000000', 255, '', '', '', '', 3, 0, 0, 0, 0, 0);

DELETE FROM `creaturedisplayinfo` WHERE `id` IN (32385, 35249, 35250, 36445, 36446, 39095, 39096);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(32385, 3194, 0, 0, '0.7500000000000000', 255, 'Hobgoblin1Red', 'Hobgoblin2', '', '', 0, 0, 0, 0, 0, 0), -- hobgoblin
(35249, 3624, 0, 0, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- goblin trike
(35250, 3623, 0, 0, '1.0000000000000000', 255, '', '', '', '', 0, 0, 0, 0, 0, 0), -- goblin turbo-trike
(36445, 3141, 0, 24081, '1.0000000000000000', 255, '', '', '', '', 3, 0, 0, 0, 0, 0), -- male worgen?
(36446, 831, 0, 24082, '1.0000000000000000', 255, '', '', '', '', 1, 0, 0, 0, 0, 0), -- ?
(39095, 65, 0, 0, '1.0000000000000000', 255, 'HorseSkinBlack', '', '', '', 1, 0, 0, 0, 0, 0), -- black mountain horse
(39096, 65, 0, 0, '1.0000000000000000', 255, 'HorseSkinBrown', '', '', '', 1, 0, 0, 0, 0, 0); -- brown mountain horse
