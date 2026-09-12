-- I-270: Kaja'Cola (item 84474) is not consumed when drunk.
--
-- The F-011 item pipeline (goblin_gen/item_spells.py) wires only spellid_N and
-- spelltrigger_N from the item_spell_wm fixture; spellcharges_N/spellcooldown_N
-- are left at the item_cols defaults (0 / -1). spellcharges 0 = unlimited uses,
-- so a stack of colas never shrinks.
--
-- Cata source (Whitemane 4.3.4 Item-sparse.db2, item 49884):
--   SpellID 70478, Trigger 0, Charges -1, Cooldown 1500, Category 0, CatCD -1
-- Charges -1 = single use, consumed. Cooldown 1500ms matches the 1.5s cast
-- (spellcasttimes 16) the I-268 drink animation plays over.
--
-- 84474 is owned by zz_[AUTO,F-011]_05_item_template.sql; this file sorts after
-- it and overrides these two columns only.

UPDATE item_template SET
  spellcharges_1 = -1,
  spellcooldown_1 = 1500
WHERE entry = 84474;
