-- All normal dwarf starting skills (languages, weapons, armor permissions, etc.)
-- are extended to Dark Iron without duplicating rows.
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @DarkIronDwarfMask
WHERE (`raceMask` & @DwarfMask) <> 0;

-- Dedicated Dark Iron racial skill line.
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @DarkIronDwarfMask AND `classMask` = 0 AND `skill` = @DarkIronDwarfRacials;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`,`classMask`,`skill`,`rank`,`comment`)
VALUES (@DarkIronDwarfMask, 0, @DarkIronDwarfRacials, 0, 'Dark Iron Dwarf - Racial');
