-- ============================================================
-- I-276  Shipwreck Shore arrival scene + goblin cinematic (F-011)
--
-- Second half of I-276. zz_[I-276]_lost_isles_transition.sql gets the player to
-- the beach; this file stages what happens when they land, and fires the movie
-- on the way out of Kezan.
--
-- Retail runs the scene from C++ and TrinityCore never wrote it (master's
-- src/server/scripts/Maelstrom/kezan.cpp is an empty stub), so what follows is a
-- SmartAI reconstruction. The DIALOGUE is not invented: all seven lines come
-- verbatim from the Neltharion 4.3.4 creature_text for 36608, and they describe
-- the scene exactly -- Doc spots you, calls Gizmo over, warns everyone back,
-- shocks you repeatedly, and gives up just as you come round.
--
-- Sequence: intro (groups 2, 3, 4) -> four jolts, each with a random "clear!"
-- line (group 0) -> group 5 -> aura stripped, player stands -> group 1.
-- ============================================================


-- ---- 1. Lock the player prone on arrival ---------------------------------
-- 74100 (the Life Savings teleport) triggers custom aura 900841 'Shipwrecked'
-- on hit: FEIGN_DEATH + MOD_ROOT, hidden from the buff bar. The player is held
-- down until Doc's script strips it -- the 5-minute duration on the spell is a
-- failsafe against the scene never firing, not the intended lifetime.
--
-- type 0 = SPELL_LINK_CAST: cast spell_effect when spell_trigger is cast.
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 74100 AND `spell_effect` = 900841;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
  (74100, 900841, 0, 'I-276 Life Savings teleport -> Shipwrecked prone lock on the Lost Isles beach');


