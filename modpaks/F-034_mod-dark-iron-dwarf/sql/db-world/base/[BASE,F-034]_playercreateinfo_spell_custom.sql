-- Inherit every spell a normal dwarf receives for the same class.
UPDATE `playercreateinfo_spell_custom` SET `racemask` = `racemask` | @DarkIronDwarfMask
WHERE (`racemask` & @DwarfMask) <> 0;

-- Explicit racial safety net (INSERT IGNORE prevents duplicates when inherited already).
INSERT IGNORE INTO `playercreateinfo_spell_custom` VALUES
(@DarkIronDwarfMask, @AllClassMask, @DarkIronDwarfRacial1, 'Stoneform'),
(@DarkIronDwarfMask, @AllClassMask, @DarkIronDwarfRacial2, 'Gun Specialization'),
(@DarkIronDwarfMask, @AllClassMask, @DarkIronDwarfRacial3, 'Frost Resistance'),
(@DarkIronDwarfMask, @AllClassMask, @DarkIronDwarfRacial4, 'Find Treasure'),
(@DarkIronDwarfMask, @AllClassMask, @DarkIronDwarfRacial5, 'Mace Specialization');
