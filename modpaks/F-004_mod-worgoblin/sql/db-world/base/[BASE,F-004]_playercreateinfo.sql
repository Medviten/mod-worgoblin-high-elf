DELETE FROM `playercreateinfo` WHERE `race` IN (@Goblin, @Worgen);
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@Goblin, @Warrior,     @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Paladin,     @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO), -- ARAC
(@Goblin, @Hunter,      @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Rogue,       @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Priest,      @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Shaman,      @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Mage,        @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Warlock,     @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO),
(@Goblin, @Druid,       @Kalimdor,  @Durotar,        @OrcStartX,      @OrcStartY,      @OrcStartZ,      @OrcStartO), -- ARAC
(@Goblin, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,       @DKStartY,       @DKStartZ,       @DKStartO),
(@Worgen, @Warrior,     @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @Paladin,     @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO), -- ARAC
(@Worgen, @Hunter,      @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @Rogue,       @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @Priest,      @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @Shaman,      @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO), -- ARAC
(@Worgen, @Mage,        @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @Warlock,     @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @Druid,       @Kalimdor,  @Teldrassil,     @NightElfStartX, @NightElfStartY, @NightElfStartZ, @NightElfStartO),
(@Worgen, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,       @DKStartY,       @DKStartZ,       @DKStartO),
