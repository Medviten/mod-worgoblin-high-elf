-- [I-274] Quest 14125 "447" — flip Kezan to the burning-KTC phase when the quest
-- COMPLETES (the Gasbot explosion), not only once it is turned in.
--
-- WHY THIS IS NOT IN THE AUTO FILE
-- The ported phase conditions are a faithful copy of the source's SourceType-25
-- rows, and the source gates Kezan phase definition 4 (phasemask 4096, the fires)
-- on QUESTREWARDED(14125) alone. That is correct FOR CATA, because there the
-- mid-quest transition was driven by a spell, not by a phase definition: the
-- Gasbot's arrival actionlist (3759801) ran
--     REMOVEAURASFROMSPELL 151137  /  INVOKER_CAST 151138
-- on the player, and the Claims Adjuster (37602) and Sassy Hardwrench (34668)
-- carry the same pair. Those are Neltharion-side custom spell ids above the 4.3.4
-- client's max spell id (121820), so they exist in no client DBC and cannot be
-- ported (see I-274). The phase definition was only ever the PERSISTENT state
-- after turn-in; the spell covered the window in between.
--
-- Without that spell the player stayed on the previous stage's mask (2048, from
-- QUESTREWARDED 14116) for the whole end of the quest, which caused BOTH reported
-- symptoms at once — PhaseMgr definitions here use flags=1 (OVERWRITE), so the
-- last matching definition wins outright rather than OR-ing:
--   * mask 2048 & 4096 = 0        -> the KTC building never appears on fire.
--   * mask 2048 & 2052 = 2048     -> Trade Prince Gallywix's phase-2052 spawn at
--     the KTC HQ (source guid 172919, same spot as his phase-1 spawn 172920) stays
--     visible alongside the Claims Adjuster (6144), so the quest could be handed in
--     to either. The source legitimately lists both 35222 and 37602 in
--     creature_involvedrelation; retail never shows both because by then the player
--     is on 4096, where only the Claims Adjuster remains.
-- Once the mask flips to 4096 both Gallywix spawns fall out of phase (4096 & 1 = 0,
-- 4096 & 2052 = 0) and the Claims Adjuster (6144) plus the fires (4096) come in, so
-- the ender list needs no edit — the phase does the gating exactly as Cata intended.
--
-- Adding ElseGroup 1 (condition groups are OR-ed, conditions within a group AND-ed)
-- keeps the source's QUESTREWARDED row and adds QUEST_COMPLETE(28) for the window
-- between the explosion and the hand-in. AC re-runs PhaseMgr from
-- Player::SetQuestStatus (PlayerQuest.cpp) so the flip lands the instant the fourth
-- objective is credited.
DELETE FROM conditions
 WHERE SourceTypeOrReferenceId = 26 AND SourceGroup = 4737 AND SourceEntry = 4 AND ElseGroup = 1;
INSERT INTO conditions SET
  SourceTypeOrReferenceId = 26,
  SourceGroup = 4737,
  SourceEntry = 4,
  SourceId = 0,
  ElseGroup = 1,
  ConditionTypeOrReference = 28,
  ConditionTarget = 0,
  ConditionValue1 = 14125,
  ConditionValue2 = 0,
  ConditionValue3 = 0,
  NegativeCondition = 0,
  ErrorType = 0,
  ErrorTextId = 0,
  ScriptName = '',
  Comment = 'I-274 Kezan phase 4096 while quest 14125 447 is complete (ports the unportable 151138 phase spell)';
