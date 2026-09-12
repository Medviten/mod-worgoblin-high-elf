-- I-307 Weed Whacker (q14236): the quest's plant creatures came out of the
-- Neltharion (French) source dump named 'Freezya' while the objective text
-- reads 'Deadly Jungle Plants mowed down'. Rename to match.
-- Stock-port rows (owned by zz_[AUTO,F-011]_10_creature_template.sql) -> one
-- consolidated UPDATE per ID. 35897 = hostile mowable plant (self-credits on
-- death); 35928 = friendly variant with KillCredit1 = 35897.
-- flags_extra 0x40 = CREATURE_FLAG_EXTRA_NO_XP: 137 fast-farmable mow targets
-- must not grant kill XP (quest credit is unaffected).
UPDATE creature_template SET name = 'Deadly Jungle Plant', flags_extra = 0x40 WHERE entry = 35897;
UPDATE creature_template SET name = 'Deadly Jungle Plant' WHERE entry = 35928;
