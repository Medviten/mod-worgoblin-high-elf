DELETE FROM `playercreateinfo` WHERE `race` = @DarkIronDwarf;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`)
SELECT @DarkIronDwarf,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation` FROM `playercreateinfo` WHERE `race` = @Dwarf;
