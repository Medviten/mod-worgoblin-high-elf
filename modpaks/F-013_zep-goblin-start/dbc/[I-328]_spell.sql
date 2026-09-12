-- I-328 "A Goblin in Shark's Clothing" (quest 24817) — spell 71648 "Mechashark X-Steam".
--
-- Effect 0 is SUMMON with SummonProperties 827 (control 4 = SUMMON_CATEGORY_VEHICLE).
-- AC reads the ride spell out of the effect VALUE (SpellEffects.cpp:2559):
--
--     int32 basePoints = m_spellInfo->Effects[effIndex].CalcValue();
--     if (basePoints > 1) { spellInfo = sSpellMgr->GetSpellInfo(basePoints);
--                           if (spellInfo->HasAura(SPELL_AURA_CONTROL_VEHICLE)) spellId = ...; }
--
-- The source encodes "71661" as BasePoints 71661 / DieSides 0, but spells.py forces
-- `die_sides = max(e[9], 1)` for $s tooltips and AC's CalcValue does `case 1: += 1`
-- (SpellInfo.cpp:435) — so the ported row calculates to 71662, which is the GO's own
-- controller spell and carries no CONTROL_VEHICLE aura. AC silently falls back to
-- VEHICLE_SPELL_RIDE_HARDCODED 46598: the pilot boards seat 0 but never receives
-- 71661's other two auras — WATER_BREATHING (82) and +150% swim speed (58) — i.e.
-- drowns. The generator-side twin of this fix is spells.EFFECT_OVERRIDE[71648].
--
-- AUTO-owned row -> one consolidated UPDATE. DieSides 0 (not BasePoints 71660) so the
-- stored value stays the literal spell id the effect names.
UPDATE spell SET
  `effect_die_sides_1` = 0
WHERE id = 71648;
