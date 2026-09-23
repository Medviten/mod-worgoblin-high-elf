/* Update achievement criteria involving interactions with all races to include Kul Tiran */
REPLACE INTO `achievement_criteria_data` (
    `criteria_id`, -- ID from Achievement_Criteria.dbc
    `type`, -- Determines how value1 and value2 are used (0–23)
    `value1`, -- Depends on type
    `value2`, -- Depends on type
    `ScriptName`
) VALUES
(@KulTiranCriteria2,  2,  0, @KulTiran, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(@KulTiranCriteria2,  9, 18,       0, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(@KulTiranCriteria2, 10,  1,       0, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(@KulTiranCriteria3,  2,  0, @KulTiran, ''), -- Achievement  291 (Check Your Head)
(@KulTiranCriteria4,  2,  0, @KulTiran, ''); -- Achievement 1430* (Realm First! Level 80 Kul Tiran)
