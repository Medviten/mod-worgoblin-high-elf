/* Update achievement criteria involving interactions with all races to include Horde Pandaren */
REPLACE INTO `achievement_criteria_data` (
    `criteria_id`, -- ID from Achievement_Criteria.dbc
    `type`, -- Determines how value1 and value2 are used (0–23)
    `value1`, -- Depends on type
    `value2`, -- Depends on type
    `ScriptName`
) VALUES
(@HordePandarenCriteria2, 2, 0, @HordePandaren, ''),
(@HordePandarenCriteria2, 9, 18, 0, ''),
(@HordePandarenCriteria2, 10, 1, 0, ''),
(@HordePandarenCriteria3, 2, 0, @HordePandaren, ''),
(@HordePandarenCriteria4, 2, 0, @HordePandaren, '');
