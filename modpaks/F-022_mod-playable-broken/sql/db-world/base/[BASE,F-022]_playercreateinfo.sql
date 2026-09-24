DELETE FROM `playercreateinfo` WHERE `race` = @Broken;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@Broken, @Warrior,     @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO),
(@Broken, @Paladin,     @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO),
(@Broken, @Hunter,      @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO),
(@Broken, @Rogue,       @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO), -- ARAC
(@Broken, @Priest,      @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO),
(@Broken, @Shaman,      @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO),
(@Broken, @Mage,        @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO),
(@Broken, @Warlock,     @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO), -- ARAC
(@Broken, @Druid,       @Outland,   @AzuremystIsle,  @DraeneiStartX, @DraeneiStartY, @DraeneiStartZ, @DraeneiStartO), -- ARAC
(@Broken, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,      @DKStartY,      @DKStartZ,      @DKStartO);
