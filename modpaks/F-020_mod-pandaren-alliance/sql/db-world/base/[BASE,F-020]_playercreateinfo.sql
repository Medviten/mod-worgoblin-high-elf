DELETE FROM `playercreateinfo` WHERE `race` = @AlliancePandaren;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@AlliancePandaren, @Warrior,     @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @Hunter,      @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @Rogue,       @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @Priest,      @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @Mage,        @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @Warlock,     @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @Druid,       @EasternKingdoms,  @ElwynnForest,      @HumanStartX, @HumanStartY, @HumanStartZ, @HumanStartO),
(@AlliancePandaren, @DeathKnight, @Northrend,        @ScarletEnclave,    @DKStartX,    @DKStartY,    @DKStartZ,    @DKStartO);
