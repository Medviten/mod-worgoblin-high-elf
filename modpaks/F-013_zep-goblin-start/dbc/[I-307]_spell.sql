-- I-307 Weed Whacker (q14236): make the whirlwind aura 68212 usable on 3.3.5a.
-- Stock Cata-port row (owned by [AUTO,F-011]_spell.sql) -> one consolidated UPDATE.
--   * eff1 was aura 296 SET_VEHICLE_ID(493); vehicle 493 is Cata-only and was
--     never ported into Vehicle.dbc, so the effect can never resolve. Dropped.
--     The mow behaviour lives entirely in eff2 (periodic trigger 68213 / 500ms).
--   * duration_index 21 (-1, until cancelled) -> 9 (30s): the spell carries
--     SPELL_ATTR0_NO_AURA_CANCEL, so an infinite whirlwind could never be
--     removed. Core script (spell_zep_q14236_weed_whacker) also toggles it off
--     on re-click.
--   * spell_visual_1 14605 was never ported into spellvisual (dangling ref).
--     Remapped to stock 6664 (Herod's Whirlwind 8989): state_kit 370 loops
--     AnimationData 126 'Whirlwind' for the whole aura with the classic wind
--     swirl (base_effect 361) + whoosh sound. Bladestorm's 10704 was tried
--     first but its kit 9857 drags in the energy/lightning effect (4059).
--     Per-tick hit feedback stays on 68213's stock visual 11022 (impact kit
--     on the struck plants).
UPDATE spell SET
  effect_1 = 0,
  effect_apply_aura_name_1 = 0,
  effect_misc_value_a_1 = 0,
  effect_implicit_target_a_1 = 0,
  duration_index = 9,
  spell_visual_1 = 6664
WHERE id = 68212;
