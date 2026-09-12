-- I-335 "Irresistible Pool Pony" (quest 24864) — the pool pony itself.
--
-- Item 84318 casts 71914, whose aura is water breathing (82) + swim speed (58) and
-- nothing else: the inflatable is not an effect, it is SpellVisual 15198's STATE kit,
-- 14052, which hangs three models off the player for as long as the aura is up.
-- 4.3.4 SpellVisualKitModelAttach for kit 14052:
--
--   3781  attach 10  effectname 6305  Floating Orange Pool Pony   <- the pony
--   3782  attach 10  effectname 6306  Bubbles
--   3783  attach 17  effectname  754  Bubbles
--
-- We shipped rows 2 and 3 (as 90011/90012, resolved onto stock effectnames 108 and
-- 754) and dropped row 1, so the spell delivered its buff and drew a stream of
-- bubbles with no pony in it — reported as "I get the swim buff but I was expecting
-- a visible model".
--
-- Cause is the same shape as I-328's periscope: `spellvisuals.py` resolves a Cata
-- effectname by matching its .mdx path against the effectnames 3.3.5a already has,
-- and 6305's path is not one of them, so the slot was zeroed and the attach row
-- never emitted. Only the DBC row was ever missing — the MESH ships, retroported to
-- v264 in patch-open-azeroth and verified present in the built PATCH-O as
-- `WORLD\GENERIC\GOBLIN\PASSIVEDOODADS\KEZAN\POOLPONY\
--  GOBLIN_KEZAN_POOLPONY_FLOATING_ORANGE_01.M2`.
--
-- 90xxx is the hand-authored effectname block the emitter skips; 90104 is I-328's.

-- 4.3.4 effectname 6305 verbatim. scale 0.7 against a mesh 2.53 wide (y -1.249..1.282)
-- and 1.59 tall gives a ring 1.77 across on a goblin whose own model is 2.38 tall —
-- waist-sized, which is what attachment 10 (hips, z 0.658 on GOBLINMALE.M2) wants.
-- min/max 0.1/10, NOT 0/0, which would render it invisible
-- (reference_item_cast_spellvisual_kit).
DELETE FROM spellvisualeffectname WHERE id = 90105;
INSERT INTO spellvisualeffectname SET
  `id` = 90105,
  `name` = 'Floating Orange Pool Pony (I-335 quest 24864)',
  `file_name` = 'world\\generic\\goblin\\passivedoodads\\kezan\\poolpony\\goblin_kezan_poolpony_floating_orange_01.mdx',
  `area_effect_size` = 0.0,
  `scale` = 0.7,
  `min_allowed_scale` = 0.1,
  `max_allowed_scale` = 10.0;
