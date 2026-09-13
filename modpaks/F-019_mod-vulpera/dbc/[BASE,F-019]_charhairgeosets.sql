-- charhairgeosets: 2 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charhairgeosets` WHERE `race` = @Vulpera;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(692, @Vulpera, @Male, 0, 1, 0),
(693, @Vulpera, @Male, 1, 2, 0),
(694, @Vulpera, @Male, 2, 3, 0),
(695, @Vulpera, @Male, 3, 4, 0),
(696, @Vulpera, @Male, 4, 5, 0),
(697, @Vulpera, @Male, 5, 6, 0),
(698, @Vulpera, @Male, 6, 7, 0),
(699, @Vulpera, @Male, 7, 8, 0),
(700, @Vulpera, @Female, 0, 1, 0),
(701, @Vulpera, @Female, 1, 2, 0),
(702, @Vulpera, @Female, 2, 3, 0),
(703, @Vulpera, @Female, 3, 4, 0),
(704, @Vulpera, @Female, 4, 5, 0),
(705, @Vulpera, @Female, 5, 6, 0),
(706, @Vulpera, @Female, 6, 7, 0),
(707, @Vulpera, @Female, 7, 8, 0),
(708, @Vulpera, @Female, 8, 9, 0),
(709, @Vulpera, @Female, 9, 10, 0),
(710, @Vulpera, @Female, 10, 11, 0);
