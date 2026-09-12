-- I-337 "Town-In-A-Box: Under Attack" (24901) — the eight Cata FactionTemplate.dbc
-- rows the goblin zone uses. Companion to [I-337]_faction.sql (Faction.dbc rows
-- 1133 / 1152 / 1157) and sql/zz_[I-337]_goblin_zone_factions.sql (the creatures).
--
-- Straight ports of the 4.3.4 rows (Zeppelin-Tools/wago-cata-classic/FactionTemplate.csv)
-- narrowed from Cata's 8 enemy/friend slots to 3.3.5a's 4. None of these rows uses more
-- than slot 0 except 2200, so nothing is lost.
--
-- The two that carry the invasion:
--   2228 (Oomlot Warrior) faction 1157, faction_group 8 MONSTER, enemy_group 1 PLAYER,
--        enemies_1 1133 -> hostile to players AND to the Bilgewater goblins, and
--        pacifiable via a forced reaction on 1157 (spell 66987 Pygmy Helmet).
--   2231 (the 15 Town-In-A-Box residents) faction 1133, enemies_1 1157 -> the town
--        fights back. This is the half that was missing: flattened to 35, whose
--        enemy_group is 0 and enemy list empty, they never engage anything, so the
--        Oomlot warriors' SMART_ACTION_ATTACK_START on SMART_TARGET_CLOSEST_CREATURE
--        finds only invalid targets and every warrior falls through to the player.
--
-- flags are carried verbatim; each value already occurs in stock 3.3.5a
-- (e.g. template 2 = the Orc player template is flags 72 / group 5 / friend 4 / enemy 10,
-- byte-identical in shape to 2204 "PLAYER, Goblin").

DELETE FROM factiontemplate WHERE id IN (2159, 2160, 2200, 2204, 2227, 2228, 2231, 2238);

-- Bilgewater civilians (103 templates) — Horde-side, no enemies of their own.
INSERT INTO factiontemplate SET
  id = 2159,
  faction = 1133,
  flags = 0,
  faction_group = 4,
  friend_group = 4,
  enemy_group = 2,
  friends_1 = 1133;

INSERT INTO factiontemplate SET
  id = 2160,
  faction = 1133,
  flags = 0,
  faction_group = 4,
  friend_group = 4,
  enemy_group = 2,
  friends_1 = 1133;

-- Wildlife predator/prey pair.
INSERT INTO factiontemplate SET
  id = 2200,
  faction = 973,
  flags = 65,
  faction_group = 0,
  friend_group = 0,
  enemy_group = 0,
  enemies_1 = 974,
  enemies_2 = 28,
  friends_1 = 973;

-- "PLAYER, Goblin" — player-controlled vehicles and props.
INSERT INTO factiontemplate SET
  id = 2204,
  faction = 1152,
  flags = 72,
  faction_group = 5,
  friend_group = 4,
  enemy_group = 10;

-- Bilgewater goblins that fight the Oomlot (1157).
INSERT INTO factiontemplate SET
  id = 2227,
  faction = 1133,
  flags = 0,
  faction_group = 4,
  friend_group = 4,
  enemy_group = 2,
  enemies_1 = 1157,
  friends_1 = 1133;

INSERT INTO factiontemplate SET
  id = 2231,
  faction = 1133,
  flags = 129,
  faction_group = 4,
  friend_group = 4,
  enemy_group = 2,
  enemies_1 = 1157,
  friends_1 = 1133;

-- Oomlot tribe.
INSERT INTO factiontemplate SET
  id = 2228,
  faction = 1157,
  flags = 16,
  faction_group = 8,
  friend_group = 0,
  enemy_group = 1,
  enemies_1 = 1133,
  friends_1 = 1157;

-- Orgrimmar-aligned, hostile to Monster (14).
INSERT INTO factiontemplate SET
  id = 2238,
  faction = 76,
  flags = 32,
  faction_group = 4,
  friend_group = 4,
  enemy_group = 2,
  enemies_1 = 14;
