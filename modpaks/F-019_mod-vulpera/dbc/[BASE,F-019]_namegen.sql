-- namegen: 1953 inserts, 0 updates, 0 deletes

-- New entries
SET @NameGenID = (SELECT COALESCE(MAX(id), 0) FROM `namegen`);

DELETE FROM `namegen` WHERE `race_id` = @Vulpera;
INSERT INTO `namegen` (`id`, `name`, `race_id`, `sex`) VALUES
(@NameGenID := @NameGenID +1, 'Grok',    @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Mogor',   @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Tharg',   @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Krol',    @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Gorlash', @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Brugor',  @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Dorgok',  @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Krosh',   @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Grimnok', @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Lunk',    @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Urok',    @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Zorbo',   @Vulpera, @Male),
(@NameGenID := @NameGenID +1, 'Chogara', @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Mogra',   @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Urda',    @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Grulla',  @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Zogra',   @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Karga',   @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Maghara', @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Brogga',  @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Gorma',   @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Hargala', @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Thokra',  @Vulpera, @Female),
(@NameGenID := @NameGenID +1, 'Wulgra',  @Vulpera, @Female);
