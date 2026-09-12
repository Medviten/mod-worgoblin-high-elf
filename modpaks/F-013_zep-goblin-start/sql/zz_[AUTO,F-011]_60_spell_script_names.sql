-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 spell_script_names (one file per table; rows carry final state)

DELETE FROM spell_script_names WHERE spell_id IN (67917,68211,68280,71170,72887,72891);

INSERT INTO spell_script_names (`spell_id`, `ScriptName`) VALUES
  (68211, 'spell_zep_q14236_weed_whacker'),
  (68280, 'spell_zep_q14031_ktc_snapflash'),
  (72891, 'spell_zep_q24942_zombies_booster'),
  (72887, 'spell_zep_q24942_boots_ride');

