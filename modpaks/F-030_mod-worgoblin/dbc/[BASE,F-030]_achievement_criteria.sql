-- achievement_criteria: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `achievement_criteria` WHERE `id` BETWEEN 13471 AND 13478;
INSERT INTO `achievement_criteria` (`id`, `achievement_id`, `type`, `req_asset_id`, `req_asset_count`, `start_event`, `start_asset_id`, `fail_event`, `fail_asset_id`, `desc_enus`, `desc_kokr`, `desc_frfr`, `desc_dede`, `desc_zhcn`, `desc_zhtw`, `desc_eses`, `desc_esmx`, `desc_ruru`, `desc_jajp`, `desc_ptpt`, `desc_itit`, `desc_unused_1`, `desc_unused_2`, `desc_unused_3`, `desc_unused_4`, `desc_flags`, `flags`, `timer_start_event`, `timer_asset_id`, `timer_limit`, `ui_order`) VALUES
(13471, 246, 53, @Goblin, 1, 0, 0, 0, 0, 'Goblin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 6),
(13472, 1005, 53, @Worgen, 1, 0, 0, 0, 0, 'Worgen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 6),
(13473, 2422, 110, 61815, 1, 0, 0, 0, 0, 'Goblin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 11),
(13474, 2422, 110, 61815, 1, 0, 0, 0, 0, 'Worgen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 12),
(13475, 291, 110, 44212, 1, 0, 0, 0, 0, 'Goblin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 11),
(13476, 291, 110, 44212, 1, 0, 0, 0, 0, 'Worgen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 12),
(13477, 1429, 5, 80, 0, 0, 0, 0, 0, 'Level to 80', '80 레벨', 'Atteindre le niveau 80', 'Erreicht Stufe 80', '升到80级', '升至80級', 'Alcanza el nivel 80', 'Alcanza el nivel 80', 'Достигнуть 80-го уровня', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 1),
(13478, 1430, 5, 80, 0, 0, 0, 0, 0, 'Level to 80', '80 레벨', 'Atteindre le niveau 80', 'Erreicht Stufe 80', '升到80级', '升至80級', 'Alcanza el nivel 80', 'Alcanza el nivel 80', 'Достигнуть 80-го уровня', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 1);
