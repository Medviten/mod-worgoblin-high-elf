-- I-242 Hot Rod sounds — ported from the Whitemane Cata 4.3.4 SoundEntries.dbc
-- (first 30 fields = the 3.3.5a layout; Cata's 5 appended variation fields dropped).
-- 22491 GoblinHotrod_Horn  -> Honk Horn (66298) via SmartAI SMART_ACTION_SOUND.
-- 23406 Radio loop (music) -> Radio (66299) via SmartAI SMART_ACTION_MUSIC.
--   advanced_id 4361 (Cata SoundEntriesAdvanced row) is not ported -> 0.
-- Audio files ship in zep-goblin-start mpq/source-assets/Sound/... (PATCH-Z).

DELETE FROM soundentries WHERE id = 22491;
INSERT INTO soundentries SET
  id = 22491,
  sound_type = 1,
  name = 'GoblinHotrod_Horn',
  file_1 = 'goblinhotrod_horn.ogg',
  frequency_1 = 1,
  base_dir = 'sound\\creature\\goblinhotrod',
  volume = 0.8,
  flags = 0,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 23406;
INSERT INTO soundentries SET
  id = 23406,
  sound_type = 28,
  name = 'MUS_GoblinHotrodRadioLoop_EU',
  file_1 = 'mus_goblinhotrodradioloop_eu01.mp3',
  frequency_1 = 1,
  base_dir = 'sound\\music\\cataclysm',
  volume = 0.69,
  flags = 512,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

-- Engine/vehicle-state sounds, triggered via the ObjectEffect chain (package 492 on
-- display 31988 — see [I-242]_objecteffect.sql). Rows ported verbatim from Cata at
-- their original ids (all free in 3.3.5a); Cata SoundEntriesAdvanced refs dropped
-- (26-field Cata layout doesn't map onto the 24-field 3.3.5a one) -> advanced_id 0.
-- goblinhotrod oggs ship in the zpak; the motorcyclevehicle .ogg files (18245/18266/
-- 18267) are Cata-only too (stock 3.3.5a has .wav variants) and ship as well.
-- (22492/22493 'GoblinhotrodStand/WalkRun' were a retired name-binding experiment.)
DELETE FROM soundentries WHERE id IN (22492, 22493);

DELETE FROM soundentries WHERE id = 18095;
INSERT INTO soundentries SET
  id = 18095,
  sound_type = 53,
  name = 'Goblinhotrod_Engine_Backfire',
  file_1 = 'goblinhotrod_engine_backfire_01.ogg',
  file_2 = 'goblinhotrod_engine_backfire_02.ogg',
  frequency_1 = 1,
  frequency_2 = 1,
  base_dir = 'sound\\creature\\goblinhotrod',
  volume = 0.22,
  flags = 0,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18096;
INSERT INTO soundentries SET
  id = 18096,
  sound_type = 53,
  name = 'Goblinhotrod_Engine_Drive_LP',
  file_1 = 'goblinhotrod_engine_drive_lp_01.ogg',
  frequency_1 = 1,
  base_dir = 'sound\\creature\\goblinhotrod',
  volume = 0.6,
  flags = 512,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18097;
INSERT INTO soundentries SET
  id = 18097,
  sound_type = 53,
  name = 'Goblinhotrod_Engine_Idle_LP',
  file_1 = 'goblinhotrod_engine_idle_lp_01.ogg',
  file_2 = 'goblinhotrod_engine_idle_lp_02.ogg',
  frequency_1 = 1,
  frequency_2 = 1,
  base_dir = 'sound\\creature\\goblinhotrod',
  volume = 0.36,
  flags = 512,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18099;
INSERT INTO soundentries SET
  id = 18099,
  sound_type = 53,
  name = 'Goblinhotrod_Engine_Sputters_OS',
  file_1 = 'goblinhotrod_engine_sputters_os_01.ogg',
  file_2 = 'goblinhotrod_engine_sputters_os_02.ogg',
  file_3 = 'goblinhotrod_engine_sputters_os_03.ogg',
  frequency_1 = 1,
  frequency_2 = 1,
  frequency_3 = 1,
  base_dir = 'sound\\creature\\goblinhotrod',
  volume = 0.11,
  flags = 512,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18245;
INSERT INTO soundentries SET
  id = 18245,
  sound_type = 53,
  name = 'Goblinhotrod_Rev',
  file_1 = 'MotorcycleVehicleJumpStart3.ogg',
  frequency_1 = 1,
  base_dir = 'sound\\vehicles\\motorcyclevehicle',
  volume = 0.25,
  flags = 3072,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18266;
INSERT INTO soundentries SET
  id = 18266,
  sound_type = 53,
  name = 'HotRodVehicleJumpEnd',
  file_1 = 'MotorcycleVehicleJumpEnd1.ogg',
  file_2 = 'motorcyclevehiclejumpend2.ogg',
  frequency_1 = 1,
  frequency_2 = 1,
  base_dir = 'sound\\vehicles\\motorcyclevehicle',
  volume = 0.22,
  flags = 3072,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18267;
INSERT INTO soundentries SET
  id = 18267,
  sound_type = 53,
  name = 'MotorCycleRev_Shared_LowerVol',
  file_1 = 'MotorcycleVehicleJumpStart2.ogg',
  frequency_1 = 1,
  base_dir = 'sound\\vehicles\\motorcyclevehicle',
  volume = 0.05,
  flags = 3072,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;

DELETE FROM soundentries WHERE id = 18271;
INSERT INTO soundentries SET
  id = 18271,
  sound_type = 53,
  name = 'Goblinhotrod_Engine_Accel_OS',
  file_1 = 'goblinhotrod_engine_accel_os_01.ogg',
  frequency_1 = 1,
  base_dir = 'sound\\creature\\goblinhotrod',
  volume = 0.2,
  flags = 1024,
  min_distance = 8,
  distance_cutoff = 45,
  eax_def = 0,
  advanced_id = 0;
