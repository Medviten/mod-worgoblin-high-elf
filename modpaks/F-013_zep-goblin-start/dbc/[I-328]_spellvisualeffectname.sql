-- I-328 Mechashark X-Steam appearance — effectnames for SpellVisualKit 14016.
--
-- There is no mechanical shark model. Cata's Mechashark X-Steam is creature display
-- 21763 -> model 230 -> `Creature\Shark\HammerHead.m2` — the plain stock hammerhead,
-- byte-identical attachment table in 3.3.5a and 4.3.4 (ids 15-22, 34; verified by
-- parsing both M2s). The machine is built entirely out of SpellVisualKit 14016, applied
-- by aura spell 71663 on summon, which hangs SIX models off the shark:
--
--   attach 17 (head)      Goblin Kezan Pipe 04     the periscope
--   attach 17 (head)      Smoke Flare (White)      smoke out of the periscope
--   attach 21 (left fin)  Missile: Rocket          rocket, +1.1 z -> sits on the back
--   attach 22 (right fin) Missile: Rocket          rocket
--   attach 17 (head)      UL Light Effect Green    left eye light
--   attach 17 (head)      UL Light Effect Green    right eye light
--
-- We shipped three of the six: the smoke and both rockets. The pipe and the two eye
-- lights were dropped because `spellvisuals.py` resolves a Cata effectname by matching
-- its .mdx path against the effectnames 3.3.5a already has, and neither path is in that
-- table. For the pipe that test was too strict — the MESH ships, in
-- patch-open-azeroth's `WORLD/GENERIC/GOBLIN/PASSIVEDOODADS/LOSTISLES/
-- GOBLIN_KEZAN_PIPE_04.M2` — so only the DBC row was ever missing. Same shape of gap as
-- I-323's missile model.
--
-- The eye lights stay missing: `world\expansion02\doodads\ulduar\ul_light_effect_green.mdx`
-- is not a 3.3.5a asset (no stock DBC of any table references it) and only exists as a
-- 4.3.4 M2 in the Whitemane extract, so it needs a curated retroport before it can be
-- referenced. Tracked in the I-328 note.
--
-- 90xxx is the hand-authored effectname block the emitter skips; 90101 is I-323's.

-- The rockets currently point at stock effectname 3088, which is the right mesh
-- (`spells\Missle_Rocket.mdx`) at the wrong size: 3088 is scale 1.0, the Cata row 6279
-- the donor actually used is scale 1.25. Ship 6279's values under a custom id rather
-- than editing stock 3088, which 40+ other spells share.
DELETE FROM spellvisualeffectname WHERE id = 90102;
INSERT INTO spellvisualeffectname SET
  `id` = 90102,
  `name` = 'Missile: Rocket (I-328 Mechashark, Cata 6279 scale)',
  `file_name` = 'spells\\Missle_Rocket.mdx',
  `area_effect_size` = 1.0,
  `scale` = 1.25,
  `min_allowed_scale` = 0.01,
  `max_allowed_scale` = 100.0;

-- 4.3.4 effectname 6275 verbatim. Note scale 0.1 with min_allowed 0.1 — the pipe doodad
-- is world-sized and gets shrunk to periscope scale; min/max are NOT 0/0, which would
-- render it invisible (reference_item_cast_spellvisual_kit).
DELETE FROM spellvisualeffectname WHERE id = 90103;
INSERT INTO spellvisualeffectname SET
  `id` = 90103,
  `name` = 'Goblin Kezan Pipe 04 (I-328 Mechashark periscope)',
  `file_name` = 'world\\generic\\goblin\\passivedoodads\\lostisles\\goblin_kezan_pipe_04.mdx',
  `area_effect_size` = 0.0,
  `scale` = 0.1,
  `min_allowed_scale` = 0.1,
  `max_allowed_scale` = 10.0;

-- The eye lights (4.3.4 effectname 6281), now that the mesh ships. Donor values except
-- `scale`: 0.5 sizes the glow for the stock hammerhead, whose head lobes reach y 1.650.
-- Ours reach 0.930, and with display 21763 rendering at creature_model_scale 2.0 the
-- donor disc overhung the eye by 0.96 yards on screen. Scaled by the head-width ratio,
-- 0.5 * (0.930/1.650) = 0.28. area_effect_size 0, min/max 0.1/10 as the donor has them. The .mdx path is the
-- stock Cata one because that is where the retroported model is shipped to in this
-- zpak's source-assets; see asset_recipes.json for the conversion and its hashes.
--
-- The donor names this "Ulduar Light Effect Yellow" while the file is the green variant;
-- kept the file, dropped the misleading half of the name.
DELETE FROM spellvisualeffectname WHERE id = 90104;
INSERT INTO spellvisualeffectname SET
  `id` = 90104,
  `name` = 'UL Light Effect Green (I-328 Mechashark eye lights)',
  `file_name` = 'world\\expansion02\\doodads\\ulduar\\ul_light_effect_green.mdx',
  `area_effect_size` = 0.0,
  `scale` = 0.28,
  `min_allowed_scale` = 0.1,
  `max_allowed_scale` = 10.0;
