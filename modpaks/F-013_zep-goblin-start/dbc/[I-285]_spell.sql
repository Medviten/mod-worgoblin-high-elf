-- ============================================================
-- I-285  Spell 900844 "Dismiss Frightened Miner" — RETIRED
-- ============================================================
-- The dismiss-ping (cast via spell_linked_spell when controller aura 68062 was
-- removed) shipped briefly and was superseded the same day by the core event
-- SMART_EVENT_QUEST_ABANDONED (111), which scopes to the abandoning player's own
-- summon with no radius caveat. This DELETE stays so the spell never resurfaces
-- from an old DB or a rebuild; id 900844 may be reclaimed for something else.

DELETE FROM spell WHERE id = 900844;
