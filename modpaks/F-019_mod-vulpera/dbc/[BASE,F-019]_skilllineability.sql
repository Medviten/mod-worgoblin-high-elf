/*
-- All skill-line abilities available to trolls are also valid for Vulpera.
UPDATE `skilllineability` SET `required_races` = `required_races` | @VulperaMask
WHERE (`required_races` & @TrollMask) <> 0;
*/