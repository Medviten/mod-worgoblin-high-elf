DELETE FROM `playercreateinfo` WHERE `race` = @MagharOrc;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@MagharOrc, @Warrior,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Paladin,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO), -- ARAC
(@MagharOrc, @Hunter,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Priest,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Shaman,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Rogue,       @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Mage,        @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Warlock,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@MagharOrc, @Druid,       @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO), -- ARAC
(@MagharOrc, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,  @DKStartY,  @DKStartZ,  @DKStartO);
