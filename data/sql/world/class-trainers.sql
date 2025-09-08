/*Add NPC entries*/
DELETE FROM `creature_template` WHERE `entry` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
/*Shadowglen Mage Trainer*/
(62100, 0, 0, 0, 0, 0, 'Thaddius Dalrymple', 'Mage Trainer', NULL, 62100, 10, 10, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.2, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 8, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/*Dolanaar Mage Trainer*/
(62101, 0, 0, 0, 0, 0, 'Oswald Dunsmore', 'Mage Trainer', NULL, 62101, 20, 20, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 0.8, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 8, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/*Darnassus Mage Trainer*/
(62102, 0, 0, 0, 0, 0, 'Leah Ashcroft', 'Mage Trainer', NULL, 62102, 40, 40, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.1, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 8, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/*Shadowglen Warlock Trainer*/
(62103, 0, 0, 0, 0, 0, 'Amelia Fearhart', 'Warlock Trainer', NULL, 62103, 10, 10, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.2, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 9, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/*Dolanaar Warlock Trainer*/
(62104, 0, 0, 0, 0, 0, 'Lady Lovelace', 'Warlock Trainer', NULL, 62104, 20, 20, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 0.8, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 9, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0),
/*Darnassus Warlock Trainer*/
(62105, 0, 0, 0, 0, 0, 'Lord Gideon Blackwood', 'Warlock Trainer', NULL, 62105, 40, 40, 0, 79, 51, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1.1, 1500, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 9, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0);

/*Add display IDs*/
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (92600, 92601, 92602, 92603, 92604, 92605);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
(92600, 0.406, 1.5, 0, 0), -- Thaddius Dalrymple
(92601, 0.406, 1.5, 0, 0), -- Oswald Dunsmore
(92602, 0.406, 1.5, 1, 0), -- Leah Ashcroft
(92603, 0.406, 1.5, 1, 0), -- Amelia Fearhart
(92604, 0.406, 1.5, 1, 0), -- Lady Lovelace
(92605, 0.406, 1.5, 0, 0); -- Lord Gideon Blackwood

/*Associate extended display IDs with textures*/
DELETE FROM `creaturedisplayinfoextra_dbc` WHERE `ID` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `creaturedisplayinfoextra_dbc` (`ID`, `DisplayRaceID`, `DisplaySexID`, `SkinID`, `FaceID`, `HairStyleID`, `HairColorID`, `FacialHairID`, `NPCItemDisplay1`, `NPCItemDisplay2`, `NPCItemDisplay3`, `NPCItemDisplay4`, `NPCItemDisplay5`, `NPCItemDisplay6`, `NPCItemDisplay7`, `NPCItemDisplay8`, `NPCItemDisplay9`, `NPCItemDisplay10`, `NPCItemDisplay11`, `Flags`, `BakeName`) VALUES
/*Thaddius Dalrymple*/
(62100,
12, 0,
3, 4, 3, 3, 0,
0, 0, 0, 12656, 0, 0, 0, 0, 0, 0, 0,
0, 'CreatureDisplayExtra-62100.blp'),
/*Oswald Dunsmore*/
(62101,
12, 0,
1, 3, 4, 2, 0,
0, 0, 0, 30868, 0, 0, 0, 0, 0, 0, 0,
0, 'CreatureDisplayExtra-62101.blp'),
/*Leah Ashcroft*/
(62102,
12, 1,
4, 13, 15, 1, 0,
0, 0, 0, 12673, 0, 0, 0, 0, 0, 0, 0,
0, 'CreatureDisplayExtra-62102.blp'),
/*Amelia Fearhart*/
(62103,
12, 1,
7, 5, 13, 0, 0,
0, 0, 0, 12646, 0, 0, 0, 0, 0, 0, 0,
0, 'CreatureDisplayExtra-62103.blp'),
/*Lady Lovelace*/
(62104,
12, 1,
8, 2, 7, 4, 0,
0, 0, 0, 12696, 11533, 0, 0, 0, 0, 0, 0,
0, 'CreatureDisplayExtra-62104.blp'),
/*Lord Gideon Blackwood*/
(62105,
12, 0,
2, 1, 0, 4, 0,
0, 0, 0, 0, 25225, 43193, 0, 0, 0, 0, 0,
0, 'CreatureDisplayExtra-62105.blp');

/*Associate display ID with worgen model and extended display ID*/
DELETE FROM `creaturedisplayinfo_dbc` WHERE `ID` IN (92600, 92601, 92602, 92603, 92604, 92605);
INSERT INTO `creaturedisplayinfo_dbc` (`ID`, `ModelID`, `SoundID`, `ExtendedDisplayInfoID`, `CreatureModelScale`, `CreatureModelAlpha`, `TextureVariation_1`, `TextureVariation_2`, `TextureVariation_3`, `PortraitTextureName`, `BloodLevel`, `BloodID`, `NPCSoundID`, `ParticleColorID`, `CreatureGeosetData`, `ObjectEffectPackageID`) VALUES
/*Thaddius Dalrymple*/
(92600, 3141, 0, 30, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
/*Oswald Dunsmore*/
(92601, 3141, 0, 45, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
/*Leah Ashcroft*/
(92602, 3142, 0, 54, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
/*Amelia Fearhart*/
(92603, 3142, 0, 57, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
/*Lady Lovelace*/
(92604, 3142, 0, 58, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0),
/*Lord Gideon Blackwood*/
(92605, 3141, 0, 59, 1, 255, '', '', '', '', 1, 0, 0, 0, 0, 0);

/*Associate creature IDs with display IDs*/
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(62100, 0, 92600, 1, 1), -- Thaddius Dalrymple
(62101, 0, 92601, 1, 1), -- Oswald Dunsmore
(62102, 0, 92602, 1, 1), -- Leah Ashcroft
(62103, 0, 92603, 1, 1), -- Amelia Fearhart
(62104, 0, 92604, 1, 1), -- Lady Lovelace
(62105, 0, 92605, 1, 1); -- Lord Gideon Blackwood

/*Add NPCs to world*/
DELETE FROM `creature` WHERE `guid` IN (6210000, 6210001, 6210002, 6210003, 6210004, 6210005);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
/*Thaddius Dalrymple*/
(6210000, -- guid 1
62100, -- id1 2
0, -- id2 3
0, -- id3 4
1, -- map 5
141, -- zoneId 6
256, -- areaId 7
1, -- spawnMask 8
1, -- phaseMask 9
0, -- equipment_id 10
10440.052, -- position_x 11
771.8263, -- position_y 12
1322.6658, -- position_z 13
2.2232187, -- orientation 14
300, -- spawntimesecs 15
0, -- wander_distance 16
0, -- currentwaypoint 17
102, -- curhealth 18
0, -- curmana 19
0, -- MovementType 20
0, -- npcflag 21
0, -- unit_flags 22
0, -- dynamicflags 23
'', -- ScriptName 24
0, -- VerifiedBuild 25
0, -- CreateObject 26
NULL -- Comment 27
),
/*Oswald Dunsmore*/
(6210001, -- guid 1
62101, -- id1 2
0, -- id2 3
0, -- id3 4
1, -- map 5
141, -- zoneId 6
256, -- areaId 7
1, -- spawnMask 8
1, -- phaseMask 9
0, -- equipment_id 10
9799.775, -- position_x 11
973.43005, -- position_y 12
1313.8927, -- position_z 13
0.37601513, -- orientation 14
300, -- spawntimesecs 15
0, -- wander_distance 16
0, -- currentwaypoint 17
102, -- curhealth 18
0, -- curmana 19
0, -- MovementType 20
0, -- npcflag 21
0, -- unit_flags 22
0, -- dynamicflags 23
'', -- ScriptName 24
0, -- VerifiedBuild 25
0, -- CreateObject 26
NULL -- Comment 27
),
/*Leah Ashcroft*/
(6210002, -- guid 1
62102, -- id1 2
0, -- id2 3
0, -- id3 4
1, -- map 5
1657, -- zoneId 6
1657, -- areaId 7
1, -- spawnMask 8
1, -- phaseMask 9
0, -- equipment_id 10
9662.262, -- position_x 11
2515.0222, -- position_y 12
1331.6708, -- position_z 13
2.9128127, -- orientation 14
300, -- spawntimesecs 15
0, -- wander_distance 16
0, -- currentwaypoint 17
102, -- curhealth 18
0, -- curmana 19
0, -- MovementType 20
0, -- npcflag 21
0, -- unit_flags 22
0, -- dynamicflags 23
'', -- ScriptName 24
0, -- VerifiedBuild 25
0, -- CreateObject 26
NULL -- Comment 27
),
/*Amelia Fearhart*/
(6210003, -- guid 1
62103, -- id1 2
0, -- id2 3
0, -- id3 4
1, -- map 5
141, -- zoneId 6
256, -- areaId 7
1, -- spawnMask 8
1, -- phaseMask 9
0, -- equipment_id 10
10432.833, -- position_x 11
880.5583, -- position_y 12
1318.2678, -- position_z 13
0.9940506, -- orientation 14
300, -- spawntimesecs 15
0, -- wander_distance 16
0, -- currentwaypoint 17
102, -- curhealth 18
0, -- curmana 19
0, -- MovementType 20
0, -- npcflag 21
0, -- unit_flags 22
0, -- dynamicflags 23
'', -- ScriptName 24
0, -- VerifiedBuild 25
0, -- CreateObject 26
NULL -- Comment 27
),
/*Lady Lovelace*/
(6210004, -- guid 1
62104, -- id1 2
0, -- id2 3
0, -- id3 4
1, -- map 5
141, -- zoneId 6
256, -- areaId 7
1, -- spawnMask 8
1, -- phaseMask 9
0, -- equipment_id 10
9803.713, -- position_x 11
977.55255, -- position_y 12
1303.5801, -- position_z 13
1.8839686, -- orientation 14
300, -- spawntimesecs 15
0, -- wander_distance 16
0, -- currentwaypoint 17
102, -- curhealth 18
0, -- curmana 19
0, -- MovementType 20
0, -- npcflag 21
0, -- unit_flags 22
0, -- dynamicflags 23
'', -- ScriptName 24
0, -- VerifiedBuild 25
0, -- CreateObject 26
NULL -- Comment 27
),
/*Lord Gideon Blackwood*/
(6210005, -- guid 1
62105, -- id1 2
0, -- id2 3
0, -- id3 4
1, -- map 5
1657, -- zoneId 6
1657, -- areaId 7
1, -- spawnMask 8
1, -- phaseMask 9
0, -- equipment_id 10
10121.33, -- position_x 11
2516.2488, -- position_y 12
1289.5824, -- position_z 13
2.7164388, -- orientation 14
300, -- spawntimesecs 15
0, -- wander_distance 16
0, -- currentwaypoint 17
102, -- curhealth 18
0, -- curmana 19
0, -- MovementType 20
0, -- npcflag 21
0, -- unit_flags 22
0, -- dynamicflags 23
'', -- ScriptName 24
0, -- VerifiedBuild 25
0, -- CreateObject 26
NULL -- Comment 27
);

/*Add spells to trainers*/
DELETE FROM `npc_trainer` WHERE `ID` IN (62100, 62101, 62102, 62103, 62104, 62105);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(62100, -200007, 0, 0, 0, 0, 0),
(62101, -200007, 0, 0, 0, 0, 0),
(62101, -200008, 0, 0, 0, 0, 0),
(62102, -200007, 0, 0, 0, 0, 0),
(62102, -200008, 0, 0, 0, 0, 0),
(62103, -200009, 0, 0, 0, 0, 0),
(62104, -200009, 0, 0, 0, 0, 0),
(62104, -200010, 0, 0, 0, 0, 0),
(62105, -200009, 0, 0, 0, 0, 0),
(62105, -200010, 0, 0, 0, 0, 0);