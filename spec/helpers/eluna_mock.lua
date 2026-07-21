--[[
    Minimal Eluna API test harness
    ------------------------------
    The lua_scripts in this module are Eluna server scripts. They call global
    Eluna registration functions at load time (RegisterPlayerEvent,
    RegisterSpellEvent) and operate on Player objects via Eluna's method API
    (player:GetRace(), player:HasSpell(id), ...).

    This helper provides:
      * a fake Player object with just the methods the scripts use, plus
        instrumentation (spell set, learned/removed/registered-event logs);
      * an event registry that captures the callbacks the scripts register;
      * load_script(), which injects the mocked globals and loads a script
        from lua_scripts/ in an isolated environment, returning both the
        module table the script exports and the captured registry.
]]

local M = {}

-- Standard WotLK / Eluna constants used by the scripts under test.
M.GENDER_MALE = 0
M.GENDER_FEMALE = 1

--- Create a fake Player.
-- opts: { race, gender, class, level, spells = {id1, id2, ...} }
function M.new_player(opts)
    opts = opts or {}

    local player = {
        _race = opts.race or 1,
        _gender = opts.gender or M.GENDER_MALE,
        _class = opts.class or 1,
        _level = opts.level or 1,
        _inWorld = opts.inWorld ~= false, -- default true
        _spells = {},
        -- instrumentation
        learned = {},
        removed = {},
        registeredEvents = {},
    }

    for _, id in ipairs(opts.spells or {}) do
        player._spells[id] = true
    end

    function player:GetRace() return self._race end
    function player:GetGender() return self._gender end
    function player:GetClass() return self._class end
    function player:GetLevel() return self._level end
    function player:IsInWorld() return self._inWorld end

    function player:HasSpell(id) return self._spells[id] == true end

    function player:LearnSpell(id)
        self._spells[id] = true
        table.insert(self.learned, id)
    end

    function player:RemoveSpell(id)
        self._spells[id] = nil
        table.insert(self.removed, id)
    end

    -- Capture delayed events instead of running them. Tests can invoke
    -- player:runRegisteredEvents() to simulate the timer firing.
    function player:RegisterEvent(callback, delay, repeats)
        table.insert(self.registeredEvents, {
            callback = callback,
            delay = delay,
            repeats = repeats,
        })
    end

    -- Test-only: fire every captured RegisterEvent callback once, passing the
    -- player as the fourth arg exactly like Eluna does.
    function player:runRegisteredEvents()
        for _, ev in ipairs(self.registeredEvents) do
            ev.callback(1, ev.delay, ev.repeats, self)
        end
    end

    -- ToPlayer is used by the spell-cast hook (caster:ToPlayer()); a Player
    -- returns itself.
    function player:ToPlayer() return self end

    return player
end

--- Load a script from lua_scripts/ with mocked Eluna globals.
-- Returns: module_table, registry
--   registry.playerEvents[eventId] = { callback, ... }
--   registry.spellEvents[spellId]  = { {event=..., callback=...}, ... }
function M.load_script(name)
    local registry = {
        playerEvents = {},
        spellEvents = {},
    }

    -- Fresh sandbox environment inheriting the real stdlib.
    local env = setmetatable({}, { __index = _G })

    env.RegisterPlayerEvent = function(eventId, callback)
        registry.playerEvents[eventId] = registry.playerEvents[eventId] or {}
        table.insert(registry.playerEvents[eventId], callback)
    end

    env.RegisterSpellEvent = function(spellId, event, callback)
        registry.spellEvents[spellId] = registry.spellEvents[spellId] or {}
        table.insert(registry.spellEvents[spellId], { event = event, callback = callback })
    end

    -- Resolve the script path relative to the repo root regardless of cwd.
    local here = debug.getinfo(1, "S").source:sub(2)
    local helpers_dir = here:match("(.*/)") or "./"
    local path = helpers_dir .. "../../lua_scripts/" .. name

    local chunk, err = loadfile(path)
    if not chunk then
        error("failed to load " .. path .. ": " .. tostring(err))
    end
    setfenv(chunk, env)

    local module = chunk()
    return module, registry
end

return M
