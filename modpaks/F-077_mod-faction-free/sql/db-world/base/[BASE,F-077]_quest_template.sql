/*This will update the quest_template table to allow all races to have access to all quests.*/
UPDATE `quest_template` SET `AllowableRaces` = @PlayableRaceMask WHERE `AllowableRaces` = @AllianceMask OR `AllowableRaces` = @HordeMask;
