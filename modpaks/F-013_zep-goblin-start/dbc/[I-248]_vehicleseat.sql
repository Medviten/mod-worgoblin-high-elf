-- I-248 — Buccaneer driver seat (6846, vehicle 582): WotLK flag semantics.
--
-- Same Cata-bit disease as the vehicle row (dbc/[I-248]_vehicle.sql): the Cata
-- flags value 0x62100a00, read with WotLK semantics, happens to include
-- CAN_CONTROL/CAN_CAST (which is why boarding + the bar worked) but misses the
-- rest of the siege-driver UI set, and flags_b 0x18010000 is pure Cata noise.
-- The vehicle-level ADJUST_AIM_ANGLE alone did not light up the client aim arc
-- in testing — the seat is the remaining Cata-semantics field in the chain.
--
-- Adopt the stock WotLK demolisher driver seat flags wholesale (WG 1554 and
-- SotA 2021 both = 0x6710880b = 1729136651: CAN_CONTROL, CAN_CAST, zoom,
-- enter/exit + anim bits, passenger not selectable) and flags_b = 0 (SotA
-- driver). Attachment/anim/camera columns keep their Cata values. Row is owned
-- by dbc/[AUTO,F-011]_vehicleseat.sql -> consolidated UPDATE here.
-- Side effect to verify in-game: dropping Cata bit-soup may newly SHOW the
-- goblin in the seat (WotLK HIDE_PASSENGER 0x200 was set by accident).
UPDATE vehicleseat SET
  flags = 1729136651,
  flags_b = 0
WHERE id = 6846;
