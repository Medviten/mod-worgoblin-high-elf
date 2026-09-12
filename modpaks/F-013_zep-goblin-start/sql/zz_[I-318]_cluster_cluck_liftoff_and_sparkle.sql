-- I-318 : Cluster Cluck (q24671) - the Wild Clucker behaviour set.
--
-- Covers, in order: the interact sparkle (removed with the whole spellclick path),
-- the capture sequence (lift off before flying to the coop), and ambient wander
-- (the birds never moved at all before being captured).
--
-- The sparkle was invisible until the visual chain was ported (same issue): it is
-- `particles\lootfx.mdx`, carried by SpellVisual 15092, which rendered nothing
-- before spellvisuals.py started emitting it.

-- ---------------------------------------------------------------------------
-- 1. Cluster Cluck is item-only: no click interaction, no sparkle at all.
-- ---------------------------------------------------------------------------
-- The quest hands out an item ("Take these remote control fireworks and attach
-- them to the cluckers"), and the birds are ordinary selectable creatures, so the
-- spellclick path is redundant with the item path: both ended in the same place,
-- creature 38111 SPELLHIT 71170 -> actionlist 3811100. Dropping it removes the
-- whole sparkle apparatus rather than repairing it.
--
-- What the sparkle was and why it had to go:
--   * On the BIRDS it comes from `creature_template_addon` aura 66727 (plus 8
--     per-guid rows), permanent and identical for every observer. It cannot be
--     gated on quest state - a creature's ambient aura has no per-player variant -
--     so it kept shimmering long after turn-in. Retail hides them by phasing the
--     zone forward instead; all 65 spawns here sit in phaseMask 2048.
--   * On the PLAYER it was a real bug: `cast_flags` carried
--     NPC_CLICK_CAST_CASTER_CLICKER (0x1) from the donor, so AC resolved
--         Unit* caster = (castFlags & NPC_CLICK_CAST_CASTER_CLICKER) ? clicker : this;
--     and 66727 applies its aura to TARGET_UNIT_CASTER (1) - the permanent shimmer
--     landed on the clicking player and was SAVED to `character_aura`
--     (remainTime -1), surviving relogs. Existing victims need `.unaura 66727`;
--     SQL cannot reach an aura already on a character.
--
-- npcflag 16777216 (SPELLCLICK) is cleared too, so the client stops offering an
-- interact cursor for a click that no longer exists. Selectability is unaffected -
-- unit_flags 32768 is UNIT_FLAG_SWIMMING, not NOT_SELECTABLE (0x02000000) - so the
-- bird can still be targeted for the item.
--
-- Leaves creature 38111's two ON_SPELLCLICK SAI rows (ids 1 and 8) in place. With
-- no npcflag and no spellclick row, HandleSpellClick never runs and they are inert;
-- forking the whole 9-row block to delete two dead rows would freeze the escort
-- rows (which reference GO guid 106846) against future regens for no gain.
DELETE FROM npc_spellclick_spells WHERE npc_entry = 38111;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 18 AND SourceGroup = 38111;
UPDATE creature_template_addon SET auras = '' WHERE entry = 38111;
-- Scoped by ENTRY, never by guid list. The generator reassigns spawn guids between
-- runs: a regen on 2026-08-08 moved the eight aura-carrying addon rows from
-- 11001802/11/12/26/27/45/46/54 to 11001825/34/35/49/50/68/69/77, and the hardcoded
-- list this replaces then cleared eight rows that no longer existed while the
-- sparkle came back on eight birds. `creature_addon` is emitted with REPLACE, so the
-- rows return on every regen and this has to keep finding them.
UPDATE creature_addon SET auras = ''
 WHERE guid IN (SELECT guid FROM creature WHERE id = 38111);

-- Irresistible Pool Pony (38412 + 44578-44580 / 83142) has the identical
-- caster-clicker defect but genuinely needs its click, so it is repaired rather
-- than removed. Unreported only because its visual (17188) had not been emitted
-- yet - fixed here rather than left as a landmine for the next PATCH-Z. The
-- generator-side rule lives in `goblin_gen/spellclick.py::_fix_clicker_selfcast`;
-- this makes it live without a regen.
--
-- Deliberately NOT touched: clicks whose spell the creature does not already carry
-- (37945/38430 -> 70766 Dream State, aura 261 phase) and stock 24418 Flying Machine
-- Controls. There the clicker really is meant to be the caster.
UPDATE npc_spellclick_spells SET cast_flags = 0
 WHERE npc_entry IN (38412, 44578, 44579, 44580) AND spell_id = 83142;

-- ---------------------------------------------------------------------------
-- 2. Captured cluckers walked off instead of rocketing up.
-- ---------------------------------------------------------------------------
-- Full re-definition of timed actionlist 3811100 (the imported one is otherwise
-- kept beat for beat). Two changes to the source ordering:
--
--   * Flight (57403) is cast BEFORE the bird is asked to move, not after. The
--     import cast it at entry 5, two steps after the movement call.
--   * a vertical MOVE_TO_POS replaces nothing and is inserted before WP_START, so
--     the rocket carries the bird ~8 yards straight up first; the 2s that already
--     preceded the escort now covers the climb, and only then does it turn for the
--     coop. Previously the bird idled on the spot for 2s and then ran the escort
--     path at ground level, which is what "the motion seems weird" was.
--
-- MOVE_TO_POS (69) with target_type 1 (SELF) uses target_x/y/z as an OFFSET from
-- the creature's own position (SmartScript.cpp, the `default:` branch of the
-- action), so target_z = 8 is "8 yards above wherever this bird was clicked" - it
-- works for all 65 spawns without per-spawn coordinates. action_param6 = 0 leaves
-- disableForceDestination unset, i.e. forceDestination TRUE, so the climb is not
-- re-clamped to the ground by pathfinding.
--
-- The escort path itself (`waypoints` entry 38111 -> the coop, then ESCORT_REACHED
-- rows 3-7 on creature 38111 activate GO 106846 and despawn) is unchanged.
-- The authoritative definition of actionlist 3811100 is the single DELETE +
-- INSERT at the end of section 5 - it carries the final state including the
-- SET_FLY and emote-state beats added later. One representation per id: this
-- section describes the design, section 5 is where the rows live.

