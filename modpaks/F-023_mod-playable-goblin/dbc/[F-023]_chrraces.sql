-- chrraces: 0 inserts, 1 updates, 0 deletes

-- Fix faction
UPDATE `chrraces` SET `faction_id` = @GoblinFactionTemplate WHERE `id` = @Goblin;
