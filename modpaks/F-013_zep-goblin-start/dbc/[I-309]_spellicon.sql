-- ============================================================
-- I-309  Quest 14238 "Infrared = Infradead" — goggles aura had no icon
-- ============================================================
-- Root cause is port-wide, not quest-specific: the F-011 port carries Cata
-- `spell_icon_id` values verbatim, but WotLK SpellIcon.dbc ends its stock rows
-- around 4059 with gaps — 21 Cata-only icon ids are referenced by ported spells
-- and have NO SpellIcon row, so the client renders no icon at all (38 live
-- spells affected, e.g. 68376/69303 Infrared Heat Focals -> 4032, and the
-- mod-worgoblin Rocket Barrage racial -> 4281).
--
-- Fix: port the missing SpellIcon rows VERBATIM from 4.3.4 SpellIcon.dbc
-- (whitemane-15595 extract), keyed at their CATA ids so the ported spells —
-- and any future ports — resolve without touching a single spell row. Every
-- referenced texture is verified shipped: stock 3.3.5a BLPs except
-- ability_racial_rocketbarrage, which mod-worgoblin already ships in PATCH-Z.
--
-- 4012-4015 are unreferenced by the live spell table today (I-261 re-pointed
-- the bank-heist widget spells at hand rows 5815-5817) but the AUTO spell file
-- still carries them, so they are included for parity.
-- Hand-authored NEW icons keep using the 5815+ custom block; this file is only
-- for verbatim Cata ports at Cata ids.

DELETE FROM spellicon WHERE id IN (3962, 3969, 4012, 4013, 4014, 4015, 4026,
  4028, 4029, 4032, 4136, 4137, 4138, 4183, 4186, 4187, 4209, 4210, 4213,
  4275, 4281);
INSERT INTO spellicon (`id`, `name`) VALUES
  (3962, 'Interface\\Icons\\Trade_Engineering'),
  (3969, 'Interface\\Icons\\Trade_Engineering'),
  (4012, 'Interface\\Icons\\inv_misc_ear_nightelf_02'),
  (4013, 'Interface\\Icons\\inv_weapon_shortblade_21'),
  (4014, 'Interface\\Icons\\INV_Misc_EngGizmos_swissArmy'),
  (4015, 'Interface\\Icons\\INV_Belt_47'),
  (4026, 'INTERFACE\\ICONS\\trade_engineering'),
  (4028, 'INTERFACE\\ICONS\\trade_engineering'),
  (4029, 'INTERFACE\\ICONS\\inv_misc_food_23'),
  (4032, 'INTERFACE\\ICONS\\inv_helmet_47'),
  (4136, 'INTERFACE\\ICONS\\trade_engineering'),
  (4137, 'INTERFACE\\ICONS\\trade_engineering'),
  (4138, 'INTERFACE\\ICONS\\trade_engineering'),
  (4183, 'INTERFACE\\ICONS\\trade_engineering'),
  (4186, 'INTERFACE\\ICONS\\trade_engineering'),
  (4187, 'INTERFACE\\ICONS\\trade_engineering'),
  (4209, 'INTERFACE\\ICONS\\inv_crate_07'),
  (4210, 'INTERFACE\\ICONS\\trade_engineering'),
  (4213, 'INTERFACE\\ICONS\\trade_engineering'),
  (4275, 'INTERFACE\\ICONS\\inv_shield_70'),
  (4281, 'INTERFACE\\ICONS\\ability_racial_rocketbarrage');
