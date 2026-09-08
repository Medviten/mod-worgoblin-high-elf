-- achievement_criteria: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `achievement_criteria` WHERE `id` IN (@GoblinCriteria1, @GoblinCriteria2, @GoblinCriteria3, @GoblinCriteria4, @WorgenCriteria1, @WorgenCriteria2, @WorgenCriteria3, @WorgenCriteria4);
INSERT INTO `achievement_criteria` (`id`, `achievement_id`, `type`, `req_asset_id`, `req_asset_count`, `start_event`, `start_asset_id`, `fail_event`, `fail_asset_id`, `desc_enus`, `desc_kokr`, `desc_frfr`, `desc_dede`, `desc_zhcn`, `desc_zhtw`, `desc_eses`, `desc_esmx`, `desc_ruru`, `desc_jajp`, `desc_ptpt`, `desc_itit`, `desc_unused_1`, `desc_unused_2`, `desc_unused_3`, `desc_unused_4`, `desc_flags`, `flags`, `timer_start_event`, `timer_asset_id`, `timer_limit`, `ui_order`) VALUES
(@GoblinCriteria1, @KnowThyEnemyHorde, 53, @Goblin, 1, 0, 0, 0, 0, 'Goblin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 6),
(@WorgenCriteria1, @KnowThyEnemyAlliance, 53, @Worgen, 1, 0, 0, 0, 0, 'Worgen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 6),
(@GoblinCriteria2, @ShakeYourBunnyMaker, 110, 61815, 1, 0, 0, 0, 0, 'Goblin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 11),
(@WorgenCriteria2, @ShakeYourBunnyMaker, 110, 61815, 1, 0, 0, 0, 0, 'Worgen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 12),
(@GoblinCriteria3, @CheckYourHead, 110, 44212, 1, 0, 0, 0, 0, 'Goblin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 11),
(@WorgenCriteria3, @CheckYourHead, 110, 44212, 1, 0, 0, 0, 0, 'Worgen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 12),
(@GoblinCriteria4, @GoblinAchievement, 5, 80, 0, 0, 0, 0, 0, 'Level to 80', '80 레벨', 'Atteindre le niveau 80', 'Erreicht Stufe 80', '升到80级', '升至80級', 'Alcanza el nivel 80', 'Alcanza el nivel 80', 'Достигнуть 80-го уровня', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 1),
(@WorgenCriteria4, @WorgenAchievement, 5, 80, 0, 0, 0, 0, 0, 'Level to 80', '80 레벨', 'Atteindre le niveau 80', 'Erreicht Stufe 80', '升到80级', '升至80級', 'Alcanza el nivel 80', 'Alcanza el nivel 80', 'Достигнуть 80-го уровня', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 1);
