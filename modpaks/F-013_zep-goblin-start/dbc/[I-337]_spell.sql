-- I-337 "Town-In-A-Box: Under Attack" (24901) — B.C. Eliminator: 72206 "Fire Cannon".
--
-- 72206 is the turret's only spell (creature_template_spell 38526/0). effect_1 = 32
-- SPELL_EFFECT_TRIGGER_MISSILE -> a trajectory missile (implicit target 89, range index 135
-- "Tower 100") that triggers 72207 "Cannon Blast" on impact: 26 school damage in radius
-- index 13 plus a 125 knockback. An Oomlot Warrior is level 7-8 with HealthModifier 0.1 ->
-- 16-19 effective HP (creature_classlevelstats basehp0 165/188), so every blast that lands
-- is a kill and a KillCredit1 = 38536 tick toward the 30 the quest wants.
--
-- ============================================================================
-- ROOT CAUSE of "green ground circle, no targeting line and no impact sphere":
-- **spell_missile_id was 0.**
-- ============================================================================
-- This is I-248 Part 6's finding, arrived at there after four rounds of vehicle- and
-- seat-side fixes that all changed nothing, and it applies verbatim here: WotLK trajectory
-- spells carry a SpellMissile.dbc ballistic record, and the client computes and DRAWS the
-- green aim arc from it (and times the launch motion from it). Cata moved missile data out
-- of Spell.dbc, so the F-011 spells.py port left the column 0 -> the client has no
-- ballistic solution, falls back to the plain ground reticle, and no arc or impact sphere
-- can ever appear no matter what Vehicle.dbc says. Every stock siege spell has one:
--   51421 Fire Cannon (WG Tower Cannon 28366, vehicle 244) -> 582
--   49872 / 67452 Rocket Blast (SotA / IoC cannons)        -> 463 / 2023
--   52338 Hurl Boulder (SotA demolisher)                   -> 642
--   69992 Throw Footbomb (I-248, custom clone)             -> 90642
--   72206 Fire Cannon (ours)                               -> 0
--
-- Missile **582** is the matched donor: it belongs to stock 51421, which is also named
-- "Fire Cannon", also uses SpellVisual 12925, and is mounted on the Wintergrasp Tower
-- Cannon whose vehicle row 244 our 640 was already modelled on. Its ballistics suit this
-- shot: pitch -0.5236..1.5708 (30deg depression, matching the vehicle pitch_min adopted in
-- [I-337]_vehicle.sql), default_speed 90, gravity 30 — ample for the 100-140yd downhill
-- spawn points (I-248 measured boulder 642 at speed 60 / gravity 30 capping near 120yd).
--
-- `speed` REVERTED to the stock 10, i.e. the authored 51421 pairing. This undoes the 4x
-- bump made earlier for "the rockets are too slow", and that is deliberate: with a missile
-- record present the client solves and flies the shot from the MISSILE (90 yd/s, gravity
-- 30), and per I-248 `spell.speed` "does NOT drive arc reach ... it only sets server hit
-- delay + missile render speed" — a spell speed that disagrees with the missile record was
-- their prime suspect for erratic launch animation. The 10 yd/s crawl that prompted the
-- request was a symptom of having NO missile record at all; the shot is now a fast arced
-- lob, not a slow flat drift. If it still reads slow, the correct lever is a custom
-- SpellMissile clone of 582 with a higher default_speed (SpellMissile is the one DBC where
-- a custom id is proven safe — I-248 ships 90642) — NOT this column.
--
-- spell_visual_1 stays STOCK 12925. An earlier cut repointed it at a repurposed visual
-- (14135) chasing the aim line; wrong layer, reverted in [I-337]_spellvisual.sql. The
-- explicit assignment below keeps this file idempotent over that applied state.
--
-- The row is AUTO-owned (dbc/[AUTO,F-011]_spell.sql DELETEs and INSERTs 72206), so the
-- single consolidated statement below edits it in place rather than redefining it.

UPDATE spell SET
  `spell_missile_id` = 582,
  `speed` = 10,
  `spell_visual_1` = 12925
WHERE `id` = 72206;
