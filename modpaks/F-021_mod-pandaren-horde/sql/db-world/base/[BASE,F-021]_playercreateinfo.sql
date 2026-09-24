DELETE FROM `playercreateinfo` WHERE `race` = @HordePandaren;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@HordePandaren, @Warrior,     @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @Hunter,      @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @Rogue,       @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @Priest,      @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @Mage,        @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @Warlock,     @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @Druid,       @Kalimdor,  @Mulgore,         @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), 
(@HordePandaren, @DeathKnight, @Northrend, @ScarletEnclave,  @DKStartX,     @DKStartY,     @DKStartZ,     @DKStartO); 
