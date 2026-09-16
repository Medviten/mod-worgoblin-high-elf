/* Update achievement criteria involving interactions with all races to include Alliance Pandaren */
REPLACE INTO `achievement_criteria_data` (
    `criteria_id`, -- ID from Achievement_Criteria.dbc
    `type`, -- Determines how value1 and value2 are used (0–23)
    `value1`, -- Depends on type
    `value2`, -- Depends on type
    `ScriptName`
) VALUES
(@AlliancePandarenCriteria2, 2, 0, @AlliancePandaren, ''),
(@AlliancePandarenCriteria2, 9, 18, 0, ''),
(@AlliancePandarenCriteria2, 10, 1, 0, ''),
(@AlliancePandarenCriteria3, 2, 0, @AlliancePandaren, ''),
(@AlliancePandarenCriteria4, 2, 0, @AlliancePandaren, '');
