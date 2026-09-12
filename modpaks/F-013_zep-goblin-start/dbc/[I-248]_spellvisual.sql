-- I-248 — Throw Footbomb visuals: stock 13175 with ONLY the wind-up removed.
--
-- Bisect verdicts (v21-v23 in-game): ANY custom-id row in the visual chain
-- triggers the ghost-explosion replay — custom SpellVisual 90175 did it, and
-- putting custom SpellVisualKit 90144 into stock 13175 brought it back
-- (v622->v623). Every id the client touches must be STOCK.
--
-- Anim architecture without custom kits:
--   * cast_kit stays STOCK 11144 (anim 107 AttackThrown). 107 is beyond the
--     shreddermount M2's 103-entry animation lookup -> client falls back to
--     AttackUnarmed (16) -> our shipped M2 aliases lookup[16] to sequence 54
--     (UseStandingLoop, animId 123). The pinned release anim comes from the
--     MODEL, with zero custom DBC ids.
--   * precast_kit 10325 -> 0: the wind-up dragged the aim anchor. A zeroed
--     reference is a value edit, not a custom id.
-- Shared-row note: Ulduar's Hurl Pyrite Barrel (62490) also uses 13175 and
-- loses its wind-up; its own model resolves anim 107 natively. Cosmetic.
UPDATE spellvisual SET
  precast_kit = 0,
  cast_kit = 314
WHERE id = 13175;
-- cast_kit -> STOCK kit 314 (v29): a bare stock kit whose only payload is
-- anim_id 123 UseStandingLoop — the ONE anim mechanism proven to work on this
-- model (custom kit 90144 with the same anim played perfectly v614-v622 but
-- its custom ID caused the ghost; M2 sequence aliasing is ignored by the
-- client, v631 test). Stock-row value edits are proven ghost-free (v624).
-- Shared-row note: Ulduar's Hurl Pyrite Barrel also plays UseStandingLoop on
-- release now — cosmetic.

-- Custom visuals/kits RETIRED (DELETE-only cleanup of previously applied rows).
DELETE FROM spellvisual WHERE id = 90175;
DELETE FROM spellvisual WHERE id = 90115;
