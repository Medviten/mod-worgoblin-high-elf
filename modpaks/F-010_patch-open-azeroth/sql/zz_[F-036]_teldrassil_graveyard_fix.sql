-- Open Azeroth added Shadowglen as an area and shuffled area IDs
-- This updates graveyards to match

-- First, drop the existing primary key
ALTER TABLE graveyard_zone DROP PRIMARY KEY;

-- Then add the new composite primary key
ALTER TABLE graveyard_zone ADD PRIMARY KEY (ID, GhostZone);

-- Graveyard 90

    DELETE FROM `graveyard_zone` WHERE `ID` = '90';

    INSERT INTO `graveyard_zone` SET
        `ID` = '90',
        `GhostZone` = '1657',
        `Faction` = '469',
        `Comment` = 'Teldrassil, Darnassus GY';
    
    INSERT INTO `graveyard_zone` SET
        `ID` = '90',
        `GhostZone` = '141',
        `Faction` = '469',
        `Comment` = 'Teldrassil, Darnassus GY';

-- Graveyard 91

    DELETE FROM `graveyard_zone` WHERE `ID` = '91';

    INSERT INTO `graveyard_zone` SET
        `ID` = '91',
        `GhostZone` = '186',
        `Faction` = '0',
        `Comment` = 'Teldrassil, Dolanaar GY';

    INSERT INTO `graveyard_zone` SET
        `ID` = '91',
        `GhostZone` = '1657',
        `Faction` = '67',
        `Comment` = 'Teldrassil, Dolanaar GY';

-- Graveyard 97

    DELETE FROM `graveyard_zone` WHERE `ID` = '93';

    INSERT INTO `graveyard_zone` SET
        `ID` = '93',
        `GhostZone` = '256',
        `Faction` = '469',
        `Comment` = 'Teldrassil, Aldrassil GY - Teldrassil';


    INSERT INTO `graveyard_zone` SET
        `ID` = '93',
        `GhostZone` = '188',
        `Faction` = '469',
        `Comment` = 'Teldrassil, Shadowglen';

-- Graveyard 129

    DELETE FROM `graveyard_zone` WHERE `ID` = '129';

    INSERT INTO `graveyard_zone` SET
        `ID` = '129',
        `GhostZone` = '702',
        `Faction` = '0',
        `Comment` = 'Teldrassil, Ruttheran Village GY - Teldrassil';
