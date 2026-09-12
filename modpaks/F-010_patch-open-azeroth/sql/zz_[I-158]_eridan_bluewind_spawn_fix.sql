-- [I-158] Eridan Bluewind (9116) spawn fix in Emerald Sanctuary, Felwood
-- NPC spawns halfway up a tent (Z=254.58), likely caused by HD tent model or Open Azeroth
-- Relocated to ground level nearby

UPDATE creature SET
  position_x = 4006.6252,
  position_y = -1323.231,
  position_z = 246.22513,
  orientation = 2.6286037
WHERE guid = 39098;
