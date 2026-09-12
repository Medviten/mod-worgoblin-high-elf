/*This will update all Inns to give rested xp bonus to players regaurdless to the faction of the player vs. the Inn's faction.*/
UPDATE `areatrigger_tavern` SET `faction` = 6 WHERE `faction` != 6;
