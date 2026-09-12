-- ============================================================
-- I-301  Lost Isles hearthstone binds to the beach, not to the innkeeper
--
-- Symptom: hearthing on the Lost Isles drops the player ~155 yd north of
-- Grimy Greasefingers (36496, Innkeeper), out on the wash-ashore beach next to
-- Geargrinder Gizmo and Doc Zapnozzle's phase-1 copy -- not at the survivor camp
-- the inn is actually in.
--
-- Cause: nothing to do with the innkeeper. His gossip is fine -- OptionType 8 on
-- menu 510046, npcflag 65537 carries UNIT_NPC_FLAG_INNKEEPER, and AC's
-- WorldSession::SendBindPoint (NPCHandler.cpp:316) casts spell 3286 "Bind",
-- whose SPELL_EFFECT_BIND has no dst, so Spell::EffectBind
-- (SpellEffects.cpp:6341) binds to the player's own position. That path works.
--
-- The homebind players actually have was set much earlier, by spell 74100
-- "Life Savings: Teleport & Bind to the Lost Isles" -- the arrival spell handed
-- out as quest 14126's RewardSpell (see zz_[I-276]_lost_isles_transition.sql).
-- 74100 has TWO effects sharing one destination:
--     effect 0 = SPELL_EFFECT_BIND (11), targets 1/17 -> TARGET_DEST_DB
--     effect 1 = SPELL_EFFECT_TELEPORT_UNITS (5), same TARGET_DEST_DB
-- and spell_target_position ships a row per EffectIndex, both pointing at the
-- beach. So the arrival teleport and the homebind are the same coordinate, and
-- a player who never clicks an innkeeper keeps the beach forever. Confirmed on
-- a live character: character_homebind = (1.5017, -9527.08, 0.1719), byte-equal
-- to the 74100 destination.
--
-- Fix: split the two effects apart. EffectIndex 1 (the teleport) keeps the beach
-- -- you are still meant to wash ashore there. EffectIndex 0 (the bind) moves to
-- the survivor camp, 3 yd in front of Grimy Greasefingers and facing him.
--
-- areaId is NOT set from this row: EffectBind prefers Effects[0].MiscValue, which
-- is 4721 for 74100, and both the old and new points sit inside area 4721 anyway
-- (it spans ~1000x1000 yd, see I-276), so the spell_area gating there is
-- unchanged by this move.
--
-- Row owner is zz_[AUTO,F-011]_61_spell_target_position.sql (ported straight from
-- tdb434, which has the retail beach coordinate for both indices). UPDATE, not
-- DELETE+INSERT: this file is the reviewable diff from the ported value.
-- ============================================================

-- Grimy Greasefingers 36496 stands at (66.4007, -9681.37, 3.6596) o=1.6406.
-- Bind point = 3 yd along his facing, oriented back at him (1.6406 + PI).
UPDATE `spell_target_position` SET
  `MapID`       = 1,
  `PositionX`   = 66.191,
  `PositionY`   = -9678.377,
  `PositionZ`   = 3.6596,
  `Orientation` = 4.7822
WHERE `ID` = 74100 AND `EffectIndex` = 0;

-- Characters that already carry the beach homebind from an earlier 74100 cast
-- keep it until they re-bind; there is no server-side rebind hook, and clicking
-- any innkeeper (including Grimy) re-binds to wherever the player is standing.
