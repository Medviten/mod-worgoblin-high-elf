-- ============================================================
-- I-276  Kezan -> Lost Isles transition (F-011)
--
-- Handing in 14126 "Life Savings" left the player standing on the yacht with
-- nowhere to go: no quest chains 14126 to the Lost Isles, and its reward spell
-- (91847, the goblin cinematic) has no teleport effect. Retail drives the
-- transition from C++; TrinityCore never implemented it either (master's
-- src/server/scripts/Maelstrom/kezan.cpp is an empty stub), so the wiring below
-- is ours.
--
-- The DATA is all upstream, though. Spell 74100 "Life Savings: Teleport & Bind
-- to the Lost Isles" (effect 11 BIND, MiscValue 4721 = Shipwreck Shore, plus
-- effect 5 TELEPORT_UNITS, both TARGET_DEST_DB) is ported by the gen pipeline
-- via the missing_spells fixture, and its destination rows come from TDB 4.3.4
-- through _spellscope.dest_positions() -> map 1 (1.5017, -9527.08, 0.1719).
--
-- Effects 5 / 11 / 17 / 77 are identical between 4.3.4 and 3.3.5a, and AC's
-- Spell::EffectBind (SpellEffects.cpp:6341) already reads MiscValue as the area
-- id and destTarget as the position -- the same semantics Cata uses -- so 74100
-- needs no translation. Area 4721 "Shipwreck Shore" already exists in our
-- AreaTable as a child of 4720.
-- ============================================================


-- ---- 1. Cast the teleport on hand-in -------------------------------------
-- Player::RewardQuest casts `RewardSpell` after marking the quest complete
-- (PlayerQuest.cpp:833). It has the quest GIVER cast it unless the spell is
-- self-cast; SpellInfo::IsSelfCast() is true here because both of 74100's
-- effects use TARGET_UNIT_CASTER, so AC takes the `CastSpell(this, ...)` branch
-- and the player is the caster. That matters: TARGET_UNIT_CASTER on a creature
-- caster would have teleported Gallywix instead.
--
-- `RewardDisplaySpell` is left alone. It holds 91847 (the goblin cinematic),
-- which AC zeroes at load with "spell 91847 does not exist" -- harmless, and
-- the id is worth keeping as the marker for where the movie belongs.
--
-- Quest 14126 is owned by zz_[AUTO,F-011]_30_quest_template.sql; this is the
-- documented single-column override on an AUTO row, not a second definition.
UPDATE `quest_template` SET `RewardSpell` = 74100 WHERE `ID` = 14126;


-- ---- 2. (withdrawn) Lost Isles chain opener --------------------------------
-- This file originally added `creature_queststarter` 36600 -> 14001 "Goblin
-- Escape Pods", on the reading that the opener had an ender but no giver.
--
-- That was wrong, and it is the cause of Gizmo offering the escape-pod quest
-- TWICE. There are two quests with that identical title:
--
--   14001  PrevQuestID 0      -- a variant with no prerequisite
--   14474  PrevQuestID 14239  -- the real opener, following the revive
--
-- The source already wires 36600 -> 14474 (zz_[AUTO,F-011]_45_creature_
-- queststarter.sql), and Sassy Hardwrench 35650 ends both. Adding 14001 on top
-- simply gave Gizmo two versions of the same quest to hand out.
--
-- The chain is: arrive -> 14239 granted by Doc's scene -> hand 14239 to Doc ->
-- 14474 from Gizmo -> Sassy. Nothing needs adding here.
DELETE FROM `creature_queststarter` WHERE `id` = 36600 AND `quest` = 14001;
