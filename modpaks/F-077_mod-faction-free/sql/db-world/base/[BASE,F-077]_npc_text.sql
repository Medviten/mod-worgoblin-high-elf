/*This will update the broadcast_text, creature_text, and npc_text tables to ensure players can read NPC chat regardless of player faction.*/
UPDATE `broadcast_text` SET `LanguageID` = 0 WHERE `LanguageID` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `creature_text` SET `Language` = 0 WHERE `Language` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang0` = 0 WHERE `lang0` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang1` = 0 WHERE `lang1` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang2` = 0 WHERE `lang2` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang3` = 0 WHERE `lang3` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang4` = 0 WHERE `lang4` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang5` = 0 WHERE `lang5` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang6` = 0 WHERE `lang6` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `npc_text` SET `lang7` = 0 WHERE `lang7` IN (1,2,3,6,7,10,13,14,33,35);
