local Common = require("worgoblin_common")

local CLASS_DEATH_KNIGHT = 6

local function GrantWorgenRiding(player)
    if not Common.IsWorgen(player) then
        return
    end

    if Common.HasAnyRiding(player) then
        return -- already has riding from some path, don't touch it
    end

    if player:GetClass() == CLASS_DEATH_KNIGHT then
        return
    elseif player:GetLevel() >= 20 then
        player:LearnSpell(Common.APPRENTICE_RIDING)
    end
end

-- Live trigger: catches the moment a non-DK Worgen crosses level 20
RegisterPlayerEvent(13, function(event, player, oldLevel) -- ON_LEVEL_CHANGE
    GrantWorgenRiding(player)
end)
