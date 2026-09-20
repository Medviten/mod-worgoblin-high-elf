-- helmetgeosetvisdata: 0 inserts, 13 updates, 0 deletes

-- Changed values (race masks are +1 in this DBC, so human is 2, orc is 4, dwarf is 8, etc. – so goblin is @GoblinHelmetMask and worgen is @WorgenHelmetMask)
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask  WHERE `id` = 246; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` & ~@WorgenHelmetMask WHERE id = 247; -- -worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` & ~@WorgenHelmetMask WHERE id = 249; -- -worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = (`hide_geoset_1` & ~@WorgenHelmetMask) WHERE id = 265; -- -worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask, `hide_geoset_2` = `hide_geoset_2` | @WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask, `hide_geoset_4` = `hide_geoset_4` | @WorgenHelmetMask, `hide_geoset_5` = `hide_geoset_5` | @WorgenHelmetMask WHERE `id` = 285; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask, `hide_geoset_2` = `hide_geoset_2` | @WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask, `hide_geoset_4` = `hide_geoset_4` | @WorgenHelmetMask, `hide_geoset_5` = `hide_geoset_5` | @WorgenHelmetMask WHERE `id` = 306; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask WHERE `id` = 307; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask WHERE `id` = 325; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask WHERE id = 366; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask WHERE `id` = 367; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_2` = `hide_geoset_2` & ~@WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` & ~@WorgenHelmetMask, `hide_geoset_4` = `hide_geoset_4` & ~@WorgenHelmetMask WHERE `id` = 369; -- -worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask WHERE `id` = 376; -- -worgen
