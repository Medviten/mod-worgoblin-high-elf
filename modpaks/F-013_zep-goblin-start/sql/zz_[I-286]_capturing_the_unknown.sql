-- ============================================================
-- I-286  Quest 14031 "Capturing the Unknown" — camera markers & photography
-- ============================================================
-- CONSOLIDATED file: replaces the former zz_[I-289/291/292/293/294/295/296/297/
-- 298/300] camera files with the net FINAL state. Full history and rationale live
-- in the Joplin note "I-286 Quest 14031 Capturing the Unknown (F-011)".
--
-- The mechanic, end to end:
--   * The four objectives are the "Capturing The Unknown - Bunny" creatures
--     37872/37895/37896/37897 (AUTO-owned), wearing the retroported spinning
--     Selfie Camera display 900201 (dbc/[I-286]_capturing_the_unknown.sql).
--     Rotation + vertical bob are baked into the M2's Stand loop — no SAI motion.
--   * Each bunny carries a per-marker MOD_INVISIBILITY aura (68231/70686/70687/
--     70688, AUTO-owned addon values); Dampwick grants the four matching "See
--     Invis" detects on quest accept (section 4), and each photograph strips that
--     marker's detect (AUTO actionlist row) so photographed markers vanish.
--   * Item 49887 casts spell 68280, which now carries its OWN SpellVisual (flash
--     cone + UseStanding hands anim, one packet) and targets 38 NEARBY_ENTRY
--     (0-20 yd) — casting away from a marker fails with "Invalid target".
--     The bunny's SPELLHIT event runs its actionlist: kill credit (3 s develop
--     delay, AUTO row) + detect strip. Everything else the port bolted on is
--     deleted in section 6.

