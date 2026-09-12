-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 npc_spellclick_spells (one file per table; rows carry final state)

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34840,35486,35995,36143,36178,36505,36585,37179,37598,37676,38111,38318,38412,38526,38802,39039,39074,39329,39456,39592,39598,44578,44579,44580);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34830,35999,48526,48721,75106);

INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
  (34840, 66392, 1, 0),
  (35486, 67476, 1, 0),
  (35995, 46598, 1, 0),
  (36143, 68387, 1, 0),
  (36178, 68436, 1, 0),
  (36505, 68805, 1, 0),
  (36585, 68974, 1, 0),
  (37179, 70016, 1, 0),
  (37598, 46598, 1, 0),
  (37676, 66724, 1, 0),
  (38111, 66727, 0, 0),
  (38318, 71661, 1, 0),
  (38412, 83142, 0, 0),
  (38526, 72240, 1, 0),
  (38802, 72971, 0, 0),
  (39039, 46598, 1, 0),
  (39074, 73427, 1, 0),
  (39329, 73747, 0, 0),
  (39456, 73947, 1, 0),
  (39592, 56685, 1, 0),
  (39598, 73989, 1, 0),
  (44578, 83142, 0, 0),
  (44579, 83142, 0, 0),
  (44580, 83142, 0, 0),
  (34830, 66306, 1, 0),
  (35999, 46598, 0, 0),
  (48526, 56685, 1, 0),
  (48721, 46598, 1, 0),
  (75106, 56685, 1, 0);

