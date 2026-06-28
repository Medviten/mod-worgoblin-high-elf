/*Updates existing starting skills to include Worgen, Goblins, and High Elves where relevant*/
/* Only update skill if it has the default racemask to prevent conflict with other modules that change starting weapon skills. */
/* I have commented out Guns for High Elves and Bows for Worgen and Goblins because other Hunters in WotLK start with only one ranged weapon skill. */
--- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048|4096 WHERE `skill` = 45 AND `racemask` = 650; -- Bows
--- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048|4096 WHERE `skill` = 46 AND `racemask` = 36; -- Guns
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|4096 WHERE `skill` = 45 AND `racemask` = 650; --- Bows for Orcs, Night Elves, Trolls, Blood Elves, and High Elves
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|64|256|2048 WHERE `skill` = 46 AND `racemask` = 36; --- Guns for Dwarves, Tauren, Gnomes, Goblins, and Worgen
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|1|5 WHERE `skill` = 226 AND `racemask` = 1024; --- Crossbows for Humans, Undead, and Draenei
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048|4096 WHERE `skill` = 173 AND `racemask` = 735; --- Daggers for everyone except Tauren and Draenei
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256|2048 WHERE `skill` = 160 AND `racemask` = 1061; -- 2H-maces for Humans, Dwarves, Tauren, Goblins, Draenei, and Worgen Warriors
/* Special cases */
INSERT INTO `playercreateinfo_skills` (`racemask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(0, 8, 173, 0, 'Daggers - Rogues'), --- Tauren and Draenei Rogues need Daggers
(0, 2, 173, 0, '2H-Maces - Paladins'); --- 2H-Maces for all Paladins

/* Add appropriate faction language to Worgen, Goblins, and High Elves */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|256 WHERE `skill` = 109; -- Orcish language for Goblins
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|2048|4096 WHERE `skill` = 98; -- Common language for Worgen and High Elves
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|4096 WHERE `skill` = 137; --- Thalassian language for High Elves

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` IN (256, 2048) AND `classMask` = 0;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(256, 0, 790, 0, 'Goblin - Racial'),
(2048, 0, 789, 0, 'Worgen - Racial');
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask`|4096 WHERE `skill` = 756; --- High Elves copy Blood Elves.
