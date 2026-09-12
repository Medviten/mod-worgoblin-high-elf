SET @map_id = 530;
SET @positionx_min = 4800;
SET @positionx_max = 13866.666;
SET @positiony_min = -9566.661;
SET @positiony_max = -4266.666;
SET @WorldMapAreaId_list = JSON_ARRAY(462, 463, 480, 499);
SET @Points_of_Interest_list = JSON_ARRAY('Silvermoon City, Weapon Master', 'Silvermoon City, Warlock Trainers', 'Silvermoon City, Tailoring',
        'Silvermoon City, Stable Master', 'Silvermoon City, Skinning', 'Silvermoon City, Rogue Trainer',
        'Silvermoon City, Priest Trainer', 'Silvermoon City, Paladin Trainer', 'Silvermoon City, Mining',
        'Silvermoon City, Mana Loom', 'Silvermoon City, Mailbox', 'Silvermoon City, Mage Trainer',
        'Silvermoon City, Leatherworking', 'Silvermoon City, Jewelcrafting', 'Silvermoon City, Inn',
        'Silvermoon City, Hunter Trainer', 'Silvermoon City, Herbalism', 'Silvermoon City, Guild House',
        'Silvermoon City, Flight Master', 'Silvermoon City, Fishing', 'Silvermoon City, First Aid',
        'Silvermoon City, Engineering', 'Silvermoon City, Enchanting', 'Silvermoon City, Druid Trainer',
        'Silvermoon City, Cooking', 'Silvermoon City, Blacksmithing', 'Silvermoon City, Battlemasters',
        'Silvermoon City, Bank', 'Silvermoon City, Auction House', 'Silvermoon City, Alchemy',
        'Silvermoon City Inscription', 'Saltheril''s Haven, Tailor', 'Saltheril''s Haven, Herbalist',
        'Saltheril''s Haven, Enchanter', 'Saltheril''s Haven, Alchemist', 'Farstrider Retreat, Blacksmith',
        'Falconwing Square, Warlock Trainer', 'Falconwing Square, Stable Master', 'Falconwing Square, Rogue Trainer',
        'Falconwing Square, Priest Trainer', 'Falconwing Square, Paladin Trainer', 'Falconwing Square, Mage Trainer',
        'Falconwing Square, Jewelcrafter', 'Falconwing Square, Innkeeper', 'Falconwing Square, Hunter Trainer',
        'Falconwing Square, First Aid Trainer', 'Falconwing Square, Cook', 'Eversong Woods, Skinner',
        'Eversong Woods, Leatherworker');

SET @adtdimensions = 533.33333;
SET @adt_xshift = -4;
SET @adt_yshift = 4;
SET @map_id_new = 0;

UPDATE points_of_interest
SET
    positionx = positionx + (@adt_xshift * @adtdimensions),
    positiony = positiony + (@adt_yshift * @adtdimensions)
WHERE
    JSON_CONTAINS(@Points_of_Interest_list, JSON_QUOTE(NAME))
    AND positionx BETWEEN @positionx_min AND @positionx_max
    AND positiony BETWEEN @positiony_min AND @positiony_max;

UPDATE playercreateinfo
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE waypoints w
SET
    w.position_x = w.position_x + (@adt_xshift * @adtdimensions),
    w.position_y = w.position_y + (@adt_yshift * @adtdimensions)
WHERE
    w.position_x BETWEEN @positionx_min AND @positionx_max AND
    w.position_y BETWEEN @positiony_min AND @positiony_max AND
    EXISTS (
        SELECT 1
        FROM creature_addon
        INNER JOIN creature_template ct ON w.entry = ct.entry
        INNER JOIN creature cr ON ct.entry = cr.id1
        WHERE
          cr.map = @map_id
    );

UPDATE waypoint_data wd
SET
    wd.position_x = wd.position_x + (@adt_xshift * @adtdimensions),
    wd.position_y = wd.position_y + (@adt_yshift * @adtdimensions)
WHERE
    wd.position_x BETWEEN @positionx_min AND @positionx_max AND
    wd.position_y BETWEEN @positiony_min AND @positiony_max AND
    EXISTS (
        SELECT 1
        FROM creature_addon
        INNER JOIN creature ON creature_addon.guid = creature.guid
        INNER JOIN creature_template ON creature.id1 = creature_template.entry
        WHERE
            creature.map = @map_id
            AND creature_addon.path_id = wd.id
    );

UPDATE spell_target_position
SET
    mapid = @map_id_new,
    positionx = positionx + (@adt_xshift * @adtdimensions),
    positiony = positiony + (@adt_yshift * @adtdimensions)
WHERE
    mapid = @map_id AND
    positionx BETWEEN @positionx_min AND @positionx_max AND
    positiony BETWEEN @positiony_min AND @positiony_max;

UPDATE game_tele
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE game_graveyard
SET
    map = @map_id_new,
    x = x + (@adt_xshift * @adtdimensions),
    y = y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    x BETWEEN @positionx_min AND @positionx_max AND
    y BETWEEN @positiony_min AND @positiony_max;

UPDATE creature
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE quest_poi_points
SET
    X = X + (@adt_xshift * @adtdimensions),
    Y = Y + (@adt_yshift * @adtdimensions)
WHERE
    X BETWEEN @positionx_min AND @positionx_max AND
    Y BETWEEN @positiony_min AND @positiony_max AND
    QuestID IN (
        SELECT QuestID
        FROM quest_poi
        WHERE JSON_CONTAINS(@WorldMapAreaId_list, CAST(WorldMapAreaId AS JSON))
    );

UPDATE quest_poi
SET
    MAPID = @map_id_new
WHERE
    MAPID = @map_id AND
   	JSON_CONTAINS(@WorldMapAreaId_list, CAST(WorldMapAreaId AS JSON));

UPDATE areatrigger
SET
    map = @map_id_new,
    x = x + (@adt_xshift * @adtdimensions),
    y = y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    x BETWEEN @positionx_min AND @positionx_max AND
    y BETWEEN @positiony_min AND @positiony_max;

UPDATE areatrigger_teleport
SET
    target_map = @map_id_new,
    target_position_x = target_position_x + (@adt_xshift * @adtdimensions),
    target_position_y = target_position_y + (@adt_yshift * @adtdimensions)
WHERE
    target_map = @map_id AND
    target_position_x BETWEEN @positionx_min AND @positionx_max AND
    target_position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE gameobject
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;
