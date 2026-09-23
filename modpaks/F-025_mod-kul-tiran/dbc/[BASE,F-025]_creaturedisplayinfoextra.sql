-- [F-025] mod-kul-tiran: creaturedisplayinfoextra: 2 inserts, 0 updates, 0 deletes

-- Unspecified versions of each
DELETE FROM `creaturedisplayinfoextra` WHERE `id` IN (@KulTiranMaleDisplayExtra, @KulTiranFemaleDisplayExtra);
INSERT INTO `creaturedisplayinfoextra` (`id`, `race`, `gender`, `skin_color`, `face_type`, `hair_style`, `hair_color`, `facial_hair`, `helm_id`, `shoulders_id`, `shirt_id`, `chest_id`, `belt_id`, `legs_id`, `boots_id`, `wrists_id`, `gloves_id`, `tabard_id`, `cape_id`, `can_equip`, `texture`) VALUES
(@KulTiranMaleDisplayExtra,   @KulTiran, @Male,   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, ''),
(@KulTiranFemaleDisplayExtra, @KulTiran, @Female, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '');
