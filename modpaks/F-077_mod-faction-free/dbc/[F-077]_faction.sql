-- faction: 0 inserts, 38 updates, 0 deletes

-- Changed values
-- swap PEACE_FORCED for AT_WAR on the capital-city reputation slot
-- 273 - 16 (PEACE_FORCED) + 2 (AT_WAR) = 259
UPDATE `faction` SET `reputation_base_2` = 400, `reputation_flags_2` = 273 WHERE `id` = @GoblinFaction; -- Bilgewater Cartel
UPDATE `faction` SET `reputation_base_2` = 400, `reputation_flags_2` = 273 WHERE `id` = @WorgenFaction; -- Gilneas
UPDATE `faction` SET `reputation_base_2` = 400, `reputation_flags_2` = 273 WHERE `id` = @MagharOrcFaction; -- Mag'har of the Horde
UPDATE `faction` SET `reputation_base_2` = 400, `reputation_flags_2` = 273 WHERE `id` = @OgreFaction; -- Stonemaul Clan

UPDATE `faction` SET `reputation_flags_2` = 259 WHERE `id` IN (@HumanFaction, @OrcFaction, @DwarfFaction, @NightElfFaction, @UndeadFaction, @TaurenFaction, @GnomeFaction, @TrollFaction, @BloodElfFaction, @DraeneiFaction, @GoblinFaction, @WorgenFaction, @HighElfFaction, @MagharOrcFaction, @OgreFaction);
-- flip PEACE_FORCED (0x10) off, AT_WAR (0x02) on, for the native-race slot
UPDATE `faction` SET `reputation_flags_1` = (`reputation_flags_1` & ~0x10) | 0x02 WHERE `id` IN (@HumanFaction, @OrcFaction, @DwarfFaction, @NightElfFaction, @UndeadFaction, @TaurenFaction, @GnomeFaction, @TrollFaction, @BloodElfFaction, @DraeneiFaction, @GoblinFaction, @WorgenFaction, @HighElfFaction, @MagharOrcFaction, @OgreFaction);
UPDATE `faction` SET `reputation_flags_4` = (`reputation_flags_4` & ~0x10) | 0x02 WHERE `id` IN (@HumanFaction, @OrcFaction, @DwarfFaction, @NightElfFaction, @UndeadFaction, @TaurenFaction, @GnomeFaction, @TrollFaction, @BloodElfFaction, @DraeneiFaction, @GoblinFaction, @WorgenFaction, @HighElfFaction, @MagharOrcFaction, @OgreFaction);
