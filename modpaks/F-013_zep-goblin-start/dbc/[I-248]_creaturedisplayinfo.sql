-- I-248 — Buccaneer display 26559 -> self-contained model 90001
-- ([I-248]_creaturemodeldata.sql). Stock row: one consolidated UPDATE.
-- The HD zpaks' [BASE,F-049] file sets this row's texture_variation_1-3
-- ('Shreddermountred1-3') — different columns, no conflict; the red variation
-- BLPs ship in the new model folder (variations resolve model-folder-relative).
UPDATE creaturedisplayinfo SET model_id = 90001 WHERE id = 26559;
