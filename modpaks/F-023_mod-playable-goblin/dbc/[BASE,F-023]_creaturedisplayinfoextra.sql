-- [F-030] mod-worgoblin: creaturedisplayinfoextra: 1 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `creaturedisplayinfoextra` WHERE `id` = 24082;
INSERT INTO `creaturedisplayinfoextra` (`id`, `race`, `gender`, `skin_color`, `face_type`, `hair_style`, `hair_color`, `facial_hair`, `helm_id`, `shoulders_id`, `shirt_id`, `chest_id`, `belt_id`, `legs_id`, `boots_id`, `wrists_id`, `gloves_id`, `tabard_id`, `cape_id`, `can_equip`, `texture`) VALUES
(24082, @Goblin, @Male, 2, 0, 4, 1, 4, 0, 0, 0, 0, 5904, 1883, 0, 0, 0, 13909, 0, 0, 'CreatureDisplayExtra-24082.blp');
