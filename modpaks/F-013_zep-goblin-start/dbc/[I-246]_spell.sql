-- I-246 "Necessary Roughness" (24502) — spell fixes for the Bilgewater Buccaneer chain.
--
-- 70016 (spellclick ride): eff1 aura 236 CONTROL_VEHICLE, eff2 aura 23 PERIODIC
-- (shark waves), eff3 90 KILL_CREDIT.
--   * eff2: Cata ships aura 23 period 1000 / trigger 0 / target caster — retail
--     resolves the trigger hotfix-side. Restored as the wave driver: trigger 69971
--     (summons ALL THREE lanes, see below) every 10s, retargeted 1 -> 25 so the
--     periodic rides the VEHICLE: vehicle SmartAI is dead while possessed (I-242)
--     but auras tick, and one application with the control aura means exiting the
--     shredder stops the waves.
--   * eff3 misc: 4.3 client credits bunny 48271; the Neltharion quest row predates
--     the revamp (RequiredNpcOrGo1 = 37179) -> repoint so boarding completes obj 1.
--
-- 69971 ("Summon Steamwheedle Shark 000"): retail uses 8 single-effect lane spells
-- (69971/69976-69982) rotated server-side; a periodic can only trigger ONE spell,
-- so 69971 gets all three lanes as three summon effects (Warmane-observed behavior:
-- all lanes at once). Each effect resolves its own marker bunny via
-- TARGET_DEST_NEARBY_ENTRY + per-effect type-13 condition (SourceGroup = effect
-- mask: 1 -> 75042 north [AUTO, from source], 2 -> 75044 center, 4 -> 75045 south
-- [both in zz_[I-246]_necessary_roughness_field.sql]).
--
-- 69992/69993 (Throw Footbomb + impact): their Cata SpellVisuals (14788 / 19393)
-- don't exist in the 3.3.5a client -> no trajectory-arc aiming kit and an invisible
-- projectile (plain ground-circle cast). Repointed to the goblin SotA demolisher
-- barrel-toss pair (62490/62489 "Hurl Pyrite Barrel"): 13175 = trajectory targeting
-- kit + barrel missile, 11015 = barrel impact. Cosmetic compromise: the projectile
-- is a pyrite barrel, not a football (porting Cata visual 14788 + footbomb model is
-- possible follow-up polish).
--
-- Stock-row rule: the AUTO INSERTs are owned by dbc/[AUTO,F-011]_spell.sql —
-- one consolidated UPDATE per id here.
UPDATE spell SET
  effect_amplitude_2 = 10000,
  effect_trigger_spell_2 = 69971,
  effect_implicit_target_a_2 = 25,
  effect_misc_value_a_3 = 37179
WHERE id = 70016;

UPDATE spell SET
  effect_2 = 28,
  effect_die_sides_2 = 1,
  effect_misc_value_a_2 = 37114,
  effect_misc_value_b_2 = 942,
  effect_implicit_target_a_2 = 46,
  effect_3 = 28,
  effect_die_sides_3 = 1,
  effect_misc_value_a_3 = 37114,
  effect_misc_value_b_3 = 942,
  effect_implicit_target_a_3 = 46
WHERE id = 69971;

UPDATE spell SET
  spell_visual_1 = 13175
WHERE id = 69992;

UPDATE spell SET
  spell_visual_1 = 11015
WHERE id = 69993;
