-- I-311 "Warchief's Revenge" — 900881 Cyclone of the Elements Bar: aura 293
-- (SPELL_AURA_OVERRIDE_SPELLS) pointing at OverrideSpellData 508 (Lightning
-- Strike 68445). Structure cloned from the proven 900820 All-In-1-Der Belt bar
-- ([I-261], works while seated in a vehicle), minus its PACIFY effect — the
-- rider must cast. Applied/removed by the cyclone's SmartAI
-- (zz_[I-311]_warchiefs_revenge_cyclone.sql) on passenger boarded/removed, plus
-- an explicit strip at ferry end; duration -1 (index 21).
-- 900882 Cyclone Tailwind: invisible +99% flight speed for the ferry leg —
-- replaces stock 54950 Swift Wings (wings visual + buff icon the rider disliked,
-- 5s duration needing a refresh ticker). Clone of 54950's aura 208 with no
-- visual, hidden aura icon (attr_ex_1 0x10000000, I-249 Cata pattern) and
-- duration -1; it dies with the cyclone's despawn at the Wild Overlook.
DELETE FROM spell WHERE id = 900882;
INSERT INTO spell SET
  `id` = 900882,
  `attributes` = 262160,
  `attributes_ex_1` = 268435488,
  `cast_time_index` = 1,
  `proc_chance` = 101,
  `duration_index` = 21,
  `range_index` = 1,
  `equipped_item_class` = -1,
  `effect_1` = 6,
  `effect_die_sides_1` = 1,
  `effect_base_points_1` = 99,
  `effect_implicit_target_a_1` = 1,
  `effect_apply_aura_name_1` = 208,
  `spell_icon_id` = 1548,
  `spell_name_enus` = 'Cyclone Tailwind',
  `school_mask` = 8;

DELETE FROM spell WHERE id = 900881;
INSERT INTO spell SET
  `id` = 900881,
  `attributes` = 2281701376,
  `attributes_ex_1` = 32,
  `attributes_ex_2` = 268976128,
  `attributes_ex_3` = 197120,
  `attributes_ex_4` = 8392896,
  `attributes_ex_5` = 393224,
  `attributes_ex_6` = 1024,
  `cast_time_index` = 1,
  `proc_chance` = 101,
  `duration_index` = 21,
  `range_index` = 1,
  `equipped_item_class` = -1,
  `effect_1` = 6,
  `effect_die_sides_1` = 1,
  `effect_implicit_target_a_1` = 1,
  `effect_apply_aura_name_1` = 293,
  `effect_misc_value_a_1` = 508,
  `spell_icon_id` = 3080,
  `spell_name_enus` = 'Cyclone of the Elements Bar',
  `spell_desc_enus` = 'Channel the cyclone''s fury. Hurl lightning at the Alliance sailors below!',
  `damage_class` = 1,
  `school_mask` = 8;
