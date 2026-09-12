-- [I-231] Human/orc/dwarf/nightelf/gnome NPC faces -- override for generated creaturedisplayinfoextra (DBC, PATCH-Z).
-- The generator emits per-NPC bake names (CreatureDisplayExtra-<id>.blp). For race 1-4,7 NPCs these are
-- repointed here to stock '_HD.blp' bakes so faces match the HD Everything (PATCH-Q) player models.
-- Loads after [F-011]_*creaturedisplayinfoextra.sql (I > F in filename sort) and overrides the `texture` field only.
-- Requires: dbc db rebuild -t creaturedisplayinfoextra + PATCH-Z rebuild to reach the client.

UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00996_HD.blp' WHERE id = 19680;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-02563_HD.blp' WHERE id = 19809;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-12203_HD.blp' WHERE id = 19824;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00122_HD.blp' WHERE id = 19835;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00078_HD.blp' WHERE id = 19841;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-01120_HD.blp' WHERE id = 19842;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00235_HD.blp' WHERE id = 19860;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-02457_HD.blp' WHERE id = 19873;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00235_HD.blp' WHERE id = 19874;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00077_HD.blp' WHERE id = 19878;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-03060_HD.blp' WHERE id = 19886;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00219_HD.blp' WHERE id = 19888;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00445_HD.blp' WHERE id = 19892;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-02458_HD.blp' WHERE id = 19958;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00167_HD.blp' WHERE id = 20863;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00795_HD.blp' WHERE id = 20865;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-00488_HD.blp' WHERE id = 22530;