-- ---------------------------------------------------------------------------
-- 3. The cluckers never wandered - a one-shot MoveIdle was killing it.
-- ---------------------------------------------------------------------------
-- Imported SAI row (38111, source_type 0, id 0) is verbatim donor:
--
--     event 1 UPDATE_OOC, event_flags 1, action 89 RANDOM_MOVE, action_param1 0
--     comment: " Random move"
--
-- The comment states the intent, but AC reads a zero distance as the OPPOSITE:
--
--     if (e.action.moveRandom.distance) MoveRandom(distance); else MoveIdle();
--
-- so the row calls `MoveIdle()`. `event_flags 1` is SMART_EVENT_FLAG_NOT_REPEATABLE,
-- so it fires exactly once on the first out-of-combat update after spawn and
-- replaces the RandomMovementGenerator with an idle one - permanently. Every bird
-- stood perfectly still, which is why strapping a rocket to one looked so odd.
--
-- This is a donor/AC semantic divergence, not a lost value: the source row really
-- does carry 0. It is a one-off - of the 14 rows in the world with
-- action_type 89 / action_param1 0, the other 13 are stock AC content whose
-- comments show they genuinely mean "stop moving" (Karu, Zulian Crocolisk, Brann,
-- the Swine, ...), so there is nothing here to generalise into the generator.
-- Deleting the row lets the spawn-level movement config do its job. No other row
-- links to id 0, so removing it does not disturb the escort chain.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 38111 AND id = 0;

-- The donor has all 65 spawns at MovementType 0; the generator's TDB 4.3.4 wander
-- overlay granted MovementType 1 / wander_distance 10 to only 52 of them, and that
-- overlay is non-deterministic (its `tdb_q` has no ORDER BY), so the split moves
-- between regens. Normalising the whole entry is therefore both the fix for the 13
-- stragglers and self-healing against a future gen run redrawing the line.
--
-- wander_distance is the "how far do they roam" knob, and it is the RIGHT one for
-- that question - speed is not, because speed drives the animation rate (see
-- section 6). 4 yards keeps the birds pottering around their spawn instead of
-- striding across Kezan, at an unchanged, native-rate walk.
UPDATE creature SET MovementType = 1, wander_distance = 4 WHERE id = 38111;

