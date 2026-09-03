-- helmetgeosetvisdata: 0 inserts, 15 updates, 0 deletes

-- Changed values (race masks are +1 in this DBC, so human is 2, orc is 4, dwarf is 8, etc. – so goblin is @GoblinHelmetMask and worgen is @WorgenHelmetMask)
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask  WHERE `id` = 246; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` & ~(@GoblinHelmetMask | @WorgenHelmetMask), `hide_geoset_4` = `hide_geoset_4` & ~@GoblinHelmetMask WHERE id = 247; -- 3: -worgen & -goblin, 4: -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` & ~@GoblinHelmetMask, `hide_geoset_4` = `hide_geoset_4` & ~@GoblinHelmetMask, `hide_geoset_5` = `hide_geoset_5` & ~@GoblinHelmetMask WHERE `id` = 248; -- 3–5: -goblin
-- 249: clear bits 0-5 and 12 (0x103F = 4159), set bit 6 (64)
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = (`hide_geoset_1` & ~4159) | 64 WHERE id = 249; -- -worgen, but -4160, not -4161, for some reason
-- 265: same as above for hide_geoset_1; hide_geoset_5 stays a pure goblin-bit clear
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = (`hide_geoset_1` & ~4159) | 64, `hide_geoset_5` = `hide_geoset_5` & ~@GoblinHelmetMask WHERE id = 265; -- 1: -worgen, but -4160, not -4161, for some reason; 5: -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask, `hide_geoset_2` = `hide_geoset_2` | @WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask, `hide_geoset_4` = `hide_geoset_4` | @WorgenHelmetMask, `hide_geoset_5` = `hide_geoset_5` | @WorgenHelmetMask WHERE `id` = 285; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 305; -- +goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask | @WorgenHelmetMask, `hide_geoset_2` = `hide_geoset_2` | @WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask, `hide_geoset_4` = `hide_geoset_4` | @WorgenHelmetMask, `hide_geoset_5` = `hide_geoset_5` | @WorgenHelmetMask WHERE `id` = 306; -- 1: +worgen & +goblin, 2–5: +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask | @WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask WHERE `id` = 307; -- 1: +worgen & goblin, 3: +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @WorgenHelmetMask WHERE `id` = 325; -- +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask WHERE `id` = 345; -- +goblin
-- 366: clear bit 128, set bits 8+64+256+@WorgenHelmetMask (=4424)
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = (`hide_geoset_3` & ~128) | 4424 WHERE id = 366; -- 4424, not 4224, for some reason
UPDATE `helmetgeosetvisdata` SET `hide_geoset_1` = `hide_geoset_1` | @GoblinHelmetMask, `hide_geoset_3` = `hide_geoset_3` | @WorgenHelmetMask WHERE `id` = 367; -- 1: +goblin, 3: +worgen
UPDATE `helmetgeosetvisdata` SET `hide_geoset_2` = `hide_geoset_2` & ~@WorgenHelmetMask, `hide_geoset_3` = `hide_geoset_3` & ~@WorgenHelmetMask, `hide_geoset_4` = `hide_geoset_4` & ~(@GoblinHelmetMask | @WorgenHelmetMask) WHERE `id` = 369; -- 2–3: -worgen, 4: -worgen & -goblin
UPDATE `helmetgeosetvisdata` SET `hide_geoset_3` = `hide_geoset_3` | @GoblinHelmetMask | @WorgenHelmetMask WHERE `id` = 376; -- -worgen & -goblin
