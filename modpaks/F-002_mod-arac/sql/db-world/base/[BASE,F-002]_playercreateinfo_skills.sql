UPDATE `playercreateinfo_skills` SET `raceMask` = @OrcMask | @NightElfMask | @TrollMask | @BloodElfMask WHERE `skill` = 45 AND `classMask` != 0;
UPDATE `playercreateinfo_skills` SET `raceMask` = @DwarfMask | @TaurenMask | @GnomeMask WHERE `skill` = 46 AND `classMask` != 0;
UPDATE `playercreateinfo_skills` SET `raceMask` = @HumanMask | @UndeadMask | @DraeneiMask WHERE `skill` = 226 AND `classMask` != 0;
UPDATE `playercreateinfo_skills` SET `raceMask` = @HumanMask | @DwarfMask | @TaurenMask | @DraeneiMask WHERE `skill` = 160 AND `classMask` != 0;
UPDATE `playercreateinfo_skills` SET `raceMask` = @PlayableRaceMask & ~(@TaurenMask | @DraeneiMask) WHERE `skill` = 173 AND `classMask` != 0;

DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @TaurenMask | @DraeneiMask AND `classMask` = @RogueMask AND `skill` = 173;
INSERT INTO `playercreateinfo_skills` VALUES (@TaurenMask | @DraeneiMask, @RogueMask, 173, 0, 'Daggers (Tauren & Draenei Rogues)');

-- Classic ARAC approach equalizes skills across races instead
/* UPDATE `playercreateinfo_skills` SET `raceMask` = 0 WHERE `skill` IN (45, 46, 160, 173, 226) AND `classMask` != 0; */
