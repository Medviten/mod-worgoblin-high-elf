-- I-248 "Fourth and Goal" (28414) — one Throw Footbomb with real vehicle aiming.
--
-- v2 (user direction): NO second kick spell. 69992 stays the only bar button and
-- gains WotLK siege-vehicle aim (the green trajectory arc you pitch and fire —
-- SotA demolisher style) instead of the ground-click reticle. The reticle vs arc
-- choice is CLIENT-side, driven by Vehicle.dbc aim flags -> dbc/[I-248]_vehicle.sql.
-- 69992's shape (targets 0x40 + TARGET_DEST_TRAJ 89 + trigger-missile 69993)
-- already matches stock 52338 "Hurl Boulder" exactly; the spell only needs reach.
--
-- 70052 "Kick Footbomb" (v1 of this fix) is RETIRED — delete, do not re-insert.
-- Do not add 70052 to the missing_spells fixture either.
DELETE FROM spell WHERE id = 70052;

-- Stock-row rule: 69992/69993 INSERTs are owned by dbc/[AUTO,F-011]_spell.sql
-- (visual repoints live in dbc/[I-246]_spell.sql) — one consolidated UPDATE each.
--
-- 69992: aligned to stock 52338 "Hurl Boulder" (the proven siege aim-arc spell —
-- full-column diff, only zone-flavor kept):
--   * spell_missile_id 642 — THE missing link: WotLK trajectory spells carry a
--     SpellMissile.dbc ballistic record; the client computes/draws the aim arc
--     and times the launch motion from it. Cata moved missile data out of
--     Spell.dbc so the port left 0 -> no arc (reticle fallback) and erratic
--     launch-anim timing. 642 is stock client data, nothing extra to ship.
--   * attributes 0/0x400/0x40000/0/0 — the ported values were CATA bit
--     semantics (noise under WotLK reading, client and server both). ex2 keeps
--     0x4 CAN_TARGET_NOT_IN_LOS (equal on both spells, needed for the rooftop).
--   * range 6 -> 13 (anywhere): goal is 160yd downfield, server range-checks
--     the traj dest.
--   * spell_missile_id 642 -> 90642 (dbc/[I-248]_spellmissile.sql): boulder
--     ballistics cap the arc ~120yd — the custom missile (1402 pyrite-barrel
--     clone, speed 95) reaches the rooftop goal. 1402's family also matches
--     visual kit 13175, which 62490 pairs with spell speed 40 — speed 10/642
--     was a mismatched pairing and a suspect in the erratic launch anim.
--   * eff1 radius index 14 (8yd): the trigger-missile corridor — AC's traj
--     sampling uses the effect radius, 0 disabled mid-flight interception.
--   * start_recovery_category 133: standard GCD category.
-- recovery_time 2000 = stock Hurl Boulder's cooldown: the client force-plays
-- the launch visual's impact kit at the OLD dest when refiring mid-flight
-- (inherent missile-slot behavior); the cooldown keeps normal cadence from
-- tripping it, exactly as stock siege spells do.
UPDATE spell SET
  range_index = 13,
  speed = 40,
  attributes = 0,
  attributes_ex_1 = 0x400,
  attributes_ex_3 = 0x40000,
  attributes_ex_4 = 0,
  attributes_ex_6 = 0,
  start_recovery_category = 133,
  recovery_time = 2000,
  effect_radius_index_1 = 14,
  effect_damage_multiplier_1 = 1,
  spell_missile_id = 90642,
  spell_visual_1 = 13175
WHERE id = 69992;
-- ^^^ FINAL (v24): visual = STOCK 13175 (precast zeroed only). The bisects
-- proved ANY custom-id row in the visual chain re-triggers the ghost (visual
-- 90175, then kit 90144 inside 13175 in v622). Release anim = shreddermount M2
-- lookup alias (stock kit 11144 anim 107 -> out-of-lookup -> falls back to 16
-- -> aliased to UseStandingLoop). Missile 90642 = fixed speed 95 + pitch floor
-- 45deg ([I-248]_spellmissile.sql).

-- 69971 (shark wave summon): summon properties 942 -> 64 on all three lane
-- effects (I-251). Prop 942 is control-1 GUARDIAN: the sharks' OWNER became
-- the summoning vehicle, and AC hard-codes reaction-to-owner as FRIENDLY, so
-- the sharks could never attack the shredder (retail/Whitemane: they maul it
-- until destroyed). Prop 64 = wild summon, no owner — the SAI forced attack
-- (I-246 file, row 6) becomes valid. eff1's 942 is AUTO-ported; effs 2/3 got
-- 942 from the I-246 lane clone — this consolidated UPDATE layers after both.
UPDATE spell SET
  effect_misc_value_b_1 = 64,
  effect_misc_value_b_2 = 64,
  effect_misc_value_b_3 = 64
WHERE id = 69971;

-- 69993 (impact): eff1 = dummy on DEST_AREA_ENEMY radius 3yd, entry-filtered to
-- sharks 37114 (AUTO type-13 group 1) — unchanged.
-- eff2 REVERTED to none (v5): goal credit now lives in the C++ spell script
-- spell_zep_q28414_footbomb_goal on 69992 (flight-path vs goal-quad intersect;
-- see zz_[I-248]_fourth_and_goal_kick.sql). The v2-v4 dest-area attempts were
-- structurally wrong for through-shots (only see the LANDING point) — and v8's
-- shipped b=16 was additionally an ENEMY check (3.3.5: 8 = UNIT_DEST_AREA_ENTRY,
-- 16 = UNIT_DEST_AREA_ENEMY, SpellInfo.cpp:221) that can never select friendly
-- bunnies. An ENTRY-check effect without its condition row just error-logs, so
-- the whole effect goes back to empty.
-- visual -> 2519, stock Boulder-impact's (v19): the ghost that survived every
-- kit permutation is the MISSILE RECORD's area burst replaying when the record
-- is destroyed at the NEXT launch — stock never shows it because the impact
-- spell's GO closes the record right at landing, and closure evidently needs
-- the impact spell to carry a real visual (v18's visual=0 left the record
-- dangling). 2519 = impact_kit 728 only (unit hits, no area kits, no caster
-- kits): closes the record, renders nothing on ground landings, cannot stomp
-- the vehicle anim. The chain is now field-for-field stock Hurl Boulder:
-- launch visual (11477 + 11489) + missile record + visualed impact spell.
-- Attribute masks aligned to stock 62489 (the pyrite impact, proven ghost-free
-- on this client): 69993 had carried its raw CATA masks all along
-- (0x20220000 / ex2 0x4000004 — noise under WotLK semantics, and the impact GO
-- is precisely the packet whose record-close behavior is broken). ex2 keeps
-- 0x4 ignore-LoS. damage_class 3 = stock's. Visual stays 2519, NOT 62489's
-- 11015 — 11015's cast kit (10166) plays anim 54 on the CASTER at landing,
-- which stomps the shredder's release anim.
UPDATE spell SET
  attributes = 0,
  attributes_ex_1 = 0,
  attributes_ex_2 = 4,
  attributes_ex_3 = 0x40080,
  attributes_ex_4 = 0,
  attributes_ex_5 = 0x4000000,
  attributes_ex_6 = 0x1000000,
  damage_class = 3,
  effect_2 = 0,
  effect_implicit_target_a_2 = 0,
  effect_implicit_target_b_2 = 0,
  effect_radius_index_2 = 0,
  effect_misc_value_a_2 = 0,
  spell_visual_1 = 2519
WHERE id = 69993;
