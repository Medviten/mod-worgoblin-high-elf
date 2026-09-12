-- I-262 "Waltz Right In" (14123) — mook disguise, never ported (retail rig is a
-- Neltharion C++ script; nothing for the gen pipeline to collect). Loads after
-- the [AUTO,F-011] files and owns:
--   * transform helper template 948925 (single-model, never spawned) — aura 56
--     misc value for spell 67435 (dbc/[I-262]_spell.sql). Display 30262 = purple
--     hobgoblin (the Villa Mook look, stock model 3194; creature_model_info row
--     already live). Entry = 9 + source NPC 48925, the I-254 helper convention.
--   * spell_area: hidden carrier 67435 auto-applies in Gallywix's Villa (area
--     4768) while 14123 is INCOMPLETE or COMPLETE-but-unrewarded — faithful to
--     the retail sniff row (151342, 4768, 14123, ..., statuses 10/11); you keep
--     the disguise while carrying the loot out.
--   * spell_linked_spell type 2: carrier co-applies/co-removes the visible
--     disguise 70467 (I-254 verified pattern) — instant disguise on entry, clean
--     removal on leaving/turn-in; the carrier's 5s periodic re-applies it after
--     a combat drop (dbc/[I-262]_spell.sql).
--   * spell_script_names: round-4 out-of-combat gate on the carrier
--     (spell_zep_mook_disguise_carrier, zeppelin_goblin_start.cpp) — while in
--     combat the periodic strips the disguise instead of re-casting it, so no
--     buff/transform flicker mid-fight; it returns <=5s after combat ends.

-- ---- transform helper template (we own; referenced by aura 56 misc only) ----
DELETE FROM creature_template WHERE entry = 948925;
INSERT INTO creature_template SET
  entry = 948925,
  name = 'Mook Disguise',
  subname = '',
  minlevel = 1,
  maxlevel = 1,
  faction = 35,
  unit_class = 1,
  type = 7,
  AIName = 'NullAI';

DELETE FROM creature_template_model WHERE CreatureID = 948925;
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) VALUES
  (948925, 0, 30262, 1, 1, 0);   -- purple hobgoblin (Villa Mook display)

-- ---- disguise while in the villa on the quest ----
DELETE FROM spell_area WHERE spell = 67435 AND area = 4768;
INSERT INTO spell_area (spell, area, quest_start, quest_end, aura_spell, racemask, gender, autocast, quest_start_status, quest_end_status) VALUES
  (67435, 4768, 14123, 14123, 0, 0, 2, 1, 10, 11);

-- ---- carrier -> visible disguise, applied and removed together ----
DELETE FROM spell_linked_spell WHERE spell_trigger = 67435;
INSERT INTO spell_linked_spell (spell_trigger, spell_effect, type, comment) VALUES
  (67435, 70467, 2, 'Waltz Right In: cap carrier - co-apply/remove mook disguise (I-262)');

-- ---- out-of-combat gate on the carrier periodic (round 4) ----
DELETE FROM spell_script_names WHERE spell_id = 67435;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
  (67435, 'spell_zep_mook_disguise_carrier');
