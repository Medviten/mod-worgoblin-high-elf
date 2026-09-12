-- ============================================================
-- I-280  Movie.dbc rows (F-011 goblin cinematic)
--
-- Split out of I-276 once the transition and arrival scene were finished and the
-- cinematic was parked. The trigger chain is PROVEN -- pointing
-- SMART_ACTION_PLAYMOVIE at movie 14 plays Wrathgate correctly -- but no file we
-- can produce for movie 22 plays. See I-280.
--
-- Quest 14126's retail reward spell 91847 plays movie 22 via Cata effect 45
-- SPELL_EFFECT_PLAY_MOVIE. We cannot port 91847: effect 45 in AC 3.3.5a is
-- SPELL_EFFECT_ADD_HONOR, so a verbatim port would hand the player honor
-- instead. The movie is fired from SmartAI instead (SMART_ACTION_PLAYMOVIE, 68).
--
-- The client appends the resolution suffix itself, so the paths below carry
-- none. WHICH suffix matters and differs by expansion:
--   3.3.5a stock ships WOW_Wrathgate_**1024**.avi   (1024x576, codec DXGM)
--   4.3.4  stock ships WOW_Wrathgate_**1280**.avi   (1280x720, codec DX50)
-- so a Cata-sourced _1280 / _800 file is not necessarily even looked for by our
-- client. See the zep-cinematics zpak notes.
-- ============================================================


-- ---- 14 / 16: repair EMPTY stock paths ----------------------------------
-- Both rows exist in our DBC with a BLANK movie_path, so neither the Wrathgate
-- nor the Fall-of-the-Lich-King cinematic can ever resolve a filename. That is
-- pre-existing data loss, not something F-011 introduced -- but it matters here
-- because movie 14 is the only cinematic we can be sure the client has a working
-- file for (WOW_Wrathgate_1024.avi ships with 3.3.5a), which makes it the
-- control for testing whether the PLAYMOVIE trigger works at all:
--
--   .debug play movie 14   -> plays  = trigger chain + client are fine
--   .debug play movie 22   -> silent = the goblin FILE is the problem
--
-- Paths verified against the 4.3.4 client Movie.dbc, which carries the same ids.
DELETE FROM `movie` WHERE `id` IN (14, 16);
INSERT INTO `movie` SET
  `id` = 14,
  `movie_path` = 'Interface\\Cinematics\\WOW_Wrathgate',
  `volume` = 100;
INSERT INTO `movie` SET
  `id` = 16,
  `movie_path` = 'Interface\\Cinematics\\WOW_FoTLK',
  `volume` = 100;


-- ---- 22: the goblin cinematic -------------------------------------------
DELETE FROM `movie` WHERE `id` = 22;
INSERT INTO `movie` SET
  `id` = 22,
  `movie_path` = 'Interface\\Cinematics\\Goblin',
  `volume` = 100;
