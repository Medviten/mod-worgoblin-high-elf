-- I-246 "Necessary Roughness" (24502) — retail-style shark waves.
--
-- Retail spawns NO static Steamwheedle Sharks (37114): riding the Bilgewater
-- Buccaneer applies 70016, whose aura-23 periodic (restored in dbc/[I-246]_spell.sql)
-- has the vehicle cast 69971 "Summon Steamwheedle Shark 000" every 5s. The summon
-- lands at lane marker 75042 (manual_spawns fixture, center-west field) via
-- TARGET_DEST_NEARBY_ENTRY + its type-13 condition, and the shark charges the
-- shredder. Footbomb impact 69993 -> AUTO SAI rows 0-2 (credit + dies).
--
-- The 3 Neltharion beach spawns of 37114 (-8592,-11034, ~350yd off-field) are
-- leftovers of the source's unfinished implementation — retail spawns NO static
-- sharks, and a static passive shark contradicts the summon design -> remove ALL
-- static 37114 rows. Deliberately BY ENTRY, not guid: the AUTO spawn file assigns
-- sequential guids, so any sweep change renumbers them and a guid-pinned override
-- silently misses (it did — adding marker 75042 to the sweep shifted the beach
-- sharks from 12000944-946 to 12000947+). The I-244 cascade reapplies this after
-- every regen. Summoned sharks are dynamic and unaffected by this DELETE.
DELETE FROM creature WHERE id = 37114;
-- earlier I-246 static field sharks (own block), superseded by the wave design
DELETE FROM creature WHERE guid IN (12950001, 12950002, 12950003);

-- Charge behavior: AUTO owns 37114 rows 0-2 (spellhit credit/die, JUST_SUMMONED
-- passive); rows 3+ are I-246-owned. On summon: WALK (slow, Warmane-observed
-- ~quarter pace — speed_walk below) toward the summoner (the vehicle / its
-- passenger), 45s fallback despawn; on arrival (point 1): ATTACK the shredder
-- (I-251, retail/Whitemane: sharks maul the vehicle until it is destroyed).
-- No faction change needed: template 7 (sharks) is friendly to nothing and
-- vehicle faction 35 is only friendly to PLAYERS, so a script-forced
-- ATTACK_START on the summoner is a valid attack while players still cannot
-- attack the shredder. Passive react (AUTO row 2) only blocks auto-aggro.
-- Row 5's 45s fallback doubles as the per-shark combat lifetime; row 7 cleans
-- up when the vehicle dies or the rider bails (evade).
-- I-251 FINAL: retail sharks never melee — they shoot **70027 Sharkblade**
-- (whitemane 4.3.4 data: instant, sawblade missile, 9-11 phys; ported in
-- dbc/[I-251]_spell.sql). v12 lessons baked in:
--   * Target = SMART_TARGET_CLOSEST_CREATURE(19) entry 37179 — NEVER 23
--     (owner/summoner): the wave aura 70016 is CLICKER-cast, so the summon
--     chain's original caster is the PLAYER and target-23 blades hit the
--     RIDER, not the shredder. Movement uses the same explicit target.
--   * Volleys gated on ARRIVAL (event 34, point 1 -> event phase 1): sharks
--     march silently and only open fire from the crowd around the shredder
--     (user direction: ~10yd, not cross-field). Arrival is trustworthy now
--     that movement uses an explicit target (v11's invoker-target move never
--     completed, which is what killed every arrival-gated row before).
-- Volley pacing (~3.5s/shark) vs the lvl-5 shredder pool = the shot clock.
DELETE FROM smart_scripts WHERE entryorguid = 37114 AND source_type = 0 AND id IN (3, 4, 5, 6, 7, 8, 9, 10);
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(37114, 0, 3, 4, 54, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'I-246 Steamwheedle Shark - Just Summoned - Set Walk'),
(37114, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 3, 1, 0, 19, 37179, 100, 0, 0, 0, 0, 0, 'I-246 Steamwheedle Shark - Linked - Advance on the Shredder (point 1)'),
(37114, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 45000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'I-246 Steamwheedle Shark - Linked - Fallback Despawn 45s'),
(37114, 0, 8, 0, 34, 0, 100, 0, 8, 1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'I-251 Steamwheedle Shark - Reached Shredder (point 1) - Set Event Phase 1'),
(37114, 0, 6, 0, 60, 1, 100, 0, 0, 500, 3000, 4500, 11, 70027, 2, 0, 0, 0, 0, 19, 37179, 100, 0, 0, 0, 0, 0, 'I-251 Steamwheedle Shark - Update (arrived) - Volley Sharkblade at the Shredder'),
(37114, 0, 7, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'I-251 Steamwheedle Shark - On Evade - Despawn');

-- Slow menacing advance (Warmane-observed ~0.25 pace): walk mode + reduced walk
-- speed => ~2 yd/s, ~21s to cross the 42yd field. 37114 creature_template is
-- AUTO-owned -> one consolidated UPDATE.
-- BaseAttackTime 0 in the ported template -> explicit 2s swing (I-251).
UPDATE creature_template SET speed_walk = 0.8, speed_run = 0.8, BaseAttackTime = 2000 WHERE entry = 37114;

