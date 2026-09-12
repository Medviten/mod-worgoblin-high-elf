-- I-324: F-011 vendor-path armour shipped with MaxDurability = 0 -- it never takes
-- durability damage and can never be repaired.
--
-- Same root cause as zz_[I-324]_vendor_weapon_damage.sql: goblin_gen/vendors.py builds
-- these rows from the Whitemane 4.3.4 (build 15595) Item-sparse.db2, which does not
-- store MaxDurability (the 4.3.4 client derives it at runtime). Values below are the
-- authoritative wago Cata Classic 4.4.2 ItemSparse rows, keyed on the Cata id.
--
-- MUST BE PAIRED with a characters-DB repair. These items shipped at 0, so every copy
-- already in a player's bags has item_instance.durability = 0; raising MaxDurability
-- alone makes them read 0/60 -- broken, granting no stats. Applied 2026-08-08 together
-- with this repair (all affected copies belonged to one offline character):
--
--   UPDATE item_instance ii
--     JOIN acore_world.item_template it ON it.entry = ii.itemEntry
--     SET ii.durability = it.MaxDurability
--     WHERE ii.itemEntry BETWEEN 84424 AND 84459
--       AND ii.durability = 0 AND it.MaxDurability > 0;
--
-- Re-run that repair (idempotent, scoped) if this file is ever applied to a DB whose
-- item_instance rows predate it.
--
-- All ids are owned by zz_[AUTO,F-011]_05_item_template.sql; this file sorts after it
-- and overrides this one column. One consolidated UPDATE per id.
-- SERVER-SIDE ONLY: worldserver restart to pick up item_template.


UPDATE item_template SET MaxDurability = 60  WHERE entry = 84424;  -- Waterlogged Cloth Vest         (Cata 49241)
UPDATE item_template SET MaxDurability = 20  WHERE entry = 84425;  -- Waterlogged Cloth Belt         (Cata 49242)
UPDATE item_template SET MaxDurability = 45  WHERE entry = 84426;  -- Waterlogged Cloth Pants        (Cata 49243)
UPDATE item_template SET MaxDurability = 30  WHERE entry = 84427;  -- Waterlogged Cloth Boots        (Cata 49244)
UPDATE item_template SET MaxDurability = 20  WHERE entry = 84428;  -- Waterlogged Cloth Bracers      (Cata 49245)
UPDATE item_template SET MaxDurability = 20  WHERE entry = 84429;  -- Waterlogged Cloth Gloves       (Cata 49246)

UPDATE item_template SET MaxDurability = 20  WHERE entry = 84430;  -- Drenched Leather Belt          (Cata 49247)
UPDATE item_template SET MaxDurability = 30  WHERE entry = 84431;  -- Drenched Leather Boots         (Cata 49248)
UPDATE item_template SET MaxDurability = 20  WHERE entry = 84432;  -- Drenched Leather Bracers       (Cata 49249)
UPDATE item_template SET MaxDurability = 20  WHERE entry = 84433;  -- Drenched Leather Gloves        (Cata 49250)
UPDATE item_template SET MaxDurability = 45  WHERE entry = 84434;  -- Drenched Leather Pants         (Cata 49251)
UPDATE item_template SET MaxDurability = 60  WHERE entry = 84435;  -- Drenched Leather Vest          (Cata 49252)

UPDATE item_template SET MaxDurability = 75  WHERE entry = 84440;  -- Salvaged Chain Armor           (Cata 49259)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84441;  -- Salvaged Chain Belt            (Cata 49260)
UPDATE item_template SET MaxDurability = 35  WHERE entry = 84442;  -- Salvaged Chain Boots           (Cata 49261)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84443;  -- Salvaged Chain Bracers         (Cata 49262)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84444;  -- Salvaged Chain Gloves          (Cata 49263)
UPDATE item_template SET MaxDurability = 55  WHERE entry = 84445;  -- Salvaged Chain Leggings        (Cata 49264)

UPDATE item_template SET MaxDurability = 25  WHERE entry = 84446;  -- Recovered Knit Belt            (Cata 49265)
UPDATE item_template SET MaxDurability = 35  WHERE entry = 84447;  -- Recovered Knit Boots           (Cata 49266)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84448;  -- Recovered Knit Bracers         (Cata 49267)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84449;  -- Recovered Knit Gloves          (Cata 49268)
UPDATE item_template SET MaxDurability = 55  WHERE entry = 84450;  -- Recovered Knit Pants           (Cata 49269)
UPDATE item_template SET MaxDurability = 75  WHERE entry = 84451;  -- Recovered Knit Vest            (Cata 49270)

UPDATE item_template SET MaxDurability = 25  WHERE entry = 84452;  -- Water-Stained Leather Belt     (Cata 49271)
UPDATE item_template SET MaxDurability = 35  WHERE entry = 84453;  -- Water-Stained Leather Boots    (Cata 49272)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84454;  -- Water-Stained Leather Bracers  (Cata 49273)
UPDATE item_template SET MaxDurability = 25  WHERE entry = 84455;  -- Water-Stained Leather Gloves   (Cata 49274)
UPDATE item_template SET MaxDurability = 75  WHERE entry = 84456;  -- Water-Stained Leather Harness  (Cata 49275)
UPDATE item_template SET MaxDurability = 55  WHERE entry = 84457;  -- Water-Stained Leather Pants    (Cata 49276)
