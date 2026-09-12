-- I-259: Kaja'Cola (item 84474) does nothing when drunk.
-- Spell 70478's only effect is an unhandled dummy aura; the retail behaviour
-- (player sometimes exclaims a random goblin idea, broadcast_text 37326-37365)
-- is reimplemented as core AuraScript spell_zep_item_kajacola
-- (Zeppelin-Core src/server/scripts/Custom/zeppelin_goblin_start.cpp).
-- 70478 is not owned by the AUTO spell_script_names file.

DELETE FROM spell_script_names WHERE spell_id = 70478;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(70478, 'spell_zep_item_kajacola');
