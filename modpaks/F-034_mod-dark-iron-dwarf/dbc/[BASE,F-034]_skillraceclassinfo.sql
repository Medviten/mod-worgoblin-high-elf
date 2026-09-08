-- Give Dark Iron every skill permission a normal dwarf has.
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask
WHERE (`race_mask` & @DwarfMask) <> 0;

-- Dedicated racial skill line.
DELETE FROM `skillraceclassinfo` WHERE `id` = 1143;
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`)
VALUES (1143, @DarkIronDwarfRacials, @DarkIronDwarfMask, @AllClassMask, 1170, 0, 0, 0);

-- [F-034] mod-dark-iron-dwarf: skillraceclassinfo: 5 inserts, 104 updates, 0 deletes

-- New entries
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`) VALUES (1140, @DarkIronDwarfRacials, @DarkIronDwarfMask, @AllClassMask, 1170, 0, 0, 0) ON DUPLICATE KEY UPDATE `race_mask` = `race_mask` | @DarkIronDwarfMask;

-- Changed values
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 21;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 24;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 26;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 27;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 28;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 29;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 30;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 34;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 35;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 36;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 37;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 38;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 40;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 48;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 49;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 54;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 59;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 62;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 64;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 65;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 66;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 73;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 76;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 79;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 81;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 83;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 84;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 85;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 87;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 88;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 89;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 92;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 93;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 94;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 97;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 104;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 105;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 106;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 108;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 111;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 112;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 113;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 133;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 137;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 145;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 146;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 147;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 148;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 149;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 151;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 155;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 158;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 159;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 175;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 178;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 183;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 186;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 189;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 191;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 193;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 198;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 200;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 203;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 204;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 205;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 241;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 243;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 244;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 246;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 265;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 266;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 268;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 269;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 270;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 271;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 272;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 281;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 282;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 284;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 328;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 330;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 403;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 441;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 442;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 443;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 446;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 461;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 463;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 481;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 622;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 628;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 630;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 632;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 634;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 635;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 637;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 638;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 642;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 644;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 742;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 865;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 866;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 886;
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask WHERE `id` = 899;
