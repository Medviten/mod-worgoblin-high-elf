/*Updates existing starting skills to include Worgen where relevant*/
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @WorgenMask WHERE `skill` = @BowSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @WorgenMask WHERE `skill` = @GunSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @WorgenMask WHERE `skill` = @DaggerSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @WorgenMask WHERE `skill` = @2HMaceSkill;

/* Add appropriate faction language to Worgen */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @WorgenMask WHERE `skill` = @CommonSkill;

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @WorgenMask AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@WorgenMask, 0, @WorgenRacials, 0, 'Worgen - Racial');
