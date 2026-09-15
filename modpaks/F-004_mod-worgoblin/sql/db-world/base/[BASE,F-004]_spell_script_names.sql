/* Add goblin rocket barrage racial ability */
DELETE FROM `spell_script_names` WHERE `spell_id` = @GoblinRacial1;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@GoblinRacial1, 'spell_rocket_barrage');
