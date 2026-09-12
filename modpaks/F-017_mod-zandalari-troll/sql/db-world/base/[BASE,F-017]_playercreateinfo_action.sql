DELETE FROM `playercreateinfo_action` WHERE `race` = @ZandalariTroll;
INSERT INTO `playercreateinfo_action` (`race`,`class`,`button`,`action`,`type`)
SELECT @ZandalariTroll,`class`,`button`,`action`,`type` FROM `playercreateinfo_action` WHERE `race` = @Troll;
