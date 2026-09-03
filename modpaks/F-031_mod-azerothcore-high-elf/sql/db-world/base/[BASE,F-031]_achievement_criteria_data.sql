/* Update achievement criteria involving interactions with all races to include Worgen, Goblins, and High Elves */
REPLACE INTO `achievement_criteria_data` (
    `criteria_id`, -- ID from Achievement_Criteria.dbc
    `type`, -- Determines how value1 and value2 are used (0–23)
    `value1`, -- Depends on type
    `value2`, -- Depends on type
    `ScriptName`
) VALUES
(
	13484, -- criteria_id (Achievement 2422 (Shake Your Bunny-Maker))
	2, -- type: TYPE_T_PLAYER_CLASS_RACE
	0, -- value1: The target here is a valid class (paste class list). value2 must also be set
	@HighElf, -- value2: The value here is a valid race ID. See ChrRaces.dbc
	'' -- ScriptName
), (
	13484, -- criteria_id (Achievement 2422 (Shake Your Bunny-Maker))
	9, -- type: TYPE_T_LEVEL
	18, -- value1: The minimum level that the target can be.
	0, -- value2: N/A
	'' -- ScriptName
), (
	13484, -- criteria_id (Achievement 2422 (Shake Your Bunny-Maker))
	10, -- type: TYPE_T_GENDER
	1, -- value1: Gender: 0=Male, 1=Female
	0, -- value2: N/A
	'' -- ScriptName
), (
	13485, -- criteria_id (Achievement 291 (Check Your Head))
	2, -- type: TYPE_T_PLAYER_CLASS_RACE
	0, -- value1: The target here is a valid class (paste class list). value2 must also be set
	@HighElf, -- value2: The value here is a valid race ID. See ChrRaces.dbc
	'' -- ScriptName
), (
	19216, -- criteria_id (Achievement 1431 (Realm First! Level 80 High Elf))
	2, -- type: TYPE_T_PLAYER_CLASS_RACE
	0, -- value1
	@HighElf, -- value2: The value here is a valid race ID. See ChrRaces.dbc
	'' -- ScriptName
);
