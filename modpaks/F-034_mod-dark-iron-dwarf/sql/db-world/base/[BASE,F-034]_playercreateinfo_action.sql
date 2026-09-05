DELETE FROM `playercreateinfo_action` WHERE `race` = @DarkIronDwarf;
INSERT INTO `playercreateinfo_action` (`race`,`class`,`button`,`action`,`type`)
SELECT @DarkIronDwarf,`class`,`button`,`action`,`type` FROM `playercreateinfo_action` WHERE `race` = @Dwarf;
