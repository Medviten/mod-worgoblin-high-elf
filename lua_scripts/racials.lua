--[[
    Worgen "Running Wild" speed-spell teacher
    ------------------------------------------
    Fires whenever a player learns a spell. If the spell learned is one of the
    two native riding-skill spells, and the player is a Worgen, teach the
    correct gendered custom speed spell and drop the old one if upgrading.

    Native riding spells (static WotLK content, do not change per-core):
        33388 = Apprentice Riding   (75 skill,  60% speed)
        33391 = Journeyman Riding   (150 skill, 100% speed)
]]

local RACE_WORGEN = 12

local RIDE_APPRENTICE_SPELL = 33388
local RIDE_JOURNEYMAN_SPELL = 33391

local WORGEN_APPRENTICE_MALE   = 87840
local WORGEN_APPRENTICE_FEMALE = 87841
local WORGEN_JOURNEYMAN_MALE   = 110010
local WORGEN_JOURNEYMAN_FEMALE = 110011

-- GENDER_MALE = 0, GENDER_FEMALE = 1 (standard Eluna/DBC convention)
local function GetGenderedSpells(player)
    local isMale = (player:GetGender() == 0)
    return {
        apprentice = isMale and WORGEN_APPRENTICE_MALE or WORGEN_APPRENTICE_FEMALE,
        journeyman = isMale and WORGEN_JOURNEYMAN_MALE or WORGEN_JOURNEYMAN_FEMALE,
    }
end

local function ApplyRunningWildTier(player, tier)
    if player:GetRace() ~= RACE_WORGEN then
        return
    end

    local spells = GetGenderedSpells(player)
    local spellId = spells[tier]

    if tier == "journeyman" and player:HasSpell(spells.apprentice) then
        player:RemoveSpell(spells.apprentice)
    end

    if spellId and not player:HasSpell(spellId) then
        player:RegisterEvent(function(eventId, delay, repeats, plr)
            if plr and plr:IsInWorld() and not plr:HasSpell(spellId) then
                plr:LearnSpell(spellId)
            end
        end, 250, 1)
    end
end

local function OnLearnSpell(event, player, spellId)
    if spellId == RIDE_APPRENTICE_SPELL then
        ApplyRunningWildTier(player, "apprentice")
    elseif spellId == RIDE_JOURNEYMAN_SPELL then
        ApplyRunningWildTier(player, "journeyman")
    end
end

-- Primary trigger: hook the actual spell CAST rather than the generic
-- "learn spell" player event. PLAYER_EVENT_ON_LEARN_SPELL turned out not to
-- fire reliably for Journeyman Riding — most likely because that spell's
-- skill-line auto-grant path doesn't route through the same internal call
-- as a normal LearnSpell(). Hooking SPELL_EVENT_ON_CAST on the two riding
-- spell IDs directly sidesteps that: it fires whenever the player casts
-- (i.e. trains) that spell, full stop, regardless of the internal path.
local function OnCastRidingSpell(tier)
    return function(event, caster, spell, skipCheck)
        local player = caster
        if player.ToPlayer then
            player = caster:ToPlayer()
        end
        if player then
            ApplyRunningWildTier(player, tier)
        end
    end
end

RegisterSpellEvent(RIDE_APPRENTICE_SPELL, 2, OnCastRidingSpell("apprentice")) -- SPELL_EVENT_ON_CAST
RegisterSpellEvent(RIDE_JOURNEYMAN_SPELL, 2, OnCastRidingSpell("journeyman")) -- SPELL_EVENT_ON_CAST


-- Safety net: re-sync on login in case a character already knows a riding
-- tier (e.g. granted via SQL/.learn/character import) without ever passing
-- through OnLearnSpell above.
local function OnLogin(event, player)
    if player:GetRace() ~= RACE_WORGEN then
        return
    end

    if player:HasSpell(RIDE_JOURNEYMAN_SPELL) then
        ApplyRunningWildTier(player, "journeyman")
    elseif player:HasSpell(RIDE_APPRENTICE_SPELL) then
        ApplyRunningWildTier(player, "apprentice")
    end
end

RegisterPlayerEvent(44, OnLearnSpell) -- PLAYER_EVENT_ON_LEARN_SPELL
RegisterPlayerEvent(3, OnLogin)       -- PLAYER_EVENT_ON_LOGIN

-- Expose the internal helpers so they can be unit tested. Eluna ignores the
-- return value of a script, so this has no effect on the live server.
return {
    RACE_WORGEN = RACE_WORGEN,
    RIDE_APPRENTICE_SPELL = RIDE_APPRENTICE_SPELL,
    RIDE_JOURNEYMAN_SPELL = RIDE_JOURNEYMAN_SPELL,
    WORGEN_APPRENTICE_MALE = WORGEN_APPRENTICE_MALE,
    WORGEN_APPRENTICE_FEMALE = WORGEN_APPRENTICE_FEMALE,
    WORGEN_JOURNEYMAN_MALE = WORGEN_JOURNEYMAN_MALE,
    WORGEN_JOURNEYMAN_FEMALE = WORGEN_JOURNEYMAN_FEMALE,
    GetGenderedSpells = GetGenderedSpells,
    ApplyRunningWildTier = ApplyRunningWildTier,
    OnLearnSpell = OnLearnSpell,
    OnCastRidingSpell = OnCastRidingSpell,
    OnLogin = OnLogin,
}