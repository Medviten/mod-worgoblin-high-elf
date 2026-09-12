-- I-242 "Rolling with my Homies" — homie pickup + Hot Rod horn/radio flavor.
-- Loads after the [AUTO,F-011] files and owns:
--   * spell_area: quest-invisibility DETECTION auras so Ace/Gobber/Izzy are visible
--     while on quest 14071 (their spawns carry Generic Quest Invisibility 1/2/3 via
--     creature_template_addon: Ace 49414 type 7, Izzy 49415 type 8, Gobber 60921 type 9).
--   * smart_scripts for the homies (34890 Izzy, 34892 Ace, 34954 Gobber): the donor's
--     rows cross-cast custom ride spells 98914/98915/98916 that don't exist in 3.3.5a
--     (gen now drops them — smartai.py CROSS_CAST filter); replaced with a plain
--     triggered self-cast of stock 46598 Ride Vehicle Hardcoded (basepoints 0 ->
--     seat -1 -> first free passenger seat) at the closest Hot Rod.
--   * Hot Rod horn/radio audio moved OFF SmartAI onto the spell effects themselves
--     (dbc/[I-242]_spell.sql: play sound/music at TARGET_UNIT_PASSENGER_0) — the
--     SAI spellhit hop stayed silent in-game while pure-effect bar spells work.
--     The DELETE below still covers 34840/35999 to clear the retired SAI rows.

-- ---- homie visibility (spell_area, stock 74/11 "while on quest" pattern) ----
DELETE FROM spell_area WHERE spell IN (49416, 49417, 60922) AND area = 4737 AND quest_start = 14071;
INSERT INTO spell_area (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
  (49416, 4737, 14071, 14071, 0, 0, 2, 1, 74, 11),
  (49417, 4737, 14071, 14071, 0, 0, 2, 1, 74, 11),
  (60922, 4737, 14071, 14071, 0, 0, 2, 1, 74, 11);

-- ---- homie spotlight (retail marks pickup targets with a white beam) ----
-- Stock 62165 Spotlight (aura, permanent, visual 8156) added next to each homie's
-- quest-invisibility aura. AUTO-owned addon rows -> one consolidated UPDATE each.
UPDATE creature_template_addon SET auras = '49415 62165' WHERE entry = 34890;
UPDATE creature_template_addon SET auras = '49414 62165' WHERE entry = 34892;
UPDATE creature_template_addon SET auras = '60921 62165' WHERE entry = 34954;
-- Guid-keyed creature_addon rows (tdb434 pose data, e.g. Izzy sitting) OVERRIDE the
-- template addon entirely in AC, so the spotlight must ride on them too. Joined by
-- entry — AUTO spawn guids are never pinned in overrides. Ace has no guid row.
UPDATE creature_addon ca JOIN creature c ON c.guid = ca.guid SET ca.auras = '49415 62165' WHERE c.id = 34890;
UPDATE creature_addon ca JOIN creature c ON c.guid = ca.guid SET ca.auras = '60921 62165' WHERE c.id = 34954;

-- ---- SmartAI ----
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid IN (34890, 34892, 34954, 34840, 35999);
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (34890, 0, 0, 1, 8, 0, 100, 0, 61178, 0, 0, 0, 11, 46598, 2, 0, 0, 0, 0, 19, 34840, 15, 0, 0, 0, 0, 0, 0, 'Izzy - On Spellhit Grab Passenger - Ride closest Hot Rod'),
  (34890, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 34890, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Izzy - Linked - Kill credit to driver (invoker vehicle -> charmer)'),
  (34892, 0, 0, 1, 8, 0, 100, 0, 61178, 0, 0, 0, 11, 46598, 2, 0, 0, 0, 0, 19, 34840, 15, 0, 0, 0, 0, 0, 0, 'Ace - On Spellhit Grab Passenger - Ride closest Hot Rod'),
  (34892, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 34892, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Ace - Linked - Kill credit to driver (invoker vehicle -> charmer)'),
  (34954, 0, 0, 1, 8, 0, 100, 0, 61178, 0, 0, 0, 11, 46598, 2, 0, 0, 0, 0, 19, 34840, 15, 0, 0, 0, 0, 0, 0, 'Gobber - On Spellhit Grab Passenger - Ride closest Hot Rod'),
  (34954, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 34954, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Gobber - Linked - Kill credit to driver (invoker vehicle -> charmer)');
