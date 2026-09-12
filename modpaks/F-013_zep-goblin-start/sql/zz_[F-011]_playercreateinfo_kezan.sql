-- [F-011] Goblin starting zone -> Kezan
--
-- Moves race 9 (Goblin) character creation off the Durotar/Valley of Trials
-- placeholder and onto the KTC villa patio in Kezan (zone 4737, Kalimdor map 1).
--
-- This also sets the DEFAULT HEARTH: Player::_LoadHomeBind
-- (src/server/game/Entities/Player/PlayerStorage.cpp) falls back to the
-- playercreateinfo map/zone/position whenever a character has no
-- `character_homebind` row, i.e. on a new character's first login. So new
-- goblins hearth to Kezan with no extra table involved.
--
-- The rows are OWNED by mod-worgoblin
-- (modules/mod-worgoblin/data/sql/db-world/worgoblin.sql) -> one consolidated
-- UPDATE, not DELETE+INSERT. Death Knights (class 6) keep Ebon Hold.
--
-- Position: villa patio beside Sassy Hardwrench (34668, guid 12000087,
-- phaseMask 1031 so she is visible in a fresh character's base phase 1), who
-- offers the first Kezan quest 14138 'Taking Care of Business'. The player
-- faces her. Validated ON_MESH via cli/lib/navmesh_checker/mmap_query
-- (dist 0.12, slope 1.7deg, mesh Z 104.82); raw heightmap there is 102.07 --
-- the villa deck carries the collision, do NOT "correct" Z down to terrain.
-- Nearest graveyard: game_graveyard 4737 @ -8924.37 / -11511 / 92.82 (~85y).
--
-- Requires a worldserver restart: playercreateinfo is only read by
-- ObjectMgr::LoadPlayerInfo at startup (there is no .reload for it).

SET @map = 1;
SET @zone = 4737;
SET @x = -8956.5;
SET @y = -11429.5;
SET @z = 104.82;
SET @o = 4.562;

UPDATE playercreateinfo SET
  map = @map,
  zone = @zone,
  position_x = @x,
  position_y = @y,
  position_z = @z,
  orientation = @o
WHERE race = 9 AND class <> 6;
