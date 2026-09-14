-- charhairgeosets: 2 inserts, 0 updates, 0 deletes

-- New entries
SET @CharHairGeosetsID = (SELECT COALESCE(MAX(id), 0) FROM `dbc`.`charhairgeosets`);

DELETE FROM `charhairgeosets` WHERE `race` = @ZandalariTroll;
INSERT INTO `charhairgeosets` (`id`, `race`, `gender`, `variation`, `geoset`, `show_scalp`) VALUES
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 0, 1, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 1, 2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 2, 3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 3, 4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 4, 5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 5, 6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 6, 7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Male, 7, 8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 0, 1, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 1, 2, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 2, 3, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 3, 4, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 4, 5, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 5, 6, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 6, 7, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 7, 8, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 8, 9, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 9, 10, 0),
(@CharHairGeosetsID := @CharHairGeosetsID + 1, @ZandalariTroll, @Female, 10, 11, 0);
