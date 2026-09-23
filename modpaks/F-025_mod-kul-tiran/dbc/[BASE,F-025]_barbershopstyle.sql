-- barbershopstyle: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `barbershopstyle` WHERE `race` = @KulTiran;
SET @BarbershopStyleID = (SELECT COALESCE(MAX(id), 0) FROM `barbershopstyle`);
INSERT INTO `barbershopstyle` (`id`, `type`, `display_name_enus`, `display_name_kokr`, `display_name_frfr`, `display_name_dede`, `display_name_zhcn`, `display_name_zhtw`, `display_name_eses`, `display_name_esmx`, `display_name_ruru`, `display_name_jajp`, `display_name_ptpt`, `display_name_itit`, `display_name_unused_1`, `display_name_unused_2`, `display_name_unused_3`, `display_name_unused_4`, `display_name_flags`, `description_enus`, `description_kokr`, `description_frfr`, `description_dede`, `description_zhcn`, `description_zhtw`, `description_eses`, `description_esmx`, `description_ruru`, `description_jajp`, `description_ptpt`, `description_itit`, `description_unused_1`, `description_unused_2`, `description_unused_3`, `description_unused_4`, `description_flags`, `cost_modifier`, `race`, `gender`, `data`) VALUES
(@BarbershopStyleID := @BarbershopStyleID +1, 0, 'Placeholder', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 4278177773, '1.0000000000000000', @KulTiran, @Male,   0),
(@BarbershopStyleID := @BarbershopStyleID +1, 0, 'Placeholder', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 4278177773, '1.0000000000000000', @KulTiran, @Female, 0);
