-- I-320 quest 24741 "Trading Up" (Lost Isles, Raptor Rise) — spell fixes.
--
-- Both changes mirror corrections the donor makes in C++ (SpellMgr.cpp
-- `LoadSpellInfoCorrections`). The F-011 collector carries TABLES, not SpellMgr
-- overrides, so neither reached us — see the I-312/I-313 dropped-donor-script note.
--
-- Generator-first: the same values are now in `goblin_gen/spells.py` EFFECT_OVERRIDE
-- and 66726 is in the `missing_spells.json` fixture, so a regen emits them into
-- dbc/[AUTO,F-011]_spell.sql. This file exists so the fix is live before that run;
-- once the gen has run, the 56576 statement below is redundant (harmless) and the
-- 66726 row can be dropped from this file.

-- ---- 56576 "Wild Clucker Eggs" (item 84311, on use) ----
-- AUTO-owned row (dbc/[AUTO,F-011]_spell.sql) -> one consolidated UPDATE.
--
-- effect_misc_value_b_1  61 -> 64   (donor: SpellMgr.cpp:7219)
--   SummonProperties 61 = Category 1 ALLY / Type 2 GUARDIAN, which
--   Spell::EffectSummonType (SpellEffects.cpp:2439) routes to SummonGuardian():
--   the decoy egg hatched as a PLAYER-OWNED GUARDIAN at the player's level with
--   the player's faction and an aggressive react state. Creature 38195 also has
--   BaseAttackTime 0, so it swings on every server tick — which is why using the
--   eggs killed the nearby Spiny Raptors outright instead of luring one in.
--   64 = Category 0 WILD / Type 0 NONE: a plain TempSummon that keeps the
--   creature's own faction 35 and expires on the spell's 30s duration (index 9).
--
-- effect_base_points_1    1 -> 0
--   Both 61 and 64 are on AC's multi-summon list (SpellEffects.cpp:2402), where
--   `numSummons = damage`. SpellEffectInfo::CalcValue adds +1 when DieSides == 1
--   (the port forces DieSides to at least 1), so BasePoints 1 calculated to TWO
--   eggs per click. 0 with DieSides 1 is the 3.3.5a encoding of "one" — the same
--   correction already applied to 66137 in the escape-pod port.
UPDATE spell SET
  effect_misc_value_b_1 = 64,
  effect_base_points_1 = 0
WHERE id = 56576;

-- ---- 66726 "Trading Up: Summon Spiny Raptor Egg" ----
-- Absent from 3.3.5a and from the port (it is only ever cast from the donor's
-- npc_wild_clucker_egg_trading_up C++ AI, so no ported table referenced it).
-- Values are the 4.3.4 Whitemane Spell.dbc row verbatim; the spell has no
-- SpellCategories / SpellCooldowns / SpellEquippedItems / SpellInterrupts /
-- SpellTargetRestrictions / SpellLevels row, so the port defaults apply
-- (proc_chance 101, equipped_item_class -1, damage_class 1).
--
-- effect_implicit_target_a_1 46 -> 1 is the donor's own correction
-- (SpellMgr.cpp:7222). TARGET_DEST_NEARBY_ENTRY needs a SourceType-13 entry
-- condition to resolve a destination and this spell has none; with
-- TARGET_UNIT_CASTER there is no dst at all, so EffectSummonObjectWild falls
-- through to m_caster->GetClosePoint() (SpellEffects.cpp:3832) and drops the
-- chest beside the egg — which is standing on the trap.
--
-- GO 201974 is created as a WILD object ("Wild object not have owner",
-- SpellEffects.cpp:3850), so it outlives the egg despawning 500ms later and
-- stays lootable by the player. Duration index 3 = 60s to loot it.
DELETE FROM spell WHERE id = 66726;
INSERT INTO spell SET
  `id` = 66726,
  `attributes` = 384,
  `attributes_ex_1` = 1024,
  `attributes_ex_2` = 5,
  `attributes_ex_3` = 268435456,
  `attributes_ex_4` = 128,
  `attributes_ex_5` = 0,
  `attributes_ex_6` = 0,
  `attributes_ex_7` = 0,
  `cast_time_index` = 1,
  `duration_index` = 3,
  `range_index` = 6,
  `power_type` = 0,
  `speed` = 0,
  `spell_visual_1` = 0,
  `spell_icon_id` = 1,
  `active_icon_id` = 0,
  `school_mask` = 1,
  `spell_name_enus` = 'Trading Up: Summon Spiny Raptor Egg',
  `spell_desc_enus` = '',
  `spell_level` = 0,
  `base_level` = 0,
  `max_level` = 0,
  `proc_chance` = 101,
  `equipped_item_class` = -1,
  `damage_class` = 1,
  `effect_1` = 76,
  `effect_apply_aura_name_1` = 0,
  `effect_amplitude_1` = 0,
  `effect_base_points_1` = 1,
  `effect_die_sides_1` = 1,
  `effect_item_type_1` = 0,
  `effect_mechanic_1` = 0,
  `effect_misc_value_a_1` = 201974,
  `effect_misc_value_b_1` = 0,
  `effect_radius_index_1` = 0,
  `effect_trigger_spell_1` = 0,
  `effect_implicit_target_a_1` = 1,
  `effect_implicit_target_b_1` = 0,
  `effect_real_points_per_level_1` = 0,
  `effect_spell_class_mask_a_1` = 0,
  `effect_spell_class_mask_b_1` = 0,
  `effect_spell_class_mask_c_1` = 0;
