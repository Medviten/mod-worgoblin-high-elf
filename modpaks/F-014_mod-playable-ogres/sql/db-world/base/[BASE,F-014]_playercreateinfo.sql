DELETE FROM `playercreateinfo` WHERE `race` = @Ogre;
INSERT INTO `playercreateinfo` (`race`,`class`,`map`,`zone`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@Ogre, @Warrior,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@Ogre, @Paladin,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO), -- ARAC
(@Ogre, @Hunter,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@Ogre, @Rogue,       @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO), -- ARAC
(@Ogre, @Priest,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO), -- ARAC
(@Ogre, @Shaman,      @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@Ogre, @Mage,        @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@Ogre, @Warlock,     @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO),
(@Ogre, @Druid,       @Kalimdor,  @Durotar,        @OrcStartX, @OrcStartY, @OrcStartZ, @OrcStartO), -- ARAC
(@Ogre, @DeathKnight, @Northrend, @ScarletEnclave, @DKStartX,  @DKStartY,  @DKStartZ,  @DKStartO);  -- ARAC
