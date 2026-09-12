-- I-308 — Bastia rider seat (6146, vehicle 530): WotLK flag semantics.
--
-- Same Cata-bit disease as I-248 (Buccaneer seat 6846): the Cata flags value
-- 0x42100826, read with WotLK semantics, includes CAN_CONTROL/CAN_ENTER_OR_EXIT
-- (riding worked) but misses ALLOWS_INTERACTION (0x80000000) and CAN_CAST
-- (0x20000000 = Lua_UnitHasVehicleUI). Result: the rider cannot talk to Scout
-- Brax to turn in q14240 "To the Cliffs" (retail keeps you mounted through the
-- turn-in and on to the Gyrochoppa), and the client never swaps in the vehicle
-- bar, so there is no Leave Vehicle button either — stuck on the cat with no
-- visible aura to cancel.
--
-- Adopt the stock WotLK Argent Warhorse rider seat flags wholesale (seats
-- 3129/5406 both = 0xE210880B = -502233077 signed: ALLOWS_INTERACTION,
-- CAN_CAST, 0x40000000, enter/exit, passenger-not-selectable, CAN_CONTROL,
-- exit-anim bits) — the canonical controlled ground mount you can talk to
-- NPCs from. flags_b likewise (Cata 0x98000000 is noise; Argent stock = 16).
-- Attachment/anim/camera columns keep their Cata values. Row is owned by
-- dbc/[AUTO,F-011]_vehicleseat.sql -> this file is its consolidated override.
UPDATE vehicleseat SET
  flags = -502233077,
  flags_b = 16
WHERE id = 6146;
