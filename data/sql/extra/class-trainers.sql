/* Add NPC entries */
DELETE FROM `creature_template` WHERE `entry` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
/* Shadowglen Mage Trainer */
(62100, 0, 0, 0, 0, 0, 'Thaddius Dalrymple', 'Mage Trainer', NULL, 62100, 10, 10, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.2, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/* Dolanaar Mage Trainer */
(62101, 0, 0, 0, 0, 0, 'Oswald Dunsmore', 'Mage Trainer', NULL, 62101, 20, 20, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 0.8, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/* Darnassus Mage Trainer */
(62102, 0, 0, 0, 0, 0, 'Leah Ashcroft', 'Mage Trainer', NULL, 62102, 40, 40, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.1, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/* Shadowglen Warlock Trainer */
(62103, 0, 0, 0, 0, 0, 'Amelia Fearhart', 'Warlock Trainer', NULL, 62103, 10, 10, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.2, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/* Dolanaar Warlock Trainer */
(62104, 0, 0, 0, 0, 0, 'Lady Lovelace', 'Warlock Trainer', NULL, 62104, 20, 20, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 0.8, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/* Darnassus Warlock Trainer */
(62105, 0, 0, 0, 0, 0, 'Lord Gideon Blackwood', 'Warlock Trainer', NULL, 62105, 40, 40, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.1, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0);

/* Add display IDs */
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (92600, 92601, 92602, 92603, 92604, 92605);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(92600, 0.406, 1.5, 0, 0), -- Thaddius Dalrymple
(92601, 0.406, 1.5, 0, 0), -- Oswald Dunsmore
(92602, 0.406, 1.5, 1, 0), -- Leah Ashcroft
(92603, 0.406, 1.5, 1, 0), -- Amelia Fearhart
(92604, 0.406, 1.5, 1, 0), -- Lady Lovelace
(92605, 0.406, 1.5, 0, 0); -- Lord Gideon Blackwood

/* Associate creature IDs with display IDs */
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(62100, 0, 92600, 1, 1), -- Thaddius Dalrymple
(62101, 0, 92601, 1, 1), -- Oswald Dunsmore
(62102, 0, 92602, 1, 1), -- Leah Ashcroft
(62103, 0, 92603, 1, 1), -- Amelia Fearhart
(62104, 0, 92604, 1, 1), -- Lady Lovelace
(62105, 0, 92605, 1, 1); -- Lord Gideon Blackwood

/* Add NPCs to world */
DELETE FROM `creature` WHERE `guid` IN (6210000, 6210001, 6210002, 6210003, 6210004, 6210005);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(6210000, 62100, 0, 0, 1, 141, 256, 1, 1, 0, 10440.052, 771.8263, 1322.6658, 2.2232187, 300, 0, 0, 102, 0, 0, 0, 0, 0, '', 0, 0, NULL), -- Thaddius Dalrymple
(6210001, 62101, 0, 0, 1, 141, 256, 1, 1, 0, 9799.775, 973.43005, 1313.8927, 0.37601513, 300, 0, 0, 102, 0, 0, 0, 0, 0, '', 0, 0, NULL), -- Oswald Dunsmore
(6210002, 62102, 0, 0, 1, 1657, 1657, 1, 1, 0, 9662.262, 2515.0222, 1331.6708, 2.9128127, 300, 0, 0, 102, 0, 0, 0, 0, 0, '', 0, 0, NULL), -- Leah Ashcroft
(6210003, 62103, 0, 0, 1, 141, 256, 1, 1, 0, 10531.822, 780.97076, 1329.599, 2.516502, 300, 0, 0, 102, 0, 0, 0, 0, 0, '', 0, 0, NULL), -- Amelia Fearhart
(6210004, 62104, 0, 0, 1, 141, 256, 1, 1, 0, 9803.713, 977.55255, 1303.5801, 1.8839686, 300, 0, 0, 102, 0, 0, 0, 0, 0, '', 0, 0, NULL), -- Lady Lovelace
(6210005, 62105, 0, 0, 1, 1657, 1657, 1, 1, 0, 10121.33, 2516.2488, 1289.5824, 2.7164388, 300, 0, 0, 102, 0, 0, 0, 0, 0, '', 0, 0, NULL); -- Lord Gideon Blackwood

DELETE FROM `creature_default_trainer` WHERE `CreatureId` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES
(62100, 17), -- Thaddius Dalrymple
(62101, 16), -- Oswald Dunsmore
(62102, 16), -- Leah Ashcroft
(62103, 32), -- Amelia Fearhart
(62104, 31), -- Lady Lovelace
(62105, 31); -- Lord Gideon Blackwood

DELETE FROM `gossip_menu` WHERE `MenuID` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
/* Thaddius Dalrymple */
(62100, 621000), --  Mage
(62100, 621001), --  Non-Mage
/* Oswald Dunsmore */
(62101, 621010), -- Mage
(62101, 621011), -- Non-Mage
/* Leah Ashcroft */
(62102, 621020), -- Mage
(62102, 621021), -- Non-Mage
/* Amelia Fearhart */
(62103, 621030), -- Warlock
(62103, 621031), -- Non-Warlock
/* Lady Lovelace */
(62104, 621040), -- Warlock
(62104, 621041), -- Non-Warlock
(62104, 621042), -- Non-Warlock
/* Lord Gideon Blackwood */
(62105, 621050), -- Warlock
(62105, 621051); -- Non-Warlock

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
/* Thaddius Dalrymple */
(62100, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, '', 0, 0),
(62100, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 4461, 0, 0, 0, '', 0, 0),
(62100, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 10371, 0, 0, 0, '', 0, 0),
/* Oswald Dunsmore */
(62101, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, '', 0, 0),
(62101, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 4461, 0, 0, 0, '', 0, 0),
(62101, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 10371, 0, 0, 0, '', 0, 0),
/* Leah Ashcroft */
(62102, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, '', 0, 0),
(62102, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 4461, 0, 0, 0, '', 0, 0),
(62102, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 10371, 0, 0, 0, '', 0, 0),
/* Amelia Fearhart */
(62103, 0, 3, 'I am interested in mage training.', 2544, 5, 16, 0, 0, 0, 0, '', 0, 0),
(62103, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 4461, 0, 0, 0, '', 0, 0),
(62103, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 10371, 0, 0, 0, '', 0, 0),
/* Lady Lovelace */
(62104, 0, 3, 'I am interested in mage training.', 2544, 5, 16, 0, 0, 0, 0, '', 0, 0),
(62104, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 4461, 0, 0, 0, '', 0, 0),
(62104, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 10371, 0, 0, 0, '', 0, 0),
/* Lord Gideon Blackwood */
(62105, 0, 3, 'I am interested in mage training.', 2544, 5, 16, 0, 0, 0, 0, '', 0, 0),
(62105, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 4461, 0, 0, 0, '', 0, 0),
(62105, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 10371, 0, 0, 0, '', 0, 0);

DELETE FROM `npc_text` WHERE `ID` IN (621000, 621001, 621010, 621011, 621020, 621021, 621030, 621031, 621040, 621041, 621042, 621050, 621051);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`) VALUES
/* Thaddius Dalrymple */
(621000, 'Are you looking for training in the magical arts? You should be able to find somebody who can help you... ah, right here, yes, I can teach you.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Mage
(621001, 'Are you... no, you aren\'t. You would be better served by speaking with a... a $C trainer, yes, that would be best, I think.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Non-Mage
/* Oswald Dunsmore */
(621010, 'Ah, majestic! A fellow student of the arcane. Come, let us sit about and speak feverishly, chatting into the wee hours of new ideas, of the higher plane!', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Mage
(621011, 'My apologies, but I don\'t believe I\'m equipped to train someone with your particular, ah, aptitudes.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Non-Mage
/* Leah Ashcroft */
(621020, 'Hm? Oh, hello! Were you looking to study the arcane arts? I recently discovered a new spell while reading a biography of Antonidas. Perhaps we could practice it together?', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Mage
(621021, 'I\'m sorry, but my services are only of use to those well-versed in the arcane arts.$B$BIf you\'d like, we could discuss something else. I\'ve been reading a fascinting book on the War of the Ancients; it\'s given me a deeper understanding of the locals\' wariness of magic. One of the passages I found to be especially insightful was... oh, are you leaving already?', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Non-Mage
/* Amelia Fearhart */
(621030, 'Shh! Keep your voice down. I can provide guidance, but I don\'t need you drawing any more attention than I already have.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Warlock
(621031, 'I have no business with your ilk, $C. Begone.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Non-Warlock
/* Lady Lovelace */
(621040, 'Finally, some good company! I do so enjoy the tranquility of this place, but I could do without these bothersome elves.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Warlock
(621041, 'This is a lovely place, but it could do with fewer elves.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Non-Warlock
(621042, 'This is a lovely place, but it could do with fewer elves.$B$BYes, that includes you. Hurry along and leave me to my reverie.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Night Elf
/* Lord Gideon Blackwood */
(621050, 'I don\'t suffer fools. You will learn swiftly, or you will learn elsewhere.', NULL, 0, 1, 0, 0, 0, 0, 0, 0), -- Warlock
(621051, 'What could possibly compel a bumbling vagrant with delusions of grandeur to go out of $g his:her; way to waste my time in a place like this? Surely, you must have more pressing matters to attend to. Perhaps the local swamp hermit is in need of some bear asses to hang from his mantle?', NULL, 0, 1, 0, 0, 0, 0, 0, 0); -- Non-Warlock

DELETE FROM `conditions` WHERE `SourceGroup` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
/* Thaddius Dalrymple */
(14, 62100, 621000, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Mage
(14, 62100, 621001, 0, 0, 15, 0, 1407, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Non-Mage
(15, 62100, 0, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Mage training
(15, 62100, 1, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Unlearn talents
(15, 62100, 2, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Learn dual spec
/* Oswald Dunsmore */
(14, 62101, 621010, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Mage
(14, 62101, 621011, 0, 0, 15, 0, 1407, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Non-Mage
(15, 62101, 0, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Mage training
(15, 62101, 1, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Unlearn talents
(15, 62101, 2, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Learn dual spec
/* Leah Ashcroft */
(14, 62102, 621020, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Mage
(14, 62102, 621021, 0, 0, 15, 0, 1407, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Non-Mage
(15, 62102, 0, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Mage training
(15, 62102, 1, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Unlearn talents
(15, 62102, 2, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Show gossip if player is a mage'), -- Learn dual spec
/* Amelia Fearhart */
(14, 62103, 621030, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Warlock
(14, 62103, 621031, 0, 0, 15, 0, 1279, 0, 0, 0, 0, 0, '', 'Show gossip if player is not a warlock'), -- Non-Warlock
(15, 62103, 0, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Warlock training
(15, 62103, 1, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Unlearn talents
(15, 62103, 2, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Learn dual spec
/* Lady Lovelace */
/* Warlock */
(14, 62104, 621040, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'),
/* Non-warlock */
(14, 62104, 621041, 0, 0, 15, 0, 256, 0, 0, 1, 0, 0, '', 'Show gossip if player is not a warlock'),
(14, 62104, 621041, 0, 0, 16, 0, 8, 0, 0, 1, 0, 0, '', 'Show gossip if player is not a night elf'),
/* Night Elf (non-warlock) */
(14, 62104, 621042, 0, 0, 16, 0, 8, 0, 0, 0, 0, 0, '', 'Show gossip if player is a night elf'),
(14, 62104, 621042, 0, 0, 15, 0, 256, 0, 0, 1, 0, 0, '', 'Show gossip if player is a not a warlock'),
(15, 62104, 0, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Warlock training
(15, 62104, 1, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Unlearn talents
(15, 62104, 2, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Learn dual spec
/* Lord Gideon Blackwood */
(14, 62105, 621050, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Warlock
(14, 62105, 621051, 0, 0, 15, 0, 1279, 0, 0, 0, 0, 0, '', 'Show gossip if player is not a warlock'), -- Non-Warlock
(15, 62105, 0, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Warlock training
(15, 62105, 1, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'), -- Unlearn talents
(15, 62105, 2, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Show gossip if player is a warlock'); -- Learn dual spec