-- ---- 2. Scene dialogue ---------------------------------------------------
-- Doc's seven lines and Gizmo's reply all come verbatim from the Neltharion
-- 4.3.4 creature_text. Gizmo's group 1 ("That's $n?! Sorry, Doc, I thought
-- $g he:she; was dead!") is what makes this a two-way conversation rather than
-- Doc monologuing at a silent NPC.
--
-- The only authored strings are Doc group 0 IDs 1-3, extra "clear!" variants so
-- four consecutive jolts do not repeat (creature_text picks randomly among the
-- IDs sharing a GroupID).
--
-- $n and $g substitute off the talk target. SMART_ACTION_TALK falls back to
-- GetLastInvoker() when the target list holds no player (SmartScript.cpp:227),
-- which is the arriving player -- confirmed working in-game ("That's Gobby!
-- she the only reason...").
--
-- Type 12 = CHAT_MSG_MONSTER_SAY.
DELETE FROM `creature_text` WHERE `CreatureID` IN (36608, 36600);
INSERT INTO `creature_text`
  (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`,
   `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
  (36608, 0, 0, 'Come on! Clear!', 12, 0, 25, 5, 0, 0, 0, 0, 'Doc Zapnozzle - jolt (source)'),
  (36608, 0, 1, 'Clear!', 12, 0, 25, 5, 0, 0, 0, 0, 'Doc Zapnozzle - jolt (authored variant)'),
  (36608, 0, 2, 'Again! Stand back!', 12, 0, 25, 5, 0, 0, 0, 0, 'Doc Zapnozzle - jolt (authored variant)'),
  (36608, 0, 3, 'Don''t you quit on me!', 12, 0, 25, 5, 0, 0, 0, 0, 'Doc Zapnozzle - jolt (authored variant)'),
  (36608, 1, 0, 'You made the right choice! We all owe you a great deal. Try to not get yourself killed out there.', 12, 0, 100, 1, 0, 0, 0, 0, 'Doc Zapnozzle - on hand-in / revived (source)'),
  (36608, 2, 0, 'Gizmo, what are you doing just sitting there? Don''t you recognize who that is laying next to you?!', 12, 0, 100, 25, 0, 0, 0, 0, 'Doc Zapnozzle - spots the player (source)'),
  (36608, 3, 0, 'That''s $n! $g he:she; the only reason we''re still breathing and not crispy fried critters back on Kezan.', 12, 0, 100, 25, 0, 0, 0, 0, 'Doc Zapnozzle - who you are (source)'),
  (36608, 4, 0, 'Stay back, I''m going to resuscitate $g him:her;! I hope these wet jumper cables don''t kill us all!', 12, 0, 100, 5, 0, 0, 0, 0, 'Doc Zapnozzle - before the jolts (source)'),
  (36608, 5, 0, 'That''s all I''ve got. It''s up to $g him:her; now. You hear me, $n? Come on, snap out of it! Don''t go into the Light!', 12, 0, 100, 5, 0, 0, 0, 0, 'Doc Zapnozzle - last jolt (source)'),
  (36608, 6, 0, 'There are more survivors to tend to. I''ll see you on the shore.', 12, 0, 100, 1, 0, 0, 0, 0, 'Doc Zapnozzle - parting line (source, unused)'),
  (36600, 1, 0, 'That''s $n?! Sorry, Doc, I thought $g he:she; was dead!', 12, 0, 100, 5, 0, 0, 0, 0, 'Geargrinder Gizmo - reply to Doc (source)');


-- ---- 3. Doc's SmartAI ----------------------------------------------------
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 36608;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 3660800;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 36608;

-- id 0 -- the trigger. SMART_EVENT_MOVIE_COMPLETED (113, Zeppelin custom, round
-- 3): param1 = movie id 16, the goblin cinematic (shipped as movie 16 per
-- I-280). Fired on creatures within 150y of the player when the client sends
-- CMSG_COMPLETE_MOVIE -- i.e. when the cinematic has actually left the screen,
-- whether it played through (~83s) or was skipped with Escape. Invoker = the
-- player. Gated by the conditions rows below to a player who has finished Life
-- Savings and not yet been revived.
--
-- Round 3: this was SMART_EVENT_OOC_LOS (10), which fires the moment the player
-- lands -- 2y from Doc -- while the client is still inside the 83s movie. The
-- whole 35s scene started AND finished behind the cinematic, so a player who
-- watched it through missed the entire RP. The server cannot infer movie state;
-- only the client's completion packet places the scene after it.
--
-- If the completion packet never arrives (disconnect mid-movie), no scene runs:
-- the prone lock self-heals via its 300s ceiling and 14474 is still takeable,
-- so the player skips the RP but is never stuck.
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`,
   `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`,
   `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  (36608, 0, 0, 0, 113, 0, 100, 0, 16, 0, 0, 0, 0,
   80, 3660800, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
   'Doc Zapnozzle - On goblin cinematic completed - Run the revive scene');

-- id 1 -- DEAD CODE, kept deliberately. SMART_EVENT_REWARD_QUEST (20) is on the
-- EventHasInvoker whitelist (SmartScriptMgr.cpp:398), so ACTION_INVOKER resolves
-- and the row loads clean -- but it can never FIRE, because quest 14239 is
-- unwired: Doc has no creature_queststarter or creature_questender row, an
-- earlier revision's "grant 14239 as step 0 of the scene" action no longer
-- exists in list 3660800, and nothing else in the DB hands it out. Nobody can
-- reward a quest they cannot obtain, so list 3660802 below is unreachable too.
--
-- Left in place because it is the correct wiring the day 14239 is given back to
-- Doc, and because it is harmless -- but do NOT count it as a release path for
-- the prone lock. It was silently doing nothing while three separate gates were
-- written on the assumption that it worked (round 2). The lock's real release is
-- actionlist 3660800 rows 13-15, plus the spell_area condition ceasing to match.
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`,
   `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`,
   `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  (36608, 0, 1, 0, 20, 0, 100, 0, 14239, 0, 0, 0, 80, 3660802, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
   'Doc Zapnozzle - On Reward Quest 14239 - Stop the RP and release the player');

-- 3660802 -- the hand-in list. Calling SMART_ACTION_CALL_TIMED_ACTIONLIST with a
-- DIFFERENT id is what stops the scene: SmartScript::SetScript9 clears
-- mTimedActionList before loading the new entry (SmartScript.cpp:5475).
-- Without this, Doc carried on reciting the whole revive speech to a player who
-- had already handed the quest in and walked off.
--
-- SMART_ACTION_CALL_SCRIPT_RESET (78) is NOT the tool for this: OnReset() does
-- not touch mTimedActionList at all, and it clears mLastInvoker, which would
-- break the invoker-targeted release below.
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 3660802;
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`,
   `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`,
   `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  (3660802, 9, 0, 0, 0, 0, 100, 0,   0,   0, 0, 0, 28, 900841, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Hand-in - Release the prone lock'),
  (3660802, 9, 2, 0, 0, 0, 100, 0,   0,   0, 0, 0, 91,      7, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Hand-in - Clear the forced stand state'),
  (3660802, 9, 1, 0, 0, 0, 100, 0, 500, 500, 0, 0,  1,      1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Hand-in - You made the right choice');

-- CONDITION_SOURCE_TYPE_SMART_EVENT (22), keyed SourceEntry = entryorguid,
-- SourceGroup = event id + 1, SourceId = source_type (ConditionMgr.cpp:1058).
-- SourceGroup 1 = event id 0. All rows share ElseGroup 0, so they AND.
--
-- ConditionTarget 0 is the PLAYER: SmartScript builds
-- ConditionSourceInfo(unit, GetBaseObject(), ...) at SmartScript.cpp:147, so
-- target 0 is the unit that tripped the event and target 1 is Doc.
--
-- Round 2 of this issue rewrote this gate. It used to read "14126 rewarded AND 14239 not
-- rewarded AND 14239 not taken", which sounds like a once-only gate and is
-- nothing of the sort: **quest 14239 is deliberately unwired** -- Doc has no
-- creature_queststarter and no creature_questender row, and neither does anyone
-- else -- so GetQuestStatus(14239) is QUEST_STATUS_NONE for every character
-- forever and both negative rows are permanently true. The whole gate reduced to
-- "has finished Life Savings", which every goblin past Kezan has, permanently.
--
-- Live consequence: Doc re-ran the entire resuscitation scene on any goblin who
-- came back into 20y of him -- hours later, many quests on, and after 14474 had
-- dropped the detection aura so he was not even visible while doing it. Reported
-- as "Doc was trying to zap me again when I hearthed back", and the hearth is
-- the common case because 74100 binds it to this beach.
--
-- The two gates below are the ones that actually close:
--   * NOT aura 900843 -- the Revived marker, the primary signal. Now
--     death-persistent (see the DBC file), so it survives the rest of the zone.
--     CONDITION_AURA calls HasAuraEffect(spell, effIndex) (ConditionMgr.cpp:63),
--     hence ConditionValue2 = 0 for 900843's single effect at index 0.
--   * NOT rewarded 14474 -- the same backstop the 49416 detection spell_area
--     row uses, so Doc's script and Doc's visibility stop together instead of
--     one outliving the other.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 36608 AND `SourceId` = 0;
INSERT INTO `conditions`
  (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
   `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
   `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
  (22, 1, 36608, 0, 0, 8, 0, 14126, 0, 0, 0, 0, 0, '',
   'I-276 Doc revives only someone who just finished Life Savings'),
  (22, 1, 36608, 0, 0, 1, 0, 900843, 0, 0, 1, 0, 0, '',
   'I-276 ...who is not already carrying the Revived marker'),
  (22, 1, 36608, 0, 0, 8, 0, 14474, 0, 0, 1, 0, 0, '',
   'I-276 ...and has not yet handed in Goblin Escape Pods');

-- The scene. Rows fire in ID ORDER off their own delays; `link` is 0 throughout,
-- because a non-zero link must point at a SMART_EVENT_LINK (61) row and pointing
-- it at a plain actionlist row produces "Link Event N not found, skipped" at
-- runtime and swallows the action.
--
-- Order matters and is deliberate:
--   LAST  apply the 'Revived' marker (900843), then REMOVE 900841 explicitly,
--         then clear the stand state. BOTH aura steps are required and they do
--         different jobs:
--           * removing 900841 is what actually lifts the lock NOW;
--           * the marker is what stops spell_area putting it straight back on.
--         An earlier revision applied only the marker, on the mistaken belief
--         that Player::UpdateAreaDependentAuras re-evaluates spell_area when an
--         aura changes. It does not -- it is called on quest events
--         (PlayerQuest.cpp:599 and friends), on area change
--         (PlayerUpdates.cpp:1245) and on login (CharacterHandler.cpp:1070), but
--         never on aura application. The prone lock therefore stayed on after the
--         RP finished, and since it roots and stuns, the player could not walk to
--         another area to trigger a re-evaluation either: permanently stuck.
--
-- The quest is deliberately NOT part of this any more. Earlier revisions tried to
-- drive the prone lock off 14239's state -- granting it to start the lock, or
-- crediting an objective to end it -- and every arrangement had a flaw: an
-- auto-complete quest reads as completable the moment it is granted, so the
-- player got turn-in credit before Doc had said a word. Retail hangs the revive
-- on quest completion, but nothing we have reproduces that cleanly.
--
-- With the marker aura doing the work, the quest does not need to be load-bearing
-- at all: the RP runs, the player stands up, and 14239 goes back to being an
-- ordinary quest Doc offers afterwards. Fewer moving parts, and the timing is
-- driven by the thing that actually matters -- the scene finishing.
--   id 1  force stand state DEAD. The FEIGN_DEATH aura alone is not enough:
--         nothing server-side removes it on gossip (NPCHandler.cpp:165 only
--         strips AURA_INTERRUPT_FLAG_TALK auras, and ours has none; the
--         feign-death removal right below it is commented out), so the player
--         standing up when talking to Doc is the CLIENT playing a stand
--         animation while the aura is still applied. Stand state is a unit
--         field the server owns and the client does not override on gossip --
--         the same reason a sitting player stays seated while talking to an
--         NPC. Cleared again on hand-in by list 3660802.
--
--   NO prone row -- the lock is applied by spell_linked_spell 74100 -> 900841 at
--         the moment of the HAND-IN, so the collapse animation happens behind
--         the cinematic and the loading screen and the player is already lying
--         down when the beach fades in. Doc re-applying it on arrival was what
--         made the fall-down animation play visibly, after the movie.
--   ...   dialogue and jolts
--   NO removal row -- the aura ends on the hand-in (event 20 above), so lying
--         prone lasts as long as the player wants it to.
--
-- Doc's lines target SELF; Gizmo's reply targets SMART_TARGET_CLOSEST_CREATURE
-- (19) entry 36600 so HE is the talker. Everything aimed at the player targets
-- ACTION_INVOKER (7).
--
-- ADD_AURA (75) rather than CAST for the prone, and castFlags 2
-- (SMARTCAST_TRIGGERED) on the jolts: SMART_ACTION_CAST issues a full untriggered
-- cast (SmartScript.cpp:732) and a root/feign-death spell aimed at a FRIENDLY
-- player is refused by the target checks.
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`,
   `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`,
   `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  (3660800, 9,  1, 0, 0, 0, 100, 0,     0,     0, 0, 0, 90,      7, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Force stand state DEAD so gossip cannot stand the player up'),
  (3660800, 9,  2, 0, 0, 0, 100, 0,  1000,  1000, 0, 0,  1,      2, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Gizmo, don''t you recognize $n'),
  (3660800, 9,  3, 0, 0, 0, 100, 0,  6000,  6000, 0, 0,  1,      3, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - That''s $n'),
  (3660800, 9,  4, 0, 0, 0, 100, 0,  5000,  5000, 0, 0,  1,      1, 0, 0, 0, 0, 0, 19, 36600, 15, 0, 0, 0, 0, 0, 'Geargrinder Gizmo - Scene - Sorry Doc, I thought $g he:she; was dead'),
  (3660800, 9,  5, 0, 0, 0, 100, 0,  5000,  5000, 0, 0,  1,      4, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Stay back, wet jumper cables'),
  (3660800, 9,  6, 0, 0, 0, 100, 0,  4000,  4000, 0, 0, 11, 900842, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Jolt 1'),
  (3660800, 9,  7, 0, 0, 0, 100, 0,   200,   200, 0, 0,  1,      0, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Jolt 1 shout'),
  (3660800, 9,  8, 0, 0, 0, 100, 0,  3500,  3500, 0, 0, 11, 900842, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Jolt 2'),
  (3660800, 9,  9, 0, 0, 0, 100, 0,   200,   200, 0, 0,  1,      0, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Jolt 2 shout'),
  (3660800, 9, 10, 0, 0, 0, 100, 0,  3500,  3500, 0, 0, 11, 900842, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Jolt 3'),
  (3660800, 9, 11, 0, 0, 0, 100, 0,   200,   200, 0, 0,  1,      0, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - Jolt 3 shout'),
  (3660800, 9, 12, 0, 0, 0, 100, 0,  4000,  4000, 0, 0,  1,      5, 0, 0, 0, 0, 0,  1,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - That''s all I''ve got, don''t go into the Light'),
  (3660800, 9, 13, 0, 0, 0, 100, 0,  2500,  2500, 0, 0, 75, 900843, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - RP complete: mark Revived, which drops the prone lock'),
  (3660800, 9, 14, 0, 0, 0, 100, 0,     0,     0, 0, 0, 28, 900841, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - ...and REMOVE the prone aura outright, see note'),
  (3660800, 9, 15, 0, 0, 0, 100, 0,     0,     0, 0, 0, 91,      7, 0, 0, 0, 0, 0,  7,     0,  0, 0, 0, 0, 0, 0, 'Doc Zapnozzle - Scene - ...and clear the forced stand state, player wakes');
-- ---- 4. Quest 14239 is unwired; 14474 is gated behind the RP ------------
-- "Don't Go Into the Light!" is no longer used. Every attempt to make it drive
-- the scene fought itself:
--   * it ships QuestType 0 (auto-complete), so granting it reads as completable
--     immediately -- turn-in credit before Doc had said a word;
--   * giving it an objective so the RP could credit it worked, but modelled
--     resuscitation as a kill;
--   * and talking to Doc to hand it in breaks the prone aura mid-scene, which is
--     the thing the scene exists to hold.
-- Retail hangs the revive on this quest's completion and we could not reproduce
-- that cleanly. The 'Revived' marker aura does the same job with none of the
-- coupling, so the quest is simply taken out of the flow -- Doc neither gives
-- nor ends it, and there is no reason for the player to talk to him at all.
--
-- The quest row itself is left in place (ported data, harmless unreferenced).
DELETE FROM `creature_queststarter` WHERE `quest` = 14239;
DELETE FROM `creature_questender`   WHERE `quest` = 14239;

UPDATE `quest_template` SET
  `QuestType` = 0,
  `RequiredNpcOrGo1` = 0,
  `RequiredNpcOrGoCount1` = 0,
  `ObjectiveText1` = ''
WHERE `ID` = 14239;

-- npcflag 2 = QUESTGIVER on Doc is left alone: he still needs it for nothing
-- right now, but the template is regenerated from source each gen and stripping
-- it would just be undone.

-- 14474 "Goblin Escape Pods" (Gizmo) only becomes available once the RP has
-- finished, i.e. once the player carries the 'Revived' marker. Without this the
-- player could take the zone opener while still face-down on the sand.
--
-- 14474 ships with PrevQuestID = 14239, i.e. it requires the revive quest to have
-- been REWARDED. Unwiring 14239 above therefore made 14474 permanently
-- unofferable -- nobody gives 14239, so its prerequisite can never be satisfied,
-- and Gizmo silently had nothing to offer. Clear it: the 'Revived' marker is the
-- gate now, and it is a better one, because it fires exactly when the player
-- gets up rather than depending on a quest hand-in that no longer happens.
--
-- quest_template_addon 14474 is owned by zz_[AUTO,F-011]_31_quest_template_addon.sql;
-- one consolidated UPDATE is the documented override on an AUTO row.
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 14474;

-- The quest-offer gate is deliberately NOT a condition.
--
-- An earlier revision gated 14474 on CONDITION_AURA 900843 so it could only be
-- taken once the RP had revived the player. It worked, but the client never
-- showed Gizmo's quest icon: Player::SendQuestGiverStatusMultiple is called on
-- quest events (PlayerQuest.cpp:872), item events and the client's own query --
-- never on aura application. So the offer became legal the moment the marker
-- landed, but nothing told the client to re-evaluate the icon, and Gizmo just
-- stood there looking like he had nothing to say. Same shape as the spell_area
-- mistake above: an aura changing does not refresh state that is only pushed on
-- quest/area events.
--
-- The gate is unnecessary regardless. 900841 stuns the player for the whole RP,
-- and a stunned player cannot interact with an NPC at all -- so the quest is
-- already unreachable until they are on their feet, without any condition.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 14474;


-- ---- 5. The goblin cinematic ---------------------------------------------
-- SMART_ACTION_PLAYMOVIE (68), param1 = Movie.dbc id 22 = the goblin cinematic,
-- fired alongside the teleport so the world loads behind the video -- which is
-- how Blizzard sequences zone-transition movies.
--
-- This is shipped deliberately even though the video does not currently play.
-- The trigger chain is PROVEN: pointing this same action at movie 14 plays
-- Wrathgate correctly on hand-in, so the event, the invoker and
-- Player::SendMovieStart all work.
--
-- **Fires movie 16, not 22 (I-280, resolved 2026-07-31).** The client only
-- resolves the ids in its own stock Movie.dbc -- 1, 2, 14, 16. Our Movie.dbc
-- ships correctly in PATCH-Z but is shadowed at runtime, so row 22 never
-- resolved and SendMovieStart(22) was silently inert. That, not the AVI, is why
-- the cinematic never played: the file itself is fine and plays with audio.
--
-- Id 16 (WOW_FoTLK) is unused, so the goblin cinematic ships as
-- `WOW_FoTLK_1024.avi` in the zep-cinematics zpak (PATCH-X) and is triggered
-- here as movie 16. Movie.dbc row 22 is kept for server-side bookkeeping only.
-- Revert to 22 if the DBC override is ever fixed.
-- Client resolution ceiling tracked separately as I-279.
--
-- Event **20 SMART_EVENT_REWARD_QUEST**, param1 = 14126. NOT event 50
-- SMART_EVENT_QUEST_REWARDED, which takes no quest id and is absent from
-- SmartAIMgr::EventHasInvoker() (SmartScriptMgr.cpp:398) -- an ACTION_INVOKER
-- action on it is refused outright at load.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 35222 AND `source_type` = 0 AND `id` IN (1, 2);
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`,
   `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`,
   `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  (35222, 0, 1, 0, 20, 0, 100, 0, 14126, 0, 0, 0, 68, 16, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,
   'Trade Prince Gallywix - On Reward Quest Life Savings - Play the goblin cinematic, movie 16 (I-276/I-280)');


-- ---- 5b. Gallywix takes the Keys to the Hot Rod --------------------------
-- SMART_ACTION_REMOVE_ITEM (57), item 84460, on SMART_EVENT_REWARD_QUEST (20)
-- for 14126. His offer text is explicit that he is taking the car -- "I see that
-- you've brought me all that I asked for, INCLUDING YOUR HOT ROD" -- but the keys
-- are not one of the quest's RequiredItemIds, so nothing removed them and the
-- player kept a dead quest item (bonding 4, MaxCount 1) forever.
--
-- Event 20 SMART_EVENT_REWARD_QUEST filters by quest id AND is on the
-- EventHasInvoker whitelist (SmartScriptMgr.cpp:398), so ACTION_INVOKER resolves.
-- Event 50 SMART_EVENT_QUEST_REWARDED is a different event that does neither.
INSERT INTO `smart_scripts`
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`,
   `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`,
   `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`,
   `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  (35222, 0, 2, 0, 20, 0, 100, 0, 14126, 0, 0, 0, 57, 84460, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,
   'Trade Prince Gallywix - On Reward Quest Life Savings - Take the Keys to the Hot Rod (I-276)');


-- ---- 6. Reposition Geargrinder Gizmo -------------------------------------
-- Doc and Gizmo were 4.9y apart with Doc off to one side, so the scene read as
-- Doc talking to nobody ("Gizmo, what are you doing just sitting there?"). Both
-- are now on Justin's in-game .gps marks, facing the landing spot.
--
-- Gizmo's spawn is AUTO-generated (zz_[AUTO,F-011]_40_creature.sql), so this is
-- a guid-keyed override rather than a fixture edit -- guid 11001639 is the beach
-- spawn specifically, he has five others elsewhere in the zone. Doc moved via
-- the manual_spawns fixture, since that row is ours.
--
-- z = FloorZ from .gps (0.18746543). GroundZ there reads -16.38: that is the
-- heightmap seabed under the vmap shore, and placing off it would bury him.
UPDATE `creature` SET
  `position_x` = 3.963165,
  `position_y` = -9527.91,
  `position_z` = 0.1875,
  `orientation` = 2.8671033
WHERE `guid` = 11001639;


-- ---- 7. Scene visibility: invisible to everyone but the arriving player ---
-- Justin's ask: Doc and Gizmo should only exist for the player going through the
-- arrival, up until they hand Sassy the escape-pod quest -- without burning a
-- phase on two NPCs.
--
-- That is exactly what retail does, and the machinery was already in the port:
-- creature_template_addon for 36600 carries **49414 'Generic Quest Invisibility
-- 1'** (SPELL_AURA_MOD_INVISIBILITY, type 7) plus 49416, its detection
-- counterpart. Anyone without matching detection simply cannot see him. No
-- phase involved.
--
-- I-276 round 4 briefly stripped that aura to get Gizmo on screen, which is why
-- he was then visible to everybody. Restored here, with Doc given the same
-- treatment, and the detection granted to the player by `spell_area` instead.
--
-- bytes1 = 1 keeps Gizmo SITTING, which is what Doc's line describes ("what are
-- you doing just sitting there?"). visibilityDistanceType 2 carried from the
-- template. A guid-keyed creature_addon fully overrides the template addon for
-- that spawn (I-249), so his five other spawns are untouched.
DELETE FROM `creature_addon` WHERE `guid` IN (11001639, 11900002);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
  (11001639, 0, 0, 1, 0, 0, 2, '49414 49416'),
  (11900002, 0, 0, 0, 0, 0, 0, '49414 49416');

-- `spell_area` auto-applies the detection aura to any player standing in area
-- 4721 Shipwreck Shore who has finished Life Savings and not yet finished Goblin
-- Escape Pods (14474) -- and removes it the moment either stops being true. That is the
-- whole lifecycle, with no script and no phase.
--
-- SpellArea::IsFitToRequirements (SpellMgr.cpp:1077) tests
--   (1 << player->GetQuestStatus(quest)) & status
-- so the masks are bitfields over QuestStatus, not status values:
--   quest_start_status 64 = 1<<6 = REWARDED           -> 14126 must be handed in
--   quest_end_status   27 = 1<<0|1<<1|1<<3|1<<4       -> NONE|COMPLETE|INCOMPLETE|
--                                                        AVAILABLE, i.e. 14474
--                                                        NOT yet rewarded
-- 14474 is handed in to Sassy Hardwrench (35650), not Gizmo, so the pair stay
-- visible right up to that hand-in and disappear immediately after -- which is
-- the behaviour asked for.
DELETE FROM `spell_area` WHERE `spell` IN (49416, 900841) AND `area` = 4721;
INSERT INTO `spell_area`
  (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`,
   `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
  (49416, 4721, 14126, 14474, 0, 0, 2, 1, 64, 27),
  (900841, 4721, 14126, 14474, -900843, 0, 2, 1, 64, 27);

-- The second row is the PRONE LOCK, and it is here rather than in Doc's scene
-- for a reason. Two earlier placements both failed:
--
--   * spell_linked_spell 74100 -> 900841 does not apply at all. It survived in
--     the file for several rounds looking plausible; removing Doc's duplicate
--     proved it had never been doing anything.
--   * SMART_ACTION_ADD_AURA inside Doc's scene DID work, but ran after the
--     player had already landed and stood up, so the collapse animation played
--     visibly, after the cinematic.
--
-- `aura_spell` = **-900843** is the release. A negative value means "applies only
-- while the player does NOT have this aura" (SpellMgr.cpp:1084). Doc applies the
-- 'Revived' marker at the end of the RP, the condition stops matching, and the
-- prone lock drops.
--
-- "Permanent" was not enough for that marker, and round 2 of this issue is the
-- bill for it. A permanent aura still dies with the player -- Unit::RemoveAllAurasOnDeath
-- (Unit.cpp:5733) strips everything non-passive that lacks
-- SPELL_ATTR3_ALLOW_AURA_WHILE_DEAD -- so the first time a goblin died anywhere,
-- the release signal was destroyed and this row started matching again. Area
-- 4721 is not the strip of sand it sounds like: ~224 map cells across four
-- tiles, about 1000x1000 yards, including the cave at (102, -9803, -12) where a
-- live character was found rooted several quests later. And 74100 binds the
-- HEARTHSTONE here, so the most common way back into the zone lands inside the
-- trigger. 900843 now carries the death-persistent attribute; see the DBC file.
--
-- Decoupling the release from quest state is what lets the quest be handed over
-- at the START of the scene, which is where it belongs. Two earlier designs did
-- not allow that: gating on 14239 being taken woke the player the instant it was
-- granted, and giving 14239 a kill-credit objective so the RP could complete it
-- modelled resuscitation as killing the medic.
--
-- `quest_end` is **14474** (round 2), not 14239. It was 14239 as a "backstop", but
-- 14239 is unwired -- nobody gives it and nobody ends it -- so
-- GetQuestStatus(14239) is QUEST_STATUS_NONE forever, bit 1 is inside mask 27,
-- and the backstop could never close. It was decoration, and it was the only
-- thing standing behind a marker aura that death deletes.
--
-- 14474 "Goblin Escape Pods" is handed in to Sassy Hardwrench, which is the real
-- end of the arrival sequence, and it is already what gates the 49416 detection
-- row directly above. Sharing it means the prone lock and the two NPCs go out of
-- scope on the same hand-in: past that point this row cannot match on any
-- character, whatever happened to their auras.
--
-- Note the release mechanism is genuinely the CONDITION ceasing to match, not a
-- removal: Player::UpdateAreaDependentAuras drops auras whose spell_area no
-- longer fits via SpellInfo::CheckLocation, so removing an aura that spell_area
-- still wants is futile -- that was the "hit by the aura randomly a couple of
-- minutes later" symptom in the first round of this issue.
--
-- spell_area applies on the area update that fires as the teleport completes --
-- the earliest data-driven hook there is -- so the collapse happens behind the
-- movie and the loading screen and the beach fades in with the player already
-- down. It also removes itself the instant 14239 is handed in, which is the
-- whole release mechanism; no timer, no SAI removal needed.


-- ---- 8. Chat-bubble probe (ANSWERED, probe removed) --------------------
-- Doc's lines reached the chat log but drew no bubble, while ambient NPCs on the
-- same client bubble fine. The leading theory was the RECEIVER GUID:
-- ChatHandler::BuildChatPacket writes one into MONSTER_SAY packets
-- (Chat.cpp:295) and SMART_ACTION_TALK always supplies one, falling back to
-- GetLastInvoker() unconditionally (SmartScript.cpp:227) -- the same GUID that
-- makes $n and $g resolve. If true, substitution and bubbles would have been
-- mutually exclusive through SmartAI TALK.
--
-- DISPROVEN. A probe line on Gizmo fired from SMART_EVENT_UPDATE_OOC -- no
-- invoker, so no receiver GUID, and no $ tokens -- reached the chat log and
-- still drew no bubble.
--
-- So the server side is conclusively clear on all three counts:
--   creature_text.Type 12 = CHAT_MSG_MONSTER_SAY   (SharedDefines.h:3433)
--   TEXT_RANGE_NORMAL -> SendMessageToSetInRange   (CreatureTextMgr.cpp:363)
--   receiver GUID ruled out by the probe above
-- Chat bubbles are a CLIENT concern -- the `chatBubbles` CVar, ElvUI's
-- per-character Chat Bubbles Style, or another addon. Nothing to fix in data.
DELETE FROM `creature_text` WHERE `CreatureID` = 36600 AND `GroupID` = 9;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 36600 AND `id` = 20;
