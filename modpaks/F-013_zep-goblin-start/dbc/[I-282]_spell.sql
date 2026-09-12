-- I-282: Monkey Business (q14019) banana spells — point them at visuals that exist.
--
-- Both rows are owned by [AUTO,F-011]_spell.sql, which emits the verbatim Cata
-- spell_visual_1. This file sorts after it and overrides that one column on each.
-- One consolidated UPDATE per id; see [I-282]_spellvisual.sql for what each
-- target visual contains and why.
--
--   67917 Nitro-Potassium Bananas: 14351 (Cata, absent) -> 11368 STOCK
--         = AttackThrown anim + throw sound + Banana Bunch missile on a parabola.
--         This is the throw animation and the banana projectile.
--   67919 Exploding Bananas:       14348 (Cata, absent) -> 90051 (ported chain)
--         = eat-the-banana precast, then Bomb Explosion + Immolate, plus a white
--         smoke flare state.

UPDATE spell SET
  spell_visual_1 = 11368
WHERE id = 67917;

UPDATE spell SET
  spell_visual_1 = 90051
WHERE id = 67919;
