-- ============================================================
-- F-199 (extension)  Linen Cloth on the Lost Isles hostiles
-- ============================================================
-- Same problem as the Kezan half, different cause. In Kezan the sniffed humanoid tables all
-- carried cloth below 0.02%; in the Lost Isles the tables that exist are healthy — Linen Cloth
-- 2589 runs 15-55% on every hostile mob the donor shipped a table for — but six hostile mobs
-- were never given a table at all, and between them they are the bulk of what a player kills:
--
--   Entry   Name                  Type       Lvl   Spawns   Before
--   38753   Goblin Zombie         undead     7-8     323    no loot table
--   36176   Alliance Sailor       humanoid   6-7     164    no loot table
--   38531   Oomlot Warrior        humanoid   7-8      72    no loot table
--   39069   Alliance Paratrooper  humanoid   8-9      56    table, herbs only (765/2449 @ 40%)
--   75116   Oomlot Warrior        humanoid   7-8      45    no loot table
--   38816   Goblin Zombie         undead     7-8      30    no loot table
--                                                    ----
--                                                     690 spawns
--
-- These are not a porting gap — both Cata sources (the Neltharion 4.3.4 dump and TrinityCore's
-- tdb434) agree that retail gives them no items either (checked per entry, I-338). This is a
-- deliberate playability deviation, exactly like the Kezan rows: Tailoring and First Aid have to
-- have something to start on, and half the zone's kill population dropping literally nothing
-- reads as broken rather than as design.
--
-- Rate: 40%, 1-2. Deliberately higher than Kezan's 25% and set from this zone's own data, not
-- invented — every Lost Isles hostile that DOES carry a table drops Linen at 15.24-55.22%
-- (median ~43): Alliance Sailor 36149 48.91, Southsea Mercenary 39449 43.00, Brute Overseer
-- 39193 52.94, Oomlot Shaman 38574 44.04, Oomlot Tribesman 38575 41.96. Note 36176/36149
-- Alliance Sailor and 38753/38816 Goblin Zombie are duplicate entries of the same creature, so
-- this mostly restores parity between an entry and its own twin.
--
-- Scope, on F-199's original criteria (hostile, killable, spawns in numbers): every mob whose
-- FactionTemplate is player-hostile (faction_group 8, enemy_group 1 — factions 14/16/2228),
-- type humanoid or undead, selectable and attackable, >= 5 spawns in the Lost Isles. Excluded
-- for cause:
--   * Orc Survivor / Orc Scout / Orc Battlesworn (36421, 36422, 36423, 39044, 39064, 39068,
--     39591, 35882, 35894, 36104, 39655) — factions 29/85/1074/1619/2238 are all faction_group 4
--     HORDE. They are the shipwrecked allies the player rescues, not kill mobs.
--   * 385310 Oomlot Warrior (78 spawns) — corpse scenery: dynamicflags 32 DEAD, NOT_SELECTABLE,
--     IMMUNE_TO_PC/NPC, permanent feign death aura.
--   * 39042 Alliance Paratrooper (2 spawns), 36424 Scout Brax (1), 39582 Trade Prince Gallywix
--     (level 85, scripted) — below the spawn floor or not ordinary trash.
--   * 35838 Pygmy Witchdoctor — has a table with no cloth row, but only 1 spawn.
--   * Beasts, elementals and the jungle plants (35896 Poison Spitter, 35897 Freezya,
--     40067 Iceeya, 40068 Venom Spitter) — cloth off a plant makes no sense.
--
-- Item-scoped DELETE, matching zz_[F-199]_kezan_cloth_drops.sql: 39069's Entry rows are owned
-- wholesale by zz_[AUTO,F-011]_50_creature_loot_template.sql, so only claim the 2589 row. The
-- five entries with lootid 0 also need the pointer set, or the rows never resolve — those are
-- [AUTO,F-011]-owned creature_template rows, hence UPDATE. This file sorts after the AUTO files
-- and re-applies with them through the F-205 cascade.

DELETE FROM `creature_loot_template` WHERE `Entry` IN (38753, 36176, 38531, 39069, 75116, 38816) AND `Item` = 2589;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
  (38753, 2589, 0, 40, 0, 1, 0, 1, 2, 'F-199 Goblin Zombie - Linen Cloth'),
  (36176, 2589, 0, 40, 0, 1, 0, 1, 2, 'F-199 Alliance Sailor - Linen Cloth'),
  (38531, 2589, 0, 40, 0, 1, 0, 1, 2, 'F-199 Oomlot Warrior - Linen Cloth'),
  (39069, 2589, 0, 40, 0, 1, 0, 1, 2, 'F-199 Alliance Paratrooper - Linen Cloth'),
  (75116, 2589, 0, 40, 0, 1, 0, 1, 2, 'F-199 Oomlot Warrior - Linen Cloth'),
  (38816, 2589, 0, 40, 0, 1, 0, 1, 2, 'F-199 Goblin Zombie - Linen Cloth');

-- Without this the rows above are unreachable: these five have creature_template.lootid = 0.
UPDATE creature_template SET `lootid` = 38753 WHERE `entry` = 38753;
UPDATE creature_template SET `lootid` = 36176 WHERE `entry` = 36176;
UPDATE creature_template SET `lootid` = 38531 WHERE `entry` = 38531;
UPDATE creature_template SET `lootid` = 75116 WHERE `entry` = 75116;
UPDATE creature_template SET `lootid` = 38816 WHERE `entry` = 38816;
