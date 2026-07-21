local eluna = require("spec.helpers.eluna_mock")

-- Spell IDs mirrored from racials.lua for readable assertions.
local RIDE_APPRENTICE = 33388
local RIDE_JOURNEYMAN = 33391
local WORGEN_APPRENTICE_MALE = 87840
local WORGEN_APPRENTICE_FEMALE = 87841
local WORGEN_JOURNEYMAN_MALE = 110010
local WORGEN_JOURNEYMAN_FEMALE = 110011
local RACE_WORGEN = 12
local RACE_HUMAN = 1

describe("racials.lua (Worgen Running Wild)", function()
    local mod, registry

    before_each(function()
        mod, registry = eluna.load_script("racials.lua")
    end)

    it("exports its constants unchanged", function()
        assert.are.equal(RACE_WORGEN, mod.RACE_WORGEN)
        assert.are.equal(RIDE_APPRENTICE, mod.RIDE_APPRENTICE_SPELL)
        assert.are.equal(RIDE_JOURNEYMAN, mod.RIDE_JOURNEYMAN_SPELL)
    end)

    it("registers the expected Eluna events on load", function()
        -- PLAYER_EVENT_ON_LEARN_SPELL (44) and PLAYER_EVENT_ON_LOGIN (3)
        assert.is_table(registry.playerEvents[44])
        assert.is_table(registry.playerEvents[3])
        -- SPELL_EVENT_ON_CAST (2) hooked on both riding spells
        assert.is_table(registry.spellEvents[RIDE_APPRENTICE])
        assert.is_table(registry.spellEvents[RIDE_JOURNEYMAN])
        assert.are.equal(2, registry.spellEvents[RIDE_APPRENTICE][1].event)
        assert.are.equal(2, registry.spellEvents[RIDE_JOURNEYMAN][1].event)
    end)

    describe("GetGenderedSpells", function()
        it("returns male spell IDs for a male player", function()
            local player = eluna.new_player({ gender = eluna.GENDER_MALE })
            local spells = mod.GetGenderedSpells(player)
            assert.are.equal(WORGEN_APPRENTICE_MALE, spells.apprentice)
            assert.are.equal(WORGEN_JOURNEYMAN_MALE, spells.journeyman)
        end)

        it("returns female spell IDs for a female player", function()
            local player = eluna.new_player({ gender = eluna.GENDER_FEMALE })
            local spells = mod.GetGenderedSpells(player)
            assert.are.equal(WORGEN_APPRENTICE_FEMALE, spells.apprentice)
            assert.are.equal(WORGEN_JOURNEYMAN_FEMALE, spells.journeyman)
        end)
    end)

    describe("ApplyRunningWildTier", function()
        it("does nothing for non-Worgen players", function()
            local player = eluna.new_player({ race = RACE_HUMAN })
            mod.ApplyRunningWildTier(player, "apprentice")
            player:runRegisteredEvents()
            assert.are.same({}, player.learned)
            assert.are.same({}, player.registeredEvents)
        end)

        it("schedules learning the male apprentice speed spell", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_MALE })
            mod.ApplyRunningWildTier(player, "apprentice")
            -- Learning is deferred to a RegisterEvent timer, not immediate.
            assert.are.equal(1, #player.registeredEvents)
            assert.are.equal(250, player.registeredEvents[1].delay)
            assert.is_false(player:HasSpell(WORGEN_APPRENTICE_MALE))

            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_APPRENTICE_MALE))
            assert.are.same({ WORGEN_APPRENTICE_MALE }, player.learned)
        end)

        it("schedules the female apprentice spell for a female Worgen", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_FEMALE })
            mod.ApplyRunningWildTier(player, "apprentice")
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_APPRENTICE_FEMALE))
        end)

        it("does not re-learn a speed spell the player already has", function()
            local player = eluna.new_player({
                race = RACE_WORGEN,
                gender = eluna.GENDER_MALE,
                spells = { WORGEN_APPRENTICE_MALE },
            })
            mod.ApplyRunningWildTier(player, "apprentice")
            assert.are.equal(0, #player.registeredEvents)
            assert.are.same({}, player.learned)
        end)

        it("removes the apprentice spell when upgrading to journeyman", function()
            local player = eluna.new_player({
                race = RACE_WORGEN,
                gender = eluna.GENDER_MALE,
                spells = { WORGEN_APPRENTICE_MALE },
            })
            mod.ApplyRunningWildTier(player, "journeyman")
            assert.are.same({ WORGEN_APPRENTICE_MALE }, player.removed)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_JOURNEYMAN_MALE))
        end)

        it("does not attempt to remove apprentice when the player lacks it", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_MALE })
            mod.ApplyRunningWildTier(player, "journeyman")
            assert.are.same({}, player.removed)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_JOURNEYMAN_MALE))
        end)

        it("does not learn if the player left the world before the timer fires", function()
            local player = eluna.new_player({
                race = RACE_WORGEN,
                gender = eluna.GENDER_MALE,
                inWorld = false,
            })
            mod.ApplyRunningWildTier(player, "apprentice")
            player:runRegisteredEvents()
            assert.are.same({}, player.learned)
        end)
    end)

    describe("OnLearnSpell", function()
        it("applies the apprentice tier when apprentice riding is learned", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_MALE })
            mod.OnLearnSpell(nil, player, RIDE_APPRENTICE)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_APPRENTICE_MALE))
        end)

        it("applies the journeyman tier when journeyman riding is learned", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_MALE })
            mod.OnLearnSpell(nil, player, RIDE_JOURNEYMAN)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_JOURNEYMAN_MALE))
        end)

        it("ignores unrelated spells", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_MALE })
            mod.OnLearnSpell(nil, player, 12345)
            player:runRegisteredEvents()
            assert.are.same({}, player.learned)
        end)
    end)

    describe("OnCastRidingSpell", function()
        it("returns a handler that applies the tier for the casting player", function()
            local player = eluna.new_player({ race = RACE_WORGEN, gender = eluna.GENDER_FEMALE })
            local handler = mod.OnCastRidingSpell("journeyman")
            handler(nil, player, nil, false)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_JOURNEYMAN_FEMALE))
        end)
    end)

    describe("OnLogin re-sync", function()
        it("re-grants journeyman speed spell for a Worgen who already knows journeyman riding", function()
            local player = eluna.new_player({
                race = RACE_WORGEN,
                gender = eluna.GENDER_MALE,
                spells = { RIDE_JOURNEYMAN },
            })
            mod.OnLogin(nil, player)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_JOURNEYMAN_MALE))
        end)

        it("re-grants apprentice speed spell when only apprentice riding is known", function()
            local player = eluna.new_player({
                race = RACE_WORGEN,
                gender = eluna.GENDER_MALE,
                spells = { RIDE_APPRENTICE },
            })
            mod.OnLogin(nil, player)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_APPRENTICE_MALE))
        end)

        it("prefers journeyman when the player somehow knows both riding tiers", function()
            local player = eluna.new_player({
                race = RACE_WORGEN,
                gender = eluna.GENDER_MALE,
                spells = { RIDE_APPRENTICE, RIDE_JOURNEYMAN },
            })
            mod.OnLogin(nil, player)
            player:runRegisteredEvents()
            assert.is_true(player:HasSpell(WORGEN_JOURNEYMAN_MALE))
            assert.is_false(player:HasSpell(WORGEN_APPRENTICE_MALE))
        end)

        it("does nothing for a non-Worgen player", function()
            local player = eluna.new_player({ race = RACE_HUMAN, spells = { RIDE_JOURNEYMAN } })
            mod.OnLogin(nil, player)
            player:runRegisteredEvents()
            assert.are.same({}, player.learned)
        end)

        it("does nothing for a Worgen without any riding skill", function()
            local player = eluna.new_player({ race = RACE_WORGEN })
            mod.OnLogin(nil, player)
            player:runRegisteredEvents()
            assert.are.same({}, player.learned)
        end)
    end)
end)
