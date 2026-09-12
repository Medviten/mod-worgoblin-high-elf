-- [I-282] Monkey Business banana visuals — kits.
--
-- Only ONE kit has to be rebuilt. Cata 4.3.4 (Whitemane 15595) SpellVisual 14348
-- (67919 Exploding Bananas) uses:
--   precast_kit 13259 = anim 61 EmoteEat + left_hand_effect 4940 "Missile: Banana"
--                       (World\Generic\PassiveDoodads\Fruits\Fruit_banana.mdx)
--                       -> the monkey eating the banana through the 1.5s cast
--   cast_kit    836   = base_effect 257 "Bomb Explosion" (Spells\Bomb_ExplosionA.mdx)
--                       + sound 38 Immolate  -> STOCK in 3.3.5a, used as-is
--   state_kit   8299  = chest_effect 3706 "Small Smoke Flare, White"
--                       (spells\SmokeFlare_White.mdx) -> STOCK in 3.3.5a, used as-is
--   impact_kit  0     -> nothing to port
-- 836 and 8299 already exist here with byte-identical payloads (verified against
-- the Cata rows through the +1 field shift), so only 13259 needs a new row: it is
-- a Cata-range id absent from our SpellVisualKit.
--
-- Effectnames 4940, 257 and 3706 all exist in 3.3.5a with the same .mdx paths, so
-- this ships NO assets — pure DBC rows.
--
-- The throw side (67917) needs no kit at all: see [I-282]_spellvisual.sql.

-- Kit 90052: the monkey eats the banana. Clone of stock 462, which is already the
-- exact structural twin of Cata 13259 (start_anim -1, anim 61 EmoteEat, a
-- LEFT-hand effect, everything else 0, char_proc 1-4 = -1) and differs only in
-- which prop is held: 242 instead of the banana. Cata puts the banana in the left
-- hand (source field index 7 = left_hand_effect after the 4.0 AnimKitID shift);
-- every stock WotLK eat kit uses the right hand instead, but the Cata authoring is
-- kept here since it was written against this same monkey model.
DELETE FROM `spellvisualkit` WHERE `id` = 90052;
CREATE TEMPORARY TABLE `_nb_kit` SELECT * FROM `spellvisualkit` WHERE `id` = 462;
UPDATE `_nb_kit` SET `id` = 90052, `left_hand_effect` = 4940;
INSERT INTO `spellvisualkit` SELECT * FROM `_nb_kit`;
DROP TEMPORARY TABLE `_nb_kit`;
