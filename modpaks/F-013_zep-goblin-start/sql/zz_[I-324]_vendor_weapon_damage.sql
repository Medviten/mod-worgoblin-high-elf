-- I-324: F-011 vendor thrown weapons have no damage (84438 Seashell Throwing Axe,
-- 84439 Light Throwing Tusk), and every ported ranged weapon has RangedModRange = 0.
--
-- Root cause 1 (zero damage) -- goblin_gen/vendors.py.
--   The vendor-goods item emitter recovers item_template from the extracted Whitemane
--   4.3.4 (build 15595) Item-sparse.db2, which does NOT store weapon damage/speed
--   (the 4.3.4 client derives those in-client from ItemDamage*.dbc). vendors.py
--   therefore hardcoded `dmg_min1 = 0.0 / dmg_max1 = 0.0` and never wrote `delay`,
--   so the row landed at 0-0 damage with the item_template DEFAULT delay 1000.
--   goblin_gen/items.py -- the emitter every OTHER F-011 weapon goes through -- reads
--   the wago Cata Classic 4.4.2 ItemSparse CSV instead, which DOES carry
--   MinDamage_0/MaxDamage_0/ItemDelay. That is why only these two weapons are broken:
--   they are the only two of the 47 vendor-path items (84424-84459, 84494-84504) that
--   are class 2, and the vendor path is the only path missing the damage source.
--
-- Root cause 2 (ranged range) -- goblin_gen/items.py.
--   `cols["RangedModRange"] = 0` was hardcoded, dropping the Cata `ItemRange` field.
--   Stock 3.3.5a ships RangedModRange = 100 on every real bow/gun/crossbow/thrown
--   (only "Monster -"/"NPC Equip" placeholders carry 0); 0 breaks the client-side
--   ranged attack range check.
--
-- Fixed at source in both emitters (vendors.py now joins the wago 4.4.2 ItemSparse
-- for damage/speed/range/durability; items.py reads ItemRange). This file carries the
-- same values to the live rows so they are correct before the next gen run.
--
-- Values are the authoritative Cata source rows (wago itemsparse_442, Cata ids
-- 49257/49258/52909/52950/54298) -- unmodified, matching how every other F-011
-- weapon was ported.
--
-- All five ids are owned by zz_[AUTO,F-011]_05_item_template.sql; this file sorts
-- after it and overrides these columns only. One consolidated UPDATE per id.
-- SERVER-SIDE ONLY: worldserver restart to pick up item_template.

-- Thrown (Brett "Coins" McQuid, Lost Isles) -- were 0-0 dmg @ delay 1000.
UPDATE item_template SET
  dmg_min1 = 2,
  dmg_max1 = 4,
  delay = 1800,
  RangedModRange = 100
WHERE entry = 84438;  -- Seashell Throwing Axe   (Cata 49257) 1.67 dps

UPDATE item_template SET
  dmg_min1 = 1,
  dmg_max1 = 3,
  delay = 1600,
  RangedModRange = 100
WHERE entry = 84439;  -- Light Throwing Tusk     (Cata 49258) 1.25 dps

-- Guns -- damage/speed were already correct (items.py path); only range was dropped.
UPDATE item_template SET RangedModRange = 100 WHERE entry = 84352;  -- Mini B.C. Eliminator (Cata 52909)
UPDATE item_template SET RangedModRange = 100 WHERE entry = 84389;  -- Whamo Kablamo        (Cata 52950)
UPDATE item_template SET RangedModRange = 100 WHERE entry = 84481;  -- Skyrocket Gun        (Cata 54298, quest 14071 choice reward)
