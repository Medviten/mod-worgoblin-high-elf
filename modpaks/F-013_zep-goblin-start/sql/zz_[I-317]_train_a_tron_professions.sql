-- ============================================================
-- I-317 : KTC Train-a-Tron Deluxe (45286) offers no profession training
--
-- Override for the [AUTO,F-011] gen output (loads after it by filename sort).
--
-- ROOT CAUSE (dead training options)
--   Cata source menu 12002 drove training through two OptionType-1 (GOSSIP)
--   options that opened sub-menus 12045 (primary) / 12046 (secondary), whose
--   rows were the real OptionType-5 trainer entries. Those two sub-menus sit in
--   gossip.py's MENU_CLOSURE_SKIP (mislabelled "French profession-vendor lists
--   ... donor scaffolding" during the I-286 sweep), so gen resolved their
--   ActionMenuID to 0 and emitted two options that render fine and do nothing.
--   AC 3.3.5a has no per-option trainer table (no `gossip_menu_option_trainer`),
--   so one creature = one trainer (creature_default_trainer 45286 -> 6623).
--   Re-creating the 14-option sub-menus would give 14 buttons all opening the
--   same list; instead the root menu gets one working OptionType-5 entry.
--
-- ROOT CAUSE (professions missing / capped)
--   Trainer 6623 was built from the Cata dump and shipped no entry spell at all
--   for Alchemy or First Aid, and only Herbalism/Mining carried the full
--   Apprentice->Grand Master ladder. Every other profession stopped at
--   Journeyman, hard-capping it at skill 150 on this NPC.
--   Rank rows below mirror stock 3.3.5a profession trainers exactly.
--
-- Server-side profession count cap is already open: worldserver.conf
--   MaxPrimaryTradeSkill = 11 (all 11 primaries learnable simultaneously).
-- ============================================================

-- ---------- gossip: make the training option actually open the trainer ----------
-- This file now owns the final state of menu 510082.
DELETE FROM gossip_menu_option WHERE MenuID = 510082;
INSERT INTO gossip_menu_option
  (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`,
   `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`)
VALUES
  -- OptionIcon 0 = chat bubble, OptionType 3 = GOSSIP_OPTION_VENDOR (npcflag 128)
  (510082, 0, 0, 'Access profession vending machine', 0, 3, 128, 0, 0, 0, 0, '', 0),
  -- OptionIcon 3 = trainer, OptionType 5 = GOSSIP_OPTION_TRAINER (npcflag 16).
  -- Replaces the two dead primary/secondary options: trainer 6623 carries every
  -- profession, so a single entry point lists all of them.
  (510082, 1, 3, 'I''d like to purchase profession training.', 0, 5, 16, 0, 0, 0, 0, '', 0);

-- ---------- trainer profile ----------
-- Stock row is emitted by zz_[AUTO,F-011]_58_trainer.sql, so edit it in place.
-- Type 2 = Trainer::Type::Tradeskill (was 0/Class); Requirement 0 = no class/race gate.
-- Greeting was 'Ready to learn, ?' -- a mangled leftover from the French dump.
UPDATE trainer
SET Type = 2,
    Requirement = 0,
    Greeting = 'Ready to learn? The KTC Train-a-Tron Deluxe teaches every trade, no limits.'
WHERE Id = 6623;

-- ---------- trainer spells ----------
-- Donor noise: 2575 'Mining' is the raw trade spell, already granted by the
-- trigger on 2581 'Apprentice Miner'. No stock trainer teaches it directly; on
-- this list it renders as a duplicate second "Mining" entry.
DELETE FROM trainer_spell WHERE TrainerId = 6623 AND SpellId = 2575;

-- Rows this file owns: the profession entry spells and the full rank ladder.
DELETE FROM trainer_spell WHERE TrainerId = 6623 AND SpellId IN (
  2275, 2280, 3465, 11612, 28597, 51303,          -- Alchemy      (171)
  3279, 3280, 54254, 10847, 54255, 50299,         -- First Aid    (129)
  3539, 9786, 29845, 51298,                       -- Blacksmithing(164)
  3812, 10663, 32550, 51301,                      -- Leatherwork  (165)
  19886, 18261, 54256, 51295,                     -- Cooking      (185)
  3913, 12181, 26791, 51308,                      -- Tailoring    (197)
  4041, 12657, 30351, 61464,                      -- Engineering  (202)
  7416, 13921, 28030, 51312,                      -- Enchanting   (333)
  54083, 18249, 54084, 51293,                     -- Fishing      (356)
  8620, 10769, 32679, 50307,                      -- Skinning     (393)
  28896, 28899, 28901, 51310,                     -- Jewelcrafting(755)
  45377, 45378, 45379, 45380                      -- Inscription  (773)
);

INSERT INTO trainer_spell
  (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`)
