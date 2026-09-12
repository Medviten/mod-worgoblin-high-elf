-- I-248 — custom kit 90144 RETIRED (DELETE-only cleanup).
--
-- The bisects proved ANY custom id in the visual chain (SpellVisual 90175,
-- then this kit inside stock 13175 in v622) re-triggers the client's
-- ghost-explosion replay. The pinned UseStandingLoop release now comes from
-- the shreddermount M2 animation-lookup alias instead (lookup[16] -> seq 54;
-- stock kit 11144's anim 107 is beyond the M2's lookup and falls back to 16).
DELETE FROM spellvisualkit WHERE id = 90144;
