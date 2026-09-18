-- skillraceclassinfo: 2 inserts, 30 updates, 0 deletes

-- New entries
DELETE FROM `skillraceclassinfo` WHERE `id` = 9172; -- HordePandaren racials
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`) VALUES
(9172, @PandarenRacials, @HordePandarenMask, @AllClassMask, 1170, 0, 0, 0);

-- Changed values
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 21; -- skill: 293 (plate mail)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 27; -- skill: 356 (fishing)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 28; -- skill: 182 (herbalism)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 29; -- skill: 186 (mining)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 30; -- skill: 393 (skinning)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 41; -- skill: 98 (language: common, [some of the] Horde)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 48; -- skill: 109 (language: orcish, Horde)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 84; -- skill: 139 (language: demon tongue)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 85; -- skill: 138 (language: draconic)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 88; -- skill: 141 (language: old tongue)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 93; -- skill: 140 (language: titan)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 133; -- skill: 46 (guns)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 145; -- skill: 413 (mail, 40+)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 146; -- skill: 413 (mail)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 147; -- skill: 414 (leather)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 148; -- skill: 415 (cloth)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 241; -- skill: 171 (alchemy)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 243; -- skill: 164 (blacksmithing)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 244; -- skill: 202 (engineering)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 246; -- skill: 433 (shield)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 281; -- skill: 333 (enchanting)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 282; -- skill: 185 (cooking)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 284; -- skill: 197 (tailoring)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 624; -- skill: 160 (two-handed maces, DK)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` & ~@HordePandarenMask WHERE `id` = 625; -- skill: 160 (two-handed maces)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 865; -- skill: 142 (survival)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 866; -- skill: 755 (jewelcrafting)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @HordePandarenMask WHERE `id` = 899; -- skill: 165 (leatherworking)
