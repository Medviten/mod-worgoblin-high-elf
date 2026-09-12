-- achievement_criteria: 4 inserts, 2 updates, 0 deletes

-- New entries
DELETE FROM `achievement_criteria` WHERE `id` IN (19218, 19219, 19220, 19221);
INSERT INTO `achievement_criteria` (`id`, `achievement_id`, `type`, `req_asset_id`, `req_asset_count`, `start_event`, `start_asset_id`, `fail_event`, `fail_asset_id`, `desc_enus`, `desc_kokr`, `desc_frfr`, `desc_dede`, `desc_zhcn`, `desc_zhtw`, `desc_eses`, `desc_esmx`, `desc_ruru`, `desc_jajp`, `desc_ptpt`, `desc_itit`, `desc_unused_1`, `desc_unused_2`, `desc_unused_3`, `desc_unused_4`, `desc_flags`, `flags`, `timer_start_event`, `timer_asset_id`, `timer_limit`, `ui_order`) VALUES
(@OgreCriteria1, @KnowThyEnemyHorde, 53, @Ogre, 1, 0, 0, 0, 0, 'Ogre', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 6),
(@OgreCriteria2, @ShakeYourBunnyMaker, 110, 61815, 1, 0, 0, 0, 0, 'Ogre', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 15),
(@OgreCriteria3, @CheckYourHead, 110, 44212, 1, 0, 0, 0, 0, 'Ogre', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0, 0, 15),
(@OgreCriteria4, @OgreAchievement, 5, 80, 0, 0, 0, 0, 0, 'Level to 80', '80 레벨', 'Atteindre le niveau 80', 'Erreicht Stufe 80', '升到80级', '升至80級', 'Alcanza el nivel 80', 'Alcanza el nivel 80', 'Достигнуть 80-го уровня', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 1);
