-- All skill-line abilities available to normal dwarves are also valid for Dark Iron.
UPDATE `skilllineability` SET `required_races` = `required_races` | @BrokenMask
WHERE (`required_races` & @DraeneiMask) <> 0;
