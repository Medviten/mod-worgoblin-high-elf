-- All normal dwarf starting skills (languages, weapons, armor permissions, etc.)
-- are extended to Dark Iron without duplicating rows.
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @ZandalariTrollMask
WHERE (`raceMask` & @DwarfMask) <> 0;

-- Dedicated Dark Iron racial skill line.
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @ZandalariTrollMask AND `classMask` = 0 AND `skill` = @ZandalariTrollRacials;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`,`classMask`,`skill`,`rank`,`comment`)
VALUES (@ZandalariTrollMask, 0, @ZandalariTrollRacials, 0, 'Zandalari Troll - Racial');
