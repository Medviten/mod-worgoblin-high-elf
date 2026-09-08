-- charhairgeosets: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charhairgeosets` WHERE `id` IN (650, 651);
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(650, @Ogre, @Male,   0, 0, 1),
(651, @Ogre, @Female, 0, 0, 1);