-- A manual_spawns entry also imports the entry's SOURCE spawn rows (phase-1
-- duplicates ~0.1yd from the curated phase-3 markers, plus 75042's unrelated
-- beach spawn at phase 4096). Only the phase-3 manual markers serve the summons
-- -> drop everything else, by entry+phase (never by AUTO guid).
DELETE FROM creature WHERE id IN (75042, 75044, 75045) AND phaseMask != 3;

-- Lane marker bunnies must be invisible to players: Neltharion's Wondi utility
-- bunnies ship a VISIBLE display (16480). flags_extra 128 = CREATURE_FLAG_EXTRA_TRIGGER
-- (invisible + unselectable to players; GMs in GM mode still see them) plus
-- not-selectable unit_flags. Templates are AUTO-owned -> one UPDATE per entry.
UPDATE creature_template SET flags_extra = 128, unit_flags = 33554432 WHERE entry = 75042;
UPDATE creature_template SET flags_extra = 128, unit_flags = 33554432 WHERE entry = 75044;
UPDATE creature_template SET flags_extra = 128, unit_flags = 33554432 WHERE entry = 75045;

-- Lanes 2/3 for the three-effect 69971 (dbc/[I-246]_spell.sql): per-effect type-13
-- conditions, SourceGroup = effect mask (group 1 -> 75042 comes from source via the
-- AUTO conditions port; groups 2/4 are I-246-owned). The AUTO conditions file
-- DELETEs all type-13 rows for 69971 on regen; the I-244 cascade re-adds these.
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 69971 AND SourceGroup IN (2, 4);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(13, 2, 69971, 0, 0, 31, 0, 3, 75044, 0, 0, 0, 0, '', 'I-246 Summon Steamwheedle Shark eff2 -> center lane marker'),
(13, 4, 69971, 0, 0, 31, 0, 3, 75045, 0, 0, 0, 0, '', 'I-246 Summon Steamwheedle Shark eff3 -> south lane marker');

-- I-248: the source's faction 7 ("Creature") leaves the shredder attackable to
-- players; retail has it friendly like its companion Fourth and Goal Target
-- (37203, faction 35 in the same source). AIName for the exit-cleanup SAI
-- below (the ported template shipped none — F-011 "AIName dropped" pattern).
UPDATE creature_template SET faction = 35, AIName = 'SmartAI' WHERE entry = 37179;

-- I-251: sharks put the CHARMER (player) on their threat list while mauling the
-- possessed vehicle; on exit the vehicle stops being a valid CvC target (both
-- neutral) and they retarget the player and kill them. Retail exits cast 69987
-- "Despawn Sharks" — same idea here, keyed on SMART_EVENT_PASSENGER_REMOVED
-- (28). NOTE: the vehicle's SmartAI DOES tick while possessed (v9's OOC-update
-- version proved it by despawning every wave at birth — only the spellhit path
-- is dead on possessed vehicles, I-242), which is exactly why the exit event
-- fires reliably: any shark within 60yd despawns the moment the player bails.
DELETE FROM smart_scripts WHERE entryorguid = 37179 AND source_type = 0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(37179, 0, 0, 0, 28, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, 37114, 0, 60, 0, 0, 0, 0, 'I-251 Bilgewater Buccaneer - On Passenger Removed - Despawn field sharks');

-- I-251: ONE shredder on the field (user direction) — the second unpiloted
-- spawn drew sharkblades too and cluttered the field. Fixture updated to a
-- single midpoint spawn (manual_spawns_K.json, guid 12900001); these rows make
-- the live DB match until the next gen run (fixture guids are fixed, safe to
-- address directly).
DELETE FROM creature WHERE guid = 12900002;
UPDATE creature SET position_x = -8786.0, position_y = -11315.0, position_z = 41.68 WHERE guid = 12900001;

-- Spellclick gate: the source has no condition row for 37179's click (unfinished),
-- so anyone could ride and spawn sharks. Gate on quest 24502 "Necessary Roughness"
-- OR 28414 "Fourth and Goal" in log (retail behavior; the chain is
-- 24488 -> 24502 -> 28414 -> 24520 - 24503 is a dead duplicate of 28414). I-248.
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 18 AND SourceGroup = 37179 AND SourceEntry = 70016;
INSERT INTO conditions SET
  SourceTypeOrReferenceId = 18,
  SourceGroup = 37179,
  SourceEntry = 70016,
  SourceId = 0,
  ElseGroup = 0,
  ConditionTypeOrReference = 9,
  ConditionTarget = 0,
  ConditionValue1 = 24502,
  ConditionValue2 = 0,
  ConditionValue3 = 0,
  NegativeCondition = 0,
  ErrorType = 0,
  ErrorTextId = 0,
  ScriptName = '',
  Comment = 'I-246 Bilgewater Buccaneer spellclick only while on Necessary Roughness';
INSERT INTO conditions SET
  SourceTypeOrReferenceId = 18,
  SourceGroup = 37179,
  SourceEntry = 70016,
  SourceId = 0,
  ElseGroup = 1,
  ConditionTypeOrReference = 9,
  ConditionTarget = 0,
  ConditionValue1 = 28414,
  ConditionValue2 = 0,
  ConditionValue3 = 0,
  NegativeCondition = 0,
  ErrorType = 0,
  ErrorTextId = 0,
  ScriptName = '',
  Comment = 'I-248 Bilgewater Buccaneer spellclick also while on Fourth and Goal';
