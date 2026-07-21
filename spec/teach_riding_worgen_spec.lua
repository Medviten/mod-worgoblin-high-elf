local eluna = require("spec.helpers.eluna_mock")

local RACE_WORGEN = 12
local RACE_HUMAN = 1
local CLASS_DEATH_KNIGHT = 6
local CLASS_WARRIOR = 1
local APPRENTICE_RIDING = 33388
local JOURNEYMAN_RIDING = 33391

describe("teach_riding_worgen.lua", function()
    local mod, registry

    before_each(function()
        mod, registry = eluna.load_script("teach_riding_worgen.lua")
    end)

    it("registers an ON_LEVEL_CHANGE (13) player event", function()
        assert.is_table(registry.playerEvents[13])
        assert.are.equal(1, #registry.playerEvents[13])
    end)

    describe("GrantWorgenRiding", function()
        it("teaches apprentice riding to a level-20 non-DK Worgen", function()
            local player = eluna.new_player({ race = RACE_WORGEN, class = CLASS_WARRIOR, level = 20 })
            mod.GrantWorgenRiding(player)
            assert.is_true(player:HasSpell(APPRENTICE_RIDING))
            assert.are.same({ APPRENTICE_RIDING }, player.learned)
        end)

        it("teaches apprentice riding above level 20 too", function()
            local player = eluna.new_player({ race = RACE_WORGEN, class = CLASS_WARRIOR, level = 45 })
            mod.GrantWorgenRiding(player)
            assert.is_true(player:HasSpell(APPRENTICE_RIDING))
        end)

        it("does not teach below level 20", function()
            local player = eluna.new_player({ race = RACE_WORGEN, class = CLASS_WARRIOR, level = 19 })
            mod.GrantWorgenRiding(player)
            assert.are.same({}, player.learned)
        end)

        it("does not teach non-Worgen players", function()
            local player = eluna.new_player({ race = RACE_HUMAN, class = CLASS_WARRIOR, level = 30 })
            mod.GrantWorgenRiding(player)
            assert.are.same({}, player.learned)
        end)

        it("does not teach Death Knights (they start above 20)", function()
            local player = eluna.new_player({ race = RACE_WORGEN, class = CLASS_DEATH_KNIGHT, level = 55 })
            mod.GrantWorgenRiding(player)
            assert.are.same({}, player.learned)
        end)

        it("leaves an existing apprentice rider untouched", function()
            local player = eluna.new_player({
                race = RACE_WORGEN, class = CLASS_WARRIOR, level = 40,
                spells = { APPRENTICE_RIDING },
            })
            mod.GrantWorgenRiding(player)
            assert.are.same({}, player.learned)
        end)

        it("does not downgrade a journeyman rider to apprentice", function()
            local player = eluna.new_player({
                race = RACE_WORGEN, class = CLASS_WARRIOR, level = 40,
                spells = { JOURNEYMAN_RIDING },
            })
            mod.GrantWorgenRiding(player)
            assert.are.same({}, player.learned)
            assert.is_false(player:HasSpell(APPRENTICE_RIDING))
        end)
    end)

    describe("ON_LEVEL_CHANGE hook", function()
        it("grants riding when the registered callback fires for an eligible Worgen", function()
            local player = eluna.new_player({ race = RACE_WORGEN, class = CLASS_WARRIOR, level = 20 })
            local callback = registry.playerEvents[13][1]
            callback(13, player, 19)
            assert.is_true(player:HasSpell(APPRENTICE_RIDING))
        end)
    end)
end)
