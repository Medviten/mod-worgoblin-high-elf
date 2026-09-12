-- I-337 "Town-In-A-Box: Under Attack" (24901) — restore the donor factions the F-011
-- collector flattened. Needs dbc/[I-337]_faction.sql + dbc/[I-337]_factiontemplate.sql
-- applied and PATCH-Z rebuilt first: every id below is a Cata FactionTemplate row, and
-- a creature pointing at a template the server can't resolve is a null deref
-- (that crash is what zz_[F-011]_invalid_factions.sql was papering over, see bottom).
--
-- THE BUG THIS FIXES. Reported as "the invasion triggered too soon, I get murdered
-- entering the town". The trigger is NOT early — it is byte-identical to the donor:
-- phase_definitions 4720/entry 7 = mask 4096 gated by CONDITION_QUESTREWARDED(8) on
-- 24868 "Surrender or Else!", and donor quest 24897 "Get Back to Town" carries no
-- protective SourceSpell either. What is broken is that BOTH sides of the set piece
-- were disarmed by the faction flatten (creatures.py FACTION_REMAP):
--
--   * The 55 Oomlot spawns became faction 14 "Monster". Template 14 has enemy_group 1
--     (players) and an EMPTY enemy list, so they are hostile to the player and to
--     nobody else. Retail 2228 is faction 1157 with enemies_1 = 1133 — hostile to the
--     goblins too, which is what the invasion is supposed to be about.
--   * Spell 66987 "Pygmy Helmet" — the quest's own protection, SourceSpellID on both
--     24901 and 24924 — is aura 139 FORCE_REACTION, misc 1157, base 3 + die 1 =
--     REP_FRIENDLY. GetForcedRankIfAny keys on FactionTemplateEntry->faction, so on
--     template 14 (faction 14) the forced 1157 entry never matches: nothing the player
--     could carry would pacify them. On 2228 it resolves, and HandleForceReaction's
--     StopAttackFaction even drops warriors already in combat.
--   * All 15 Town-In-A-Box residents became faction 35 "Friendly": faction 31,
--     friend_group 1, enemy_group 0, no enemies. They cannot initiate combat and
--     cannot be attacked. Retail 2231 lists enemies_1 = 1157 — the town fights the
--     pygmies. With them inert, the warriors' SMART_ACTION_ATTACK_START on
--     SMART_TARGET_CLOSEST_CREATURE (75116 rows id 0 and id 7) finds only invalid
--     targets and all 55 fall through to the one thing they can hit: the player.
--
-- Scope: all 145 F-011 templates whose donor faction had no 3.3.5a FactionTemplate row,
-- not just the invasion cast — the flatten is one defect and the 8 restored rows cover
-- the whole zone. Grouped one statement per faction (these are [AUTO,F-011]-owned rows,
-- so UPDATE, never DELETE+INSERT).

-- 2159 Bilgewater civilian (was 35) — 103 templates.
UPDATE creature_template SET `faction` = 2159 WHERE `entry` IN (
  34668, 34673, 34689, 34692, 34695, 34696, 34697, 34872, 34874, 34890, 34892, 34954,
  35053, 35054, 35063, 35075, 35120, 35126, 35128, 35130, 35175, 35185, 35186, 35201,
  35207, 35209, 35210, 35222, 35239, 35304, 35623, 35650, 35758, 35769, 35778, 35780,
  35786, 35805, 35807, 35810, 36179, 36180, 36184, 36186, 36403, 36404, 36406, 36425,
  36426, 36427, 36428, 36429, 36430, 36463, 36466, 36467, 36468, 36469, 36470, 36496,
  36501, 36513, 36518, 36519, 36520, 36521, 36523, 36525, 37056, 37057, 37106, 37500,
  37602, 37683, 37708, 37709, 37710, 37761, 37762, 37804, 38381, 38409, 38432, 38441,
  38526, 38643, 38647, 38745, 38812, 39456, 39615, 48305, 48494, 48496, 48721, 48949,
  48961, 48984, 49218, 50310, 50311, 51411, 75107);

-- 2160 Bilgewater civilian, second variant (was 35) — 7 templates.
UPDATE creature_template SET `faction` = 2160 WHERE `entry` IN (
  34693, 35806, 36524, 36600, 38510, 38928, 383870);

-- 2227 Bilgewater, fights the Oomlot (was 35).
UPDATE creature_template SET `faction` = 2227 WHERE `entry` = 38746;

-- 2231 Town-In-A-Box residents, fight the Oomlot (was 35) — 15 templates. This is the
-- half that makes the invasion survivable: Sassy, Hobart, Dampwick, Greely, the
-- trainers and the Warrior-Matic all engage faction 1157 instead of standing inert.
UPDATE creature_template SET `faction` = 2231 WHERE `entry` IN (
  36471, 36615, 38120, 38122, 38124, 38387, 38511, 38513, 38514, 38515, 38516, 38517,
  38518, 38738, 42473);

-- 2228 Oomlot tribe (was 14) — the invasion, plus the Volcanoth pair and the
-- Steamwheedle Shark, all faction 1157 in the donor and all pacifiable by 66987.
UPDATE creature_template SET `faction` = 2228 WHERE `entry` IN (
  38531, 38850, 38851, 39354, 75116, 385310);

-- 2200 Monster/Predator wildlife (was 14).
UPDATE creature_template SET `faction` = 2200 WHERE `entry` IN (35904, 40064);

-- 2204 "PLAYER, Goblin" — player-controlled vehicles and props (was 14 / 35).
-- Supersedes zz_[F-011]_invalid_factions.sql, which forced 35999 -> 35 and 38318 -> 14
-- purely to dodge the missing-FactionTemplate null deref; with 2204 present the donor
-- value is safe and that workaround is dead (this file sorts after it).
UPDATE creature_template SET `faction` = 2204 WHERE `entry` IN (
  34840, 35486, 35999, 36178, 36585, 36608, 38195, 38318, 39074, 39329);

-- 2238 Orgrimmar-aligned, hostile to Monster (was 35).
UPDATE creature_template SET `faction` = 2238 WHERE `entry` = 39591;
