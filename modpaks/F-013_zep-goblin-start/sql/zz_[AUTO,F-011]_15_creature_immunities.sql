-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 creature_immunities (one file per table; rows carry final state)

DELETE FROM creature_immunities WHERE ID = 91100;
INSERT INTO creature_immunities SET
  `ID` = 91100,
  `SchoolMask` = 0,
  `DispelTypeMask` = 0,
  `MechanicsMask` = 613097308,
  `Effects` = 0,
  `Auras` = 0,
  `ImmuneAoE` = 0,
  `ImmuneChain` = 0,
  `Comment` = 'F-011 goblin boss immunities 0x248B1F5C';

DELETE FROM creature_immunities WHERE ID = 91101;
INSERT INTO creature_immunities SET
  `ID` = 91101,
  `SchoolMask` = 0,
  `DispelTypeMask` = 0,
  `MechanicsMask` = 1073741695,
  `Effects` = 0,
  `Auras` = 0,
  `ImmuneAoE` = 0,
  `ImmuneChain` = 0,
  `Comment` = 'F-011 goblin boss immunities 0x3FFFFF7F';

