-- [F-076]_mod-instamount: spell

-- Makes mounts instacasts
UPDATE `spell` SET `cast_time_index` = 1 WHERE `effect_1` = 6 AND `effectaura_1` = 78;
