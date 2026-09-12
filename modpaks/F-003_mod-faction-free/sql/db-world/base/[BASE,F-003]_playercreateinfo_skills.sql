/*This will update the playercreateinfo_skills table to have all players start with knowing all playable race languages at creation.*/
UPDATE `playercreateinfo_skills` SET `raceMask`=@PlayableRaceMask WHERE `raceMask`!=@PlayableRaceMask AND `comment` LIKE "Language%";