VALUES
  -- Alchemy (171) -- entry spell was absent entirely; 16 alchemy recipes were
  -- already on the list with no way to learn the profession.
  (6623, 2275,     10,   0,   0, 0, 0, 0,  5, 0),   -- Apprentice Alchemist
  (6623, 2280,    500, 171,  50, 0, 0, 0, 10, 0),   -- Journeyman Alchemist
  (6623, 3465,   5000, 171, 125, 0, 0, 0, 20, 0),   -- Expert Alchemist
  (6623, 11612, 50000, 171, 200, 0, 0, 0, 35, 0),   -- Artisan Alchemist
  (6623, 28597,100000, 171, 275, 0, 0, 0, 50, 0),   -- Master Alchemist
  (6623, 51303,350000, 171, 350, 0, 0, 0, 65, 0),   -- Grand Master Alchemist

  -- First Aid (129) -- profession was completely absent (0 rows, no entry spell).
  (6623, 3279,    100,   0,   0, 0, 0, 0,  0, 0),   -- Apprentice First Aid
  (6623, 3280,    500, 129,  50, 0, 0, 0,  0, 0),   -- Journeyman First Aid
  (6623, 54254,  5000, 129, 125, 0, 0, 0,  0, 0),   -- Expert First Aid
  (6623, 10847,100000, 129, 200, 0, 0, 0,  0, 0),   -- Artisan First Aid
  (6623, 54255,350000, 129, 275, 0, 0, 0,  0, 0),   -- Master First Aid
  (6623, 50299,350000, 129, 350, 0, 0, 0,  0, 0),   -- Grand Master First Aid

  -- Blacksmithing (164) -- Apprentice/Journeyman already present.
  (6623, 3539,   5000, 164, 125, 0, 0, 0, 20, 0),   -- Expert Blacksmith
  (6623, 9786,  50000, 164, 200, 0, 0, 0, 35, 0),   -- Artisan Blacksmith
  (6623, 29845,100000, 164, 275, 0, 0, 0, 50, 0),   -- Master Blacksmith
  (6623, 51298,350000, 164, 350, 0, 0, 0, 60, 0),   -- Grand Master Blacksmith

  -- Leatherworking (165)
  (6623, 3812,   5000, 165, 125, 0, 0, 0, 20, 0),   -- Expert Leatherworker
  (6623, 10663, 50000, 165, 200, 0, 0, 0, 35, 0),   -- Artisan Leatherworker
  (6623, 32550,100000, 165, 275, 0, 0, 0, 50, 0),   -- Master Leatherworker
  (6623, 51301,350000, 165, 350, 0, 0, 0, 65, 0),   -- Grand Master Leatherworker

  -- Cooking (185) -- secondary, no level gate in stock.
  (6623, 19886,  5000, 185, 125, 0, 0, 0,  0, 0),   -- Expert Cook
  (6623, 18261, 25000, 185, 200, 0, 0, 0,  0, 0),   -- Artisan Cook
  (6623, 54256,100000, 185, 275, 0, 0, 0,  0, 0),   -- Master Cook
  (6623, 51295,350000, 185, 350, 0, 0, 0,  0, 0),   -- Grand Master Cook

  -- Tailoring (197)
  (6623, 3913,   5000, 197, 125, 0, 0, 0, 20, 0),   -- Expert Tailor
  (6623, 12181, 50000, 197, 200, 0, 0, 0, 35, 0),   -- Artisan Tailor
  (6623, 26791,100000, 197, 275, 0, 0, 0, 50, 0),   -- Master Tailor
  (6623, 51308,350000, 197, 350, 0, 0, 0, 65, 0),   -- Grand Master Tailor

  -- Engineering (202)
  (6623, 4041,   5000, 202, 125, 0, 0, 0, 20, 0),   -- Expert Engineer
  (6623, 12657, 50000, 202, 200, 0, 0, 0, 35, 0),   -- Artisan Engineer
  (6623, 30351,100000, 202, 275, 0, 0, 0, 50, 0),   -- Master Engineer
  (6623, 61464,350000, 202, 350, 0, 0, 0, 65, 0),   -- Grand Master Engineer

  -- Enchanting (333)
  (6623, 7416,   5000, 333, 125, 0, 0, 0, 20, 0),   -- Expert Enchanter
  (6623, 13921, 50000, 333, 200, 0, 0, 0, 35, 0),   -- Artisan Enchanter
  (6623, 28030,100000, 333, 275, 0, 0, 0, 50, 0),   -- Master Enchanter
  (6623, 51312,350000, 333, 350, 0, 0, 0, 65, 0),   -- Grand Master Enchanter

  -- Fishing (356) -- secondary; only Grand Master carries a level gate in stock.
  (6623, 54083,  5000, 356, 125, 0, 0, 0,  0, 0),   -- Expert Fishing
  (6623, 18249,100000, 356, 200, 0, 0, 0,  0, 0),   -- Artisan Fishing
  (6623, 54084,350000, 356, 275, 0, 0, 0,  0, 0),   -- Master Fishing
  (6623, 51293,350000, 356, 350, 0, 0, 0, 10, 0),   -- Grand Master Fishing

  -- Skinning (393) -- gathering ladder uses the 10/25/40/55 level gates.
  (6623, 8620,   5000, 393, 125, 0, 0, 0, 10, 0),   -- Expert Skinner
  (6623, 10769, 50000, 393, 200, 0, 0, 0, 25, 0),   -- Artisan Skinner
  (6623, 32679,100000, 393, 275, 0, 0, 0, 40, 0),   -- Master Skinner
  (6623, 50307,350000, 393, 350, 0, 0, 0, 55, 0),   -- Grand Master Skinner

  -- Jewelcrafting (755)
  (6623, 28896,  5000, 755, 125, 0, 0, 0, 20, 0),   -- Expert Jewelcrafter
  (6623, 28899, 50000, 755, 200, 0, 0, 0, 35, 0),   -- Artisan Jewelcrafter
  (6623, 28901,100000, 755, 275, 0, 0, 0, 50, 0),   -- Master Jewelcrafter
  (6623, 51310,350000, 755, 350, 0, 0, 0, 60, 0),   -- Grand Master Jewelcrafter

  -- Inscription (773)
  (6623, 45377,  4750, 773, 125, 0, 0, 0, 20, 0),   -- Expert Scribe
  (6623, 45378, 47500, 773, 200, 0, 0, 0, 35, 0),   -- Artisan Scribe
  (6623, 45379,100000, 773, 275, 0, 0, 0, 50, 0),   -- Master Scribe
  (6623, 45380,350000, 773, 350, 0, 0, 0, 65, 0);   -- Grand Master Scribe

