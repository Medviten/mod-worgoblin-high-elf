-- Allow Human-exclusive NPC gossip windows to appear for High Elf (contribution by Dasbadman)
-- Among other things, this allows High Elves to buy mounts in Elwynn
DELETE FROM `conditions` WHERE SourceGroup IN (4004, 4018) AND ConditionTypeOrReference = 16;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14, 4004, 4859, 0, 0, 16, 0, 4097, 0, 0, 0, 0, 0, '', 'NPC Text - Show text if Player is Human or High Elf'),
(14, 4004, 5855, 0, 0, 16, 0, 4097, 0, 0, 1, 0, 0, '', 'NPC Text - Show text if Player is Human or High Elf'),
(14, 4018, 4876, 0, 0, 16, 0, 4097, 0, 0, 0, 0, 0, '', 'Show gossip text if player is a Human or High Elf'),
(14, 4018, 5861, 0, 0, 16, 0, 4094, 0, 0, 0, 0, 0, '', 'Show gossip text if player is not a Human or High Elf'),
(15, 4004, 0, 0, 0, 16, 0, 4097, 0, 0, 0, 0, 0, '', 'Gossip Option - Show Option if Player is Human or High Elf'),
(15, 4018, 0, 0, 0, 16, 0, 4097, 0, 0, 0, 0, 0, '', 'Show gossip option if player is a Human or High Elf');
