-- [I-231] Wrong human/orc/dwarf/nightelf/gnome NPC faces (F-011 Lost Isles/Kezan).
-- NOTE: this Gender fix was NOT the root cause (the actual fix is the _HD BakeName repoint in
-- [F-011]_creaturedisplayinfoextra.sql / _K -- see I-231). Kept as correct hygiene:
-- creature_model_info.Gender defaulted to 2 (none) during migration for every non-goblin
-- character-race display; set to the real gender from each display's CreatureDisplayInfoExtra
-- (0 male / 1 female). The goblin gender fix (zz_[F-011]_goblin_gender_fix.sql) was scoped to
-- race 9 only -- this extends it to the stock character races.
-- SERVER-SIDE ONLY: `.reload creature_model_info` or a worldserver restart -- no client re-pull.

-- Human (race 1)
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29676;  -- extra 19680
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29979;  -- extra 19860
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=30010;  -- extra 19874
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=30031;  -- extra 19888
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=30035;  -- extra 19892
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=31323;  -- extra 20863

-- Orc (race 2)
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29933;  -- extra 19809
UPDATE creature_model_info SET Gender=1 WHERE DisplayID=29936;  -- extra 19824 (Aggra, female)
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29942;  -- extra 19835
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29950;  -- extra 19841
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29951;  -- extra 19842
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=29994;  -- extra 19873
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=30014;  -- extra 19878
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=30116;  -- extra 19958

-- Dwarf (race 3)
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=33958;  -- extra 22530

-- Night Elf (race 4)
UPDATE creature_model_info SET Gender=1 WHERE DisplayID=33964;  -- extra 20865 (female)

-- Gnome (race 7)
UPDATE creature_model_info SET Gender=0 WHERE DisplayID=30018;  -- extra 19886
