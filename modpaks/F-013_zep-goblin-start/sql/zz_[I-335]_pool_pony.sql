-- I-335 "Irresistible Pool Pony" (quest 24864) — the Naga Hatchling behaviour set.
--
-- The pony's own missing model is a DBC problem and lives in
-- `dbc/[I-335]_spellvisualeffectname.sql` + `dbc/[I-335]_spellvisualkitmodelattach.sql`.
-- This file is the server half: clicking a hatchling did nothing at all.
--
-- ---------------------------------------------------------------------------
-- 1. The click was wired to a spell that cannot exist here.
-- ---------------------------------------------------------------------------
-- The donor drives the whole quest through a marker spell, 151147, which is NOT a
-- 4.3.4 client spell — it is absent from the Whitemane Spell.dbc and exists only as
-- a row in Neltharion's server-side `spell_dbc` override table, with no SpellEffect
-- rows anywhere. It is a Neltharion invention, and one we can never port. Its two
-- rows on each hatchling:
--
--   id 0  event 73 ON_SPELLCLICK  -> action 85  (their INVOKER_CAST) 151147 at invoker
--   id 1  event  8 SPELLHIT 151147 -> action 88 CALL_RANDOM_RANGE_TIMED_ACTIONLIST
--                                     3841200-3841203
--
-- `smartai.py` correctly refused row 0: SMART_ACTION_CAST/INVOKER_CAST params are
-- checked against the spells the port actually ships, and firing a NULL SpellInfo
-- takes the worldserver down (I-230/I-274). But nothing checks EVENT params, so row
-- 1 was imported intact and has been sitting there ever since waiting to be hit by a
-- spell that will never be cast. Click the hatchling, get the Loot FX sparkle from
-- `npc_spellclick_spells`, and nothing else happens — which is the report.
--
-- Repaired by collapsing the pair, which is what the marker was standing in for: the
-- actionlist hangs off ON_SPELLCLICK directly. That is strictly BETTER than the donor
-- shape here, because SmartAI::OnSpellClick passes the clicker as the invoker, and
-- the actionlist needs a PLAYER invoker to work at all:
--
--   id 3  SMART_ACTION_CALL_KILLEDMONSTER 38413 at ACTION_INVOKER   the quest credit
--   id 4  SMART_ACTION_CROSS_CAST 71919 (summon 44588) cast BY ACTION_INVOKER
--
-- Both resolve ACTION_INVOKER, and the summon's caster is what makes the summoned
-- hatchling the player's — 44588-44591 answer SMART_EVENT_JUST_SUMMONED with
-- SMART_ACTION_FOLLOW at the summoner, which is the "lure them away" the quest text
-- describes. Nothing else in the actionlist changes.
--
-- One click = one credit = one follower, 12 times. The donor may well have meant
-- 151147 as an AoE that credited every hatchling in range at once, but with no
-- SpellEffect rows for it that is unknowable, and per-click is the reading the quest
-- objective ("lure 12 Naga Hatchlings") supports.
--
-- Scoped by ENTRY. `event_flags` 1 (NOT_REPEATABLE) and the actionlist range are the
-- donor's and are left alone; the click is already gated to quest-takers by the
-- `conditions` row on `npc_spellclick_spells` (SourceTypeOrReferenceId 18, condition
-- 9 CONDITION_QUEST_TAKEN 24864), so SmartAI::OnSpellClick only fires for them —
-- it early-returns when the spellclick itself was refused.
--
-- AUTO-owned rows -> UPDATE, one statement.
UPDATE smart_scripts SET
  `event_type` = 73,
  `event_param1` = 0,
  `comment` = 'Naga Hatchling - On Spellclick - Run Random Actionlist (I-335)'
WHERE source_type = 0 AND id = 1 AND entryorguid IN (38412, 44578, 44579, 44580);

-- ---------------------------------------------------------------------------
-- 2. The lured hatchlings never went away.
-- ---------------------------------------------------------------------------
-- Same marker-spell defect one step later. 44588-44591 carry
--
--   id 0  event 8 SPELLHIT 151146 -> SMART_ACTION_FORCE_DESPAWN
--
-- and 151146 is cast by the donor's quest-ender, Megs Dreadshredder (38432), on
-- SMART_EVENT_REWARD_QUEST 24864 — again through their action 85 at the invoker,
-- again a spell that only exists in Neltharion's `spell_dbc`, again dropped on
-- import. So the escort has no exit: SummonProperties 3023 is `control` 1 with
-- DurationIndex 21 (infinite), i.e. the twelve hatchlings would follow the player
-- for the rest of the session after turn-in.
--
-- Same collapse, on the ender instead of a marker: despawn the followers directly
-- when the quest is rewarded. SMART_TARGET_CREATURE_DISTANCE takes one entry per
-- row, hence four. 40 yards covers a 2-yard follow chain with room to spare.
--
-- Despawning another player's followers standing at the turn-in costs them nothing:
-- credit is banked at click time, not at despawn, so the objective is already
-- complete before this can reach them.
--
-- Ids 20-23 are ours (the donor's rows on this entry are 0-8) -> DELETE + INSERT.
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = 38432 AND id IN (20, 21, 22, 23);
INSERT INTO smart_scripts
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`,
   `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`,
   `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`,
   `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
   `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (38432, 0, 20, 0, 20, 0, 100, 0, 24864, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, 44588, 40, 0, 0, 0, 0, 0, 0, 'Megs Dreadshredder - On Quest 24864 Rewarded - Despawn Naga Hatchling 44588 (I-335)'),
  (38432, 0, 21, 0, 20, 0, 100, 0, 24864, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, 44589, 40, 0, 0, 0, 0, 0, 0, 'Megs Dreadshredder - On Quest 24864 Rewarded - Despawn Naga Hatchling 44589 (I-335)'),
  (38432, 0, 22, 0, 20, 0, 100, 0, 24864, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, 44590, 40, 0, 0, 0, 0, 0, 0, 'Megs Dreadshredder - On Quest 24864 Rewarded - Despawn Naga Hatchling 44590 (I-335)'),
  (38432, 0, 23, 0, 20, 0, 100, 0, 24864, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, 44591, 40, 0, 0, 0, 0, 0, 0, 'Megs Dreadshredder - On Quest 24864 Rewarded - Despawn Naga Hatchling 44591 (I-335)');

-- The now-dead SPELLHIT 151146 rows on 44588-44591 are LEFT in place: with no caster
-- for 151146 they never fire, and rewriting them would fork four more AUTO rows for
-- no behaviour. Same for 38318 / 75116, which carry the other two Neltharion marker
-- spells (151145 / 151150) and belong to their own content.
