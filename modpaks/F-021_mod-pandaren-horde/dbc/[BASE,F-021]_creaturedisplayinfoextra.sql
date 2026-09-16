-- [F-030] mod-worgoblin: creaturedisplayinfoextra: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfoextra` WHERE `id` IN (@HordePandarenMaleDisplayExtra, @HordePandarenFemaleDisplayExtra);
INSERT INTO `creaturedisplayinfoextra` (`id`, `race`, `gender`, `skin_color`, `face_type`, `hair_style`, `hair_color`, `facial_hair`, `helm_id`, `shoulders_id`, `shirt_id`, `chest_id`, `belt_id`, `legs_id`, `boots_id`, `wrists_id`, `gloves_id`, `tabard_id`, `cape_id`, `can_equip`, `texture`) VALUES
(@HordePandarenMaleDisplayExtra,   @HordePandaren, @Male,   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, ''),
(@HordePandarenFemaleDisplayExtra, @HordePandaren, @Female, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '');
