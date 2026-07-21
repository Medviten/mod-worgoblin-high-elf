local RACE_WORGEN = 12
local CLASS_DEATH_KNIGHT = 6

local APPRENTICE_RIDING = 33388
local JOURNEYMAN_RIDING = 33391

local function GrantWorgenRiding(player)
    if player:GetRace() ~= RACE_WORGEN then
        return
    end

    if player:HasSpell(APPRENTICE_RIDING) or player:HasSpell(JOURNEYMAN_RIDING) then
        return -- already has riding from some path, don't touch it
    end

    if player:GetClass() == CLASS_DEATH_KNIGHT then
        return
    elseif player:GetLevel() >= 20 then
        player:LearnSpell(APPRENTICE_RIDING)
    end
end

-- Live trigger: catches the moment a non-DK Worgen crosses level 20
RegisterPlayerEvent(13, function(event, player, oldLevel) -- ON_LEVEL_CHANGE
    GrantWorgenRiding(player)
end)

-- Expose the internal helper so it can be unit tested. Eluna ignores the
-- return value of a script, so this has no effect on the live server.
return {
    RACE_WORGEN = RACE_WORGEN,
    CLASS_DEATH_KNIGHT = CLASS_DEATH_KNIGHT,
    APPRENTICE_RIDING = APPRENTICE_RIDING,
    JOURNEYMAN_RIDING = JOURNEYMAN_RIDING,
    GrantWorgenRiding = GrantWorgenRiding,
}
