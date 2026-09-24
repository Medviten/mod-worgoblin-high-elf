DELETE FROM `playercreateinfo` WHERE `race` = @Vulpera;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@Vulpera, @Warrior,     @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Paladin,     @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), -- ARAC
(@Vulpera, @Hunter,      @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Rogue,       @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Priest,      @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Shaman,      @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Mage,        @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Warlock,     @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO),
(@Vulpera, @Druid,       @Kalimdor,  @Durotar,        @TaurenStartX, @TaurenStartY, @TaurenStartZ, @TaurenStartO), -- ARAC
(@Vulpera, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,     @DKStartY,     @DKStartZ,     @DKStartO);
