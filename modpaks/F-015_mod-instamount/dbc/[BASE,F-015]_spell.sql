-- [F-078]_mod-instamount: spell

-- Makes mounts instacasts
UPDATE `spell` SET `cast_time_index` = 1 WHERE `effect_1` = 6 AND `effect_apply_aura_name_1` = 78;
UPDATE `spell` SET `cast_time_index` = 1 WHERE `id` IN (87840, 87841, 110010, 110011); -- Running Wild

-- Indoors mountup
UPDATE `spell` SET `attributes` = `attributes` & ~32768 WHERE `effect_1` = 6 AND `effect_apply_aura_name_1` = 78;
UPDATE `spell` SET `attributes` = `attributes` & ~32768 WHERE `id` IN (87840, 87841, 110010, 110011); -- Running Wild

-- Indoors Druid Travel, Aquatic and Flight Forms (for fairness)
UPDATE `spell` SET `attributes` = `attributes` & ~32768 WHERE `id` IN (783, 1066, 33943, 40120);
