/*Updates existing starting skills to include worgen and goblins where relevant*/
/* Only update skill if it has the default racemask to prevent conflict with other modules that change starting weapon skills */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048 WHERE `skill` = 45 AND `racemask` = 650; -- Bows
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048 WHERE `skill` = 46 AND `racemask` = 36; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048 WHERE `skill` = 173 AND `racemask` = 735; -- Daggers
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256 WHERE `skill` = 160 AND `racemask` = 1061; -- 2h-mace goblins

/* Add appropriate faction language to worgen and goblins */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256 WHERE `skill` = 109; -- Orcish language for goblins
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|2048 WHERE `skill` = 98; -- Common language for worgen

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (256, 2048) AND `classMask` = 0;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(256, 0, 790, 0, 'Goblin - Racial'),
(2048, 0, 789, 0, 'Worgen - Racial');