/* Update achievement criteria involving interactions with all races to include worgen and goblins */
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (13473, 13474, 13475, 13476, 13477, 13478);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(13473, 2, 0, 9, ''), -- Achievement 2422 (Shake Your Bunny-Maker)
(13473, 9, 18, 0, ''),
(13473, 10, 1, 0, ''),
(13474, 2, 0, 12, ''),
(13474, 9, 18, 0, ''),
(13474, 10, 1, 0, ''),
(13475, 2, 0, 9, ''), -- Achievement 291 (Check Your Head)
(13476, 2, 0, 12, ''),
(13477, 21, 0, 9, ''), -- Achievement 1429 (Realm First! Level 80 Goblin)
(13478, 21, 0, 12, ''); -- Achievement 1430 (Realm First! Level 80 Worgen)