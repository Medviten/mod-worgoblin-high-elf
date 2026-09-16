DELETE FROM `factiontemplate` WHERE `id` IN (@AlliancePandarenFactionTemplate);
INSERT INTO `factiontemplate`(`id`, `faction`, `flags`, `faction_group`, `friend_group`, `enemy_group`, `enemies_1`, `enemies_2`, `enemies_3`, `enemies_4`, `friends_1`, `friends_2`, `friends_3`, `friends_4`) VALUES
(@AlliancePandarenFactionTemplate, @AlliancePandarenPlayer, 72, 3, 2, 12, 0, 0, 0, 0, 0, 0, 0, 0); -- "PLAYER"," AlliancePandaren", copied from Gnome