-- Capture still stops the wander before lift-off: actionlist 3811100 id 2 is
-- RANDOM_MOVE 0, i.e. the very MoveIdle described above - which is exactly what it
-- is for in that context.

-- ---------------------------------------------------------------------------
-- 4. ...but they wandered through the AIR, because the bird had no ground mode.
-- ---------------------------------------------------------------------------
-- The donor's `creature_template.InhabitType` for 38111 is 4 (air only), and
-- immunities_movement.py maps those bits straight to Ground/Swim/Flight, giving
-- Ground = 0 (CreatureGroundMovementType::None) and Flight = 1 (DisableGravity).
-- A creature with Ground = None has no ground movement at all, so the moment
-- section 3 turned wandering on, 65 chickens drifted around in the air.
--
-- It never showed before because the MoveIdle row froze them on the spot, which
-- is presumably why the donor never noticed either.
--
-- BUSHCHICKEN.M2 settles what it should be: 18 animations, none of them flight —
-- Stand / Walk / Run / Jump / Fall / Swim / AttackUnarmed. A flying clucker has no
-- anim to play and glides in its Stand pose. It is a ground bird that gets a rocket
-- strapped to it, not a flyer.
--
-- Flight must NOT go to 0. `Creature::UpdateMovementFlags` strips the flag when the
-- template forbids flight:
--
--     if (GetMovementTemplate().IsFlightAllowed() && isInAir && !IsFalling()) { ... }
--     else { if (m_movementInfo.HasMovementFlag(MOVEMENTFLAG_CAN_FLY)) SetCanFly(false); ... }
--
-- and `IsFlightAllowed()` is `Flight != None`, so Flight = 0 would undo the
-- SetCanFly(true) that capture spell 57403 (SPELL_AURA_FLY) applies, breaking the
-- lift-off. Flight = 2 (CanFly) instead: while the bird is on the ground `isInAir`
-- is false, so the else branch keeps it walking with no fly flags, and once the
-- rocket takes it up the same branch that would have stripped the flag now
-- maintains it.
--
-- (Superseded by section 5 - Flight = 2 turned out to be wrong for a different
-- reason. The single authoritative UPDATE is in "Final state" at the end.)

-- ---------------------------------------------------------------------------
-- 5. Walk on the ground; fly (and hold SwimIdle) only once rocketed.
-- ---------------------------------------------------------------------------
-- Section 4's Ground=1/Flight=2 stopped short: `Creature::CanFly()` is
--
--     bool CanFly() const override { return GetMovementTemplate().IsFlightAllowed() || IsFlying(); }
--
-- so ANY non-zero Flight makes CanFly() true even while the bird is stood on the
-- ground. `UpdateAllowedPositionZ` then never clamps the wander destination to the
-- terrain, and the random movement generator picks points in the air - the birds
-- swam around the sky. (The client falls back to the swim anims for a flying model
-- with no flight sequences, which is what that looked like: BUSHCHICKEN.M2 has
-- Stand / Walk / Run / Jump / Fall / Swim and no Fly* at all.)
--
-- Flight must therefore be 0 for a grounded wander. But Flight 0 alone breaks the
-- capture, twice over:
--   * `SetCanFly()` only sets MOVEMENTFLAG_CAN_FLY, while `IsFlying()` tests
--     MOVEMENTFLAG_FLYING | DISABLE_GRAVITY - so capture spell 57403 (aura 201)
--     leaves CanFly() false and the climb would be re-clamped to the ground; and
--   * `UpdateMovementFlags` strips CAN_FLY and DISABLE_GRAVITY on every update when
--     `IsFlightAllowed()` is false.
--
-- Hence all three of:
--   * Flight 0 / Ground 1 (Run)          - walks while idle, wander clamps to terrain
--   * flags_extra |= 0x200               - CREATURE_FLAG_EXTRA_NO_MOVE_FLAGS_UPDATE,
--                                          so UpdateMovementFlags returns early and
--                                          stops undoing the capture state
--   * SMART_ACTION_SET_FLY (60) at capture - SmartAI::SetFly -> SetCanFly(true) AND
--                                          setFly.disableGravity -> SetDisableGravity(true),
--                                          which is what actually makes IsFlying()
--                                          (and so CanFly()) true for the climb.

