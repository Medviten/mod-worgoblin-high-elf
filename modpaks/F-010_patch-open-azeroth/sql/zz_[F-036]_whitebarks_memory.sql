-- Adjust spawn location for summoning of Whitebark's Spirit (19456) for quest Whitebark's Memory (10166)
    UPDATE `event_scripts` SET `x` = (8216.55 - 4 * 533.33333), `y` = (-6335.38 + 4 * 533.33333) WHERE (`id` = 12530);