-- ---------- F-001 custom profession tool recipes ----------
-- The Train-a-Tron advertises "every trade, no limits" and carries the full
-- Apprentice->Grand Master ladder for all 11 primaries (above), but shipped none
-- of the F-001 custom tool recipes -- so it taught Grand Master Blacksmithing
-- without the smithing hammers that speed Blacksmithing up. F-001 predates this
-- NPC and hardcoded only the stock trainer ids (58/59/616/617/618, plus the
-- I-225 combined trainers 6500/6501), so 6623 was never in its list.
--
-- Scope: every trainer-taught spell owned by [F-001]_spell.sql -- skill lines
-- 164/202/755, all of which 6623 already teaches. Costs and skill ranks mirror
-- the canonical rows on the stock trainers exactly (verified identical across
-- all existing trainers before copying).
--
-- NOT included: 91144-91157 enchanting shard recipes (those are F-006, not
-- F-001) and 91119 Silencing Shot (a hunter class spell that merely sits in the
-- same 91xxx band).
--
-- Owned here rather than in [F-001]_smithing_hammers.sql because this file owns
-- trainer 6623's trainer_spell rows; splitting ownership would have the two
-- files fight over the same trainer.
DELETE FROM trainer_spell WHERE TrainerId = 6623 AND SpellId IN (
  91121, 91123, 91125, 91127, 91129, 91131,       -- Smithing Hammers   (164)
  91252, 91253, 91254, 91255,                     -- Rivets             (164)
  91218, 91219, 91220, 91221,                     -- Tinkering Tools    (202)
  91263, 91264, 91265, 91266,                     -- Drills             (202)
  91256, 91257, 91258, 91259,                     -- Fasteners          (755)
  91267, 91268, 91269, 91270                      -- Jeweler's Kits     (755)
);

