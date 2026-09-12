-- [I-233] Remove leftover Project Neltharion dev/test NPCs + Gnomey's crate GO from the goblin zone.
-- Placeholder/leet-ID entities were swept into the extraction scope and emitted by the generators:
--   creature 1234567 "Gnomey" (dev vendor), creature 1337016 "XP Rates" (dev boss),
--   gameobject_template 205112 "Stormwind Crate" + its spawn, and an aura-marker spawn on stock GO 183812.
-- This override deletes them on load. It sorts AFTER the generated zz_[F-011]_* files (I > F in filename
-- order), so it removes the dev rows those files (re)create. Live already has them absent; this keeps
-- them absent across a full re-apply. Idempotent (DELETE-only).
--
-- PREFERRED long-term fix (retires this override): filter placeholder/leet IDs (>6-digit / 1234567 /
-- 1337016 / placeholder names) in the extraction scope so they are never emitted. See the F-011
-- dev-NPC project note. Override is required only while a scope-filtered regen has not been run.

-- dev creatures + child rows (entry-keyed)
DELETE FROM creature_template          WHERE entry      IN (1234567, 1337016);
DELETE FROM creature_template_model    WHERE CreatureID IN (1234567, 1337016);
DELETE FROM creature_template_addon    WHERE entry      IN (1234567, 1337016);
DELETE FROM creature_template_movement WHERE CreatureId IN (1234567, 1337016);
DELETE FROM npc_vendor                 WHERE entry      IN (1234567, 1337016);

-- dev-only loot + immunity profiles created for them (referenced only by the dev NPCs above)
DELETE FROM creature_loot_template     WHERE Entry = 883;    -- "XP Rates" dev loot (lootid of 1337016)
DELETE FROM creature_immunities        WHERE ID = 91102;     -- dev boss-immunity profile (1337016)

-- dev spawns
DELETE FROM creature WHERE guid IN (12001140, 12001141);

-- Gnomey's dev crate GO 205112 + its two spawns (crate spawn 6500405; aura marker 6500008 on stock GO 183812)
DELETE FROM gameobject          WHERE guid  IN (6500008, 6500405);
DELETE FROM gameobject_template WHERE entry = 205112;
