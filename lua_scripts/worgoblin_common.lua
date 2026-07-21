--[[
    Shared constants and helpers for the Worgoblin/High Elf Eluna scripts.

    Returned as a table so individual scripts can pull it in with
    `require("worgoblin_common")`. This file only defines values and helper
    functions; it registers no events, so it is harmless if Eluna also loads
    it as a standalone script.
]]

local Common = {}

-- Race IDs (static WotLK content, do not change per-core).
Common.RACE_WORGEN = 12

-- Native riding-skill spells (static WotLK content, do not change per-core):
--     33388 = Apprentice Riding   (75 skill,  60% speed)
--     33391 = Journeyman Riding   (150 skill, 100% speed)
Common.APPRENTICE_RIDING = 33388
Common.JOURNEYMAN_RIDING = 33391

-- True if the given player is a Worgen.
function Common.IsWorgen(player)
    return player:GetRace() == Common.RACE_WORGEN
end

-- True if the player already knows any native riding tier.
function Common.HasAnyRiding(player)
    return player:HasSpell(Common.APPRENTICE_RIDING)
        or player:HasSpell(Common.JOURNEYMAN_RIDING)
end

return Common
