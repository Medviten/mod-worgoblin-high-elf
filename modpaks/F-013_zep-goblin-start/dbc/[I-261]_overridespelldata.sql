-- I-261 The Great Bank Heist — vault widget action bar (OverrideSpellData 476),
-- applied by custom 900820 Goblin All-In-1-Der Belt (aura 293). Id 476 matches
-- the vault's Vehicle.dbc id (mnemonic) and is free in stock 3.3.5a (stock has
-- 8 sparse rows, max 271). flags=1 mirrors stock single-quest-bar row 121
-- (same pattern as [I-254]_overridespelldata.sql).
DELETE FROM overridespelldata WHERE id = 476;
INSERT INTO overridespelldata SET
  id = 476,
  spellid_1 = 67522,
  spellid_2 = 67508,
  spellid_3 = 67524,
  spellid_4 = 67525,
  spellid_5 = 67526,
  spellid_6 = 0,
  spellid_7 = 0,
  spellid_8 = 0,
  spellid_9 = 0,
  spellid_10 = 0,
  flags = 1;
