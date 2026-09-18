DELETE FROM `playercreateinfo_action` WHERE `race` = @Broken;
INSERT INTO `playercreateinfo_action` (`race`,`class`,`button`,`action`,`type`)
SELECT @Broken,`class`,`button`,`action`,`type` FROM `playercreateinfo_action` WHERE `race` = @Draenei;
