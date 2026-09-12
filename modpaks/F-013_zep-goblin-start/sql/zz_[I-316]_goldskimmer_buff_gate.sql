-- I-316: Sister Goldskimmer machine-guns Power Word: Fortitude
--
-- Both Sister Goldskimmer entries (34692 Kezan, 38516 Lost Isles) carry a
-- SMART_EVENT_OOC_LOS row that casts Power Word: Fortitude (74973) at any player
-- within 8yd on a 2s cooldown. The donor's own row comment reads "Cast Power
-- Word: Fortitude on Player Missing Buff", but the Neltharion 4.3.4 source ships
-- castFlags = 2 (SMARTCAST_TRIGGERED) with the missing-buff gate never set — so
-- the NPC re-buffs the same player every 2 seconds for as long as they stand
-- near her, at every one of her spawns across Kezan and the Lost Isles.
--
-- The SmartCastFlags enum is byte-identical between the two cores, so this is a
-- donor data defect, not an opcode divergence: 0x20 = SMARTCAST_AURA_NOT_PRESENT
-- ("only cast if the target does not already have this spell's aura") in both.
-- Spell 74973 leaves a 30-minute aura, so with the gate set she buffs a passer-by
-- once and then stays quiet.
--
-- Generator fix (permanent): cli/data/goblin/fixtures/smartai_castflags.json +
-- the repair pass in cli/commands/goblin_gen/smartai.py. This override keeps the
-- fix live until the next `zep goblin gen` run re-emits
-- zz_[AUTO,F-011]_65_smart_scripts.sql; it sorts after that file, and the OR is
-- idempotent, so it is harmless to leave in place afterwards.

UPDATE smart_scripts
SET action_param2 = action_param2 | 0x20
WHERE source_type = 0
  AND entryorguid IN (34692, 38516)
  AND id = 0
  AND event_type = 10
  AND action_type = 11
  AND action_param1 = 74973;
