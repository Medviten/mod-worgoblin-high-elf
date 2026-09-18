DELETE FROM `playercreateinfo` WHERE `race` = @Broken;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`)
SELECT @Broken,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation` FROM `playercreateinfo` WHERE `race` = @Draenei;
