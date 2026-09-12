-- Adjust spawn location for summoning of scourge by infused crystal creature (16364) for quest Powering our Defenses (8490)
    set @xoffset := - 4 * 533.33333;
    set @yoffset := 4 * 533.33333;
    
    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8270.68 + @xoffset, `target_y` = -7188.53 + @yoffset WHERE `entryorguid` = 1636401;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8284.27 + @xoffset, `target_y` = -7187.78 + @yoffset WHERE `entryorguid` = 1636402;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8297.43 + @xoffset, `target_y` = -7193.53 + @yoffset WHERE `entryorguid` = 1636403;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8303.5 + @xoffset, `target_y` = -7201.96 + @yoffset WHERE `entryorguid` = 1636404;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8273.22 + @xoffset, `target_y` = -7241.82 + @yoffset WHERE `entryorguid` = 1636405;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8254.89 + @xoffset, `target_y` = -7222.12 + @yoffset WHERE `entryorguid` = 1636406;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8278.51 + @xoffset, `target_y` = -7242.13 + @yoffset WHERE `entryorguid` = 1636407;

    -- Infused Crystal - Script - Spawn Enraged Wraith
    UPDATE `smart_scripts` SET `target_x` = 8278.51 + @xoffset, `target_y` = -7242.13 + @yoffset WHERE `entryorguid` = 1636408;