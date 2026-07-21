# Unit tests

Unit tests for the Eluna server-side Lua scripts in `lua_scripts/`.

Prior to this suite the repository had **no automated test coverage** of any
kind. The Lua scripts are the module's only self-contained, engine-independent
logic (the C++ in `src/` links against the full AzerothCore engine and cannot
be unit tested in isolation, and the rest of the repo is DBC/MPQ game data and
SQL), so they are covered first.

## What is covered

- `racials.lua` — Worgen "Running Wild" gendered speed-spell logic: race
  gating, male/female spell selection, apprentice→journeyman upgrade (old spell
  removal), deferred learning via `RegisterEvent`, the in-world guard, the
  learn/cast hooks, and the on-login re-sync.
- `teach_riding_worgen.lua` — level-20 apprentice-riding grant: race gating,
  level threshold, Death Knight exclusion, and the "don't touch existing
  riders" guards.

## Harness

`spec/helpers/eluna_mock.lua` provides a minimal fake of the Eluna API (a
`Player` object with the handful of methods the scripts use, and an event
registry that captures `RegisterPlayerEvent` / `RegisterSpellEvent`
callbacks). Each script is loaded in an isolated environment with these globals
injected; the scripts export their internal helpers via a returned table (Eluna
ignores a script's return value, so live behavior is unchanged).

## Running

```
sudo apt-get install -y lua5.1 luarocks
sudo luarocks install busted
busted
```

Tests also run in CI via `.github/workflows/lua-tests.yml`.
