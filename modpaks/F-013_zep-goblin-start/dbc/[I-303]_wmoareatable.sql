-- ============================================================
-- I-303  Lost Isles cave minimaps blank (Kaja'mite Cavern + Gallywix Labor Mine)
-- ============================================================
-- TWO cave WMOs are covered here:
--   WMOID 5752 MD_PygmyCave1.wmo  = Kaja'mite Cavern (Vicious Vale, area 4778)
--     — the cave the user actually reported (GPS area 4780 Vicious Vale;
--     placement 48yd from report coords, LostIsles_26_30/31_obj0.adt, nameSet 1).
--     Groups: 000 = 27338 (INTERIOR, has Cata minimap tiles), 001 = 27339 (ext).
--   WMOID 5702 LostIsles_GoblinMine.wmo = Gallywix Labor Mine (area 4924)
--     — the WMO the first attempt targeted; rows kept, valid for its location.
-- Same mechanism as [CLOSED] I-012 (Stormwind): inside a WMO group the client
-- stops drawing terrain minimap tiles and resolves WMO minimap textures via
-- textures/minimap/md5translate.trs. The GoblinMine group-002 tiles ARE shipped
-- (patch-open-azeroth: trs entries + 6 BLPs under textures/minimap/lostisles/),
-- so unlike Stormwind we do NOT force terrain rendering (flags 32) — we port the
-- real Cata WMOAreaTable rows (flags 0) so the client renders the WMO tiles.
--
-- Why the first attempt (single row, name_set_id 0, flags 32) failed:
-- the MODF placement in LostIsles_28_28_obj0.adt uses nameSet = 1 (verified in
-- both Whitemane's original ADT and our shipped copy), so a nameset-0 row never
-- matches. Cata ships BOTH namesets; ported 1:1 below (Whitemane WMOAreaTable
-- ids 48382-48383/49012-49013 and 50522-50525, renumbered into our 924xx block).
--
-- WMOID 5702 is read from the MOHD chunk of
--   World/wmo/Kalimdor/LostIsles/Goblin/LostIsles_GoblinMine.wmo
-- Group uniqueIDs read from each group file's MOGP header:
--   group 000 = 27269 (exterior), 001 = 27268 (exterior),
--   group 002 = 26703 (INTERIOR — the cave, and the only group with Cata
--   minimap tiles: LostIsles_GoblinMine_002_XX_YY.blp).
-- Sound refs on the nameset-1 root row (ambience 380, music 917, intro 831)
-- all exist in our DBC — kept Cata-faithful.

DELETE FROM `wmoareatable` WHERE `id` BETWEEN 92400 AND 92413;

-- ============================================================
-- WMOID 5752  MD_PygmyCave1.wmo — Kaja'mite Cavern (Vicious Vale)
-- Cata rows 49100-49102 / 49109-49111 ported 1:1, except zone_music
-- 538/537 which do not exist in our DBC (zeroed). sound_provider_pref 75,
-- ambience 380/498 and area 4778 'Kaja'mite Cavern' all verified present.
-- Minimap tiles: 4 BLPs (group 000) staged in patch-open-azeroth
-- textures/minimap/lostisles/md_pygmycave1_000_XX_YY.blp + TRS entries.
-- ============================================================

-- nameset 0 (unused by the live placement, ported for completeness)
INSERT INTO `wmoareatable` SET
  `id` = 92408,
  `wmo_id` = 5752,
  `name_set_id` = 0,
  `wmo_group_id` = -1,
  `sound_provider_pref` = 75,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 380,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92409,
  `wmo_id` = 5752,
  `name_set_id` = 0,
  `wmo_group_id` = 27338,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92410,
  `wmo_id` = 5752,
  `name_set_id` = 0,
  `wmo_group_id` = 27339,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 498,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

-- nameset 1 — the set the MODF placement actually uses (nameSet=1)
-- zone_music: Cata used 538 (Zone-LostIslesDark), but its li_*_uniwalk.mp3
-- files exist in NO 4.3.4 archive (cut content — soundentries 16451 remains,
-- files gone). Substituted 919 (MUS_KajamiteCavern, area 4778's own music,
-- stock naxx files; row repaired in [I-306]_soundentries.sql).
INSERT INTO `wmoareatable` SET
  `id` = 92411,
  `wmo_id` = 5752,
  `name_set_id` = 1,
  `wmo_group_id` = -1,
  `sound_provider_pref` = 75,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 380,
  `zone_music` = 919,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 4778,
  `name_enus` = 'Kaja''mite Cavern',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92412,
  `wmo_id` = 5752,
  `name_set_id` = 1,
  `wmo_group_id` = 27338,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 4778,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92413,
  `wmo_id` = 5752,
  `name_set_id` = 1,
  `wmo_group_id` = 27339,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 498,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 4778,
  `name_enus` = '',
  `name_flags` = 16712190;

-- ============================================================
-- WMOID 5702  LostIsles_GoblinMine.wmo — Gallywix Labor Mine
-- ============================================================

-- nameset 0 (unused by the live placement, ported for completeness)
INSERT INTO `wmoareatable` SET
  `id` = 92400,
  `wmo_id` = 5702,
  `name_set_id` = 0,
  `wmo_group_id` = -1,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92401,
  `wmo_id` = 5702,
  `name_set_id` = 0,
  `wmo_group_id` = 26703,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92402,
  `wmo_id` = 5702,
  `name_set_id` = 0,
  `wmo_group_id` = 27268,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92403,
  `wmo_id` = 5702,
  `name_set_id` = 0,
  `wmo_group_id` = 27269,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 0,
  `name_enus` = '',
  `name_flags` = 16712190;

-- nameset 1 — the set the MODF placement actually uses (nameSet=1)
INSERT INTO `wmoareatable` SET
  `id` = 92404,
  `wmo_id` = 5702,
  `name_set_id` = 1,
  `wmo_group_id` = -1,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 380,
  `zone_music` = 917,
  `intro_sound` = 831,
  `flags` = 0,
  `area_table_id` = 4924,
  `name_enus` = 'Gallywix Labor Mine',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92405,
  `wmo_id` = 5702,
  `name_set_id` = 1,
  `wmo_group_id` = 26703,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 4924,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92406,
  `wmo_id` = 5702,
  `name_set_id` = 1,
  `wmo_group_id` = 27268,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 4924,
  `name_enus` = '',
  `name_flags` = 16712190;

INSERT INTO `wmoareatable` SET
  `id` = 92407,
  `wmo_id` = 5702,
  `name_set_id` = 1,
  `wmo_group_id` = 27269,
  `sound_provider_pref` = 0,
  `sound_provider_pref_underwater` = 0,
  `ambience_id` = 0,
  `zone_music` = 0,
  `intro_sound` = 0,
  `flags` = 0,
  `area_table_id` = 4924,
  `name_enus` = '',
  `name_flags` = 16712190;
