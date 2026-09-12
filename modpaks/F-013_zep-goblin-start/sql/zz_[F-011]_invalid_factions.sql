-- F-011 fix invalid (unremapped Cata) creature factions that crash the worldserver.
-- Faction 2204 has no FactionTemplate.dbc row -> null deref (esp. on the vehicle 35999).
UPDATE creature_template SET faction = 35 WHERE entry = 35999;   -- Voiture de sport (rideable vehicle) -> friendly
UPDATE creature_template SET faction = 14 WHERE entry = 38318;   -- Mechashark X-Steam -> hostile
