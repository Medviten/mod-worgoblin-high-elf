-- I-323 Mechachicken (38224) — walk pace, to taste.
--
-- Safe to tune freely ONLY because the authored locomotion figure now matches the art:
-- Mechachicken renders through its own model 900008, whose Walk/Run moveSpeed were
-- divided by the display's 15x scale (see build_mechachicken_m2.py and
-- dbc/[I-323]_creaturedisplayinfo.sql). Per I-318 Defect 11 the ground covered per cycle
-- is `1000ms * authored`, invariant at every speed, so lowering the speed slows the legs
-- and the body together and the feet stay locked. While an authored figure is wrong every
-- speed change trades one mismatch for another — that was I-318's unwinnable loop.
--
-- Confirmed in game as in sync at speed_walk 1.0; slowed 25% on Justin's direction.
--   speed_walk 1.0  -> 2.500 yd/s   (baseMoveSpeed[MOVE_WALK] 2.5, Unit.cpp:149)
--   speed_walk 0.75 -> 1.875 yd/s   <- this file
--
-- speed_run is deliberately NOT cut. The bird walks everywhere it is normally seen
-- (SAI id 3 WP_START has run = 0, and with no creature_template_movement row the wander
-- generator defaults to Walk), so run only applies while it is chasing a player in
-- combat — where 0.8571 (6.0 yd/s, just under player run) is what makes it a threat.
-- The stride stays locked at that speed too; only the cadence differs.
--
-- AUTO-owned row -> one consolidated UPDATE.
--
-- NOTE: `Creature::InitEntry` applies speeds at SPAWN. `.reload creature_template`
-- updates the template but never touches already-spawned creatures, so this must be
-- judged after a respawn or a worldserver restart (I-318 burned four passes on that).

UPDATE creature_template SET
  `speed_walk` = 0.75
WHERE entry = 38224;
