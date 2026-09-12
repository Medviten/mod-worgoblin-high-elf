-- [I-266] KTC pool aftermath still shows live party guests + citizens.
-- After "The Uninvited Guest" (14116) the player enters Kezan stage 2048 (fireworks
-- aftermath) and should see only the dead pirates/partygoers strewn around the pool
-- (35175/35200, dead-pose addons). But Neltharion's phaseMask flattening (no phaseId
-- in the source; the bitfield IS the whole intent) authored the LIVE party crowd with
-- the aftermath bits too, so they bleed through:
--   35185 Kezan Partygoer  6148 (4|2048|4096) -- 13 alive, cruising the pool
--   35201 Kezan Partygoer  7168 (1024|2048|4096) -- 3 alive
--   35063 Kezan Citizen    2052 (4|2048) -- 13 "scared" ambient citizens at the pool
-- (35063 is a citywide ambient — 167 spawns — so only the pool cluster is corrected,
--  by position box; the rest of the city keeps its normal stage-2048 population.)
-- Fix: drop the aftermath bits, keep bit 4 so all three still populate the party-crash
-- stage (stage 4, alongside the attacking pirates) and vanish once the bodies appear.
-- Entry-keyed, position-boxed for the citywide entry, no guid pins (regen-safe).
UPDATE creature
SET phaseMask = 4
WHERE map = 1
  AND id IN (35185, 35201);

UPDATE creature
SET phaseMask = 4
WHERE map = 1
  AND id = 35063
  AND position_x BETWEEN -9100 AND -8933
  AND position_y BETWEEN -11545 AND -11375;
