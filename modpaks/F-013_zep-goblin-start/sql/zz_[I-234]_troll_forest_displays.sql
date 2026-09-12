-- I-234 (merged, was I-235): Kezan trolls (Defiant/Rebellious/Slave/Worker) use
-- bare, self-textured forest-troll looks on the native *character* model 2613
-- (CHARACTER\FORESTTROLL\MALE\FORESTTROLLMALE.M2). The Kezan-troll render/display/
-- animation work (former issues I-232, I-234, I-235) is now tracked under I-234;
-- see also the companion emote file zz_[I-234]_troll_emote_animations.sql.
--
-- History / correction: earlier revisions of this file avoided model 2613 as
-- "white / bake-dependent" and fell back to display 298 (creature model 119,
-- TrollMelee). That premise was wrong. Model 2613 renders correctly whenever it
-- is paired with a *stock* CreatureDisplayInfoExtra whose composite bake ships in
-- the client -- exactly what the stock jungle-troll NPCs below already have. The
-- real reason to move off 298: creature model 119 has only ~28 anims and CANNOT
-- perform the work/dance/emote states this camp needs; native character model
-- 2613 has the full 141-anim set (EmoteWork/Dance/UseStanding/Eat/...), which the
-- emote scripting in zz_[I-234]_troll_emote_animations.sql depends on.
--
-- All six displays below are stock, use model 2613, have a bare/loincloth
-- (chest_id=0) Extra with a shipped bake, and read as savage jungle-troll
-- laborers -- NOT the caster-robe forest trolls (Mystic/Shadow Hunter/Witch
-- Doctor) and NOT the Darkspear player models tried in I-232. Server-side only:
-- no client patch, no DBC edit, no new assets.
--
-- Up to four Idx rows per creature (schema caps Idx <= 3) = the client rolls a
-- random look per spawn, so the camp varies in skin tone / face / hair instead
-- of 71 identical trolls. Chosen for four distinct skin tones:
--
--   28226 Defiant Troll            skin4 face4   (canonical Cata defiant look)
--   28270 Smolderthorn Headhunter  skin0 face0
--   28247 Vilebranch Hideskinner   skin5 face4
--   28263 Huntsman Markhor         skin2 face0
--
-- Supersedes the Darkspear displays chosen in I-232 (28703/4083). Loads after
-- zz_[AUTO,F-011]_K_creatures_02_model.sql (alphabetical: [AUTO,F-011] < [I-235]).

DELETE FROM creature_template_model WHERE CreatureID IN (34830, 35294, 35239, 48984);
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES
  (34830,0,28226,1,1,0),(34830,1,28270,1,1,0),(34830,2,28247,1,1,0),(34830,3,28263,1,1,0),  -- Defiant Troll
  (35294,0,28226,1,1,0),(35294,1,28270,1,1,0),(35294,2,28247,1,1,0),(35294,3,28263,1,1,0),  -- Rebellious Troll
  (35239,0,28226,1,1,0),(35239,1,28270,1,1,0),(35239,2,28247,1,1,0),(35239,3,28263,1,1,0),  -- Troll Slave
  (48984,0,28226,1,1,0),(48984,1,28270,1,1,0),(48984,2,28247,1,1,0),(48984,3,28263,1,1,0);  -- Troll Worker
