-- I-337 — B.C. Eliminator gunner seat (7545, vehicle 640): stock rooted-cannon gunner flags.
--
-- SUPERSEDES a wrong earlier cut of this file, which used the demolisher **driver** seat value
-- 0x6710880b (stock WG 1554 / SotA 2021, and what I-248 put on the shredder seat 6846). That
-- is a driver seat; pairing it with demolisher vehicle flags is what let the emplacement drive.
--
-- The correct donor is the stock rooted-cannon gunner seat, and all three stock cannons agree
-- on it byte-for-byte:
--   2029 (SotA Antipersonnel Cannon 160), 2283 (WG Tower Cannon 244), 5786 (IoC Keep Cannon
--   510)  =  flags 0x6610080f = 1712326671, flags_b 0, attachment_id 13.
-- Our 7545 already carries attachment_id 13, so it is the same class of seat.
--
-- Relative to the shipped 7545 value (flags 0x6210080f, flags_b **0x18000c00**) the delta is
-- small and precise:
--   + 0x04000000 VEHICLE_SEAT_FLAG_CAN_SWITCH
--   flags_b 0x18000c00 -> 0 — pure Cata noise, no such bits exist in WotLK's
--   VehicleSeatFlagsB (the textbook fingerprint from the vehicleseat-flag-disease note).
-- CAN_CONTROL 0x800, CAN_CAST 0x20000000, CAN_ENTER_OR_EXIT 0x2000000 and
-- PASSENGER_NOT_SELECTABLE 0x100000 all survive the Cata reinterpretation by coincidence,
-- which is why boarding and the action bar always worked and only the aim UI was missing.
--
-- Relative to the demolisher driver seat this drops ENABLE_VEHICLE_ZOOM 0x1000000 and
-- SHOULD_USE_VEH_SEAT_EXIT_ANIM_ON_FORCED_EXIT 0x8000 and restores UNK3 0x4 — i.e. a gunner,
-- not a driver. Attachment / anim / camera columns keep their Cata values.
--
-- Client-side flags: PATCH-Z only, no worldserver restart needed for this row (the server
-- only reads CAN_ENTER_OR_EXIT, on exit requests).
--
-- The row belongs to dbc/[AUTO,F-011]_vehicleseat.sql, so it is edited in place below.

UPDATE vehicleseat SET
  `flags` = 1712326671,
  `flags_b` = 0
WHERE `id` = 7545;
