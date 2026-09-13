-- All normal dwarf starting skills (languages, weapons, armor permissions, etc.)
-- are extended to Vulpera without duplicating rows.
UPDATE `playercreateinfo_skills` SET `raceMask` = `raceMask` | @VulperaMask
WHERE (`raceMask` & @TrollMask) <> 0;

-- Dedicated Vulpera racial skill line.
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @VulperaMask AND `classMask` = 0 AND `skill` = @VulperaRacials;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`,`classMask`,`skill`,`rank`,`comment`)
VALUES (@VulperaMask, 0, @VulperaRacials, 0, 'Vulpera - Racial');
