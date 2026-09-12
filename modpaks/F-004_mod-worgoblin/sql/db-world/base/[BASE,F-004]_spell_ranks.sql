/* Add two ranks for Running Wild */
REPLACE INTO `spell_ranks` (
    `first_spell_id`,
    `spell_id`,
    `rank`
) VALUES (
    87840, -- Basic spell ID: Running Wild (male, 60%)
    87840, -- Spell ID: Running Wild (male, 60%)
    1 -- Rank
), (
    87840, -- Basic spell ID: Running Wild (male, 60%)
    110010, -- Spell ID: Running Wild (male, 100%)
    2 -- Rank
),
(
    87841, -- Basic spell ID: Running Wild (female, 60%)
    87841, -- Spell ID: Running Wild (female, 60%)
    1 -- Rank
), (
    87841, -- Basic spell ID: Running Wild (female, 60%)
    110011, -- Spell ID: Running Wild (female, 100%)
    2 -- Rank
);
