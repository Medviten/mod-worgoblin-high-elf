-- "PLAYER"," Goblin", copied from Troll
DELETE FROM `factiontemplate` WHERE `id` = @GoblinFactionTemplate;
INSERT INTO `factiontemplate`(`id`, `faction`, `flags`, `faction_group`, `friend_group`, `enemy_group`, `enemies_1`, `enemies_2`, `enemies_3`, `enemies_4`, `friends_1`, `friends_2`, `friends_3`, `friends_4`) VALUES (@GoblinFactionTemplate, @GoblinPlayer, 72, 5, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0);

-- "PLAYER"," Worgen", copied from Gnome
DELETE FROM `factiontemplate` WHERE `id` = @WorgenFactionTemplate;
INSERT INTO `factiontemplate`(`id`, `faction`, `flags`, `faction_group`, `friend_group`, `enemy_group`, `enemies_1`, `enemies_2`, `enemies_3`, `enemies_4`, `friends_1`, `friends_2`, `friends_3`, `friends_4`) VALUES (@WorgenFactionTemplate, @WorgenPlayer, 72, 3, 2, 12, 0, 0, 0, 0, 0, 0, 0, 0);
