-- I-234: give the Kezan camp trolls looping emote states that ACTUALLY render on
-- the forest-troll character model 2613 (set by zz_[I-234]_troll_forest_displays.sql).
--
-- Why this is needed: the Neltharion (Cata) import scripted the Defiant Troll to
-- pick a random emote on respawn from actionlists 3483001..3483004, but only
-- 3483001 (EMOTE_STATE_DANCE=10) and 3483002 (EMOTE_STATE_SLEEP=12) were defined,
-- and on the WotLK Emotes.dbc, SLEEP(12) resolves to anim 0 (Stand) -- i.e. idle.
-- 3483003/3483004 were never defined (empty actionlist = idle). Net effect:
-- 1-in-4 danced, 3-in-4 stood idle. This file replaces that with a pool of SIX
-- emote states, every one verified to map to an AnimationData the model owns
-- (checked Emotes.dbc EmoteAnim -> AnimationData -> M2 sequence list):
--
--   SLACKERS (Defiant 34830, Rebellious 35294) -- lively/mocking, per-spawn random:
--     10  STATE_DANCE        -> anim 69  EmoteDance
--     392 STATE_LAUGH        -> anim 70  EmoteLaugh
--     391 STATE_ROAR         -> anim 74  EmoteRoar
--     253 STATE_APPLAUD      -> anim 80  EmoteApplaud
--     378 STATE_TALK         -> anim 60  EmoteTalk
--     418 STATE_EAT          -> anim 61  EmoteEat
--   LABORERS (Slave 35239, Worker 48984):
--     233 STATE_WORK_MINING  -> anim 136 EmoteWorkNoSheathe  (static via addon.emote)
--
-- Loads after zz_[AUTO,F-011]_smartai.sql (alphabetical: [AUTO,F-011] < [I-234]).

-- Laborers: mine (233 renders on model 2613; the AUTO addon set 35239=233 already,
-- 48984 was 0/idle). Existing rows -> consolidated UPDATE.
UPDATE creature_template_addon SET emote = 233 WHERE entry IN (35239, 48984);

-- Slackers: clear any static stance (35294 was 333/ReadyStance); SmartAI drives a
-- random looping emote per spawn instead.
UPDATE creature_template_addon SET emote = 0 WHERE entry IN (34830, 35294);

-- Emote actionlists (we own these six custom lists) -> DELETE + INSERT.
-- Each just sets one looping emote state on self (SMART_ACTION_SET_EMOTE_STATE=17).
DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid IN (3483001,3483002,3483003,3483004,3483005,3483006);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3483001,9,0,0,0,0,100,0,0,0,0,0,17, 10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slacker Troll - emote state DANCE'),
  (3483002,9,0,0,0,0,100,0,0,0,0,0,17,392,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slacker Troll - emote state LAUGH'),
  (3483003,9,0,0,0,0,100,0,0,0,0,0,17,391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slacker Troll - emote state ROAR'),
  (3483004,9,0,0,0,0,100,0,0,0,0,0,17,253,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slacker Troll - emote state APPLAUD'),
  (3483005,9,0,0,0,0,100,0,0,0,0,0,17,378,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slacker Troll - emote state TALK'),
  (3483006,9,0,0,0,0,100,0,0,0,0,0,17,418,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slacker Troll - emote state EAT');

-- Defiant Troll (34830): AUTO already emits the RESPAWN random-actionlist event
-- referencing 3483001..3483004; extend its pool to all six lists. (param1..4 stay.)
UPDATE smart_scripts SET action_param5=3483005, action_param6=3483006
  WHERE entryorguid=34830 AND source_type=0 AND event_type=11 AND action_type=87;

-- Rebellious Troll (35294): AUTO (derived scope, I-245 follow-up) owns source
-- rows id 0-2 (frozen Neltharion dump, so 0-2 is permanent); append our
-- RESPAWN random-emote event as id 3 (we own this event) -> DELETE + INSERT.
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35294 AND event_type=11 AND action_type=87;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35294,0,3,0,11,0,100,0,0,0,0,0,87,3483001,3483002,3483003,3483004,3483005,3483006,1,0,0,0,0,0,0,0,0,'Rebellious Troll - RESPAWN - random slacker emote state');
