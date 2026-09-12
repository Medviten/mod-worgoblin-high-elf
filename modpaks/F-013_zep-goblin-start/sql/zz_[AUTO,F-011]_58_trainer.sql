-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 trainer (one file per table; rows carry final state)

DELETE FROM trainer WHERE Id BETWEEN 6601 AND 6699;
DELETE FROM trainer WHERE Id BETWEEN 6701 AND 6799;

INSERT INTO trainer (`Id`, `Type`, `Requirement`, `Greeting`, `VerifiedBuild`) VALUES
  (6623, 0, 0, 'Ready to learn, ?', 0);

