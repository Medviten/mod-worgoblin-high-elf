-- Reputation inheritance: every reputation bracket that applies to a normal dwarf
-- also applies to a Dark Iron dwarf, preserving the same base reputation and flags.
UPDATE `faction` SET `reputation_race_mask_1` = `reputation_race_mask_1` | @DarkIronDwarfMask WHERE (`reputation_race_mask_1` & @DwarfMask) <> 0;
UPDATE `faction` SET `reputation_race_mask_2` = `reputation_race_mask_2` | @DarkIronDwarfMask WHERE (`reputation_race_mask_2` & @DwarfMask) <> 0;
UPDATE `faction` SET `reputation_race_mask_3` = `reputation_race_mask_3` | @DarkIronDwarfMask WHERE (`reputation_race_mask_3` & @DwarfMask) <> 0;
UPDATE `faction` SET `reputation_race_mask_4` = `reputation_race_mask_4` | @DarkIronDwarfMask WHERE (`reputation_race_mask_4` & @DwarfMask) <> 0;
