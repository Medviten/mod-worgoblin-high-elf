-- charhairtextures: 6 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charhairtextures` WHERE `id` IN (102, 103);
INSERT INTO `charhairtextures` (`id`, `race`, `gender`, `unk_1`, `unk_2`, `unk_3`, `unk_4`, `unk_5`) VALUES
(102, @Goblin, 0, 0, 255, 0, 1, 1),
(103, @Goblin, 1, 0, 255, 0, 1, 1);
