-- I-271: F-011 goblin zone skinning compliance with F-174 (Skinning Expanded)
--
-- The F-011 skinning port (cli/commands/goblin_gen/profession_loot.py) copies
-- creature_template.skinloot verbatim from the Neltharion 4.3.4 dump, so the zone
-- inherited retail Cata's skinnable set (12 creatures) and nothing more. F-174's
-- premise is going BEYOND retail, so the port baseline is exactly the state F-174
-- exists to correct.
--
-- These entries are defined by zz_[AUTO,F-011]_10_creature_template.sql (which sets
-- skinloot = 0). This file loads after it (I > A alphabetically within the zpak) and
-- overrides only the skinloot column, so `zep goblin gen` re-runs stay safe.
--
-- Every table referenced below already exists. No new loot tables are created,
-- per F-174's "No Economy Disruption" objective.

-- ============================================================
-- 1. Kezan (zone 4737) starter beasts -- F-002 tier
-- ============================================================
-- Table 299 is F-002's starting-zone table (Ruined Leather Scraps 1-3, plus the
-- F-001 skinning-knife bonus references). Kezan is the 9th starting zone; it
-- post-dates F-002's "8/8 zones complete" closure, so these two fall under the
-- same starter-zone rule as every other racial start.
UPDATE creature_template SET skinloot = 299 WHERE entry IN (
  34865, -- Tunneling Worm (level 1, family 42 worm, 25 spawns)
  35613  -- Keensnout Potbelly (level 3, boar, 7 spawns)
);

-- ============================================================
-- 2. Lost Isles (zone 4720) beasts -- reuse ported F-011 tables
-- ============================================================
-- Teraptor Hatchling's table (level 5-6 tier: Light Leather / Ruined Leather
-- Scraps, 1-2 each). Daggertooth Shark is the largest un-skinnable beast
-- population in the zone at 54 spawns.
UPDATE creature_template SET skinloot = 36740 WHERE entry = 34763; -- Daggertooth Shark (level 5-6)

-- Bomb-Throwing Monkey's table -- same species, same level band, already skinnable.
UPDATE creature_template SET skinloot = 34699 WHERE entry = 35812; -- Smart Mining Monkey (level 5-6)

-- Child of Volcanoth's table (family 21 turtle, Light Hide / Light Leather / RLS).
-- Volcanoth is that brood's parent, so it shares the table.
UPDATE creature_template SET skinloot = 38845 WHERE entry IN (
  36732, -- Ancient Island Turtle (level 6, family 21)
  38855  -- Volcanoth (level 10 elite, quest boss)
);

-- Ravenous Lurker's table (level 7-8 tier). The Hammer is the rare-elite shark.
UPDATE creature_template SET skinloot = 36681 WHERE entry = 36682; -- The Hammer (level 8 elite)

-- Stock generic level 22-24 raptor table (Medium Leather / Light Leather / hides).
-- Deliberately NOT 100009 -- that carries Deviate Scale, which is Wailing
-- Caverns-specific and wrong for the Lost Isles.
UPDATE creature_template SET skinloot = 100005 WHERE entry = 36735; -- Teraptor Matriarch (level 20 elite)

-- ============================================================
-- 3. Mechanicals -- repair broken engineering-salvage pointers
-- ============================================================
-- Both carry CREATURE_TYPE_FLAG_SKIN_WITH_ENGINEERING (type_flags 0x8000), so
-- GetRequiredLootSkill() routes them to SKILL_ENGINEERING -- the intent is correct
-- and 3.3.5a supports it. But the port pointed skinloot at their own entry ids and
-- then dropped the only row: both source rows contain Cata item 57058, absent from
-- AC item_template, so profession_loot.py's port-or-skip discarded it and left an
-- orphan pointer with zero rows. Creature::AllLootRemovedFromCorpse gates on
-- LootTemplates_Skinning.HaveLootFor(), so UNIT_FLAG_SKINNABLE was never set --
-- 57 spawns of dead salvage.
--
-- Table 100030 is the stock engineering-salvage table used by Rusty Harvest Golem
-- (entry 480), which is the same level 9-10 band: Copper Bar, Rough Blasting
-- Powder, Handful of Copper Bolts, Copper Tube, Copper Modulator.
UPDATE creature_template SET skinloot = 100030 WHERE entry IN (
  39354, -- Steamwheedle Shark (level 9-10 mechanical, 31 spawns)
  39376  -- KTC Oil Bot (level 9-10 mechanical, 26 spawns)
);

-- Clear the two orphan pointer entries so nothing references empty tables.
DELETE FROM skinning_loot_template WHERE Entry IN (39354, 39376);
