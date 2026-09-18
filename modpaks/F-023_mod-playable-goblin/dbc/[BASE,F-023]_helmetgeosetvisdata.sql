-- helmetgeosetvisdata: 0 inserts, 15 updates, 0 deletes

-- Changed values
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` & ~@GoblinHelmetMask, `hide_geoset_4` = `hide_geoset_4` & ~@GoblinHelmetMask WHERE id = 247; -- -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` & ~@GoblinHelmetMask, `hide_geoset_4` = `hide_geoset_4` & ~@GoblinHelmetMask, `hide_geoset_5` = `hide_geoset_5` & ~@GoblinHelmetMask WHERE `id` = 248; -- -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_5` = `hide_geoset_5` & ~@GoblinHelmetMask WHERE id = 265; -- -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 305; -- +goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 306; -- +goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 307; -- goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask WHERE `id` = 325; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 345; -- +goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 367; -- +goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_4` = `hide_geoset_4` & ~@GoblinHelmetMask WHERE `id` = 369; -- -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @GoblinHelmetMask WHERE `id` = 376; -- -goblin
