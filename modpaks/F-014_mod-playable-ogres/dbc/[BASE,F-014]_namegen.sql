-- namegen: 24 inserts, 0 updates, 0 deletes

-- New entries
SET @NameGenID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`namegen`);

DELETE FROM `namegen` WHERE `id` BETWEEN 19500 AND 19523;
INSERT INTO `namegen` (`id`, `name`, `race_id`, `sex`) VALUES
(@NameGenID := @NameGenID +1, 'Grok', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Mogor', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Tharg', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Krol', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Gorlash', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Brugor', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Dorgok', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Krosh', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Grimnok', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Lunk', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Urok', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Zorbo', @Ogre, @Male),
(@NameGenID := @NameGenID +1, 'Chogara', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Mogra', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Urda', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Grulla', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Zogra', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Karga', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Maghara', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Brogga', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Gorma', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Hargala', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Thokra', @Ogre, @Female),
(@NameGenID := @NameGenID +1, 'Wulgra', @Ogre, @Female);
