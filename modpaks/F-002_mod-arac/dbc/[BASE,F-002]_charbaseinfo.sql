-- [F-029] mod-arac: charbaseinfo

-- Clean slate + every non-NULL race/class combination
DELETE FROM `charbaseinfo` WHERE `class` in (@Warrior, @Paladin, @Hunter, @Rogue, @Priest, @DeathKnight, @Shaman, @Mage, @Warlock, @Druid);
INSERT INTO `charbaseinfo` (`race`, `class`)
SELECT `r`.`race`, `c`.`class`
FROM (
    SELECT @Human AS `race`
    UNION ALL SELECT @Orc
    UNION ALL SELECT @Dwarf
    UNION ALL SELECT @NightElf
    UNION ALL SELECT @Undead
    UNION ALL SELECT @Tauren
    UNION ALL SELECT @Gnome
    UNION ALL SELECT @Troll
    UNION ALL SELECT @Goblin -- race 9
    UNION ALL SELECT @BloodElf
    UNION ALL SELECT @Draenei
    UNION ALL SELECT @Worgen -- race 12
    UNION ALL SELECT @HighElf
    UNION ALL SELECT @MagharOrc
    UNION ALL SELECT @Ogre
    UNION ALL SELECT @DarkIronDwarf
    UNION ALL SELECT @ZandalariTroll
    UNION ALL SELECT @Vulpera
    UNION ALL SELECT @AlliancePandaren
    UNION ALL SELECT @HordePandaren
    UNION ALL SELECT @Broken
    UNION ALL SELECT @KulTiran
) AS `r`
CROSS JOIN (
    SELECT @Warrior AS `class`
    UNION ALL SELECT @Paladin
    UNION ALL SELECT @Hunter
    UNION ALL SELECT @Rogue
    UNION ALL SELECT @Priest
    UNION ALL SELECT @DeathKnight
    UNION ALL SELECT @Shaman
    UNION ALL SELECT @Mage
    UNION ALL SELECT @Warlock
    UNION ALL SELECT @Druid
) AS `c`
WHERE `r`.`race` IS NOT NULL
  AND `c`.`class` IS NOT NULL;
