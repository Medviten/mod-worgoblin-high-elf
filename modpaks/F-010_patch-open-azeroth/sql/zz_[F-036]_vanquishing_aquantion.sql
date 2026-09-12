-- Adjust spawn location for summoning of Aquantion (16292) by Altar of Tidal Mastery (181157) for quest Vanquishing Aquantion (9174)
    set @xoffset := - 4 * 533.33333;
    set @yoffset := 4 * 533.33333;
    UPDATE `event_scripts` SET `x` = (7941.15 + @xoffset), `y` = (-7636.45 + @yoffset) WHERE (`id` = 9980);
