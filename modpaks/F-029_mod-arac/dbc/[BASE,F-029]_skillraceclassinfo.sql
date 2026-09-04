-- [F-029] mod-arac: skillraceclassinfo: 0 inserts, 68 updates, 0 deletes

CREATE TEMPORARY TABLE `excluded_race_masks` (
    `race_mask` BIGINT UNSIGNED PRIMARY KEY
);

INSERT INTO `excluded_race_masks` (`race_mask`) VALUES
    (4294967295),
    (2047),
    (4095),
    (16383),
    (32767),
    (65535),
    (131071),
    (262143),
    (524287),
    (1048575),
    (2097151);

-- Changed values (original in parentheses)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 117  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 44 (axes: orc/dwarf/tauren/troll hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 122  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 172 (two-handed axes: paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 123  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 160 (two-handed maces: paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 124  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 160 (two-handed maces: druids)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 125  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 55 (two-handed swords: hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 126  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 45 (bows: orc/night elf/troll/blood elf hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 127  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 45 (bows: warriors, hunters, rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 128  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 226 (crossbows: warriors, rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 129  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: rogues, warlocks)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 131  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 118 (dual wield: rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 132  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 118 (dual wield: warriors, hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 133  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 46 (guns: dwarf/tauren hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 134  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 46 (guns: warriors, rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 138  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 136 (staves: priests, shamans, mages, warlocks, druids)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 139  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 136 (staves: warriors, hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 140  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: human/orc/night elf/undead/gnome/draenei warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 142  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 176 (thrown: rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 143  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 176 (thrown: hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 144  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 228 (wands: priests, mages, warlocks)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 323  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: priests, shamans, mages)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 325  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 328  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 330  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 473 (fist weapons: warriors, hunters, rogues, shamans, druids)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 621  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 172 (two-handed axes: orc/dwarf warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 622  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 172 (two-handed axes: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 624  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 160 (two-handed maces: tauren warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 625  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 160 (two-handed maces: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 626  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 55 (two-handed swords: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 628  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 44 (axes: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 629  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 44 (axes: warrior, paladin, hunter, death knight, mage)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 630  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 44 (axes: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 631  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 632  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 633  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: night elf/undead/gnome/troll warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 634  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 635  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 46 (guns: hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 636  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 637  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 638  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 639  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 176 (thrown: troll warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 640  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 176 (thrown: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 641  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: tauren druids)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 642  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 173 (daggers: warriors)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 643  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: night elf druids)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 644  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 701  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 172 (two-handed axes: shamans)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 702  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 160 (two-handed maces: shamans)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 872  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: rogues)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 878  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 226 (crossbows: draenei hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 879  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 226 (crossbows: hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 880  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: draenei hunters)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 881  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: mages, warlocks)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 883  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 118 (dual wield: shaman)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 884  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 55 (two-handed swords: blood elf paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 885  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: human/dwarf/draenei paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 886  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 888  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 889  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: blood elf paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 898  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 55 (two-handed swords: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 901  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 55 (two-handed swords: paladins)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 907  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 172 (two-handed axes: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 908  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 160 (two-handed maces: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 910  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 43 (swords: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 912  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 44 (axes: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 913  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 118 (dual wield: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 914  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 54 (maces: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 915  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 229 (polearms: death knights)
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @PlayableRaceMask WHERE `id` = 970  AND `race_mask` NOT IN (SELECT `race_mask` FROM `excluded_race_masks`); -- skill: 172 (two-handed axes: hunters)
