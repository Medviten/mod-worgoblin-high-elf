-- Inherit every spell a normal dwarf receives for the same class.
UPDATE `playercreateinfo_spell_custom` SET `racemask` = `racemask` | @ZandalariTrollMask
WHERE (`racemask` & @TrollMask) <> 0;
