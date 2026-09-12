-- [I-255] Wrong faces on F-011 variant-model NPCs (Pirate Party Crasher etc.) -- extends [I-231].
-- The I-231 sweep repointed the 17 primary extras to stock '_HD.blp' bakes, but the I-249 multi-Idx
-- model work later shipped Idx 1-3 variant displays whose extras still carry non-HD Cata bakes
-- (CreatureDisplayExtra-<id>.blp). On the HD Everything client (PATCH-Q) a non-HD bake on an HD
-- character model breaks the face. Repoint each to a stock '_HD.blp' bake matched on exact
-- (race, sex, skin_color, face_type); ties broken on facial_hair, then hair_style/hair_color.
-- Loads after [AUTO,F-011]_creaturedisplayinfoextra.sql (I > A in filename sort) and overrides
-- the `texture` field only. Donor '_HD' files already ship in PATCH-Q -- no new art.
-- Requires: dbc db rebuild -t creaturedisplayinfoextra + PATCH-Z rebuild to reach the client.

-- Pirate Party Crasher / Hired Looter / Southsea Mercenary variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-09212_HD.blp' WHERE id = 19681;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-05936_HD.blp' WHERE id = 19682;
-- Orc Survivor variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-19579_HD.blp' WHERE id = 19836;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-01934_HD.blp' WHERE id = 19837;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-17555_HD.blp' WHERE id = 19838;
-- Orc Scout variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00096_HD.blp' WHERE id = 19843;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00091_HD.blp' WHERE id = 19844;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-09486_HD.blp' WHERE id = 19845;
-- SI:7 Assassin variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00180_HD.blp' WHERE id = 19861;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00155_HD.blp' WHERE id = 19862;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00869_HD.blp' WHERE id = 19863;
-- SI:7 Operative variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00155_HD.blp' WHERE id = 19875;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00869_HD.blp' WHERE id = 19876;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00180_HD.blp' WHERE id = 19877;
-- Orc Battlesworn variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-11743_HD.blp' WHERE id = 19879;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-02652_HD.blp' WHERE id = 19880;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-06807_HD.blp' WHERE id = 19881;
-- Alliance Sailor variants
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15540_HD.blp' WHERE id = 19889;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-02917_HD.blp' WHERE id = 19890;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-17094_HD.blp' WHERE id = 19891;
