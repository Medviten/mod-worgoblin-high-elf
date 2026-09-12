-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 phase_definitions (one file per table; rows carry final state)

CREATE TABLE IF NOT EXISTS `phase_definitions` (
  `zoneId` INT UNSIGNED NOT NULL DEFAULT 0,
  `entry` INT UNSIGNED NOT NULL DEFAULT 0,
  `phaseMask` INT UNSIGNED NOT NULL DEFAULT 0,
  `phaseId` INT UNSIGNED NOT NULL DEFAULT 0,
  `originmap` INT UNSIGNED NOT NULL DEFAULT 0,
  `terrainswapmap` INT UNSIGNED NOT NULL DEFAULT 0,
  `flags` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `comment` TEXT DEFAULT NULL,
  PRIMARY KEY (`zoneId`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM phase_definitions WHERE zoneId IN (4720,4737);

INSERT INTO phase_definitions (`zoneId`, `entry`, `phaseMask`, `phaseId`, `originmap`, `terrainswapmap`, `flags`, `comment`) VALUES
  (4737, 1, 2, 0, 0, 0, 1, 'Kezan phase 2'),
  (4737, 2, 4, 0, 0, 0, 1, 'Kezan phase 4'),
  (4737, 3, 2048, 0, 0, 0, 1, 'Kezan phase 2048'),
  (4737, 4, 4096, 0, 0, 0, 1, 'Kezan phase 4096'),
  (4720, 1, 2, 0, 0, 0, 1, 'Lost Island Phase2'),
  (4720, 2, 4, 0, 0, 0, 1, 'Lost Island Phase4'),
  (4720, 3, 4, 0, 0, 0, 1, 'Lost Island Phase4'),
  (4720, 4, 4, 0, 0, 0, 1, 'Lost Island Phase4'),
  (4720, 5, 2048, 0, 0, 0, 1, 'Lost Island Phase2048'),
  (4720, 6, 2048, 0, 0, 0, 1, 'Lost Island Phase2048'),
  (4720, 7, 4096, 0, 0, 0, 1, 'Lost Island Phase2048'),
  (4720, 8, 8192, 0, 0, 0, 1, 'Lost Island Phase8192'),
  (4720, 9, 8192, 0, 0, 0, 1, 'Lost Island Phase8192'),
  (4720, 10, 8192, 0, 0, 0, 1, 'Lost Island Phase8192'),
  (4720, 11, 32768, 0, 0, 0, 1, 'Lost Island Phase32768'),
  (4720, 12, 32768, 0, 0, 0, 1, 'Lost Island Phase32768'),
  (4720, 13, 16384, 0, 0, 0, 1, 'Lost Island Phase16384'),
  (4720, 14, 16392, 0, 0, 0, 1, 'Lost Island Phase16392'),
  (4720, 15, 32776, 0, 0, 0, 1, 'Lost Island Phase32768'),
  (4720, 16, 32776, 0, 0, 0, 1, 'Lost Island Phase32768'),
  (4720, 17, 32808, 0, 0, 0, 1, 'Lost Island Phase32808'),
  (4720, 18, 1024, 0, 0, 0, 1, 'Lost Island Phase 1024');

