-- faction: 4 inserts, 1 updates, 0 deletes

-- new entries
DELETE FROM `faction` WHERE `id` IN (@WorgenPlayer, @WorgenFaction);
INSERT INTO `faction` (`id`, `reputation_index`, `reputation_race_mask_1`, `reputation_race_mask_2`, `reputation_race_mask_3`, `reputation_race_mask_4`, `reputation_class_mask_1`, `reputation_class_mask_2`, `reputation_class_mask_3`, `reputation_class_mask_4`, `reputation_base_1`, `reputation_base_2`, `reputation_base_3`, `reputation_base_4`, `reputation_flags_1`, `reputation_flags_2`, `reputation_flags_3`, `reputation_flags_4`, `parent_faction_id`, `parent_faction_mod_1`, `parent_faction_mod_2`, `parent_faction_cap_1`, `parent_faction_cap_2`, `name_enus`, `name_kokr`, `name_frfr`, `name_dede`, `name_zhcn`, `name_zhtw`, `name_eses`, `name_esmx`, `name_ruru`, `name_jajp`, `name_ptpt`, `name_itit`, `name_unused_1`, `name_unused_2`, `name_unused_3`, `name_unused_4`, `name_flags`, `description_enus`, `description_kokr`, `description_frfr`, `description_dede`, `description_zhcn`, `description_zhtw`, `description_eses`, `description_esmx`, `description_ruru`, `description_jajp`, `description_ptpt`, `description_itit`, `description_unused_1`, `description_unused_2`, `description_unused_3`, `description_unused_4`, `description_flags`) VALUES
(@WorgenPlayer, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', 5, 5, '"PLAYER"," Worgen"', '', '플레이어 - 늑대인간', '"JOUEUR"," Worgen"', '"SPIELER"," Worgen"', '', '狼人(玩家)', '', '', '"JUGADOR"," Huargen"', '"JUGADOR"," Huargen"', 'ИГРОК: ворген', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188),
(@WorgenFaction, @WorgenFactionRepIndex, @AllianceMask & ~@WorgenMask, @HordeMask, @WorgenMask, 0, 0, 0, 0, 0, 3100, -42000, 4000, 0, 273, 6, 17, 0, 469, '1.0000000000000000', '0.2500000000000000', 7, 5, 'Gilneas', '길니아스', 'Gilnéas', 'Gilneas', '吉尔尼斯', '吉爾尼斯', 'Gilneas', 'Gilneas', 'Гилнеас', '', '', '', '', '', '', '', 16712190, 'The kingdom of Gilneas.', '길니아스 왕국입니다.', 'Le royaume de Gilnéas.', 'Das Königreich Gilneas.', '吉尔尼斯王国。', '吉爾尼斯王國。', 'El reino de Gilneas.', 'El reino de Gilneas.', 'Королевство Гилнеас.', '', '', '', '', '', '', '', 16712190);

-- Aldor/Scryer reputation race mask fix
UPDATE `faction` SET
  `reputation_race_mask_1` = `reputation_race_mask_1` | @WorgenMask,
  `reputation_race_mask_2` = 0,
  `reputation_race_mask_3` = 0,
  `reputation_flags_1` = 16,
  `reputation_flags_2` = 0,
  `reputation_flags_3` = 0
WHERE `id` IN (932, 934);
