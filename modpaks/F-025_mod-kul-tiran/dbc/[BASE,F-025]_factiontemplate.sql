-- factiontemplate: 1 inserts, 0 updates, 0 deletes

DELETE FROM `factiontemplate` WHERE `id` IN (@KulTiranFactionTemplate);
INSERT INTO `factiontemplate`(`id`, `faction`, `flags`, `faction_group`, `friend_group`, `enemy_group`, `enemies_1`, `enemies_2`, `enemies_3`, `enemies_4`, `friends_1`, `friends_2`, `friends_3`, `friends_4`) VALUES
(@KulTiranFactionTemplate, @KulTiranPlayer, 72, 3, 2, 12, 0, 0, 0, 0, 0, 0, 0, 0); -- "PLAYER"," KulTiran", copied from Gnome
