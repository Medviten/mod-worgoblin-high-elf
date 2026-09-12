-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 Kezan (zone 4737) graveyard — KTC Headquarters (area 4765), location
-- verified in-game against Whitemane's Cata graveyard position (I-252).
DELETE FROM game_graveyard WHERE ID = 4737;
INSERT INTO game_graveyard (ID, Map, x, y, z, Comment) VALUES
  (4737, 1, -8924.371, -11510.9795, 92.81734, 'Kezan - KTC Headquarters (F-011)');
DELETE FROM graveyard_zone WHERE ID = 4737 AND GhostZone = 4737;
INSERT INTO graveyard_zone (ID, GhostZone, Faction, Comment) VALUES
  (4737, 4737, 0, 'Kezan -> KTC Headquarters graveyard (F-011)');
