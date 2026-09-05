/*This will update the item_template table to ensure all items that are faction locked are no longer set as such to allow for
both cross-faction mount aquisition as well as faction specific quest drops since all quests are open at this point to both factions.*/
UPDATE `item_template` SET `FlagsExtra` = 0 WHERE `FlagsExtra` IN (1, 2);
UPDATE `item_template` SET `FlagsExtra` = 8192 WHERE `FlagsExtra` IN (8193, 8194);
UPDATE `item_template` SET `AllowableRace` = -1;
