-- ============================================================
-- I-306  Lost Isles / OA zone music silent
-- ============================================================
-- Row 23115 MUS_KajamiteCavern (zonemusic 919 -> area 4778 Kaja'mite Cavern)
-- ships in [BASE,F-036]_soundentries.sql with ROOT-LESS paths ('zonemusic\...',
-- 'cataclysm\...') and an empty base_dir, so the client resolves them from the
-- archive root and finds nothing -> the cave is silent (reported on OA Discord
-- too; the row is broken in the OA release itself).
--
-- Stock row 1103 (WyvernWingFlap) proves empty base_dir + FULL path is valid
-- client behavior, so the minimal fix is prepending sound\music\ to each file.
-- Targets: naxx hub tracks are stock-client files; the two tanaris tracks ship
-- in PATCH-M (rebuilt from the fresh OA sound.rar, I-306).
-- One consolidated UPDATE - the row is owned by the generated OA BASE file.

UPDATE `soundentries` SET
  `file_1` = 'sound\\music\\zonemusic\\naxxramas\\naxxramashubbase1.mp3',
  `file_2` = 'sound\\music\\zonemusic\\naxxramas\\naxxramashubbase2.mp3',
  `file_3` = 'sound\\music\\cataclysm\\mus_tanaris_gu05.mp3',
  `file_4` = 'sound\\music\\cataclysm\\mus_tanaris_gu09.mp3'
WHERE `id` = 23115;
