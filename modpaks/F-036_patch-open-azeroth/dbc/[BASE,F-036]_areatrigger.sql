-- [BASE,F-036] open-azeroth: areatrigger
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-036]_areatrigger.sql with overrides

-- areatrigger: 10 inserts, 31 updates, 0 deletes
DELETE FROM `areatrigger` WHERE `id` = 6000;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6000, @Kalimdor, '-8595.2001953125000000', '-3993.1599121093750000', '-198.0000000000000000', '62.8774986267089840', '30.0000000000000000', '8.0000000000000000', '25.0000000000000000', '6.0789999961853030');
DELETE FROM `areatrigger` WHERE `id` = 6001;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6001, @EasternKingdoms, '-5695.2402343750000000', '5351.7597656250000000', '-1283.0000000000000000', '0E-16', '196.8000030517578000', '173.3999938964843800', '11.7100000381469730', '0E-16');
DELETE FROM `areatrigger` WHERE `id` = 6002;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6002, @EasternKingdoms, '-5582.1899414062500000', '5396.8999023437500000', '-1797.1700439453125000', '5.5489997863769530', '10.2299995422363280', '24.0400009155273440', '43.0400009155273440', '0E-16');
DELETE FROM `areatrigger` WHERE `id` = 6003;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6003, 643, '-660.9530029296875000', '807.4320068359375000', '244.7530059814453000', '6.2589998245239260', '25.7199993133544920', '60.9900016784668000', '110.4000015258789000', '0E-16');
DELETE FROM `areatrigger` WHERE `id` = 6004;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6004, @Kalimdor, '-10221.7998046875000000', '-1837.6600341796875000', '21.7954998016357420', '0E-16', '10.0000000000000000', '20.0000000000000000', '20.0000000000000000', '0.0055660000070930');
DELETE FROM `areatrigger` WHERE `id` = 6005;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6005, 644, '-954.3489990234375000', '452.4240112304687500', '53.4221992492675800', '0E-16', '10.0000000000000000', '20.0000000000000000', '20.0000000000000000', '4.7119998931884770');
DELETE FROM `areatrigger` WHERE `id` = 6006;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6006, @Kalimdor, '-10688.0000000000000000', '-1309.0999755859375000', '17.6616001129150400', '0E-16', '5.0000000000000000', '10.0000000000000000', '10.0000000000000000', '0.2179999947547913');
DELETE FROM `areatrigger` WHERE `id` = 6007;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6007, 755, '-10685.0996093750000000', '-1307.5300292968750000', '18.1522998809814450', '0E-16', '5.0000000000000000', '10.0000000000000000', '10.0000000000000000', '0.2456000000238419');
DELETE FROM `areatrigger` WHERE `id` = 6008;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6008, @EasternKingdoms, '-6551.2797851562500000', '-4446.4599609375000000', '332.8290100097656000', '1.7877600193023682', '0E-16', '0E-16', '0E-16', '0E-16');
DELETE FROM `areatrigger` WHERE `id` = 6009;
INSERT INTO `areatrigger` (`id`, `map_id`, `x`, `y`, `z`, `radius`, `box_length`, `box_width`, `box_height`, `box_yaw`) VALUES (6009, @EasternKingdoms, '-6518.6801757812500000', '-4604.4199218750000000', '29.2334995269775400', '1.7877600193023682', '0E-16', '0E-16', '0E-16', '0E-16');
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '5789.3466796875000000', `y` = '-4368.1762695312500000' WHERE `id` = 4064;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '5434.3364257812500000', `y` = '-5226.1367187500000000' WHERE `id` = 4071;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '5423.9765625000000000', `y` = '-4756.3164062500000000' WHERE `id` = 4108;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '5424.1064453125000000', `y` = '-4755.3164062500000000' WHERE `id` = 4109;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5750.8598632812500000', `y` = '5321.0332031250000000' WHERE `id` = 4186;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7202.8862304687500000', `y` = '-5750.1264648437500000' WHERE `id` = 4233;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5466.5800781250000000', `y` = '5661.5332031250000000' WHERE `id` = 4240;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '7541.8398437500000000', `y` = '6238.3330078125000000' WHERE `id` = 4241;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '6568.1469726562500000', `y` = '-4503.4663085937500000' WHERE `id` = 4265;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7152.6362304687500000', `y` = '-5782.6762695312500000' WHERE `id` = 4267;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '8436.3095703125000000', `y` = '6304.6328125000000000' WHERE `id` = 4280;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '7263.3701171875000000', `y` = '6161.9326171875000000' WHERE `id` = 4326;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7717.7963867187500000', `y` = '-5367.1567382812500000' WHERE `id` = 4339;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '3973.9265136718750000', `y` = '-4857.3066406250000000' WHERE `id` = 4386;
UPDATE `areatrigger` SET `z` = '-2000.0000000000000000' WHERE `id` = 4409;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7344.3364257812500000', `y` = '-4725.3666992187500000' WHERE `id` = 4486;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '6568.7465820312500000', `y` = '-4503.0063476562500000' WHERE `id` = 4722;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '4718.5463867187500000', `y` = '-5875.3964843750000000' WHERE `id` = 4738;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '10697.8671875000000000', `y` = '-4878.1064453125000000' WHERE `id` = 4847;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7212.7465820312500000', `y` = '-5133.4365234375000000' WHERE `id` = 4851;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5600.3798828125000000', `y` = '6223.7333984375000000' WHERE `id` = 4852;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '10745.4667968750000000', `y` = '-5215.4067382812500000' WHERE `id` = 4887;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '10417.6669921875000000', `y` = '-4641.8164062500000000' WHERE `id` = 4889;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5581.9599609375000000', `y` = '5982.3330078125000000' WHERE `id` = 5151;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5494.7700195312500000', `y` = '6064.6328125000000000' WHERE `id` = 5152;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5416.0000000000000000', `y` = '6048.8330078125000000' WHERE `id` = 5153;
UPDATE `areatrigger` SET `map_id` = @Kalimdor, `x` = '5443.5400390625000000', `y` = '6009.8330078125000000' WHERE `id` = 5154;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7214.8862304687500000', `y` = '-5218.3867187500000000' WHERE `id` = 5158;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7157.5463867187500000', `y` = '-5222.7563476562500000' WHERE `id` = 5159;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7119.4067382812500000', `y` = '-5181.8764648437500000' WHERE `id` = 5160;
UPDATE `areatrigger` SET `map_id` = @EasternKingdoms, `x` = '7085.1166992187500000', `y` = '-5213.6166992187500000' WHERE `id` = 5161;
