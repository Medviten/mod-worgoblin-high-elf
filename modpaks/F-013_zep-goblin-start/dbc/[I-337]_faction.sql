-- I-337 "Town-In-A-Box: Under Attack" (24901) — the three Cata Faction.dbc rows the
-- goblin-zone faction graph hangs off. See [I-337]_factiontemplate.sql for the
-- FactionTemplate half and sql/zz_[I-337]_goblin_zone_factions.sql for the creatures.
--
-- Why this file exists: the F-011 collector only accepts a donor faction if its
-- FactionTemplate row exists in the 3.3.5a client (creatures.py:_valid_faction_ids),
-- and every goblin-zone faction is a Cata addition. 145 F-011 creature templates were
-- therefore flattened to 35 (Friendly) or 14 (Monster). That kills the invasion set
-- piece two ways:
--   * spell 66987 "Pygmy Helmet" (the quest's own protection, SourceSpellID on 24901
--     and 24924) is aura 139 FORCE_REACTION with EffectMiscValue = faction 1157.
--     ReputationMgr::GetForcedRankIfAny keys on FactionTemplateEntry->faction, so a
--     warrior on template 14 (faction 14) can never match the forced 1157 entry.
--   * 1157 is what the town's own defenders list as an enemy (FactionTemplate 2231
--     Enemies_0 = 1157). No 1157, no defenders, so all 55 Oomlot spawns aggro the
--     player instead.
--
-- The load-bearing half of the fix is therefore the FactionTemplate rows; these three
-- Faction rows exist so 1133/1152/1157 resolve at all — client-side nameplate reaction
-- and tooltip naming, and server-side reputation lookups (sFactionStore) for anything
-- that reads the faction rather than the template.
--
-- Values are the 4.3.4 rows (Zeppelin-Tools/wago-cata-classic/Faction.csv), with the
-- worgen race bit (2097152, race 22) stripped from 1133's masks — no such race here.
--
-- reputation_index: 1133 ships at its RETAIL 105. The first cut of this file used -1 to
-- avoid adding a visible rep bar, and that is what made the town read NEUTRAL instead of
-- friendly. **Retail resolves Bilgewater friendliness through reputation, not through the
-- Horde group mask**: `Unit::GetFactionReactionTo` (Unit.cpp:7335) returns
-- `GetReputationMgr().GetRank(factionEntry)` as soon as `CanHaveReputation()` is true
-- (`reputationListID >= 0`), and reputation_base_1 = 3100 on race mask 946 (which
-- includes goblin, bit 256) is a standing of Friendly for every Horde race. With the
-- index at -1 that whole path is skipped. Same mechanism as every stock Horde city
-- faction (Orgrimmar 76 = index 14, base 3100).
-- Index 105 is free: our Faction.dbc holds 0..104, and SMSG_INITIALIZE_FACTIONS carries
-- 128 slots. Side effect, retail-correct: a Bilgewater Cartel bar appears and the rep the
-- goblin quests already award (24897 RewardFactionId1 = 1133) starts landing. Alliance
-- gets reputation_base_2 = -42000 (Hated), so Bilgewater NPCs are hostile to them.

DELETE FROM faction WHERE id IN (1133, 1152, 1157);

INSERT INTO faction SET
  id = 1133,
  reputation_index = 105,
  reputation_race_mask_1 = 946,
  reputation_race_mask_2 = 1101,
  reputation_base_1 = 3100,
  reputation_base_2 = -42000,
  reputation_flags_1 = 273,
  reputation_flags_2 = 6,
  parent_faction_id = 67,
  parent_faction_mod_1 = 1,
  parent_faction_mod_2 = 0.25,
  parent_faction_cap_1 = 4,
  parent_faction_cap_2 = 7,
  name_enus = 'Bilgewater Cartel',
  name_flags = 16712190,
  description_enus = 'Run by the ruthless Trade Prince Gallywix, the Bilgewater Cartel is the most powerful trading company on the Isle of Kezan. From their headquarters at Bilgewater Port, the cartel dominates trade all over the South Seas.',
  description_flags = 16712190;

INSERT INTO faction SET
  id = 1152,
  reputation_index = -1,
  parent_faction_mod_1 = 1,
  parent_faction_mod_2 = 1,
  parent_faction_cap_1 = 5,
  parent_faction_cap_2 = 5,
  name_enus = 'PLAYER, Goblin',
  name_flags = 16712190,
  description_flags = 16712188;

INSERT INTO faction SET
  id = 1157,
  reputation_index = -1,
  name_enus = 'Pygmy',
  name_flags = 16712190,
  description_flags = 16712188;
