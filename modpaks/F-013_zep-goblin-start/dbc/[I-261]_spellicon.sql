-- I-261 The Great Bank Heist — spell icons for the vault widget bar.
-- These textures ship in the 3.3.5a client but have no stock SpellIcon row
-- (Cata added rows 4012-4014 for them). Ids 5815-5817 continue the custom
-- block above live/file max 5810.
DELETE FROM spellicon WHERE id IN (5815, 5816, 5817);
INSERT INTO spellicon (`id`, `name`) VALUES
  (5815, 'Interface\\Icons\\INV_Weapon_ShortBlade_21'),
  (5816, 'Interface\\Icons\\INV_Misc_Ear_NightElf_02'),
  (5817, 'Interface\\Icons\\INV_Misc_EngGizmos_swissArmy');
