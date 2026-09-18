-- faction: 4 inserts, 1 updates, 0 deletes

-- new entries
DELETE FROM `faction` WHERE `id` IN (@GoblinPlayer, @WorgenPlayer, @GoblinFaction, @WorgenFaction);
INSERT INTO `faction` (`id`, `reputation_index`, `reputation_race_mask_1`, `reputation_race_mask_2`, `reputation_race_mask_3`, `reputation_race_mask_4`, `reputation_class_mask_1`, `reputation_class_mask_2`, `reputation_class_mask_3`, `reputation_class_mask_4`, `reputation_base_1`, `reputation_base_2`, `reputation_base_3`, `reputation_base_4`, `reputation_flags_1`, `reputation_flags_2`, `reputation_flags_3`, `reputation_flags_4`, `parent_faction_id`, `parent_faction_mod_1`, `parent_faction_mod_2`, `parent_faction_cap_1`, `parent_faction_cap_2`, `name_enus`, `name_kokr`, `name_frfr`, `name_dede`, `name_zhcn`, `name_zhtw`, `name_eses`, `name_esmx`, `name_ruru`, `name_jajp`, `name_ptpt`, `name_itit`, `name_unused_1`, `name_unused_2`, `name_unused_3`, `name_unused_4`, `name_flags`, `description_enus`, `description_kokr`, `description_frfr`, `description_dede`, `description_zhcn`, `description_zhtw`, `description_eses`, `description_esmx`, `description_ruru`, `description_jajp`, `description_ptpt`, `description_itit`, `description_unused_1`, `description_unused_2`, `description_unused_3`, `description_unused_4`, `description_flags`) VALUES
(@GoblinPlayer, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', 5, 5, '"PLAYER"," Goblin"', '', '플레이어 - 고블린', '"JOUEUR"," Gobelin"', '"SPIELER"," Goblin"', '', '地精(玩家)', '', '', '"JUGADOR"," goblin"', '"JUGADOR"," goblin"', 'ИГРОК: гоблин', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188),
(@WorgenPlayer, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', 5, 5, '"PLAYER"," Worgen"', '', '플레이어 - 늑대인간', '"JOUEUR"," Worgen"', '"SPIELER"," Worgen"', '', '狼人(玩家)', '', '', '"JUGADOR"," Huargen"', '"JUGADOR"," Huargen"', 'ИГРОК: ворген', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188),
(@GoblinFaction, @GoblinFactionRepIndex, @BarrensBros & ~@GoblinMask, @AllianceMask, @UndercityMask, @GoblinMask, 0, 0, 0, 0, 3100, -42000, 500, 4000, 273, 6, 17, 17, 67, '1.0000000000000000', '0.2500000000000000', 7, 5, 'Bilgewater Cartel', '빌지워터 무역회사', 'Cartel Baille-Fonds', 'Bilgewasserkartell', '锈水财阀', '污水企業', 'Cártel Pantoque', 'Cártel Pantoque', 'Торговая компания Трюмных Вод', '', '', '', '', '', '', '', 16712190, 'Goblins sworn to the Horde.', '호드에 충성을 맹세한 고블린들입니다.', 'Des gobelins ayant juré fidélité à la Horde.', 'Goblins, die der Horde die Treue geschworen haben.', '效忠于部落的地精。', '效忠部落的哥布林。', 'Goblins que juraron lealtad a la Horda.', 'Goblins que juraron lealtad a la Horda.', 'Гоблины, присягнувшие Орде.', '', '', '', '', '', '', '', 16712190),
(@WorgenFaction, @WorgenFactionRepIndex, @AllianceMask & ~@WorgenMask, @HordeMask, @WorgenMask, 0, 0, 0, 0, 0, 3100, -42000, 4000, 0, 273, 6, 17, 0, 469, '1.0000000000000000', '0.2500000000000000', 7, 5, 'Gilneas', '길니아스', 'Gilnéas', 'Gilneas', '吉尔尼斯', '吉爾尼斯', 'Gilneas', 'Gilneas', 'Гилнеас', '', '', '', '', '', '', '', 16712190, 'The kingdom of Gilneas.', '길니아스 왕국입니다.', 'Le royaume de Gilnéas.', 'Das Königreich Gilneas.', '吉尔尼斯王国。', '吉爾尼斯王國。', 'El reino de Gilneas.', 'El reino de Gilneas.', 'Королевство Гилнеас.', '', '', '', '', '', '', '', 16712190);

-- Aldor/Scryer reputation race mask fix
UPDATE `faction` SET
  `reputation_race_mask_1` = `reputation_race_mask_1` | @GoblinMask | @WorgenMask,
  `reputation_race_mask_2` = 0,
  `reputation_race_mask_3` = 0,
  `reputation_flags_1` = 16,
  `reputation_flags_2` = 0,
  `reputation_flags_3` = 0
WHERE `id` IN (932, 934);
