/*Updates existing starting skills to include Worgen where relevant*/
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @KulTiranMask WHERE `skill` = @BowSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @KulTiranMask WHERE `skill` = @GunSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @KulTiranMask WHERE `skill` = @DaggerSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @KulTiranMask WHERE `skill` = @2HMaceSkill;

/* Add appropriate faction language to Worgen */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @KulTiranMask WHERE `skill` = @CommonSkill;

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @KulTiranMask AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@KulTiranMask, 0, @KulTiranRacials, 0, 'Worgen - Racial');
