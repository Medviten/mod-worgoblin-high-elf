-- All skill-line abilities available to normal Draenei are also valid for Broken.
UPDATE `skilllineability` SET `required_races` = `required_races` | @BrokenMask
WHERE (`required_races` & @DraeneiMask) <> 0;
