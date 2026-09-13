DELETE FROM `playercreateinfo` WHERE `race` = @Vulpera;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`)
SELECT @Vulpera,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation` FROM `playercreateinfo` WHERE `race` = @Tauren;
