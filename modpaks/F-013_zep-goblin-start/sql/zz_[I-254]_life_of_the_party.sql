-- I-254 "Life of the Party" (14113 male / 14153 female) — full party system port.
-- Loads after the [AUTO,F-011] files and owns:
--   * spell_area: party costume + action bar while the quest is INCOMPLETE in
--     area 4765 (KTC Headquarters pool), faithful to the Cata sniff rows
--     (statuses 8/11, gender-split outfits).
--   * spell_linked_spell: outfit aura co-applies/removes 66985 (disarm set) so
--     weapons don't clip the costume and it can't stick after leaving the party.
--   * transform helper templates 935175/935186 (single-model, never spawned) —
--     aura 56 misc values for the [I-254]_spell.sql outfit overrides.
--   * gameobject_template 195378 Bucket (source GO the port skipped; vanilla
--     display 239) for the bucket-need cosmetic summon.
--   * retail-like partygoer SmartAI for 35175/35186, replacing the source dump's
--     dead stub (has-aura 66916 -> killcredit with nothing able to apply 66916):
--     random need via phases, matching bar-spell spellhit -> thanks line + Happy
--     Partygoer + killcredit 35175, re-roll 30s later. Spell/text mapping:
--       phase 1 dance     66911  need talk 0 / thanks 5  (+disco ball 195373)
--       phase 2 drink     66909  need talk 1 / thanks 6
--       phase 3 food      66913  need talk 2 / thanks 7
--       phase 4 bucket    66910  need talk 3 / thanks 8  (+bucket 195378)
--       phase 5 fireworks 66912  need talk 4 / thanks 9  (+invoker casts random
--                                firework 66917/18/19 via timed actionlists)

-- ---- transform helper templates (we own; referenced by aura 56 misc only) ----
DELETE FROM creature_template WHERE entry IN (935175, 935186);
INSERT INTO creature_template SET
  entry = 935175,
  name = 'Life of the Party Outfit - Male',
  subname = '',
  minlevel = 1,
  maxlevel = 1,
  faction = 35,
  unit_class = 1,
  type = 7,
  AIName = 'NullAI';
INSERT INTO creature_template SET
  entry = 935186,
  name = 'Life of the Party Outfit - Female',
  subname = '',
  minlevel = 1,
  maxlevel = 1,
  faction = 35,
  unit_class = 1,
  type = 7,
  AIName = 'NullAI';

DELETE FROM creature_template_model WHERE CreatureID IN (935175, 935186);
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) VALUES
  (935175, 0, 29630, 1, 1, 0),   -- goblin male, tuxedo (partygoer display, bake shipped)
  (935186, 0, 29631, 1, 1, 0);   -- goblin female, party dress

-- ---- bucket cosmetic GO (source 195378; the disco ball 195373 was auto-ported) ----
DELETE FROM gameobject_template WHERE entry = 195378;
INSERT INTO gameobject_template SET
  entry = 195378,
  type = 5,
  displayId = 239,
  name = 'Bucket',
  size = 0.5;

-- ---- costume + party bar (spell_area, Cata sniff: active only while INCOMPLETE) ----
DELETE FROM spell_area WHERE spell IN (66908, 66927, 66928) AND area = 4765;
INSERT INTO spell_area (spell, area, quest_start, quest_end, aura_spell, racemask, gender, autocast, quest_start_status, quest_end_status) VALUES
  (66908, 4765, 14113, 14113, 0, 0, 2, 1, 8, 11),   -- party bar, male quest
  (66908, 4765, 14153, 14153, 0, 0, 2, 1, 8, 11),   -- party bar, female quest
  (66928, 4765, 14113, 14113, 0, 0, 0, 1, 8, 11),   -- tux outfit, males
  (66927, 4765, 14153, 14153, 0, 0, 1, 1, 8, 11);   -- dress outfit, females

-- ---- outfit -> disarm set, applied and removed together (SPELL_LINK_AURA) ----
DELETE FROM spell_linked_spell WHERE spell_trigger IN (66927, 66928);
INSERT INTO spell_linked_spell (spell_trigger, spell_effect, type, comment) VALUES
  (66927, 66985, 2, 'Life of the Party: Outfit Female - link disarm set (I-254)'),
  (66928, 66985, 2, 'Life of the Party: Outfit Male - link disarm set (I-254)');

