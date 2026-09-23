-- charbaseinfo: 8 inserts, 0 updates, 0 deletes

-- New entries
DELETE FROM `charbaseinfo` WHERE `race` = @KulTiran;
INSERT INTO `charbaseinfo` (`race`, `class`) VALUES
(@KulTiran, @Warrior),
(@KulTiran, @Hunter),
(@KulTiran, @Rogue),
(@KulTiran, @Priest),
(@KulTiran, @DeathKnight),
(@KulTiran, @Shaman),
(@KulTiran, @Mage),
(@KulTiran, @Druid);
