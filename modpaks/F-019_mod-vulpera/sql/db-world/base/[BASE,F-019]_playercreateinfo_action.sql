DELETE FROM `playercreateinfo_action` WHERE `race` = @Vulpera;
INSERT INTO `playercreateinfo_action` (`race`,`class`,`button`,`action`,`type`)
SELECT @Vulpera,`class`,`button`,`action`,`type` FROM `playercreateinfo_action` WHERE `race` = @Troll;
