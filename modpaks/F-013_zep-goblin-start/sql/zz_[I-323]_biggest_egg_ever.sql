-- I-323 quest 24744 "The Biggest Egg Ever" (Kezan) — the missing reward object.
--
-- SYMPTOM (reported in game): killing Mechachicken (38224) gives nothing at all, and
-- quest 24744 cannot be completed. Its objective item 84313 "The Biggest Egg Ever"
-- had NO source anywhere: no row in creature_loot_template, gameobject_loot_template,
-- item_loot_template or reference_loot_template, and no spell effect creates it.
--
-- INTENDED MECHANIC — already fully ported into smart_scripts, and correct:
--   38224 dies
--     -> SAI source_type 0 id 0, event 6 (JUST_DIED), action 11 casts spell 71422
--        "The Biggest Egg Ever: Summon The Biggest Egg Ever Visual Bunny"
--     -> effect 28 SUMMON, misc value 38227 -> creature 38227
--        "The Biggest Egg Ever Spell Visual" (NOT_SELECTABLE | IMMUNE_TO_PC/NPC)
--     -> 38227 event 54 (JUST_SUMMONED) -> CALL_TIMED_ACTIONLIST 3822700
--     -> list 3822700 id 1, action 50 SUMMON_GO 201977, despawn 90s
--        ('On summoned summon go 201977' — zz_[AUTO,F-011]_65_smart_scripts.sql:998)
--     -> the bunny force-despawns at 90000ms, so GO and summoner expire together.
--
-- ROOT CAUSE: gameobject_template 201977 DOES NOT EXIST. SMART_ACTION_SUMMON_GO
-- resolves nothing, so the death produces no lootable object and the chain dead-ends
-- at a 90-second invisible prop. Everything upstream of the GO is present and correct.
--
-- Same class as I-320 (sibling quest 24741 "Trading Up", GO 201974): the GO port
-- sweep is spawn-driven, and an object that is only ever spell/SAI-summoned has no
-- spawn row to be swept in, so it was never ported. 201977 is likewise ABSENT from
-- the go_scope fixture, so a regen will not emit it either — see the note at the end.
--
-- The SAI comment on the death row ('on death spawn 201977') describes the end of the
-- chain, not that row's own action; the row casts 71422. Left as the donor wrote it.

-- =========================================================================
-- 1. GO 201977 "The Biggest Egg Ever"
-- =========================================================================
-- Donor-verbatim, read from the restored `neltharion` 4.3.4 DB:
--   entry 201977, type 3, displayId 1411, size 9.0, Data0 43, Data1 201977, Data2 1, Data3 0
-- Data0 43 is lock 43, the client-openable "no key" lock used by quest chests; Data1 is
-- the loot id; for a type-3 chest Data2 is chestRestockTime and Data3 consumable — note
-- this object restocks and is NOT consumed, the opposite of its sibling 201974, which is
-- consumable with no restock. Kept as the donor has it: the summoned object only lives
-- 90s anyway, and a restocking chest is friendlier if two players are on the quest.
--
-- displayId 1411 is `World\Generic\PassiveDoodads\EasterEggs\EasterEgg05.mdx` — stock
-- 3.3.5a, verified present in our gameobjectdisplayinfo, so nothing new ships in PATCH-Z.
-- At size 9.0 it earns the name. (An earlier pass approximated this as the sibling's
-- wyvern-egg model 3851 at size 3.0, before the donor DB was available — superseded.)
DELETE FROM gameobject_template WHERE entry = 201977;
INSERT INTO gameobject_template SET
  `entry` = 201977,
  `type` = 3,
  `displayId` = 1411,
  `name` = 'The Biggest Egg Ever',
  `IconName` = '',
  `castBarCaption` = '',
  `unk1` = '',
  `size` = 9,
  `Data0` = 43,
  `Data1` = 201977,
  `Data2` = 1,
  `Data3` = 0,
  `AIName` = '',
  `ScriptName` = '',
  `VerifiedBuild` = 0;

-- =========================================================================
-- 2. The loot — item 84313, the quest 24744 objective
-- =========================================================================
-- Donor row is Cata item 50261 at chance -100; item_remap already maps 50261 -> 84313
-- "The Biggest Egg Ever", which is quest 24744's RequiredItemId1. Negative chance =
-- quest-required at 100%, which splits into Chance 100 + QuestRequired 1 here.
DELETE FROM gameobject_loot_template WHERE Entry = 201977;
INSERT INTO gameobject_loot_template (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
  (201977, 84313, 0, 100, 1, 1, 0, 1, 1);

-- Client-side sparkle for players on the quest. GO_DYNFLAG_LO_SPARKLE is driven by
-- ObjectMgr's GO quest-item list, not by the loot table, so this row is required
-- separately. The questitems gen domain (I-332) now emits this table, but only for
-- entries the gen actually collects — 201977 is still absent from go_scope.json (see
-- the follow-up below), so this row stays hand-owned until that scope fix lands.
DELETE FROM gameobject_questitem WHERE GameObjectEntry = 201977;
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
  (201977, 0, 84313, 0);

-- =========================================================================
-- Generator-first follow-up
-- =========================================================================
-- 201977 should be added to cli/data/goblin/fixtures/go_scope.json ("ents"), the same
-- way I-320 added 201974, so a regen emits this template and its loot from the donor
-- row instead of this hand-written approximation. Until then this file is the source
-- of truth for the object, and re-running the gen will NOT overwrite it (the AUTO
-- gameobject_template file sorts before this one).
