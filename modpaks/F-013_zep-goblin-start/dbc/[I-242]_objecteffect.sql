-- I-242 Hot Rod engine sounds — ObjectEffect chain port (Cata 4.3.4 -> 3.3.5a).
-- The client plays vehicle state sounds (engine idle/drive, backfire, rev, jump)
-- via CreatureDisplayInfo.obj_effect_package_id -> ObjectEffectPackage ->
-- ObjectEffectPackageElem (per state) -> ObjectEffectGroup -> ObjectEffect
-- (effect_rec_type 1 = SoundEntries). Display 31988 already ships package id 492
-- (ported verbatim); these are the missing chain rows. Cata continued the WotLK id
-- sequences, so every id below is free in stock 3.3.5a (stock maxima: package 491,
-- elem 844, group 611, effect 828) — ported at original Cata ids, verbatim.
-- Companion sound rows: [I-242]_soundentries.sql; ogg assets in the zpak mpq.

DELETE FROM objecteffectpackage WHERE id = 492;
INSERT INTO objecteffectpackage (`id`, `name`) VALUES (492, 'Goblinhotrod');

DELETE FROM objecteffectgroup WHERE id IN (612, 614, 615, 616, 623, 649);
INSERT INTO objecteffectgroup (`id`, `name`) VALUES
  (612, 'Goblinhotrod_idle'),
  (614, 'goblinhotrod_drive'),
  (615, 'Goblinhotrod_Jump'),
  (616, 'Goblinhotrod_JumpEnd'),
  (623, 'Goblinhotrod_RevFromMotorCycle'),
  (649, 'GoblinTrike_VehicleImpact');

DELETE FROM objecteffectpackageelem WHERE id IN (845, 857, 862, 866, 867, 874, 875, 876, 878, 879, 941, 964);
INSERT INTO objecteffectpackageelem (`id`, `object_effect_package_id`, `object_effect_group_id`, `state_type`) VALUES
  (845, 492, 612, 19),
  (857, 492, 614, 34),
  (862, 492, 612, 25),
  (866, 492, 615, 23),
  (867, 492, 616, 24),
  (874, 492, 612, 20),
  (875, 492, 612, 21),
  (876, 492, 616, 35),
  (878, 492, 612, 22),
  (879, 492, 623, 22),
  (941, 492, 649, 35),
  (964, 492, 614, 12);

DELETE FROM objecteffect WHERE id IN (830, 832, 833, 836, 837, 838, 841, 842, 843, 844, 846, 847, 848, 849, 861, 862, 911);
INSERT INTO objecteffect (`id`, `name`, `object_effect_group_id`, `trigger_type`, `event_type`, `effect_rec_type`, `effect_rec_id`, `attachment`, `offset_x`, `offset_y`, `offset_z`, `object_effect_modifier_id`) VALUES
  (830, 'Idle', 612, 2, 0, 1, 18097, 0, 0, 0, 0, 0),
  (832, 'drive', 614, 2, 0, 1, 18096, 0, 0, 0, 0, 0),
  (833, 'Sputter', 614, 2, 0, 1, 18099, 0, 0, 0, 0, 0),
  (836, 'Sputter', 612, 2, 0, 1, 18099, 0, 0, 0, 0, 0),
  (837, 'Backfire', 612, 2, 0, 1, 18095, 0, 0, 0, 0, 0),
  (838, 'Backfire', 614, 2, 0, 1, 18095, 0, 0, 0, 0, 0),
  (841, 'Sputter', 615, 2, 0, 1, 18099, 0, 0, 0, 0, 0),
  (842, 'Backfire', 615, 2, 0, 1, 18095, 0, 0, 0, 0, 0),
  (843, 'Idle', 615, 2, 0, 1, 18097, 0, 0, 0, 0, 0),
  (844, 'Rev', 615, 1, 0, 1, 18245, 0, 0, 0, 0, 0),
  (846, 'Sputter', 616, 2, 0, 1, 18099, 0, 0, 0, 0, 0),
  (847, 'Backfire', 616, 2, 0, 1, 18095, 0, 0, 0, 0, 0),
  (848, 'Idle', 616, 2, 0, 1, 18097, 0, 0, 0, 0, 0),
  (849, 'VehicleImpact', 616, 1, 0, 1, 18266, 0, 0, 0, 0, 0),
  (861, 'MotorcycleRevShared', 623, 1, 0, 1, 18267, 0, 0, 0, 0, 0),
  (862, 'Goblinhotrod_REV', 614, 1, 0, 1, 18271, 0, 0, 0, 0, 0),
  (911, 'GoblinTrike_ImpactGround', 649, 1, 0, 1, 18266, 0, 0, 0, 0, 0);
