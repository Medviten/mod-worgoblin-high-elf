--[[
    Worgen "Running Wild" speed-spell teacher
    ------------------------------------------
    Fires whenever a player learns a spell. If the spell learned is one of the
    two native riding-skill spells, and the player is a Worgen, teach the
    correct gendered custom speed spell and drop the old one if upgrading.

    Native riding spell IDs and the Worgen race ID live in worgoblin_common.
]]

local Common = require("worgoblin_common")

local RIDE_APPRENTICE_SPELL = Common.APPRENTICE_RIDING
local RIDE_JOURNEYMAN_SPELL = Common.JOURNEYMAN_RIDING

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
    if not Common.IsWorgen(player) then
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
    if not Common.IsWorgen(player) then
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