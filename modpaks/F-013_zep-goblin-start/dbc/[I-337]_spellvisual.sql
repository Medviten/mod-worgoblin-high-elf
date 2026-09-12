-- I-337 — REVERT of a wrong diagnosis. Kept as a file (not deleted) because the earlier
-- version of it was already applied, so the stock values have to be restored explicitly.
--
-- The theory was that the trajectory aiming line came from `SpellVisual.flags` bit 0x20 plus
-- `missile_motion`, on the strength of 12925 (Fire Cannon, flat green circle) and 13329
-- (Harpoon Mortar, arc) being byte-identical except those two fields. 14135 — an unreferenced
-- stock row otherwise identical to 12925 — was given flags 33 / missile_motion 13 /
-- impact_area_kit 13085 and spell 72206 was repointed at it. **It changed nothing in-game.**
--
-- The aim arc is a Vehicle.dbc property, not a SpellVisual one: the `mssl_trgt_*` field group
-- on the vehicle row plus WotLK-semantics flags on the vehicle AND its seat. See
-- [I-337]_vehicle.sql and [I-337]_vehicleseat.sql, which is how I-248 got it on the shredder.
-- Stock proof that no SpellVisual change is needed: SotA's own cannon (51421) uses plain
-- 12925 with missile_motion 0 and aims with an arc, because its vehicle row is configured.
--
-- So 14135 goes back to its shipped values and 72206 back to 12925 (see [I-337]_spell.sql).
-- 14135 is still referenced by no spell.

UPDATE spellvisual SET
  `flags` = 1,
  `missile_motion` = 0,
  `impact_area_kit` = 4931
WHERE `id` = 14135;
