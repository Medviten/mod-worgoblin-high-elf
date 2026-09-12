-- I-254 "Life of the Party" — party action bar (OverrideSpellData 122), applied
-- by 66908 Awesome Party Ensemble (aura 293). Id 122 matches the Cata source row
-- and is free in stock 3.3.5a (stock has 8 sparse rows, e.g. 121 = Argent charger).
-- flags=1 mirrors stock single-quest-bar row 121 and the 4.3.4 source value.
DELETE FROM overridespelldata WHERE id = 122;
INSERT INTO overridespelldata SET
  id = 122,
  spellid_1 = 66909,
  spellid_2 = 66910,
  spellid_3 = 66911,
  spellid_4 = 66912,
  spellid_5 = 66913,
  spellid_6 = 0,
  spellid_7 = 0,
  spellid_8 = 0,
  spellid_9 = 0,
  spellid_10 = 0,
  flags = 1;
