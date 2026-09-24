DELETE FROM `playercreateinfo` WHERE `race` = @DarkIronDwarf;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@DarkIronDwarf, @Warrior,     @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Paladin,     @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Hunter,      @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Rogue,       @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Priest,      @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Shaman,      @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Mage,        @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Warlock,     @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO),
(@DarkIronDwarf, @Druid,       @EasternKingdoms,  @DunMorogh,      @DwarfStartX, @DwarfStartY, @DwarfStartZ, @DwarfStartO), -- ARAC
(@DarkIronDwarf, @DeathKnight, @Northrend,        @ScarletEnclave, @DKStartX,    @DKStartY,    @DKStartZ,    @DKStartO);
