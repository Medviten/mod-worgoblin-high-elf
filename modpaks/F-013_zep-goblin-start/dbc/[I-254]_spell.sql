-- I-254 "Life of the Party" (14113/14153) — 3.3.5a adaptations of the ported
-- Cata party spells (base rows live in [AUTO,F-011]_spell.sql via missing_spells).
-- One consolidated UPDATE per AUTO-owned ID (override pattern, cf. [I-246]_spell.sql).

-- 66908 Awesome Party Ensemble: eff2 was 4.x-only cancel-aura of 91551 "Keys to
-- the Hot Rod" (unported) — strip it. Eff1 aura 293 override-bar (misc 122) stays.
UPDATE spell SET
  effect_2 = 0,
  effect_trigger_spell_2 = 0
WHERE id = 66908;

-- Outfit auras: retail applies the costume via a server-side dummy script; on
-- 3.3.5a we repoint the dummy to aura 56 TRANSFORM into single-model helper
-- templates (935186 dress female / 935175 tux male, partygoer displays 29631/29630,
-- bakes already shipped). Eff2 force-cast 66985 is replaced by spell_linked_spell
-- type 2 (see zz_[I-254]_life_of_the_party.sql) so the disarm set is REMOVED with
-- the outfit — a force-cast permanent aura would stick after leaving the party.
-- Cata SpellVisual 17522/17521 don't exist in 3.3.5a -> zeroed.
UPDATE spell SET
  effect_apply_aura_name_1 = 56,
  effect_misc_value_a_1 = 935186,
  effect_2 = 0,
  effect_trigger_spell_2 = 0,
  spell_visual_1 = 0
WHERE id = 66927;

UPDATE spell SET
  effect_apply_aura_name_1 = 56,
  effect_misc_value_a_1 = 935175,
  effect_2 = 0,
  effect_trigger_spell_2 = 0,
  spell_visual_1 = 0
WHERE id = 66928;

-- Cata-only SpellVisual ids absent from 3.3.5a (66911 Dance vis 14214,
-- 66985 Outfit-Secondary vis 17524) -> zeroed; dancing is done via SAI emote.
UPDATE spell SET spell_visual_1 = 0 WHERE id = 66911;
UPDATE spell SET spell_visual_1 = 0 WHERE id = 66985;
