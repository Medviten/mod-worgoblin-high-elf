-- Inherit every spell a normal dwarf receives for the same class.
UPDATE `playercreateinfo_spell_custom` SET `racemask` = `racemask` | @BrokenMask
WHERE (`racemask` & @DraeneiMask) <> 0;
