-- ============================================================
-- I-303  Kaja'mite Cavern (MD_PygmyCave1) WMO minimap TRS entries
-- ============================================================
-- Companion to [I-303]_wmoareatable.sql: the WMOAreaTable rows tell the
-- client to render WMO minimap textures; these md5translate rows tell it
-- where those textures live. The 4 BLPs ship from zep-goblin-start
-- mpq/source-assets/Textures/Minimap/lostisles/. The complete .trs is
-- generated from this table by the 'trs-generate' preprocessor (F-201).

DELETE FROM `md5translate` WHERE `src` IN (
  'WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_00_00.blp',
  'WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_00_01.blp',
  'WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_01_00.blp',
  'WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_01_01.blp'
);
INSERT INTO `md5translate` (`src`, `dst`, `dir`) VALUES
('WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_00_00.blp', 'lostisles\\md_pygmycave1_000_00_00.blp', 'WMO\\Dungeon\\MD_PygmyCave1'),
('WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_00_01.blp', 'lostisles\\md_pygmycave1_000_00_01.blp', 'WMO\\Dungeon\\MD_PygmyCave1'),
('WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_01_00.blp', 'lostisles\\md_pygmycave1_000_01_00.blp', 'WMO\\Dungeon\\MD_PygmyCave1'),
('WMO\\Dungeon\\MD_PygmyCave1\\MD_PygmyCave1_000_01_01.blp', 'lostisles\\md_pygmycave1_000_01_01.blp', 'WMO\\Dungeon\\MD_PygmyCave1');
