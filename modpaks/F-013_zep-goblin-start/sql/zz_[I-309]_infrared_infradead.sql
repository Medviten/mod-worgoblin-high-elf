-- ============================================================
-- I-309  Quest 14238 "Infrared = Infradead" — Orc Scout lifecycle
-- ============================================================
-- The scout (36100) is a guardian summoned on quest accept / Kilag's gossip
-- (giver 35917 INVOKER_CASTs 68338, whose effect 2 FORCE_CASTs summon 68336).
-- The port shipped him with NO SmartAI and nothing ever dismisses him — he
-- follows the player forever after the quest ends. Kilag's AUTO reward rows
-- only strip the player auras (68376/69303/68338); a removed dummy aura does
-- not despawn an already-summoned guardian.
--
-- LIFECYCLE (all scout-side, so no fragile appends to Kilag's AUTO script):
--   * summon: react defensive + follow the summoner (SmartAI replaces whatever
--     default AI carried the follow, so it must be re-issued explicitly), then
--     the goggles-reminder line (creature_text group 0, AUTO-owned, was never
--     wired to anything).
--   * quest complete (4/4 assassins): SMART_EVENT_QUEST_COMPLETED (112,
--     Zeppelin core, onlyOwnSummon=1) — salute and leave. Same event family as
--     the I-285 miner; a scout-side event needs no Kilag rows that a gen
--     re-run + `sql changed` would silently delete.
--   * abandon: SMART_EVENT_QUEST_ABANDONED (111, onlyOwnSummon=1) — strip the
--     controller aura from the owner and despawn. The aura must go or
--     re-accepting stacks a second application before the fresh accept-cast.
--   * logout: guardians despawn with the owner; 68338 must NOT persist to
--     character_aura or the restored aura hides Kilag's re-summon gossip
--     (condition: option 510030 requires NOT aura 68338) with no scout alive —
--     same trap as I-285's 68062, same fix (0x01000000 AURA_CANNOT_BE_SAVED).
--
-- FOLLOW angle is relative to the target's facing; 180 = directly behind
-- (see I-285 file notes).

SET @SCOUT = 36100;   -- Orc Scout (guardian, SummonProperties 2341)
SET @QUEST = 14238;
SET @AURA  = 68338;   -- Orc Scout controller dummy on the player

-- AUTO owns the template -> consolidated UPDATE. AC will not run SmartAI on a
-- creature whose AIName is empty, and the port leaves it empty.
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @SCOUT;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = @SCOUT;
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,
   `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- summon: guard stance + fall in behind the player
(@SCOUT, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 0,
   8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - on summon - react defensive'),
(@SCOUT, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   29, 4, 180, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - on summon - follow the summoner'),
-- the goggles reminder, once, shortly after the summon settles
(@SCOUT, 0, 2, 0, 1, 0, 100, 1, 2000, 2000, 0, 0, 0,
   1, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - keep your goggles on (Talk 0)'),
-- quest complete: my summoner has dealt with the assassins - salute and leave
(@SCOUT, 0, 3, 4, 112, 0, 100, 0, @QUEST, 1, 0, 0, 0,
   5, 66, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - quest complete - salute the player'),
(@SCOUT, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - quest complete - despawn'),
-- quest abandoned: strip the controller aura from the owner, then despawn
(@SCOUT, 0, 5, 6, 111, 0, 100, 0, @QUEST, 1, 0, 0, 0,
   28, @AURA, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - quest abandoned - strip the controller aura'),
(@SCOUT, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0,
   41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orc Scout - quest abandoned - despawn');

-- 68338 must not persist to character_aura on logout (guardian is already gone,
-- and the restored aura hides the re-summon gossip). 0x01000000 =
-- SPELL_ATTR0_CU_AURA_CANNOT_BE_SAVED.
DELETE FROM `spell_custom_attr` WHERE `spell_id` = @AURA;
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES (@AURA, 0x01000000);

-- Kilag's re-summon gossip (menu 510030 option 0) is AUTO-gated on NOT having
-- 68338 only; without a quest gate a player whose aura dropped (logout after
-- completing the objectives) could keep re-summoning a permanent bodyguard.
-- Type 9 = QUEST_TAKEN (active and incomplete). ANDs with the AUTO aura row.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 510030 AND `ConditionTypeOrReference` = 9;
INSERT INTO `conditions`
  (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
   `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
   `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
  (15, 510030, 0, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', 'I-309 - scout gossip only while 14238 is active and incomplete');
