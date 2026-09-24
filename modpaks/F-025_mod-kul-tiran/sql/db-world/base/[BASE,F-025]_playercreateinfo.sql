DELETE FROM `playercreateinfo` WHERE `race` = @KulTiran;
INSERT IGNORE INTO `playercreateinfo` VALUES
(@KulTiran, @Warrior,     @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @Hunter,      @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @Rogue,       @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @Priest,      @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @Shaman,      @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @Mage,        @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @Druid,       @EasternKingdoms,  @ElwynnForest,   @HumanStartX,  @HumanStartY, @HumanStartZ, @HumanStartO),
(@KulTiran, @DeathKnight, @Northrend,        @ScarletEnclave, @DKStartX,     @DKStartY,    @DKStartZ,    @DKStartZ);
