-- Give Dark Iron every skill permission a normal dwarf has.
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @DarkIronDwarfMask
WHERE (`race_mask` & @DwarfMask) <> 0;

-- Dedicated racial skill line.
DELETE FROM `skillraceclassinfo` WHERE `id` = 1143;
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`)
VALUES (1143, @DarkIronDwarfRacials, @DarkIronDwarfMask, @AllClassMask, 1170, 0, 0, 0);
