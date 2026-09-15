/* Add two ranks for Running Wild */
REPLACE INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(@RunningWildMale60, @RunningWildMale60, 1), -- baseline
(@RunningWildMale60, @RunningWildMale100, 2), -- upgrade
(@RunningWildFemale60, @RunningWildFemale60, 1), -- baseline
(@RunningWildFemale60, @RunningWildFemale100, 2); -- upgrade
