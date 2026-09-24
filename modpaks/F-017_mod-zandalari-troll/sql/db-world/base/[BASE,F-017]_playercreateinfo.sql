DELETE FROM `playercreateinfo` WHERE `race` = @ZandalariTroll;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@ZandalariTroll, @Warrior,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Paladin,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Hunter,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Rogue,       @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Priest,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Shaman,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Mage,        @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Warlock,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @Druid,       @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@ZandalariTroll, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,  @DKStartY,  @DKStartZ,  @DKStartO);
