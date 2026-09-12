-- ============================================================
-- F-011: one-shot ownership stamp for goblin-generator spawn rows.
--
-- `zep goblin gen` used to wipe a whole guid block per zone, so anything that
-- drifted into that block died with it (F-089 lost four profession trainers this
-- way; five other features lost their spawns to the same sweep). The generator now
-- stamps every row it writes with `[gen F-011 <zone>]` in `Comment` and deletes on
-- that stamp instead of on a guid range.
--
-- Rows already live in the DB predate the stamp, so the first post-change gen run
-- would delete nothing and then collide on the primary key re-inserting them. This
-- file stamps them once. It is idempotent: after a full rebuild the AUTO files
-- insert rows already stamped and every statement below matches zero rows.
--
-- Guid ranges appear ONLY here, and only as the legacy identity of rows written
-- before the stamp existed. The generator itself no longer uses them.
-- ============================================================

-- ---- creature_addon / waypoint_data: add the stamp column -------------------
-- Stock AC tables have no Comment column. Both core loaders name their columns
-- explicitly (ObjectMgr.cpp:1267, WorldDatabase.cpp:55), so a trailing column is
-- inert. MySQL 8 has no ADD COLUMN IF NOT EXISTS, hence the guarded form.
SET @_has := (SELECT COUNT(*) FROM information_schema.COLUMNS
              WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'creature_addon'
                AND COLUMN_NAME = 'Comment');
SET @_sql := IF(@_has = 0,
  'ALTER TABLE `creature_addon` ADD COLUMN `Comment` VARCHAR(255) NULL DEFAULT NULL', 'DO 0');
PREPARE _stmt FROM @_sql; EXECUTE _stmt; DEALLOCATE PREPARE _stmt;

SET @_has := (SELECT COUNT(*) FROM information_schema.COLUMNS
              WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'waypoint_data'
                AND COLUMN_NAME = 'Comment');
SET @_sql := IF(@_has = 0,
  'ALTER TABLE `waypoint_data` ADD COLUMN `Comment` VARCHAR(255) NULL DEFAULT NULL', 'DO 0');
PREPARE _stmt FROM @_sql; EXECUTE _stmt; DEALLOCATE PREPARE _stmt;

-- ---- creature: generated spawns --------------------------------------------
UPDATE `creature` SET `Comment` = '[gen F-011 Lost Isles]' WHERE `Comment` = 'F-011 Lost Isles';
UPDATE `creature` SET `Comment` = '[gen F-011 Kezan]'      WHERE `Comment` = 'F-011 Kezan';

-- ---- creature: manual_spawns fixture rows (I-246) ---------------------------
-- Free-form prose comments, so they cannot be matched on text. Listed by guid and
-- NOT by band: zz_[I-310] hand-claimed 11900003 inside the fixture band, and a band
-- predicate would stamp that hand row as generator-owned — which would hand it to
-- the very wipe this whole change exists to keep it out of.
-- The list never needs maintaining: from the next gen run on, the generator stamps
-- its own fixture rows and these statements match nothing.
-- Prefix rather than replace: the prose documents why each was hand-placed.
UPDATE `creature` SET `Comment` = CONCAT('[gen F-011 Lost Isles] ', COALESCE(`Comment`, ''))
  WHERE `guid` IN (11900001, 11900002, 11900004, 11900005, 11900006)
    AND COALESCE(`Comment`, '') NOT LIKE '[gen F-011%';
UPDATE `creature` SET `Comment` = CONCAT('[gen F-011 Kezan] ', COALESCE(`Comment`, ''))
  WHERE `guid` IN (12900001, 12900003, 12900004, 12900005)
    AND COALESCE(`Comment`, '') NOT LIKE '[gen F-011%';

-- ---- gameobject: generated spawns ------------------------------------------
-- Exact match, so the Kaja'mite cavern rows ("F-011 Kezan Kaja'mite Cavern (I-256)")
-- are deliberately left alone — kajamite.py owns those by entry, not by stamp.
UPDATE `gameobject` SET `Comment` = '[gen F-011 Lost Isles]' WHERE `Comment` = 'F-011 Lost Isles';
UPDATE `gameobject` SET `Comment` = '[gen F-011 Kezan]'      WHERE `Comment` = 'F-011 Kezan';

-- ---- child tables: inherit the stamp from the parent spawn -------------------
-- Safe here (unlike at wipe time) because every parent still exists right now;
-- verified zero orphans in the generator bands before writing this.
-- Only the tag is copied, never the parent's full comment: `creature`.`Comment` is
-- TEXT and carries fixture prose, while the child columns are VARCHAR(255).
UPDATE `creature_addon` a JOIN `creature` c ON c.`guid` = a.`guid`
   SET a.`Comment` = IF(c.`Comment` LIKE '[gen F-011 Kezan]%',
                        '[gen F-011 Kezan]', '[gen F-011 Lost Isles]')
 WHERE c.`Comment` LIKE '[gen F-011%'
   AND COALESCE(a.`Comment`, '') NOT LIKE '[gen F-011%';

UPDATE `waypoint_data` w JOIN `creature` c ON c.`guid` = w.`id` DIV 10
   SET w.`Comment` = IF(c.`Comment` LIKE '[gen F-011 Kezan]%',
                        '[gen F-011 Kezan]', '[gen F-011 Lost Isles]')
 WHERE c.`Comment` LIKE '[gen F-011%'
   AND COALESCE(w.`Comment`, '') NOT LIKE '[gen F-011%';
