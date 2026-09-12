-- I-242 Honk Horn (66298) + Radio (66299) — direct spell-effect audio delivery.
--
-- History: Cata's originals target 95 (TARGET_UNIT_TARGET_PASSENGER, needs an
-- explicit passenger target -> "invalid target" from the 3.3.5a vehicle bar) and
-- rely on a retail creature script for the actual audio. A first fix retargeted to
-- caster(1) and played audio via SmartAI on-spellhit; in-game that stayed silent
-- while the pure-effect Punch It (66300) works on the same bar — so the audio now
-- rides the proven spell-effect path and the SmartAI hop is retired.
--
-- Both effects target 96 (TARGET_UNIT_PASSENGER_0 = seat 0 = the driver, resolved
-- server-side via GetVehicleKit()->GetPassenger(0)):
--   66298 eff1 = 131 SPELL_EFFECT_PLAYER_NOTIFICATION, misc 22491 (honk ogg)
--   66299 eff1 = 132 SPELL_EFFECT_PLAY_MUSIC,          misc 23406 (radio track)
-- AC's EffectPlaySound/EffectPlayMusic require a PLAYER target — passenger 0 is
-- exactly that. Known compromise: only the driver hears them (retail broadcasts
-- to nearby players via script).
--
-- Stock-row rule: the 66298/66299 INSERTs are owned by dbc/[AUTO,F-011]_spell.sql —
-- one consolidated UPDATE per id here.
UPDATE spell SET
  effect_implicit_target_a_1 = 96,
  effect_implicit_target_a_2 = 96
WHERE id = 66298;

UPDATE spell SET
  effect_1 = 132,
  effect_misc_value_a_1 = 23406,
  effect_implicit_target_a_1 = 96
WHERE id = 66299;
