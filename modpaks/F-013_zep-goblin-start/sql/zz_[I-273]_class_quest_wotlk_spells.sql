-- [I-273] Kezan class trainer quests target Cataclysm spells the WotLK client cannot train.
--
-- Quests 14007-14013 were ported verbatim from Cataclysm, so their objectives, flavour text and
-- SmartAI spellhit credit rows all name the *Cata* version of each class's low-level signature
-- ability. On 3.3.5a several of those spells sit far above the quest's level or do not exist:
--   14007 Hunter  56641 Steady Shot     -> level 50, not on Bamm Megabomb at all
--   14008 Mage     5143 Arcane Missiles -> level 8, and the log text describes the Cata
--                                          "Arcane Missiles!" proc, which does not exist in WotLK
--   14009 Priest   2061 Flash Heal      -> level 20, not on Sister Goldskimmer at all
--   14011 Shaman  73899 Primal Strike   -> Cataclysm-only ability, no WotLK trainer teaches it
--   14013 Warrior   100 Charge          -> level 4, but the quest was gated at MinLevel 3
--
-- Fix: standardise all seven quests to QuestLevel/MinLevel 4 and target the ability each Kezan
-- trainer actually teaches at ReqLevel 4. Level 4 is the first tier where every class has a
-- trainable, dummy-testable ability, so the whole set becomes uniform.
--
--   Quest  Class    Trainer                     Spell                  ID
--   14007  Hunter   34673 Bamm Megabomb         Serpent Sting        1978  (was 56641)
--   14008  Mage     34689 Fizz Lighter          Frostbolt             116  (was 5143)
--   14009  Priest   34692 Sister Goldskimmer    Lesser Heal          2052  (was 2061)
--   14010  Rogue    34693 Slinky Sharpshiv      Eviscerate           2098  (unchanged)
--   14011  Shaman   34695 Maxx Avalanche        Earth Shock          8042  (was 73899)
--   14012  Warlock  34696 Evol Fingers          Immolate              348  (unchanged)
--   14013  Warrior  34697 Warrior-Matic NX-01   Charge                100  (unchanged)
--
-- Kick (1766) and Counterspell (2139) are also ReqLevel 4 but require a casting target, and
-- training dummies never cast, so neither could ever award credit. Backstab (53) requires a
-- dagger and goblin rogues start with Worn Mace (36), so it is unusable for them.
--
-- This file loads AFTER zz_[AUTO,F-011]_30_quest_template.sql and _65_smart_scripts.sql
-- ("[I-" sorts after "[AUTO,"), so the scoped UPDATEs below override the generated rows.
-- A generator-side fix would need a per-quest spell-remap fixture; the replacement spell and the
-- rewritten flavour text are hand-authored design choices, so an override is the right home.

-- ---------------------------------------------------------------------------
-- quest_template - one consolidated UPDATE per quest ID
-- ---------------------------------------------------------------------------

-- 14007 Hunter: Steady Shot (lvl 50) -> Serpent Sting (lvl 4)
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4,
  `LogTitle` = 'Serpent Sting',
  `LogDescription` = 'Speak with Bamm Megabomb and train Serpent Sting, then sting a Training Dummy with it 3 times.',
  `QuestDescription` = 'I''m Bamm Megabomb, your personal trainer, $g sir : ma''am;.$B$BI understand that you''re interested in some new insight about being a $c? Look no further.$B$BI think you''ll gain a great deal by me teaching you how to apply a Serpent Sting. It just might help you climb the corporate ladder if you know what I mean.$B$BLearn the ability from me and then practice it on a training dummy here.',
  `ObjectiveText1` = 'Practiced Serpent Sting'
WHERE `ID` = 14007;

-- 14008 Mage: Arcane Missiles (lvl 8, Cata proc wording) -> Frostbolt (lvl 4)
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4,
  `LogTitle` = 'Frostbolt',
  `LogDescription` = 'Speak with Fizz Lighter and train Frostbolt, then cast the spell 2 times at a Training Dummy.',
  `QuestDescription` = 'I''m Fizz Lighter, your personal trainer, $g sir : ma''am;.$B$BI understand that you''re interested in some new insight about being a $c? Look no further.$B$BI think you''ll gain a great deal by me teaching you how to cast Frostbolt. It just might help you climb the corporate ladder if you know what I mean.$B$BLearn the spell from me and then go practice casting it a few times on a training dummy across the yard to the southeast.',
  `ObjectiveText1` = 'Practiced Frostbolt'
WHERE `ID` = 14008;

-- 14009 Priest: Flash Heal (lvl 20) -> Lesser Heal (lvl 4)
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4,
  `LogDescription` = 'Reach level 4 and learn ''Lesser Heal'' from Sister Goldskimmer. Practice casting Lesser Heal 3 times on Injured Employees.',
  `QuestDescription` = 'I''m Sister Goldskimmer, your personal trainer, $g sir : ma''am;.$B$BI understand that you''re interested in some new insight about being a $c? Look no further.$B$BI think you''ll gain a great deal by me teaching you how to cast Lesser Heal. It just might help you climb the corporate ladder if you know what I mean.$B$BLearn it from me and then use it to heal the injured employees around the courtyard.',
  `ObjectiveText1` = 'Practice Lesser Heal on Injured Employee'
WHERE `ID` = 14009;

-- 14010 Rogue: Eviscerate already correct, level bump only
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4
WHERE `ID` = 14010;