-- ---- partygoer SmartAI ----
-- 35175 is AUTO-owned (stub replaced here); 35186 shipped without AIName.
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = 35186;

DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid IN (35175, 35186);
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid IN (3517500, 3517501, 3517502, 3518600, 3518601, 3518602);
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_param4, target_x, target_y, target_z, target_o, comment) VALUES
  -- roll a need on spawn/reset
  (35175, 0,  0, 0, 25, 0,  100, 0, 0, 0, 0, 0,          30, 1, 2, 3, 4, 5, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Reset - Random need phase'),
  -- need chatter
  (35175, 0,  1, 0, 1,  1,  100, 0, 10000, 60000, 20000, 60000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need dance line'),
  (35175, 0,  2, 0, 1,  2,  100, 0, 10000, 60000, 20000, 60000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need drink line'),
  (35175, 0,  3, 0, 1,  4,  100, 0, 10000, 60000, 20000, 60000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need food line'),
  (35175, 0,  4, 0, 1,  8,  100, 0, 10000, 60000, 20000, 60000, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need bucket line'),
  (35175, 0,  5, 0, 1,  16, 100, 0, 10000, 60000, 20000, 60000, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need fireworks line'),
  -- dance satisfied
  (35175, 0,  6, 7, 8,  1,  100, 0, 66911, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Dance - Quest credit'),
  (35175, 0,  7, 8, 61, 0,  100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35175, 0,  8, 9, 61, 0,  100, 0, 0, 0, 0, 0,          1, 5, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Dance thanks line'),
  (35175, 0,  9, 10, 61, 0, 100, 0, 0, 0, 0, 0,          17, 10, 0, 0, 0, 0, 0,      1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Dance emote state'),
  (35175, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0,          50, 195373, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Summon Disco Ball'),
  (35175, 0, 11, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  -- drink satisfied
  (35175, 0, 12, 13, 8, 2,  100, 0, 66909, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Bubbly - Quest credit'),
  (35175, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35175, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0,          1, 6, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Drink thanks line'),
  (35175, 0, 15, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  -- food satisfied
  (35175, 0, 16, 17, 8, 4,  100, 0, 66913, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Hors D''oeuvres - Quest credit'),
  (35175, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35175, 0, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0,          1, 7, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Food thanks line'),
  (35175, 0, 19, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  -- bucket satisfied
  (35175, 0, 20, 21, 8, 8,  100, 0, 66910, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Bucket - Quest credit'),
  (35175, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35175, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0,          1, 8, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Bucket thanks line'),
  (35175, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0,          50, 195378, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Summon Bucket'),
  (35175, 0, 24, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  -- fireworks satisfied
  (35175, 0, 25, 26, 8, 16, 100, 0, 66912, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Fireworks - Quest credit'),
  (35175, 0, 26, 27, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35175, 0, 27, 28, 61, 0, 100, 0, 0, 0, 0, 0,          1, 9, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Fireworks thanks line'),
  (35175, 0, 28, 29, 61, 0, 100, 0, 0, 0, 0, 0,          87, 3517500, 3517501, 3517502, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Invoker casts random firework'),
  (35175, 0, 29, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  -- happy cooldown, then re-roll
  (35175, 0, 30, 31, 1, 32, 100, 0, 30000, 30000, 30000, 30000, 28, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC happy phase - Remove Happy Partygoer'),
  (35175, 0, 31, 32, 61, 0, 100, 0, 0, 0, 0, 0,          17, 0, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Clear emote state'),
  (35175, 0, 32, 0, 61, 0,  100, 0, 0, 0, 0, 0,          30, 1, 2, 3, 4, 5, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Random need phase'),

  (35186, 0,  0, 0, 25, 0,  100, 0, 0, 0, 0, 0,          30, 1, 2, 3, 4, 5, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Reset - Random need phase'),
  (35186, 0,  1, 0, 1,  1,  100, 0, 10000, 60000, 20000, 60000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need dance line'),
  (35186, 0,  2, 0, 1,  2,  100, 0, 10000, 60000, 20000, 60000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need drink line'),
  (35186, 0,  3, 0, 1,  4,  100, 0, 10000, 60000, 20000, 60000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need food line'),
  (35186, 0,  4, 0, 1,  8,  100, 0, 10000, 60000, 20000, 60000, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need bucket line'),
  (35186, 0,  5, 0, 1,  16, 100, 0, 10000, 60000, 20000, 60000, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC - Need fireworks line'),
  (35186, 0,  6, 7, 8,  1,  100, 0, 66911, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Dance - Quest credit'),
  (35186, 0,  7, 8, 61, 0,  100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35186, 0,  8, 9, 61, 0,  100, 0, 0, 0, 0, 0,          1, 5, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Dance thanks line'),
  (35186, 0,  9, 10, 61, 0, 100, 0, 0, 0, 0, 0,          17, 10, 0, 0, 0, 0, 0,      1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Dance emote state'),
  (35186, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0,          50, 195373, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Summon Disco Ball'),
  (35186, 0, 11, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  (35186, 0, 12, 13, 8, 2,  100, 0, 66909, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Bubbly - Quest credit'),
  (35186, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35186, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0,          1, 6, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Drink thanks line'),
  (35186, 0, 15, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  (35186, 0, 16, 17, 8, 4,  100, 0, 66913, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Hors D''oeuvres - Quest credit'),
  (35186, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35186, 0, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0,          1, 7, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Food thanks line'),
  (35186, 0, 19, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  (35186, 0, 20, 21, 8, 8,  100, 0, 66910, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Bucket - Quest credit'),
  (35186, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35186, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0,          1, 8, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Bucket thanks line'),
  (35186, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0,          50, 195378, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Summon Bucket'),
  (35186, 0, 24, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  (35186, 0, 25, 26, 8, 16, 100, 0, 66912, 0, 0, 0,      33, 35175, 0, 0, 0, 0, 0,   7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - On Spellhit Fireworks - Quest credit'),
  (35186, 0, 26, 27, 61, 0, 100, 0, 0, 0, 0, 0,          75, 66916, 0, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Add Happy Partygoer'),
  (35186, 0, 27, 28, 61, 0, 100, 0, 0, 0, 0, 0,          1, 9, 0, 0, 0, 0, 0,        7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Fireworks thanks line'),
  (35186, 0, 28, 29, 61, 0, 100, 0, 0, 0, 0, 0,          87, 3518600, 3518601, 3518602, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Invoker casts random firework'),
  (35186, 0, 29, 0, 61, 0,  100, 0, 0, 0, 0, 0,          22, 6, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Set happy phase'),
  (35186, 0, 30, 31, 1, 32, 100, 0, 30000, 30000, 30000, 30000, 28, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - OOC happy phase - Remove Happy Partygoer'),
  (35186, 0, 31, 32, 61, 0, 100, 0, 0, 0, 0, 0,          17, 0, 0, 0, 0, 0, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Clear emote state'),
  (35186, 0, 32, 0, 61, 0,  100, 0, 0, 0, 0, 0,          30, 1, 2, 3, 4, 5, 0,       1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Linked - Random need phase'),

  -- firework color actionlists (invoker = the entertaining player, casts on self)
  (3517500, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0,           134, 66917, 2, 0, 0, 0, 0,  7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Actionlist - Invoker casts Fireworks Blue'),
  (3517501, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0,           134, 66918, 2, 0, 0, 0, 0,  7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Actionlist - Invoker casts Fireworks Green'),
  (3517502, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0,           134, 66919, 2, 0, 0, 0, 0,  7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Actionlist - Invoker casts Fireworks Red'),
  (3518600, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0,           134, 66917, 2, 0, 0, 0, 0,  7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Actionlist - Invoker casts Fireworks Blue'),
  (3518601, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0,           134, 66918, 2, 0, 0, 0, 0,  7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Actionlist - Invoker casts Fireworks Green'),
  (3518602, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0,           134, 66919, 2, 0, 0, 0, 0,  7, 0, 0, 0, 0, 0, 0, 0, 0, 'Kezan Partygoer - Actionlist - Invoker casts Fireworks Red');
