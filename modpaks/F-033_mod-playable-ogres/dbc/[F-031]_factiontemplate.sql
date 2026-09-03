-- "PLAYER"," Ogre", copied from Troll
DELETE FROM `factiontemplate` WHERE `id` = @OgreFactionTemplate;
INSERT INTO `factiontemplate`(`id`, `faction`, `flags`, `faction_group`, `friend_group`, `enemy_group`, `enemies_1`, `enemies_2`, `enemies_3`, `enemies_4`, `friends_1`, `friends_2`, `friends_3`, `friends_4`) VALUES (@OgreFactionTemplate, @OgrePlayer, 72, 5, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0);