-- 14011 Shaman: Primal Strike (Cata-only) -> Earth Shock (lvl 4)
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4,
  `LogTitle` = 'Earth Shock',
  `LogDescription` = 'Speak with Maxx Avalanche and train Earth Shock, then use it 2 times on a Training Dummy.',
  `QuestDescription` = 'I''m Maxx Avalanche, your personal trainer, $g sir : ma''am;.$B$BI understand that you''re interested in some new insight about being a $c? Look no further.$B$BI think you''ll gain a great deal by me teaching you how to call down an Earth Shock. It just might help you climb the corporate ladder if you know what I mean.$B$BLearn it from me and then go use it on a training dummy to the southeast.',
  `ObjectiveText1` = 'Practiced Earth Shock'
WHERE `ID` = 14011;

-- 14012 Warlock: Immolate already correct, level bump only
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4
WHERE `ID` = 14012;

-- 14013 Warrior: Charge already correct, level bump only (Charge is ReqLevel 4, quest was MinLevel 3)
UPDATE quest_template SET
  `QuestLevel` = 4,
  `MinLevel` = 4
WHERE `ID` = 14013;

-- ---------------------------------------------------------------------------
-- smart_scripts - repoint the spellhit credit rows on the Training Dummy
--
-- Entry 48304 "Training Dummy" is the spawned creature (5 spawns on map 1). It carries two credit
-- sets: rows 0-5 award creature 44175 "Spell Practice Credit" (which quest 14008 requires) and
-- rows 17-21 award 48304 itself (which 14007/14010/14011/14012/14013 require). Entry 44175 is a
-- credit proxy and is never spawned, so its own SAI rows are dead - they are updated anyway so a
-- future spawn cannot resurrect the stale spell IDs.
--
-- Scoped to event_type 8 (SPELLHIT) so the HP-normalisation rows on the same entries, which key on
-- unrelated Darkspear trainee spells, are untouched. Re-running is a no-op once the IDs are swapped.
-- ---------------------------------------------------------------------------

-- Hunter: 56641 Steady Shot -> 1978 Serpent Sting
UPDATE smart_scripts SET `event_param1` = 1978,
  `comment` = 'Training Dummy - Hunter Quest 14007 - On spell hit Serpent Sting, give quest credit (I-273)'
WHERE `source_type` = 0 AND `entryorguid` IN (44175, 48304) AND `event_type` = 8 AND `event_param1` = 56641;

-- Mage: 5143 Arcane Missiles -> 116 Frostbolt
UPDATE smart_scripts SET `event_param1` = 116,
  `comment` = 'Training Dummy - Mage Quest 14008 - On spell hit Frostbolt, give quest credit (I-273)'
WHERE `source_type` = 0 AND `entryorguid` IN (44175, 48304) AND `event_type` = 8 AND `event_param1` = 5143;

-- Shaman: 73899 Primal Strike -> 8042 Earth Shock
UPDATE smart_scripts SET `event_param1` = 8042,
  `comment` = 'Training Dummy - Shaman Quest 14011 - On spell hit Earth Shock, give quest credit (I-273)'
WHERE `source_type` = 0 AND `entryorguid` IN (44175, 48304) AND `event_type` = 8 AND `event_param1` = 73899;

-- ---------------------------------------------------------------------------
-- smart_scripts - Injured Employee (48305), priest quest 14009
--
-- The generated rows key on 2061 Flash Heal: row 0 talks then links to row 2 (force despawn) and
-- row 3 awards credit. Repoint that chain to Lesser Heal rank 2 (2052), which is what Sister
-- Goldskimmer teaches at level 4.
--
-- Ranks matter here in a way they do not for the other six quests: a priest already knows Lesser
-- Heal rank 1 (2050) from level 1 and will learn rank 3 (591) at level 6, and AC's SPELLHIT event
-- matches one exact spell ID. Crediting only 2052 would mean a player casting the rank already on
-- their bar gets nothing and the quest reads as broken, so parallel chains are added for 2050 and
-- 591. Rows 10-15 are owned by this file, hence DELETE + INSERT.
-- ---------------------------------------------------------------------------

UPDATE smart_scripts SET `event_param1` = 2052,
  `comment` = 'Injured Employee - On spell hit Lesser Heal r2, say0 (I-273)'
WHERE `source_type` = 0 AND `entryorguid` = 48305 AND `event_type` = 8 AND `event_param1` = 2061 AND `action_type` = 1;

UPDATE smart_scripts SET `event_param1` = 2052,
  `comment` = 'Injured Employee - On spell hit Lesser Heal r2 - Quest 14009 Credit 48305 (I-273)'
WHERE `source_type` = 0 AND `entryorguid` = 48305 AND `event_type` = 8 AND `event_param1` = 2061 AND `action_type` = 33;

DELETE FROM smart_scripts WHERE `source_type` = 0 AND `entryorguid` = 48305 AND `id` IN (10, 11, 12, 13, 14, 15);
INSERT INTO smart_scripts
  (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
   `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`,
   `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
   `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`,
   `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
  -- Lesser Heal rank 1 (2050) - known from level 1
  (48305, 0, 10, 11, 8, 0, 100, 0, 2050, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Employee - On spell hit Lesser Heal r1, say0 (I-273)'),
  (48305, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Employee - Lesser Heal r1 force despawn (I-273)'),
  (48305, 0, 12, 0, 8, 0, 100, 0, 2050, 0, 0, 0, 0, 0, 33, 48305, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Employee - On spell hit Lesser Heal r1 - Quest 14009 Credit 48305 (I-273)'),
  -- Lesser Heal rank 3 (591) - trained at level 6, in case the player out-levels the quest
  (48305, 0, 13, 14, 8, 0, 100, 0, 591, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Employee - On spell hit Lesser Heal r3, say0 (I-273)'),
  (48305, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Employee - Lesser Heal r3 force despawn (I-273)'),
  (48305, 0, 15, 0, 8, 0, 100, 0, 591, 0, 0, 0, 0, 0, 33, 48305, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Employee - On spell hit Lesser Heal r3 - Quest 14009 Credit 48305 (I-273)');
