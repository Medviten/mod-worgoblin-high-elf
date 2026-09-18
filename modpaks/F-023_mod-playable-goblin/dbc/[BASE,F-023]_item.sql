-- item: 26 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `item` WHERE `id` IN (49502, 49503, 49504, 49505, 49506, 49508, 49510, 49512, 49514, 49515, 49516, 49520, 49521, 49522, 49524, 49527, 49528, 49529, 49531, 52532, 52550, 52551, 52552, 62461, 62462, 90000);
INSERT INTO `item` (`id`, `class`, `subclass`, `sound_override_subclass`, `material`, `display_id`, `inventory_type`, `sheath`) VALUES
(49502, 4, 2, -1,   7,  62614,  5, 0), -- Goblin Trapper's Shirt
(49503, 4, 2, -1,   7,  69187,  7, 0), -- Goblin Trapper's Pants
(49504, 4, 2, -1,   7,  62617,  8, 0), -- Goblin Trapper's Boots
(49505, 4, 1, -1,   7,  62618, 20, 0), -- Goblin Apprentice's Robe
(49506, 4, 1, -1,   7,  62621,  7, 0), -- Goblin Apprentice's Pants
(49508, 4, 1, -1,   7,   9929,  8, 0), -- Goblin Apprentice's Boots
(49510, 4, 1, -1,   7,  65789, 20, 0), -- Goblin Neophyte's Robe
(49512, 4, 1, -1,   7,  62598,  7, 0), -- Goblin Neophyte's Pants
(49514, 4, 2, -1,   7,  65799,  5, 0), -- Goblin Thug's Tunic
(49515, 4, 2, -1,   7,  69188,  7, 0), -- Goblin Thug's Pants
(49516, 4, 2, -1,   7,  65798,  8, 0), -- Goblin Thug's Boots
(49520, 4, 1, -1,   7,  65787, 20, 0), -- Goblin Acolyte's Robe
(49521, 4, 1, -1,   7,  62621,  7, 0), -- Goblin Acolyte's Pants
(49522, 4, 1, -1,   7,   4143,  8, 0), -- Goblin Acolyte's Shoes
(49524, 4, 3, -1,   7,  69181,  5, 0), -- Goblin Brawler's Harness
(49527, 4, 3, -1,   7,  69185,  8, 0), -- Goblin Brawler's Boots
(49528, 4, 3, -1,   7,  69183,  7, 0), -- Goblin Brawler's Greaves
(49529, 4, 3, -1,   7,  69182, 10, 0), -- Goblin Brawler's Gauntlets
(49531, 4, 1, -1,   7,   6318,  8, 0), -- Goblin Neophyte's Shoes
(52532, 2, 1, -1,   1,  65743, 17, 1), -- Worn Wood Chopper
(52550, 4, 2, -1,   7,  65801,  5, 0), -- Primal Shirt
(52551, 4, 2, -1,   7,  62573,  7, 0), -- Primal Pants
(52552, 4, 2, -1,   7,  65800,  8, 0), -- Primal Boots
(62461, 15, 5, -1,  4, 134237,  0, 0), -- Goblin Trike Key
(62462, 15, 5, -1,  4, 134238,  0, 0), -- Goblin Turbo-Trike Key
(90000, 12, 0, -1, -1,  75787,  0, 0); -- Unknown?
