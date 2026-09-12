-- I-311 "Warchief's Revenge" — Cyclone of the Elements rider action bar
-- (OverrideSpellData 508, mnemonic = the cyclone's Vehicle.dbc id, free in stock
-- 3.3.5a which has 8 sparse rows max 271; same pattern as [I-254]/[I-261]).
-- Applied to the RIDER by custom aura 900881 (dbc/[I-311]_spell.sql) from the
-- cyclone's SmartAI on passenger-boarded: an uncontrolled vehicle seat has no
-- server-served bar on this core lineage (see the I-311 note), so the rider's
-- own bar is overridden instead — the player casts Lightning Strike themselves,
-- which also hard-guarantees quest kill credit. flags=1 mirrors stock
-- single-quest-bar row 121.
DELETE FROM overridespelldata WHERE id = 508;
INSERT INTO overridespelldata SET
  id = 508,
  spellid_1 = 68445,
  spellid_2 = 0,
  spellid_3 = 0,
  spellid_4 = 0,
  spellid_5 = 0,
  spellid_6 = 0,
  spellid_7 = 0,
  spellid_8 = 0,
  spellid_9 = 0,
  spellid_10 = 0,
  flags = 1;
