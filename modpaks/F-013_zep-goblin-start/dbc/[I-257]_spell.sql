-- I-257 "Robbing Hoods" (14121) — Hot Rod run-over chain.
--
-- Retail (Cata 4.4 wago extract) implements run-over robbery as: contact ->
-- 66301 "Rolling with my Homies: Hot Rod - Knockback" (KNOCK_BACK, 12yd cone
-- entry, speed 9/9) on the looter -> looter grants 67041 "Robbing Hoods:
-- Create Stolen Loot" (CREATE_ITEM 47530 -> our 84466). The contact detection
-- itself is core-side on retail (no trigger aura exists for the regular Hot
-- Rod; Life Savings' 70329 shows Blizzard's own data pattern: aura 23
-- periodic-trigger at 100ms). We supply that missing driver as custom 66302 —
-- the 66302 slot is unused even in Cata Classic 4.4, so it can never collide
-- with a future port; it sits next to its triggered spell for discoverability.
--
-- The trigger rides as effect 2 of 66392 "Hot Rod" (the control spell), aimed
-- at the CASTER. It must sit on the PLAYER, not the vehicle: periodic-trigger
-- auras are cast by the aura TARGET, and the looter SpellHit invoker is
-- m_caster (Spell.cpp:2944) — player-held aura => invoker = player => the
-- looter can cast CREATE_ITEM back at the driver (target 7). 66392 is cast BY
-- the boarding player on BOTH entry paths: spellclick (cast_flags 1) and the
-- SUMMON_CATEGORY_VEHICLE auto-board (SpellEffects.cpp:2571), which never
-- touches HandleSpellClick — a spellclick-row carrier (the first I-257
-- attempt, retired 66302 below) silently never fires for summoned vehicles.
--
-- 66393 basepoints fix: retail encodes the ride spell in the summon effect's
-- EffectBasePoints as a FINAL value (66392, die 0); the Cata import wrote
-- die_sides 1, so CalcValue resolved 66392+1=66393 (no control aura) and the
-- auto-board fell back to generic Ride 46598. bp 66391 + die 1 = 66392
-- restores the retail ride spell. Same import bug class as I-246's
-- "SpellEffect trigger@21" off-by-one — other summon spells with a spell id
-- or seat index in basepoints may be shifted +1 too (emitter sweep is a
-- follow-up, not done here).
--
-- 66301: target 60 TARGET_UNIT_CONE_ENTRY (front cone, gated to entry 35234
-- via type-13 condition in the world SQL). Radius index 32 = 12yd (present in
-- our spellradius). bp 89 + die 1 = speedZ 9.0, misc_a 90 = speedXY 9.0 —
-- retail values. damage_class 0 (no damage roll, cannot be avoided).
--
-- 67041: retail ID free in stock 3.3.5a; effect_item_type repointed from
-- retail 47530 to our renumbered Stolen Loot 84466 (quest item, bonding 4).
--
-- Ships in PATCH-Z; server side needs a worldserver restart only (no core
-- rebuild).
DELETE FROM spell WHERE id = 66301;
INSERT INTO spell SET
  id = 66301,
  spell_name_enus = 'Rolling with my Homies: Hot Rod - Knockback',
  school_mask = 1,
  damage_class = 0,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 1,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 98,
  effect_base_points_1 = 89,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 90,
  effect_radius_index_1 = 32,
  effect_implicit_target_a_1 = 60,
  spell_icon_id = 3208;

-- 66302 (I-257-reserved slot; formerly the retired spellclick carrier) is now
-- the run-over stun: SAI-cast on the looter itself on spellhit of 66301. A
-- real MOD_STUN aura (12) is required — SmartAI SET_UNIT_FLAG(0x40000) only
-- flips the display bit and never calls SetStunned(), so it neither shows the
-- stun visual nor blocks the looter's Torch Toss. MOD_STUN sets
-- UNIT_STATE_STUNNED -> CastStop() + no new casts/melee + client stun stars.
-- duration_index 39 = 2000ms (covers the 1500ms until the linked death);
-- attributes 0x10 (CANT_BE_REFLECTED-adjacent unused here) omitted — keep it
-- plain so it always lands on the lvl-5 looters (no immunities).
DELETE FROM spell WHERE id = 66302;
INSERT INTO spell SET
  id = 66302,
  spell_name_enus = 'Robbing Hoods: Run Them Over!',
  spell_desc_enus = 'Stunned after being flattened by a Hot Rod.',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 39,
  range_index = 1,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 6,
  effect_apply_aura_name_1 = 12,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_implicit_target_a_1 = 1,
  spell_icon_id = 3208;

-- Stock-row rule: 66392/66393 are owned by the AUTO import — one consolidated
-- UPDATE per id. eff2 = the run-over driver: aura 23, 250ms periodic, cast on
-- the CASTER (the boarding player), stripped on exit by the Hot Rod's
-- PASSENGER_REMOVED SAI (zz_[I-257]_robbing_hoods_runover.sql).
UPDATE spell SET
  effect_2 = 6,
  effect_apply_aura_name_2 = 23,
  effect_amplitude_2 = 250,
  effect_trigger_spell_2 = 66301,
  effect_die_sides_2 = 1,
  effect_implicit_target_a_2 = 1
WHERE id = 66392;

UPDATE spell SET
  effect_base_points_1 = 66391
WHERE id = 66393;

DELETE FROM spell WHERE id = 67041;
INSERT INTO spell SET
  id = 67041,
  spell_name_enus = 'Robbing Hoods: Create Stolen Loot',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 24,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_item_type_1 = 84466,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 3208;