SET @B1 = 37872; SET @B2 = 37895; SET @B3 = 37896; SET @B4 = 37897;
SET @DAMPWICK  = 35769;      -- quest 14031 giver (Kaja'mine, phase 1)
SET @CAM_DISPLAY = 900201;   -- retroported spinning Selfie Camera (client DBC)
SET @ORB = 900301;           -- hovering orb companion creature

-- ---------------------------------------------------------------
-- 1. Camera display on the bunnies (AUTO owns creature_template_model -> UPDATE)
-- + the server-side bounding row the custom display needs.
-- ---------------------------------------------------------------
DELETE FROM `creature_model_info` WHERE `DisplayID` = @CAM_DISPLAY;
INSERT INTO `creature_model_info` SET
  `DisplayID` = @CAM_DISPLAY,
  `BoundingRadius` = 0.35,
  `CombatReach` = 0.5,
  `Gender` = 2,
  `DisplayID_Other_Gender` = 0,
  `VerifiedBuild` = 0;

UPDATE `creature_template_model` SET `CreatureDisplayID` = @CAM_DISPLAY
WHERE `CreatureID` IN (@B1, @B2, @B3, @B4) AND `Idx` = 0;

-- ---------------------------------------------------------------
-- 2. Marker 2 relocated to the bone ladder at Shipwreck Shore (spawn row owned by
-- zz_[F-011]_creatures_06_buzzbox_spawns.sql -> UPDATE keyed on its stable guid).
-- Ground is Z -9.918914 (.gps FloorZ); the marker hangs ~5 yd above it.
-- ---------------------------------------------------------------
UPDATE `creature` SET
  `position_x` = 108.59127,
  `position_y` = -9817.344,
  `position_z` = -4.918914,
  `orientation` = 2.4943004
WHERE `guid` = 6700002 AND `id` = @B2;

-- ---------------------------------------------------------------
-- 3. Objective text: monkey-artist puns for the three paintings; objective 4 is
-- the pygmy altar, not a painting (quest_template is AUTO-owned -> one UPDATE).
-- ---------------------------------------------------------------
UPDATE `quest_template` SET
  `LogDescription` = 'Using your KTC Snapflash, capture images at the bouncing cameras of the three monkey masterworks and the pygmy altar.',
  `ObjectiveText1` = 'A Bananksy original photographed',
  `ObjectiveText2` = 'A Chimpicasso photographed',
  `ObjectiveText3` = 'A Vincent van Grunt photographed',
  `ObjectiveText4` = 'Pygmy Altar Captured'
WHERE `ID` = 14031;

-- ---------------------------------------------------------------
-- 4. Detect grant on quest accept. Nothing in the source dump GRANTS the detects
-- (quest SourceSpellId is 0; the source only removes them), so they are wired to
-- Dampwick's ACCEPTED_QUEST event. Must be INVOKER_CAST (134): the detect spells
-- are TARGET_UNIT_CASTER, so a plain SMART_ACTION_CAST would buff DAMPWICK.
-- Dampwick's ids 0-5 are AUTO-owned; these append at 20-23.
-- ---------------------------------------------------------------
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = @DAMPWICK AND `id` BETWEEN 20 AND 23;
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,
   `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@DAMPWICK, 0, 20, 21, 19, 0, 100, 0, 14031, 0, 0, 0, 0,
   134, 70661, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,
   'Dampwick - Accept 14031 - grant See Invis Bunny 1'),
(@DAMPWICK, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   134, 70678, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,
   'Dampwick - Accept 14031 - grant See Invis Bunny 2'),
(@DAMPWICK, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   134, 70680, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,
   'Dampwick - Accept 14031 - grant See Invis Bunny 3'),
(@DAMPWICK, 0, 23, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   134, 70681, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,
   'Dampwick - Accept 14031 - grant See Invis Bunny 4');

-- ---------------------------------------------------------------
-- 5. Bunny SAI: AUTO owns id 0 (SPELLHIT 68280 -> actionlist). The SAI spin
-- (id 1, retired — rotation is in the M2) and hover (id 2) rows are gone.
-- ---------------------------------------------------------------
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (@B1, @B2, @B3, @B4) AND `id` IN (1, 2);

-- ---------------------------------------------------------------
-- 6. Actionlists: the AUTO credit row (id 4, 3 s develop delay), the detect strip
-- (id 5), and ONE rebuilt row (id 1): play kit 90100 on the photographer.
--
-- WHY the kit is server-driven and not on the spell: 68280 is cast FROM AN ITEM,
-- and the cast packets carry the ITEM's guid as the source — the client-side
-- Spell.dbc -> SpellVisual cast-kit route never attaches the effect model to the
-- player (missiles DO work, they are positional — tried and rejected in round 8).
-- SMSG_PLAY_SPELL_VISUAL on the player's own guid (SAI 229) plays the full kit —
-- UseStanding hands anim + the rotated cone firing out of the player toward the
-- camera they are facing.
--
-- Deleted from the AUTO baseline:
--   id 2: invoker-cast 70641 retail bind-sight-to-bunny gimmick
--   id 3: bunny self-cast 68281 (its SpellVisual 17260 is Cata-only, dead art)
--   id 6: remove-aura 70649 — I-292 once set its param1 to 0 to "no-op" it, but
--         param1 = 0 means RemoveAllAuras: it stripped EVERY player aura per photo
--   id 20: legacy late-emote row from the pre-consolidation files
-- ---------------------------------------------------------------
DELETE FROM `smart_scripts` WHERE `source_type` = 9
  AND `entryorguid` IN (3787200, 3789500, 3789600, 3789700)
  AND `id` IN (1, 2, 3, 6, 20);
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,
   `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3787200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   229, 90100, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Flash kit 90100 on the photographer (I-286)'),
(3789500, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   229, 90100, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Flash kit 90100 on the photographer (I-286)'),
(3789600, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   229, 90100, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Flash kit 90100 on the photographer (I-286)'),
(3789700, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0,
   229, 90100, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Flash kit 90100 on the photographer (I-286)');

-- ---------------------------------------------------------------
-- 7. Legacy cleanup: the I-297 sparkle goobers (retired — the creature route keeps
-- per-player invisibility gating, which a GO cannot do).
-- ---------------------------------------------------------------
DELETE FROM `gameobject` WHERE `guid` BETWEEN 6950010 AND 6950013;
DELETE FROM `gameobject_template` WHERE `entry` = 902100;

-- ---------------------------------------------------------------
-- 8. The orbiting orb companion: one per marker, the WXL-downported monk orb
-- (display 900203, scale 1.5 = 75% of the size-2 test goober; orbit anim is its
-- idle). Spawns share the camera's position so the orbit circles the camera.
-- Each orb carries the SAME per-marker invisibility aura as its camera via
-- per-guid creature_addon, so it appears and vanishes with the camera.
-- ---------------------------------------------------------------
DELETE FROM `creature_template` WHERE `entry` = @ORB;
INSERT INTO `creature_template` SET
  `entry` = @ORB, `name` = 'Camera Marker Orb',
  `minlevel` = 1, `maxlevel` = 1, `faction` = 35, `npcflag` = 0,
  `speed_walk` = 1, `speed_run` = 1.14286, `unit_class` = 1,
  `unit_flags` = 33555200,      -- NOT_SELECTABLE | IMMUNE_TO_PC | IMMUNE_TO_NPC
  `type` = 10, `HealthModifier` = 1, `ManaModifier` = 1, `ArmorModifier` = 1,
  `DamageModifier` = 1, `BaseVariance` = 1, `RangeVariance` = 1,
  `RegenHealth` = 1, `MovementType` = 0, `AIName` = '',
  `flags_extra` = 2,            -- CIVILIAN only. NEVER 0x80 (TRIGGER): that made the
                                -- orb invisible to players in EVERY form (I-286 rd 8)
  `VerifiedBuild` = 0;

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ORB;
INSERT INTO `creature_template_model` SET
  `CreatureID` = @ORB, `Idx` = 0, `CreatureDisplayID` = 900203,
  `DisplayScale` = 1, `Probability` = 1, `VerifiedBuild` = 0;

-- Flight like the cameras (their AUTO movement rows are Ground 0 / Flight 1):
-- without this the SERVER grounds the spawn regardless of the addon hover bytes
DELETE FROM `creature_template_movement` WHERE `CreatureId` = @ORB;
INSERT INTO `creature_template_movement` SET
  `CreatureId` = @ORB, `Ground` = 0, `Swim` = 0, `Flight` = 1;

-- custom display needs its server-side bounding row or nothing renders
DELETE FROM `creature_model_info` WHERE `DisplayID` = 900203;
INSERT INTO `creature_model_info` SET
  `DisplayID` = 900203, `BoundingRadius` = 0.35, `CombatReach` = 0.5,
  `Gender` = 2, `DisplayID_Other_Gender` = 0, `VerifiedBuild` = 0;

DELETE FROM `creature` WHERE `guid` BETWEEN 6700020 AND 6700023;
INSERT INTO `creature`
  (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`,
   `position_x`, `position_y`, `position_z`, `orientation`,
   `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`,
   `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
  (6700020, @ORB, 1, 0, 0, 1, 1, 0, 33.524, -9852.57, 2.9672, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-286 orbiting orb @ camera marker 1'),
  (6700021, @ORB, 1, 0, 0, 1, 1, 0, 108.5913, -9817.344, -4.9189, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-286 orbiting orb @ camera marker 2'),
  (6700022, @ORB, 1, 0, 0, 1, 1, 0, 82.75, -9950.1, -4.6476, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-286 orbiting orb @ camera marker 3'),
  (6700023, @ORB, 1, 0, 0, 1, 1, 0, 117.27, -9833.78, 3.329, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 'I-286 orbiting orb @ camera marker 4');

-- bytes1 = 50397184 (anim tier 3, hover) — same as the cameras' template addon;
-- without it the orb creature is grounded instead of floating at the shared origin
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 6700020 AND 6700023;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
  (6700020, 0, 0, 50397184, 1, 0, '68231'),
  (6700021, 0, 0, 50397184, 1, 0, '70686'),
  (6700022, 0, 0, 50397184, 1, 0, '70687'),
  (6700023, 0, 0, 50397184, 1, 0, '70688');

-- ---------------------------------------------------------------
-- 9. Test-rig cleanup: the two model-verification goobers that stood next to
-- Foreman Dampwick (rounds 4-13) are retired. Displays 10501/10502 are likewise
-- deleted in the DBC file.
-- ---------------------------------------------------------------
DELETE FROM `gameobject` WHERE `guid` IN (6950014, 6950015);
DELETE FROM `gameobject_template` WHERE `entry` IN (902101, 902102);
