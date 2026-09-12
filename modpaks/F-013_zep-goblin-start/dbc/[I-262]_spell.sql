-- I-262 "Waltz Right In" (14123) — mook disguise cap, never ported (retail rig is
-- a Neltharion C++ periodic script + vehicle-rider costume, so the gen pipeline
-- had nothing to collect). Both ids hand-owned at their retail values (free in
-- stock 3.3.5a; precedent [I-234]_spell.sql).
--
-- Two-spell rig, mirroring retail's own structure (Cata 67435 eff2 was an aura 23
-- 5s loop triggering 70467 — the server-side re-apply/combat check):
--
-- 67435 carrier (spell_area-applied in area 4768 while 14123 active, hidden buff
-- via attr_ex_1 0x10000000 [I-259], NO interrupt flags): aura 23 periodic 5s
-- trigger -> 70467, so the disguise comes back ~5s after combat ends instead of
-- requiring an area re-entry. spell_linked_spell type 2 (see the zz_ file)
-- co-applies 70467 instantly on villa entry and co-removes it on leaving/turn-in.
--
-- 70467 visible disguise ("Hobart's Ingenious Cap of Mook Foolery"):
--   eff0 aura 139 FORCE_REACTION faction 960 "Actor Evil" -> FRIENDLY (retail
--        eff0 verbatim; Villa Mooks are factiontemplate 2102 -> faction 960,
--        hostile to players — this is what lets you waltz in; Keensnout pigs are
--        faction 16 and see through it). bp 3 + die 1 = 4, stock illusion pattern.
--   eff1 aura 56 TRANSFORM -> helper template 948925 (purple hobgoblin display
--        30262), replacing retail's aura 296 SET_VEHICLE_ID rider-costume rig
--        (I-254 costume pattern). While seated in a vehicle (Hot Rod) the client
--        won't re-render a passenger's model swap — protection still active, the
--        look pops when you hop out (retail's rider rig couldn't render there
--        either).
--   aura_interrupt_flags 0x1002 (take damage | melee attack): combat exposes you
--        (mooks turn on you). Round 4 dropped 0x2000 SPELL_ATTACK — the core fires
--        that bit on EVERY stealth-breaking cast (Spell.cpp:3634), so Skinning a
--        pig corpse was knocking the cap off. Ranged/spell combat entries are
--        covered by the carrier's script instead: spell_zep_mook_disguise_carrier
--        (zeppelin_goblin_start.cpp) makes the 5s periodic strip the disguise
--        while in combat and only re-cast it once combat ends — no mid-fight
--        buff/transform flicker.

DELETE FROM `spell` WHERE `id` = 67435;

INSERT INTO `spell` SET
    `id` = 67435,
    `attributes` = 256,
    `attributes_ex_1` = 268435456,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `duration_index` = 21,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 23,
    `effect_amplitude_1` = 5000,
    `effect_trigger_spell_1` = 70467,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 2412,
    `spell_name_enus` = 'Hobart''s Ingenious Cap of Mook Foolery',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 70467;

INSERT INTO `spell` SET
    `id` = 70467,
    `attributes` = 256,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `duration_index` = 21,
    `aura_interrupt_flags` = 4098,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 139,
    `effect_base_points_1` = 3,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 960,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 56,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 948925,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 2412,
    `spell_name_enus` = 'Hobart''s Ingenious Cap of Mook Foolery',
    `spell_tooltip_enus` = 'You look just like one of Trade Prince Gallywix''s mooks. Slip past them to "procure" the priceless objects that you need, but beware the Keensnout Potbelly pigs!!!',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;