INSERT INTO trainer_spell
  (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`)
VALUES
  -- Blacksmithing (164) -- smithing hammers + rivets
  (6623, 91121,    500, 164,  75, 0, 0, 0, 0, 0),   -- Bronze Smithing Hammer
  (6623, 91252,    500, 164,  75, 0, 0, 0, 0, 0),   -- Bronze Rivets
  (6623, 91123,    500, 164, 150, 0, 0, 0, 0, 0),   -- Iron Smithing Hammer
  (6623, 91125,    500, 164, 225, 0, 0, 0, 0, 0),   -- Mithril Smithing Hammer
  (6623, 91253,   5000, 164, 225, 0, 0, 0, 0, 0),   -- Truesilver Rivets
  (6623, 91127,    500, 164, 300, 0, 0, 0, 0, 0),   -- Thorium Smithing Hammer
  (6623, 91254,  50000, 164, 300, 0, 0, 0, 0, 0),   -- Adamantite Rivets
  (6623, 91129,    500, 164, 375, 0, 0, 0, 0, 0),   -- Felsteel Smithing Hammer
  (6623, 91255, 100000, 164, 375, 0, 0, 0, 0, 0),   -- Saronite Rivets
  (6623, 91131,    500, 164, 450, 0, 0, 0, 0, 0),   -- Titanium Smithing Hammer

  -- Engineering (202) -- tinkering tools + drills
  (6623, 91218,    500, 202,  75, 0, 0, 0, 0, 0),   -- Journeyman Tinkering Tools
  (6623, 91263,    500, 202,  75, 0, 0, 0, 0, 0),   -- Bronze Drill
  (6623, 91219,   5000, 202, 225, 0, 0, 0, 0, 0),   -- Artisan Tinkering Tools
  (6623, 91264,   5000, 202, 225, 0, 0, 0, 0, 0),   -- Gold Drill
  (6623, 91220,  50000, 202, 300, 0, 0, 0, 0, 0),   -- Master Tinkering Tools
  (6623, 91265,  50000, 202, 300, 0, 0, 0, 0, 0),   -- Fel Iron Drill
  (6623, 91221, 100000, 202, 375, 0, 0, 0, 0, 0),   -- Grand Master Tinkering Tools
  (6623, 91266, 100000, 202, 375, 0, 0, 0, 0, 0),   -- Saronite Drill

  -- Jewelcrafting (755) -- fasteners + jeweler's kits
  (6623, 91256,    500, 755,  75, 0, 0, 0, 0, 0),   -- Bronze Fasteners
  (6623, 91267,   1000, 755,  75, 0, 0, 0, 0, 0),   -- Journeyman Jewelers Kit
  (6623, 91257,   5000, 755, 225, 0, 0, 0, 0, 0),   -- Truesilver Fasteners
  (6623, 91268,  10000, 755, 225, 0, 0, 0, 0, 0),   -- Artisan Jewelers Kit
  (6623, 91258,  50000, 755, 300, 0, 0, 0, 0, 0),   -- Adamantite Fasteners
  (6623, 91269, 100000, 755, 300, 0, 0, 0, 0, 0),   -- Master Jewelers Kit
  (6623, 91259, 100000, 755, 375, 0, 0, 0, 0, 0),   -- Saronite Fasteners
  (6623, 91270, 200000, 755, 375, 0, 0, 0, 0, 0);   -- Grand Master Jewelers Kit
