-- [F-011] Kezan quest-availability conditions (CONDITION_SOURCE_TYPE_QUEST_AVAILABLE = 19)
-- Ported verbatim from Project Neltharion 4.3.4 world DB. In Cata most goblin-start quests have
-- PrevQuestID=0 and are staged by these type-19 conditions instead: prior-quest-rewarded (type 8),
-- gender (type 20), item held (type 2). All AC-native condition types; no core change required.
-- 25 conditions gating 11 quests.
-- NOTE: 1 negative item-held row on quest 28607 (item 46856 'Keys to the Hot Rod', not shipped) omitted;
--       redundant here (a non-existent item is never held) and the 14125-not-rewarded gate still applies.

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN (14109, 14110, 14113, 14115, 14125, 14153, 24520, 25473, 26711, 26712, 28607);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 14109, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14110, 0, 0, 20, 0, 1, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14113, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14113, 0, 0, 8, 0, 14070, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14113, 0, 0, 8, 0, 14109, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14113, 0, 0, 8, 0, 24520, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14115, 0, 0, 8, 0, 14113, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14115, 0, 0, 8, 0, 24520, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14115, 0, 1, 8, 0, 14153, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14115, 0, 1, 8, 0, 24520, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14125, 0, 0, 8, 0, 14121, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14125, 0, 0, 8, 0, 14122, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14125, 0, 0, 8, 0, 14123, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14125, 0, 0, 8, 0, 14124, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14153, 0, 0, 20, 0, 1, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14153, 0, 0, 8, 0, 14070, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14153, 0, 0, 8, 0, 14110, 0, 0, 0, 0, 0, '', ''),
(19, 0, 14153, 0, 0, 8, 0, 24520, 0, 0, 0, 0, 0, '', ''),
(19, 0, 24520, 0, 0, 8, 0, 28414, 0, 0, 0, 0, 0, '', NULL),
(19, 0, 25473, 0, 0, 8, 0, 14069, 0, 0, 0, 0, 0, '', ''),
(19, 0, 25473, 0, 0, 8, 0, 14075, 0, 0, 0, 0, 0, '', ''),
(19, 0, 26711, 0, 0, 20, 0, 1, 0, 0, 0, 0, 0, '', ''),
(19, 0, 26712, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, '', ''),
(19, 0, 28607, 0, 0, 8, 0, 14071, 0, 0, 0, 0, 0, '', ''),
(19, 0, 28607, 0, 0, 8, 0, 14125, 0, 0, 1, 0, 0, '', '');
