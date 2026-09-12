-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 spell_target_position (one file per table; rows carry final state)

DELETE FROM spell_target_position WHERE ID IN (68488,68489,68804,68815,68817,72971,74028,74029,74100,92633);

INSERT INTO spell_target_position (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`) VALUES
  (68488, 0, 1, 433.5702, -8978.483, 3.4, 5.7012),
  (68489, 0, 1, 470.6526, -9019.84, -1.8, 5.236),
  (68804, 0, 1, 345.0867, -10059.82, 130.784, 4.9126),
  (68815, 0, 1, 322.8347, -10048.98, 118.784, 2.7332),
  (68817, 0, 1, 345.0867, -10059.82, 130.784, 4.9126),
  (72971, 0, 1, 947.8167, -11530.23, 106.779, 0),
  (74028, 0, 1, 1821.9667, -10316.31, 11.1715, 5.4684),
  (74029, 0, 1, 1468.8, -5012.29, 11.7693, 3.2386),
  (74029, 2, 1, 1468.8, -5012.29, 11.7693, 3.2386),
  (74100, 0, 1, 1.5017, -9527.08, 0.1719, 5.1479),
  (74100, 1, 1, 1.5017, -9527.08, 0.1719, 5.1479),
  (92633, 0, 1, -8383.7233, -10959.97, 7.6094, 2.1747);

