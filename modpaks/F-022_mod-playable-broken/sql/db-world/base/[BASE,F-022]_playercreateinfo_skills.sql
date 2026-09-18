-- All normal dwarf starting skills (languages, weapons, armor permissions, etc.)
-- are extended to Dark Iron without duplicating rows.
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @BrokenMask
WHERE (`raceMask` & @DraeneiMask) <> 0;

-- Dedicated Dark Iron racial skill line.
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @BrokenMask AND `classMask` = 0 AND `skill` = @BrokenRacials;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`,`classMask`,`skill`,`rank`,`comment`)
VALUES (@BrokenMask, 0, @BrokenRacials, 0, 'Broken - Racial');
