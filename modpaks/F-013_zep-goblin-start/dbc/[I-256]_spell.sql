-- I-256: Kablooey Bombs (67682, quest 14124 'Liberate the Kaja'mite') kept its
-- Cata SpellVisual 14307, which the 3.3.5a client doesn't have -> the throw was
-- completely invisible (no missile, no explosion). Repoint to the stock thrown
-- sapper-charge visual 3819 (Saronite Bomb 56350 / The Big One 12562 family).
-- Overrides the [AUTO,F-011]_spell.sql row (loads after it).
UPDATE spell SET spell_visual_1 = 3819 WHERE id = 67682;
