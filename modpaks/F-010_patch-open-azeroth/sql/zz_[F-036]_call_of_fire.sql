-- fix the event creature spawn for Wickerman Effigy object (181672)
UPDATE `event_scripts` SET `x` = 4567, `y` = 7176, `z` = 20.4, `o` = 2.4 WHERE `id` = 10626;