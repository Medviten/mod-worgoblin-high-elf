/* Update achievement criteria involving interactions with all races to include Worgen and Goblins */
REPLACE INTO `achievement_criteria_data` (
    `criteria_id`, -- ID from Achievement_Criteria.dbc
    `type`, -- Determines how value1 and value2 are used (0–23)
    `value1`, -- Depends on type
    `value2`, -- Depends on type
    `ScriptName`
) VALUES
(@GoblinCriteria2,  2,  0, @Goblin, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(@GoblinCriteria2,  9, 18,       0, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(@GoblinCriteria2, 10,  1,       0, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(@GoblinCriteria3,  2,  0, @Goblin, ''), -- Achievement  291 (Check Your Head)
(@GoblinCriteria4,  2,  0, @Goblin, ''); -- Achievement 1429* (Realm First! Level 80 Goblin)
