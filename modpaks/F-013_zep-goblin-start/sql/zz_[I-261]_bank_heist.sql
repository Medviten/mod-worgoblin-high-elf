-- ============================================================================
-- I-261 "The Great Bank Heist" (quest 14122) — vault-cracking minigame.
--
-- Retail flow: click a First Bank of Kezan Vault (GO 195525) -> summon the
-- vault "bunny" vehicle 35486 (spell 67488, auto-boards via ride spell 67476)
-- -> widget minigame -> success casts 67492 Vault Cracked! (CREATE_ITEM
-- Personal Riches 84461).
--
-- The Neltharion source SAI for 35486 is unusable: no phase gating (one widget
-- press fires correct+wrong+success lists at once) and it relies on spellhit
-- events on the vehicle. Both source blocks are smartai_exclude'd (cre 35486,
-- go 195525) and replaced here.
--
-- 3.3.5a adaptation = CANNON PATTERN (all data, no C++). The rider POSSESSES
-- the vault (stock control seat 5326) exactly like a turret, so the client
-- shows the vehicle action bar built from creature_template_spell (the 5
-- widgets). The player is the caster, so the widgets (target 94 = the caster's
-- vehicle) hit the vault and fire SMART_EVENT_SPELLHIT (IsAIEnabled stays true
-- under a vehicle charm). Movement is stopped by rooting the vault with 42716
-- at summon (a rooted vehicle can't be driven). No override aura is used.
--
-- Minigame: prompts are SAI phases 1-5 (Drill/Blastcrackers/Ear-O-Scope/
-- Lockpick/G-Ray). Correct widget in the prompt's phase -> counter +1; at 4
-- correct the vault cracks. Wrong widget -> Incorrect! + ejected. Sitting idle
-- on prompts too long (a cumulative timer) also ejects the rider.
--
-- WHILE_CHARMED (event_flags 0x200 = 512) is set on EVERY vault row. The rider
-- POSSESSES the vault (vehicle charm), and SmartScript::ProcessEvent drops any
-- event WITHOUT this flag while the AI owner is charmed (SmartScript.cpp L4187:
-- IsCharmedCreature -> Creature::IsCharmed). That single gate silently killed
-- every post-board event for rounds: the first prompt only survived because it
-- runs in the JUST_SUMMONED chain BEFORE the player boards/possesses. With the
-- flag, spellhit / counter / phase-change events fire while possessed. Timing
-- must use DIRECTLY-DEFINED UPDATE rows (event 60, flagged 0x200), NOT
-- CREATE_TIMED_EVENT (its stored event is unflagged -> dropped at the charm
-- gate). OnUpdate itself is NOT charm-gated (SmartAI::UpdateAI L575, before the
-- IsAIControlled melee gate), so flagged UPDATE timers do tick under possession.
-- ============================================================================

-- ---- vault GO: SmartGameObjectAI (AIName override on the AUTO-owned row) ----
UPDATE gameobject_template SET AIName = 'SmartGameObjectAI' WHERE entry = 195525;

-- ---- vault GO SAI: on use, the clicker summons their personal vault bunny ----
-- (goober autoCloseTime=0 means AC never fires GO_STATE_CHANGED. Event 64
-- GOSSIP_HELLO fires from GameObject::Use — param1=1 filters to that path
-- only, like stock goobers, since CMSG_GAMEOBJ_REPORT_USE fires it a second
-- time with reportUse=true. Action 134 = AC INVOKER_CAST; 85 is the
-- TrinityCore id and means SELF_CAST on AC.)
DELETE FROM smart_scripts WHERE source_type = 1 AND entryorguid = 195525;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (195525, 1, 0, 0, 64, 0, 100, 0, 1, 0, 0, 0, 134, 67488, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Bank Vault - On Use - Invoker summons vault bunny vehicle (I-261)');

-- Gate the click: quest 14122 in log + not already running the heist.
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 22 AND SourceEntry = 195525 AND SourceId = 1;
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
  (22, 1, 195525, 1, 0, 9, 0, 14122, 0, 0, 0, 0, 0, '', 'I-261 vault SAI only while The Great Bank Heist active');
-- ---- vault vehicle 35486: minigame SAI (charm-safe, timer-driven) ----
-- The rider POSSESSES the vault (control seat 5326), so Creature::IsCharmed()
-- is true for the whole minigame and SmartScript::ProcessEvent DROPS any row
-- lacking SMART_EVENT_FLAG_WHILE_CHARMED (0x200=512). => event_flags=512 on
-- EVERY row here (the GO 195525 row is NOT flagged; a GO is never charmed).
--
-- Two charm/re-entrancy hazards this design works around:
--  1. CREATE_TIMED_EVENT is UNUSABLE under charm: the stored UPDATE event it
--     builds hardcodes event_flags=0, so it is dropped at the charm gate when it
--     tries to fire. ALL timing here uses DIRECTLY-DEFINED UPDATE rows (event
--     60) that carry their own 0x200 flag and tick in SmartAI::UpdateAI->
--     OnUpdate (NOT charm-gated). Phase-gated UPDATE timers only tick while in
--     their phase (rows 10, 30).
--  2. Rolling the next prompt INSIDE the spellhit dispatch caused a phantom
--     'wrong': ProcessEventsFor(SPELLHIT) iterates the correct row THEN the
--     wrong row in one pass; the correct row advanced the phase mid-loop, so the
--     same cast's wrong row (complement mask) then matched the NEW phase. Fix:
--     a correct hit NEVER rolls a prompt directly - it enters pending phase 6
--     (no widget matches phase 6), and the phase-6 UPDATE timer (row 10) rolls
--     the next prompt ~2.5s later, OUTSIDE the spellhit loop. That delay also
--     gives a read pause before the first prompt and after each result.
--
-- Phases: 1-5 = active prompt (Drill/Blast/Ear/Lockpick/G-Ray); 6 = pending
-- (initial read / between prompts); 0 = transient. Prompts whisper via target
-- 23 (OWNER_OR_SUMMONER) param1=0 = the player (charmer/summoner). Timeout =
-- phases-1-5-gated UPDATE (15s cumulative prompt time; frozen in phase 6).
-- Wrong widget or timeout eject (cast 50630) + despawn; four correct -> riches.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 35486;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (35486, 0, 0, 1, 54, 0, 100, 512, 0, 0, 0, 0, 63, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'JUST_SUMMONED - reset counter 1 to 0'),
  (35486, 0, 1, 2, 61, 0, 100, 512, 0, 0, 0, 0, 11, 42716, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'linked - root vault (42716, immovable while possessed)'),
  (35486, 0, 2, 3, 61, 0, 100, 512, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'linked - intro whisper text0 (summoner)'),
  (35486, 0, 3, 4, 61, 0, 100, 512, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'linked - intro whisper text1'),
  (35486, 0, 4, 5, 61, 0, 100, 512, 0, 0, 0, 0, 1, 2, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'linked - intro whisper text2'),
  (35486, 0, 5, 0, 61, 0, 100, 512, 0, 0, 0, 0, 22, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'linked - enter pending phase 6 (roll timer fires first prompt after read delay)'),
  (35486, 0, 6, 0, 28, 0, 100, 512, 0, 0, 0, 0, 41, 1500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'PASSENGER_REMOVED - despawn'),
  (35486, 0, 10, 11, 60, 32, 100, 512, 2500, 2500, 2500, 2500, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'pending (phase 6) UPDATE 2.5s - leave pending to phase 0'),
  (35486, 0, 11, 0, 61, 0, 100, 512, 0, 0, 0, 0, 30, 1, 2, 3, 4, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'linked - roll next prompt (random phase 1-5)'),
  (35486, 0, 20, 0, 66, 0, 100, 512, 1, 0, 0, 0, 1, 4, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'phase 1 - prompt Kaja mite Drill (text4)'),
  (35486, 0, 21, 0, 66, 0, 100, 512, 2, 0, 0, 0, 1, 5, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'phase 2 - prompt Blastcrackers (text5)'),
  (35486, 0, 22, 0, 66, 0, 100, 512, 4, 0, 0, 0, 1, 6, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'phase 3 - prompt Ear-O-Scope (text6)'),
  (35486, 0, 23, 0, 66, 0, 100, 512, 8, 0, 0, 0, 1, 7, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'phase 4 - prompt Infinifold Lockpick (text7)'),
  (35486, 0, 24, 0, 66, 0, 100, 512, 16, 0, 0, 0, 1, 8, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'phase 5 - prompt Amazing G-Ray (text8)'),
  (35486, 0, 30, 31, 60, 31, 100, 512, 15000, 15000, 15000, 15000, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'timeout - 15s cumulative on prompts (phases 1-5) -> phase 0, eject'),
  (35486, 0, 31, 32, 61, 0, 100, 512, 0, 0, 0, 0, 1, 11, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'timeout - whisper Timed Out (text11)'),
  (35486, 0, 32, 33, 61, 0, 100, 512, 0, 0, 0, 0, 11, 50630, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'timeout - eject rider (50630)'),
  (35486, 0, 33, 0, 61, 0, 100, 512, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'timeout - despawn'),
  (35486, 0, 40, 45, 8, 1, 100, 512, 67522, 0, 0, 0, 1, 9, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Drill correct (phase 1) - whisper Correct!'),
  (35486, 0, 41, 45, 8, 2, 100, 512, 67508, 0, 0, 0, 1, 9, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Blastcrackers correct (phase 2)'),
  (35486, 0, 42, 45, 8, 4, 100, 512, 67524, 0, 0, 0, 1, 9, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Ear-O-Scope correct (phase 3)'),
  (35486, 0, 43, 45, 8, 8, 100, 512, 67525, 0, 0, 0, 1, 9, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Lockpick correct (phase 4)'),
  (35486, 0, 44, 45, 8, 16, 100, 512, 67526, 0, 0, 0, 1, 9, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'G-Ray correct (phase 5)'),
  (35486, 0, 45, 0, 61, 0, 100, 512, 0, 0, 0, 0, 63, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'correct - counter +1 (COUNTER_SET routes phase 6 or success)'),
  (35486, 0, 50, 0, 77, 0, 100, 512, 1, 1, 0, 0, 22, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'counter=1 -> pending phase 6 (deferred roll)'),
  (35486, 0, 51, 0, 77, 0, 100, 512, 1, 2, 0, 0, 22, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'counter=2 -> pending phase 6'),
  (35486, 0, 52, 0, 77, 0, 100, 512, 1, 3, 0, 0, 22, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'counter=3 -> pending phase 6'),
  (35486, 0, 53, 54, 77, 0, 100, 512, 1, 4, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'counter=4 -> phase 0 (freeze roll), success'),
  (35486, 0, 54, 55, 61, 0, 100, 512, 0, 0, 0, 0, 1, 12, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'success - whisper Success! (text12)'),
  (35486, 0, 55, 56, 61, 0, 100, 512, 0, 0, 0, 0, 11, 67492, 2, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'success - cast Vault Cracked! Personal Riches (67492)'),
  (35486, 0, 56, 57, 61, 0, 100, 512, 0, 0, 0, 0, 11, 50630, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'success - eject rider (50630)'),
  (35486, 0, 57, 0, 61, 0, 100, 512, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'success - despawn'),
  (35486, 0, 60, 65, 8, 30, 100, 512, 67522, 0, 0, 0, 1, 10, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Drill wrong (phases 2-5) - whisper Incorrect!'),
  (35486, 0, 61, 65, 8, 29, 100, 512, 67508, 0, 0, 0, 1, 10, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Blastcrackers wrong'),
  (35486, 0, 62, 65, 8, 27, 100, 512, 67524, 0, 0, 0, 1, 10, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Ear-O-Scope wrong'),
  (35486, 0, 63, 65, 8, 23, 100, 512, 67525, 0, 0, 0, 1, 10, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Lockpick wrong'),
  (35486, 0, 64, 65, 8, 15, 100, 512, 67526, 0, 0, 0, 1, 10, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'G-Ray wrong'),
  (35486, 0, 65, 66, 61, 0, 100, 512, 0, 0, 0, 0, 11, 50630, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'wrong - eject rider (50630)'),
  (35486, 0, 66, 0, 61, 0, 100, 512, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'wrong - despawn');

-- ---- vault action bar: the 5 widgets as the vehicle's own spells ----
-- VehicleSpellInitialize sends creature_template_spell as the possessed
-- vehicle's action buttons (cf. stock cannons 27894/28833). Index = bar slot.
DELETE FROM creature_template_spell WHERE CreatureID = 35486;
INSERT INTO creature_template_spell (`CreatureID`, `Index`, `Spell`, `VerifiedBuild`) VALUES
  (35486, 0, 67522, 0),   -- Kaja''mite Drill
  (35486, 1, 67508, 0),   -- Blastcrackers
  (35486, 2, 67524, 0),   -- Ear-O-Scope
  (35486, 3, 67525, 0),   -- Infinifold Lockpick
  (35486, 4, 67526, 0);   -- Amazing G-Ray

-- (the old source-style timed actionlists are gone; clear any applied copies)
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid IN (3548600, 3548602, 3548610, 3548611, 3548612, 3548613, 3548614, 3548630, 3548650);

-- ---- creature_text: retail whispers (type 41 raid-boss whisper to the rider).
-- creature_text.py only sweeps zone-spawned NPCs, so the summon-only vault
-- bunny is hand-carried. Group 2 adapted: retail's worldstate progress bar is
-- replaced by the 4-correct-widgets rule.
DELETE FROM creature_text WHERE CreatureID = 35486;
INSERT INTO creature_text (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
  (35486, 0, 0, 'You are breaking into the vault to retrieve your Personal Riches!', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault intro 1'),
  (35486, 1, 0, 'Use what is called for in your Goblin All-In-1-Der Belt below to crack open the vault!$B|TInterface\\Icons\\INV_Misc_EngGizmos_20.blp:50|t |TInterface\\Icons\\INV_Misc_Bomb_07.blp:50|t |TInterface\\Icons\\INV_Misc_Ear_NightElf_02.blp:50|t |TInterface\\Icons\\INV_Misc_EngGizmos_swissArmy.blp:50|t |TInterface\\Icons\\INV_Weapon_ShortBlade_21.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault intro 2'),
  (35486, 2, 0, 'The vault will be cracked after |cFFFF2222four correct widgets!|r$B|TInterface\\Icons\\INV_Misc_coin_02.blp:50|t$BWrong widgets waste precious time - too slow and the vault seals up!', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault intro 3 (adapted)'),
  (35486, 3, 0, 'Good luck!', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault intro 4'),
  (35486, 4, 0, 'Use your |cFFFF2222Kaja''mite Drill!|r$B|TInterface\\Icons\\INV_Weapon_ShortBlade_21.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault prompt Drill'),
  (35486, 5, 0, 'Use your |cFFFF2222Blastcrackers!|r$B|TInterface\\Icons\\INV_Misc_Bomb_07.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault prompt Blastcrackers'),
  (35486, 6, 0, 'Use your |cFFFF2222Ear-O-Scope!|r$B|TInterface\\Icons\\INV_Misc_Ear_NightElf_02.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault prompt Ear-O-Scope'),
  (35486, 7, 0, 'Use your |cFFFF2222Infinifold Lockpick!|r$B|TInterface\\Icons\\INV_Misc_EngGizmos_swissArmy.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault prompt Lockpick'),
  (35486, 8, 0, 'Use your |cFFFF2222Amazing G-Ray!|r$B|TInterface\\Icons\\INV_Misc_EngGizmos_20.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault prompt G-Ray'),
  (35486, 9, 0, 'Correct!', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault correct'),
  (35486, 10, 0, 'Incorrect!', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault wrong'),
  (35486, 11, 0, 'Timed Out! Try again!', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault timeout'),
  (35486, 12, 0, 'Success! You have your Personal Riches!$B$B|TInterface\\Icons\\INV_Misc_coin_02.blp:50|t', 41, 0, 100, 0, 0, 0, 0, 0, 'Vault success');
