/*Updates existing starting skills to include Goblins where relevant*/
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = @BowSkill;
-- UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = @CrossbowSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = @GunSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = @DaggerSkill;
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = @2HMaceSkill;

/* Add appropriate faction language to Goblins */
UPDATE `playercreateinfo_skills` SET `racemask` = `racemask` | @GoblinMask WHERE `skill` = @OrcishSkill;

/* Add racial skills */
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @GoblinMask AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@GoblinMask, 0, @GoblinRacials, 0, 'Goblin - Racial');
