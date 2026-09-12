-- Fix Aspect of Air (creature 17436) sunken into ground in Azuremyst Isle (Wildwind Path)
-- GPS GroundZ: 211.72914, spawn was at Z: 209.754
UPDATE creature SET position_z = 211.7 WHERE guid = 85976;
