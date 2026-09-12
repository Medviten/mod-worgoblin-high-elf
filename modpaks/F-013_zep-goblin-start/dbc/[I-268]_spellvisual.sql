-- [I-268] Kaja'Cola (70478) spell visual — the visual row.
--
-- Port of Cata 4.3.4 SpellVisual 14885 onto custom id 90050 (Cata visual ids are
-- absent from our SpellVisual.dbc, so 70478 was pointing at nothing and the item
-- played no animation at all — see [I-268]_spellvisualkit.sql for the chain).
-- Kits: precast 90050 (EmoteEat + food-heal glow + drinking sound), impact 90051
-- (EmoteTalkExclamation + head poof + impact sound). Cata's cast_kit 13739 and
-- state_kit 13735 are empty rows, so they stay 0 here.
-- 70478 has a 1.5s cast (spellcasttimes 16), so the precast drink plays through
-- the cast and the impact pops on completion, right before the I-259 idea shout.
-- missile_* left at the 3.3.5a defaults for a non-missile visual (has_missile 0):
-- Cata's row carries 300/750/4 in the missile-follow fields, which are inert and
-- unlike every stock WotLK row.
DELETE FROM `spellvisual` WHERE `id` = 90050;
INSERT INTO `spellvisual` (`id`, `precast_kit`, `impact_kit`, `missile_dest_attachment`, `missile_attachment`)
  VALUES (90050, 90050, 90051, 1, 4294967295);
