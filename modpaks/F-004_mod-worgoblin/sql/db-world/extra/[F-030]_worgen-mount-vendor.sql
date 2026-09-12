SET @WorgenMask = 2048;
SET @GilneasFaction = 1165;
SET @Exalted = 128;
SET @PlaceholderDisplayID = 0; -- TODO: replace with a real human female CreatureDisplayID before running

DELETE FROM `gossip_menu` WHERE `MenuID` = 12440 AND `TextID` IN (100002, 100003);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(12440, 100002),
(12440, 100003);

DELETE FROM `broadcast_text` WHERE `ID` IN (100002, 100003);
INSERT INTO `broadcast_text` (`ID`, `LanguageID`, `MaleText`, `FemaleText`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `SoundEntriesId`, `EmotesID`, `Flags`, `VerifiedBuild`) VALUES
(100002, 0, 'Looking for a mount that can handle Gilnean terrain? I\'ve got just the horse for you.', 'Looking for a mount that can handle Gilnean terrain? I\'ve got just the horse for you.', 1, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(100003, 0, 'These horses are bred for our own people, $c. The Circle could make an exception if you were exalted with Gilneas, however...', 'These horses are bred for our own people, $c. The Circle could make an exception if you were exalted with Gilneas, however...', 1, 0, 0, 0, 0, 0, 0, 0, 1, 0);

DELETE FROM `npc_text` WHERE `ID` IN (100002, 100003);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES
(100002, 'Looking for a mount that can handle Gilnean terrain? I\'ve got just the horse for you.', 'Looking for a mount that can handle Gilnean terrain? I\'ve got just the horse for you.', 100002, 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100003, 'These horses are bred for our own people, $c. The Circle could make an exception if you were exalted with Gilneas, however...', 'These horses are bred for our own people, $c. The Circle could make an exception if you were exalted with Gilneas, however...', 100003, 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_template` WHERE `entry` = 48514;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(48514, 0, 0, 0, 0, 0, 'Astrid Langstrump', 'Mountain Horse Handler', NULL, 12440, 45, 45, 0, 12, 129, 1, 1.14286, 1, 1, 20, 1, 0, 1, 2000, 2000, 1, 1, 1, 512, 2048, 0, 0, 7, 134217728, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 2, '', 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = 48514;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(48514, 0, @PlaceholderDisplayID, 1, 1, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14, 15) AND `SourceGroup` = 12440;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14, 12440, 100002, 0, 0, 16, 0, @WorgenMask, 0, 0, 0, 0, 0, '', 'NPC Text - Show if Player is Worgen'),
(14, 12440, 100002, 0, 1, 5, 0, @GilneasFaction, @Exalted, 0, 0, 0, 0, '', 'NPC Text - Show if Player is Exalted with Gilneas'),
(14, 12440, 100003, 0, 0, 16, 0, @WorgenMask, 0, 0, 1, 0, 0, '', 'NPC Text - Show if Player is not Worgen'),
(14, 12440, 100003, 0, 0, 5, 0, @GilneasFaction, @Exalted, 0, 1, 0, 0, '', 'NPC Text - Show if Player is not Exalted with Gilneas'),
(15, 12440, 0, 0, 0, 16, 0, @WorgenMask, 0, 0, 0, 0, 0, '', 'Gossip Option - Show if Player is Worgen'),
(15, 12440, 0, 0, 1, 5, 0, @GilneasFaction, @Exalted, 0, 0, 0, 0, '', 'Gossip Option - Show if Player is Exalted with Gilneas');

DELETE FROM `npc_vendor` WHERE `entry` = 48514;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES
(48514, 0, 73838, 0, 0, 0, 0),
(48514, 0, 73839, 0, 0, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 12440;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(12440, 0, 1, 'I would like to buy from you.', 14967, 3, 128, 0, 0, 0, 0, NULL, 0, 0);