-- [I-238] Give idle hostile mobs (npcflag=0, MovementType=0) a random wander radius so they
-- don't stand motionless. Static NPCs (gossip/questgiver/trainer/vendor) stay put.
-- Override for the generated spawn files; loads after them (I > F).
-- PREFERRED long-term fix: set wander for idle hostiles in the spawn generator (migrate_creatures),
-- then retire this override.
--
-- Posed / corpse spawns are excluded (sliding-corpse regression, reported on Goblin
-- Survivor 38409 guid 11002046): a random-wander motion master drags the body across
-- the ground while it keeps its dead/kneeling/sitting pose. Neltharion stages those
-- three ways, so all three are checked:
--   * per-spawn `dynamicflags` 0x20 UNIT_DYNFLAG_DEAD
--   * a non-zero stand state (byte 0 of `bytes1`: 1 sit / 7 dead / 8 kneel / ...) on
--     either the per-guid `creature_addon` or the entry's `creature_template_addon`
--   * aura 29266 Permanent Feign Death, which lays the body down on its own even when
--     the stand state is 0 (gen unions template auras into the per-guid rows)
-- Dedicated corpse entries exist alongside their live twins and differ only in this
-- data: 35929 Poison Spitter (corpse) vs 35896 (live), 361760 Alliance Sailor (corpse)
-- vs 36176 (live).
UPDATE creature cr
  JOIN creature_template ct ON ct.entry = cr.id
  LEFT JOIN creature_addon ca ON ca.guid = cr.guid
  LEFT JOIN creature_template_addon cta ON cta.entry = cr.id
SET cr.MovementType = 1, cr.wander_distance = 5
WHERE cr.guid BETWEEN 11000000 AND 11003689
  AND ct.npcflag = 0
  AND cr.MovementType = 0
  AND cr.wander_distance = 0
  AND (cr.dynamicflags & 0x20) = 0
  AND (IFNULL(ca.bytes1, 0) & 0xFF) = 0
  AND (IFNULL(cta.bytes1, 0) & 0xFF) = 0
  AND CONCAT(' ', IFNULL(ca.auras, ''), ' ') NOT LIKE '% 29266 %'
  AND CONCAT(' ', IFNULL(cta.auras, ''), ' ') NOT LIKE '% 29266 %';

-- Repair pass: park every posed/corpse spawn that already carries movement. Clears rows
-- this file granted before the exclusion above existed, and backstops the AUTO files —
-- the gen TDB-4.3.4 overlay used to hand wander 10 straight to kneeling Orc Survivors
-- 35882 / Alliance Paratrooper 39069. Gen now carries the matching `_posed()` guard in
-- cli/commands/goblin_gen/creatures.py, so those emit static at source; this statement
-- stays as the net for any spawn that slips through a future overlay change.
-- MovementType 2 (waypoint) is left alone: a scripted path is authored intent, not a
-- blanket grant, and nothing posed currently carries one.
UPDATE creature cr
  LEFT JOIN creature_addon ca ON ca.guid = cr.guid
  LEFT JOIN creature_template_addon cta ON cta.entry = cr.id
SET cr.MovementType = 0, cr.wander_distance = 0
WHERE (cr.guid BETWEEN 11000000 AND 11999999 OR cr.guid BETWEEN 12000000 AND 12999999)
  AND cr.MovementType <> 2
  AND (cr.MovementType <> 0 OR cr.wander_distance <> 0)
  AND ((cr.dynamicflags & 0x20)
    OR (IFNULL(ca.bytes1, 0) & 0xFF) <> 0
    OR (IFNULL(cta.bytes1, 0) & 0xFF) <> 0
    OR CONCAT(' ', IFNULL(ca.auras, ''), ' ') LIKE '% 29266 %'
    OR CONCAT(' ', IFNULL(cta.auras, ''), ' ') LIKE '% 29266 %');
