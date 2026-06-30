-- These gray items should be white instead, so the mod-junk-to-gold module doesn't automatically sell them.
UPDATE item_template SET Quality = 1 WHERE entry = 6196; -- Noboru's Cudgel (quest item)