-- Actionlist rebuilt with the two new beats. SET_FLY (60) params are
-- fly / speed / disableGravity per the struct (the header comment is "0/1" only).
-- SET_EMOTE_STATE (17) writes UNIT_NPC_EMOTESTATE; emote 437 STATE_SWIM_IDLE is the
-- one that maps to AnimationData 41 SwimIdle, with EmoteSpecProc 2 (a looping state),
-- so the airborne bird holds that pose instead of falling back to Stand. It is never
-- cleared because the bird despawns at the coop.
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid = 3811100;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (3811100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Clear NPC flags (no second click)'),
  (3811100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 38117, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Quest credit to the invoker'),
  (3811100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Stop wandering (MoveIdle)'),
  (3811100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Set faction 35'),
  (3811100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - SET_FLY + disable gravity (no forced speed - see section 8)'),
  (3811100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 57403, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Cast Flight'),
  (3811100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 74177, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Cast the jetpack visual'),
  (3811100, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 96840, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Cast Rocket Trail'),
  (3811100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 437, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Emote state 437 STATE_SWIM_IDLE (anim 41) for the flight (I-318)'),
  (3811100, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 'Wild Clucker - Captured - Rocket 8y straight up (I-318)'),
  (3811100, 9, 10, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 2, 38111, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Fly the escort path to the coop (param1 2 = FORCED_MOVEMENT_RUN, I-318)');

-- ---------------------------------------------------------------------------
-- 6. The shipped M2 lied about its Walk speed. That was the whole problem.
-- ---------------------------------------------------------------------------
-- The client scales locomotion playback by (actual speed / the pace the SEQUENCE
-- SAYS it was authored for), and the shipped model was carrying a false figure:
--
--     BushChicken.M2, anim 4 Walk, moveSpeed at sequence-record offset 8
--       4.3.4 original      0.3611 yd/s
--       our shipped v264    2.5000 yd/s   <- exactly baseMoveSpeed[MOVE_WALK]
--
-- Only Walk; Run agrees at 4.1667 in both. Someone or something "normalised" the
-- field to AC's default walk speed. 2.5 / 0.3611 = 6.9, so at the speed that field
-- demanded the bird covered nearly SEVEN times the ground its legs were drawn for:
-- "anim playing super slow but movement is too fast", and a model viewer showing
-- the cycle far quicker than the game.
--
-- Every earlier attempt to tune this was chasing the lie. speed_walk 1.0 gave
-- ratio 1.0 against the false 2.5 - native cycle rate, seven times too much ground.
-- Dropping to 0.25 fixed the ground and visibly slowed the legs (ratio 0.25),
-- because the ratio is what drives playback.
--
-- Fixed at the source: the Walk moveSpeed in
-- `mpq/{source,parsed}-assets/.../bushchicken.m2` is patched back to the 4.3.4
-- value, bytes copied verbatim from the original rather than retyped (backups
-- alongside as *.pre-I318.bak). With the field honest, the matching server speed is
--
--     0.3611111 / 2.5 (baseMoveSpeed[MOVE_WALK]) = 0.144444
--
-- which gives ratio 1.0: native cycle rate AND the stride the animation actually
-- depicts. Ships in PATCH-Z; the DBC/MPQ half and the SQL half must land together.
--
-- WITH THE FIELD HONEST, SPEED BECOMES A FREE KNOB. Playback rate is
-- (speed / authored), so the cycle lasts 1000ms * authored / speed and the ground
-- covered per cycle is
--
--     speed * cycle = speed * (1000ms * authored / speed) = 1000ms * authored
--                   = 0.3611 yards, INVARIANT at every speed
--
-- The feet therefore cannot slide again whatever value is chosen - lowering the
-- speed slows the legs and the body together and the two stay locked. That is only
-- true because the authored figure now matches the art; while it was the false 2.5,
-- every change to speed desynced them, which is what made sections 7-9 unwinnable.
--
-- Native rate (0.3611 yd/s) read as too brisk in game, so the cadence is halved:
-- speed_walk 0.072222 -> 0.1806 yd/s, 0.50x rate, a 2000ms cycle, same 0.3611 yd
-- stride. Purely taste now; scale it freely (0.048148 = a third, 0.036111 = a
-- quarter) without touching the model.
--
-- Which anim plays is `creature_template_movement.Random`, read by
-- `RandomMovementGenerator` to set the spline's walk flag:
--
--     case CreatureRandomMovementType::CanRun:    walk = creature->IsWalking(); break;
--     case CreatureRandomMovementType::AlwaysRun: walk = false;                 break;
--
-- Random stays 0 (Walk) - the Walk sequence is the one that was mis-declared and is
-- now correct. Run was always honest, so Random = 2 with speed_run = 0.595238
-- (4.1667/7.0) remains a valid alternative; it needs
-- `.reload creature_movement_override`, because a per-spawn cache shadows the
-- template (`Creature::GetMovementTemplate` checks
-- `GetCreatureMovementOverride(m_spawnId)` first) and `.reload creature_template`
-- does not refresh it.
--
-- speed_run stays at the donor 1.0 - unused while the wander walks (Random 0 means
-- ground movement takes MOVE_WALK), so MOVE_RUN belongs entirely to the capture
-- flight and the actionlist sets it explicitly at both stages. See section 8.

-- ---------------------------------------------------------------------------
-- Final state - one consolidated UPDATE per row id (see the SQL standard).
-- ---------------------------------------------------------------------------
--   npcflag      0          section 1 - no spellclick affordance
--   KillCredit1  0          section 9 - killing a bird must not count as a capture
--   flags_extra  |0x200     section 5 - NO_MOVE_FLAGS_UPDATE, keeps capture flight
--   speed_walk   0.072222   section 6 - 0.1806 yd/s, half cadence, stride locked
--   speed_run    3          section 8 - MOVE_RUN 21 yd/s, the capture flight
UPDATE creature_template SET
  npcflag = 0,
  KillCredit1 = 0,
  flags_extra = flags_extra | 0x200,
  speed_walk = 0.072222,
  speed_run = 3
WHERE entry = 38111;

--   Ground 1 (Run)  Flight 0 (None)  Random 0 (Walk)   sections 4-6
UPDATE creature_template_movement SET
  Ground = 1,
  Flight = 0,
  Random = 0
WHERE CreatureId = 38111;

-- ---------------------------------------------------------------------------
-- 7. One clucker size, the large one.
-- ---------------------------------------------------------------------------
-- The size variation was faithful, not a port defect: 4.3.4 CreatureDisplayInfo
-- carries three displays on model 3262 differing ONLY in creature_model_scale -
--
--     30969  1.00      30970  1.25      30971  1.50
--
-- every other field (model, sound, extended info, texture variations, blood,
-- geoset, effect package) is identical across the three, and the emitted
-- creature_template_model gave each an equal Probability, so a flock came out in
-- three sizes. Blizzard varies them on purpose; we want them uniform.
--
-- Collapsed to a single model row on the largest. Safe to drop the other two:
-- `ObjectMgr::LoadCreatureTemplateModels` selects `ORDER BY Idx ASC` and never
-- reads Idx back, so Idx is only an ordering key - it need not start at 0 or be
-- contiguous - and the `creature` table has no modelid column, so no spawn pins a
-- display of its own.
--
-- DisplayScale stays 1: that is the server-side multiplier applied ON TOP of the
-- DBC scale, so the 1.5 comes through untouched.
DELETE FROM creature_template_model WHERE CreatureID = 38111;
INSERT INTO creature_template_model (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
  (38111, 0, 30971, 1, 1, 0);

-- ---------------------------------------------------------------------------
-- 8. The flight speed must come from the TEMPLATE, not a forced SetSpeed.
-- ---------------------------------------------------------------------------
-- The climb reads as a quick rocket and the trip to the coop as a crawl. The
-- distance explains part of it - the climb is 8 yards, while the escort path is
-- FIXED near the coop (`waypoints` entry 38111 starts at 394, -10467) and the 65
-- spawns spread from x 313-496 / y -10432 to -10541, so a bird captured at the far
-- edge covers well over a hundred yards to reach point 1.
--
-- Which speed governs it is not the obvious one:
--
--     UnitMoveType MovementInfo::GetSpeedType(uint32 moveFlags)
--     { if (moveFlags & MOVEMENTFLAG_FLYING) return MOVE_FLIGHT; ... return MOVE_RUN; }
--
-- keys on MOVEMENTFLAG_FLYING (0x02000000), which the header itself notes is
-- "only used for players. creatures use disable_gravity". SET_FLY gives CAN_FLY
-- (0x01000000) and DISABLE_GRAVITY (0x400), so the test never matches and both legs
-- take **MOVE_RUN**. `speed_flight` (0.5) is never consulted despite the bird being
-- airborne - tuning it would do nothing.
--
-- A first attempt ramped MOVE_RUN with SET_FLY's speed param
-- (`SetSpeed(MOVE_RUN, speed / 100.0f, true)`) between the climb and ESCORT_START.
-- It did not take. A forced SetSpeed only holds until something calls
-- `Unit::UpdateSpeed(MOVE_RUN)`, which recomputes from scratch and ends with
--
--     speed *= ToCreature()->GetCreatureTemplate()->speed_run;
--
-- and the capture chain applies auras (57403 carries 201/37/206) that do exactly
-- that. So the value has to live in the template where the recomputation lands:
-- speed_run 1 -> 3 gives MOVE_RUN 21 yd/s, three times player run speed, for both
-- the climb and the flight. The SET_FLY rows now pass 0 as the speed param, which
-- skips the forced call entirely.
--
-- Spline clamp is not in the way:
--     min(velocity, catmullrom || flying ? 50.0 : max(28.0, GetSpeed(MOVE_RUN) * 4.0))
-- = max(28.0, 84.0) = 84 at this rate.
--
-- Side effect accepted: MOVE_RUN is also what a fleeing critter uses, so an attacked
-- clucker bolts at 21 yd/s. They are passive level 1 critters that no longer give
-- kill credit (section 9), so nothing hangs on it. The ground wander is unaffected -
-- Random 0 means it takes MOVE_WALK.
--
-- ...and NONE of that was why the flight was slow. The escort was never using
-- MOVE_RUN at all. ESCORT_START's first parameter is documented in the header as
--
--     SMART_ACTION_ESCORT_START = 53,   // run/walk, pathID, ...
--
-- which reads like a boolean, but the struct field is `forcedMovement` and the enum
-- is `FORCED_MOVEMENT_NONE = 0, FORCED_MOVEMENT_WALK = 1, FORCED_MOVEMENT_RUN = 2`.
-- The imported 1 therefore forced the escort to **WALK**, at speed_walk - which
-- section 6 had deliberately lowered to 0.1806 yd/s to match the walk animation. A
-- rocket-propelled chicken crossing a hundred yards at a fifth of a yard per second.
-- It also explains why two separate attempts to raise MOVE_RUN changed nothing.
--
-- param1 -> 2 (FORCED_MOVEMENT_RUN). Both legs now take MOVE_RUN and the flight
-- matches the climb by construction.
--
-- SYSTEMIC: the donor core declares that same field as `uint32 run` (Neltharion
-- 4.3.4 SmartScriptMgr.h), i.e. 1 = RUN. Every ported escort row therefore carries a
-- value whose MEANING inverts on import - 318 F-011 rows currently pass 1 and walk
-- where the source meant run. Remapped at the generator; see smartai.py.

-- ---------------------------------------------------------------------------
-- 9. Killing a clucker must not count as capturing it.
-- ---------------------------------------------------------------------------
-- The donor sets `creature_template.KillCredit1 = 38117` on 38111, and the port
-- carried it verbatim. That is a SECOND, independent credit path: AC's
-- `Player::KilledMonster` follows KillCredit1/2 on death, so simply killing a bird
-- ticked the objective. The birds are level 1 critters, so that is the easiest way
-- to finish the quest and it bypasses the fireworks entirely.
--
-- The capture credit does not come from this field - it comes from the actionlist
-- (3811100 id 1, CALL_KILLEDMONSTER 38117 on the action invoker), so clearing
-- KillCredit1 costs nothing and closes the shortcut. Checked for other death paths
-- first: creature 38111 has no JUST_DIED (event 6) SAI row, so this was the only one.
--
-- Folded into the consolidated creature_template UPDATE above rather than appended
-- as its own statement - one UPDATE per row id.
