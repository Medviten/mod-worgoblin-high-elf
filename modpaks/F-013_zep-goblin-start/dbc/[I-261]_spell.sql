-- I-261 "The Great Bank Heist" (14122) — 3.3.5a adaptations of the ported Cata
-- heist spells (base rows live in [AUTO,F-011]_spell.sql via missing_spells).
-- One consolidated UPDATE per AUTO-owned ID (override pattern, cf. [I-254]_spell.sql).
-- Apply AFTER the AUTO spell file (AUTO re-apply clobbers these — re-apply last).

-- 67488 Summon Bunny Vehicle: Cata SummonProperties 1621 (control-4 vehicle,
-- flags 256) has no 3.3.5a row -> repoint to stock 827 (control-4 vehicle,
-- flags 264; the Hot Rod summon property, proven on this server in I-242).
UPDATE spell SET
  effect_misc_value_b_1 = 827
WHERE id = 67488;

-- 67492 Vault Cracked! (CREATE_ITEM Personal Riches 84461): Cata implicit
-- target 95 is invalid on 3.3.5a ("invalid target", cf. I-242) -> 25
-- TARGET_UNIT_TARGET_ANY; the vault SAI casts it explicitly on the rider.
-- SpellVisual 13447 is STOCK 3.3.5a (EmoteCheer impact on the rider) -> kept.
UPDATE spell SET
  effect_implicit_target_a_1 = 25
WHERE id = 67492;

-- Widget bar spells. Visuals verified against original_dbc: 215 (both picks,
-- UseStandingLoop fiddle) and 11710 (Blastcrackers 171/172/8792 throw) are
-- STOCK and kept verbatim; only Drill 14300 / G-Ray 14304 are Cata-only and
-- repointed to stock visuals with matching kit anims (new SpellVisual rows
-- ghost-replay on this client, I-248 -> stock rows only):
--   Drill  -> 676  (Seaforium Charge: kneel-and-work on the target)
--   G-Ray  -> 7918 (Tag Murloc: aim device, zap ray to the target)
-- Cata-only SpellIcon ids 4012-4014 -> 3.3.5a rows for the SAME textures the
-- retail prompt texts reference ([I-261]_spellicon.sql: 5815-5817).
-- recovery_time 1500 = 1.5s cooldown per widget so the bar can't be spammed
-- (there's no cast time; without a cooldown all 5 fire instantly).
-- effect_implicit_target_a_1 = 94 (TARGET_UNIT_VEHICLE): the PLAYER is the
-- caster of these vehicle-bar spells (cast anims play on the player), so 94
-- resolves to the player's vehicle = the vault, which is hit and fires
-- SMART_EVENT_SPELLHIT on the vault so the minigame SAI detects the widget.
-- (Self/1 hit the PLAYER instead -> no vault spellhit -> prompts never advanced.)
UPDATE spell SET
  spell_visual_1 = 676,
  spell_icon_id = 5815,
  recovery_time = 1500,
  effect_implicit_target_a_1 = 94
WHERE id = 67522;   -- Kaja'mite Drill (INV_Weapon_ShortBlade_21)

UPDATE spell SET
  spell_icon_id = 5816,
  recovery_time = 1500,
  effect_implicit_target_a_1 = 94
WHERE id = 67524;   -- Ear-O-Scope (INV_Misc_Ear_NightElf_02; vis 215 stock-valid)

UPDATE spell SET
  spell_icon_id = 5817,
  recovery_time = 1500,
  effect_implicit_target_a_1 = 94
WHERE id = 67525;   -- Infinifold Lockpick (INV_Misc_EngGizmos_swissArmy; vis 215 stock-valid)

UPDATE spell SET
  spell_visual_1 = 7918,
  recovery_time = 1500,
  effect_implicit_target_a_1 = 94
WHERE id = 67526;   -- Amazing G-Ray (icon 2262 stock-valid)

UPDATE spell SET
  recovery_time = 1500,
  effect_implicit_target_a_1 = 94
WHERE id = 67508;   -- Blastcrackers (visual 11710 + icon 2505 stock-valid)

-- 67476 Vault Cracking Toolset (ride aura, lives on the vehicle): Cata-only
-- icon 4015 -> stock 353 INV_Misc_Gear_01 (cosmetic only).
UPDATE spell SET
  spell_icon_id = 353
WHERE id = 67476;

-- 900820 Goblin All-In-1-Der Belt (custom, clone of 66908 party bar): aura 293
-- SPELL_AURA_OVERRIDE_SPELLS -> overridespelldata row 476 (the 5 vault widgets),
-- plus aura 26 MOD_ROOT so the rider stays planted at the vault while cracking
-- it. The vault vehicle casts this on the rider at PASSENGER_BOARDED and
-- removes it at PASSENGER_REMOVED (zz_[I-261]_bank_heist.sql). Retail showed
-- the widgets on the possessed-vehicle bar; the Cata seat (5326) is
-- non-control, and on AC a possessed vehicle's SmartAI never sees spellhits
-- (I-242 R5), so the override bar is the 3.3.5a-safe equivalent. Duration 5min
-- (index 5), not permanent — a stuck aura must never root a player forever
-- (matches the vehicle's 5min safety despawn). Icon 4041 = inv_belt_19.
DELETE FROM `spell` WHERE `id` = 900820;

INSERT INTO `spell` SET
    `id` = 900820,
    `attributes` = 2281701376,
    `attributes_ex_1` = 32,
    `attributes_ex_2` = 268976128,
    `attributes_ex_3` = 197120,
    `attributes_ex_4` = 8392896,
    `attributes_ex_5` = 393224,
    `attributes_ex_6` = 1024,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 5,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 293,
    `effect_apply_aura_name_2` = 26,
    `effect_misc_value_a_1` = 476,
    `spell_icon_id` = 4041,
    `spell_name_enus` = 'Goblin All-In-1-Der Belt',
    `spell_desc_enus` = 'Use the widgets in your All-In-1-Der belt to crack the First Bank of Kezan vault!',
    `damage_class` = 1,
    `school_mask` = 1;
