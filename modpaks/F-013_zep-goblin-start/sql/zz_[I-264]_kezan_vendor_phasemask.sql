-- [I-264] Kezan loses all vendors/repair after "The Uninvited Guest" (14116).
-- Neltharion's phase_definitions collapse Kezan into 4 stages (2 -> 4 -> 2048 -> 4096),
-- but the spawn data encodes a fifth heist-arc stage on bit 1024 that no definition ever
-- grants. Sally "Salvager" Sandscrew (37761, the zone's only repair vendor) and Brett
-- "Coins" McQuid (37762) exist only in mask 1031 (1|2|4|1024), so they vanish for the
-- entire Robbing Hoods -> Bank Heist -> Kaja'mite -> 447 -> volcano stretch.
-- Whitemane reference: both stay on their cart through the final volcano phase.
-- Fix: extend their spawn mask to 7175 (1031 | 2048 | 4096). Entry-keyed, no guid pins.
UPDATE creature
SET phaseMask = 7175
WHERE map = 1
  AND id IN (37761, 37762);
