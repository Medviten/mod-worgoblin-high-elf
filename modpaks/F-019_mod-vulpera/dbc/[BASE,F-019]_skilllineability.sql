-- All skill-line abilities available to normal trolls are also valid for Zandalari.
UPDATE `skilllineability` SET `required_races` = `required_races` | @VulperaMask
WHERE (`required_races` & @TrollMask) <> 0;
