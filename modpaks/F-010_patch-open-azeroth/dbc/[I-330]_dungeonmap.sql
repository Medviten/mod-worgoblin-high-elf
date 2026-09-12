-- [I-330] Wailing Caverns player arrow offset on the dungeon map.
--
-- Open Azeroth ships the Cataclysm-redrawn Wailing Caverns map art
-- (Interface/Worldmap/wailingcaverns/, 12 tiles) but [BASE,F-036]_dungeonmap.sql
-- imports 191 rows and does NOT include id 28, so the bounds are still the
-- 3.3.5 ones for the OLD art. The arrow is therefore placed against the wrong
-- world rectangle: the vertical axis is offset by 50 yd on a 624 yd span (~8%)
-- and the horizontal axis is over-wide by 70 yd on 1006 yd (~3.5% at the edges).
--
-- Verified: across all 55 DungeonMap rows shared between 3.3.5 and 4.3.4, only
-- id 28 changed value - every other row is byte-identical once the 4.x field
-- transposition is undone. Cata is Min[2]/Max[2] (MinX, MinY, MaxX, MaxY);
-- 3.3.5 is MinX, MaxX, MinY, MaxY.
--
-- TRAP: the dungeonmap column LABELS do not match 3.3.5 DBC field semantics.
-- Positionally, min_x = MinX, min_y = MaxX, max_x = MinY, max_y = MaxY.
-- Values below are the 4.3.4 floats re-ordered into the 3.3.5 layout.
--
-- parent_world_map_id deliberately left at the stock 0 (Cata has 11 = Barrens);
-- that controls the zoom-out link, not the arrow, and is out of scope here.

UPDATE dungeonmap SET
  min_x = '-375.9460144042969000',
  min_y = '560.5289916992188000',
  max_x = '-410.1463317871094000',
  max_y = '214.1703338623047000'
WHERE id = 28;
