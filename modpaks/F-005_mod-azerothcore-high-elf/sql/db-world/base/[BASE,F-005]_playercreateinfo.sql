DELETE FROM `playercreateinfo` WHERE `race` = @HighElf;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@HighElf, @Warrior,     @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Paladin,     @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Hunter,      @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Rogue,       @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Priest,      @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Shaman,      @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), -- ARAC
(@HighElf, @Mage,        @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Warlock,     @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), 
(@HighElf, @Druid,       @EasternKingdoms, @ElwynnForest,   @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO), -- ARAC
(@HighElf, @DeathKnight, @Northrend,       @ScarletEnclave, @DKStartX,    @DKStartY,    @DKStartZ,    @DKStartO); 
