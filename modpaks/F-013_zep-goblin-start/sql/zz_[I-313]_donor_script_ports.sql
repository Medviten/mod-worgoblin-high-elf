-- I-313 — F-011 donor C++ CreatureScript ports (wave 1).
--
-- Background: the F-011 port collector is a SQL->SQL pipeline over the Neltharion
-- dump. It carries `AIName` verbatim (creatures.py:311) but hard-blanks
-- `ScriptName` on every emitted row (creatures.py:317/522/541, gameobjects.py:175/221),
-- and it never reads the donor's C++ at all. Any donor entry whose behaviour lived
-- in a CreatureScript therefore arrived inert, with nothing logged. An audit of the
-- donor DB against what we ported found 26 creature templates and 2 GO templates in
-- F-011 scope carrying a donor ScriptName — the roster of most returned F-011 bugs
-- (I-248, I-285, I-308, I-309, I-310, I-311, I-312).
--
-- This file wires the first wave of re-implementations, which live in
-- Zeppelin-Core/src/server/scripts/Custom/zeppelin_goblin_creatures.cpp.
-- These rows do nothing until that core build is deployed.
--
-- Deliberately NOT wired here (documented in the I-313 note):
--   38195 Wild Clucker Egg, 38455 Ace, 37676 Hot Rod, 38928 Sassy Hardwrench —
--   each blocked on donor entities the port never collected (creature templates
--   38457/38450/37680/38918/75113) and, for two of them, Cata spells absent from
--   our DBC (66726, 71355, 73137). Wave 2.
--   35075 Kezan Citizen, 50310 Goblin Captive, 205065 Big Red Button,
--   207355 Boarding Mortar — the donor DB names a ScriptName but ships NO code for
--   it; there is nothing to port. Dangling references, left blank on purpose.

-- ---- q24901 "Town-In-A-Box: Under Attack" ----
-- The manned turret: rooted, unkillable, streams Oomlot Warriors (75116) from six
-- fixed points while ridden. Closure verified complete (75116, 42716, 50630 all
-- present; 38526 already has its 5 spawns).
-- AUTO-owned row -> one consolidated UPDATE.
UPDATE creature_template SET
  `ScriptName` = 'npc_zep_bc_eliminator'
WHERE entry = 38526;

-- ---- q24942 "Zombies vs. Super Booster Rocket Boots" ----
-- Summoned ride that drops the player at >20yd, or on reaching Crosscheck (38738)
-- once the quest is complete.
UPDATE creature_template SET
  `ScriptName` = 'npc_zep_super_booster_rocket_boots'
WHERE entry = 38802;

-- ---- q25184 "Wild Mine Cart Ride" ----
-- The cart runs two spline legs with a scripted jump between them and detonates at
-- the bottom. The three freed prisoners plus Assistant Greely ride along in seats
-- 1-4; the CART seats them on boarding rather than the donor's phantom 151154
-- "ping" spell (that id exists in no client DBC — see the I-277 note).
UPDATE creature_template SET
  `ScriptName` = 'npc_zep_wild_mine_cart'
WHERE entry = 39329;

-- One AI serves all four companions; per-entry credit / controller-aura / follow
-- angle are a lookup inside the script.
UPDATE creature_template SET
  `ScriptName` = 'npc_zep_wild_cart_companion'
WHERE entry IN (39198, 39199, 39200, 39201);

-- The 39203/39204/39205 "_2" variants the donor also pointed at this script were
-- never collected into our DB, so there is nothing to wire for them yet; they are
-- part of the same wave-2 closure gap.
