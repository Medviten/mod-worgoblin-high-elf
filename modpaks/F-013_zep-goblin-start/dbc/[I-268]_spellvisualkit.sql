-- [I-268] Kaja'Cola (70478) spell visual — kits.
--
-- Cata 4.3.4 (Whitemane 15595) SpellVisual 14885 is the drink animation set:
--   precast_kit 13737 = anim 61 EmoteEat + base_effect 99 "Food HealEffect Base"
--                       (Spells\Food_HealEffect_Base.mdx) + sound 3373 "Drinking"
--   impact_kit  13736 = anim 64 EmoteTalkExclamation + head_effect 402
--                       "Sap Impact Head" (Spells\Sap_Impact_Chest.mdx)
--                       + sound 22442 SPELL_KajaCola_Impact (netherpowerimpact.ogg)
--   cast_kit 13739 / state_kit 13735 are empty rows (no-ops) -> not ported.
-- Every effectname (99, 402) and its .mdx already exists byte-identical in 3.3.5a,
-- so this is a pure DBC-row port: no assets to ship.
-- Kit ids 13735-13739 are Cata-range and absent from our SpellVisualKit, so the
-- chain is rebuilt on custom ids 90050/90051 (90001-90041 already taken).

-- Kit 90050: precast (drink) — clone of stock 438, which is already the exact
-- 3.3.5a twin of Cata 13737 (anim 61, base_effect 99, sound 3373) except for the
-- extra right_hand_effect 417 "Item - Tankard". Kaja'Cola is a can, not a tankard,
-- and Cata's kit has no hand effect, so it is zeroed.
DELETE FROM `spellvisualkit` WHERE `id` = 90050;
CREATE TEMPORARY TABLE `_kc_kit` SELECT * FROM `spellvisualkit` WHERE `id` = 438;
UPDATE `_kc_kit` SET `id` = 90050, `right_hand_effect` = 0;
INSERT INTO `spellvisualkit` SELECT * FROM `_kc_kit`;
DROP TEMPORARY TABLE `_kc_kit`;

-- Kit 90051: impact ("IDEAS!" pop) — clone of stock 904, which already carries
-- head_effect 402 with start_anim/char_proc -1 like Cata 13736. anim_id -> 64
-- (EmoteTalkExclamation) and sound -> 15991 NetherPowerImpact: 3.3.5a has no
-- SoundEntries 22442, but 22442 is just netherpowerimpact.ogg and 15991 is the
-- same clip (netherpowerimpact.wav) already present in the client.
DELETE FROM `spellvisualkit` WHERE `id` = 90051;
CREATE TEMPORARY TABLE `_kc_kit` SELECT * FROM `spellvisualkit` WHERE `id` = 904;
UPDATE `_kc_kit` SET `id` = 90051, `anim_id` = 64, `sound_id` = 15991;
INSERT INTO `spellvisualkit` SELECT * FROM `_kc_kit`;
DROP TEMPORARY TABLE `_kc_kit`;
