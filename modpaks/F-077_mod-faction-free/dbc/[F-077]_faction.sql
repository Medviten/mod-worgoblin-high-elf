-- faction: 0 inserts, 38 updates, 0 deletes

-- Changed values
-- swap PEACE_FORCED for AT_WAR on the capital-city reputation slot
UPDATE `faction` SET `reputation_flags_2` = 259 WHERE `id` IN (@HumanFaction, @OrcFaction, @DwarfFaction, @NightElfFaction, @UndeadFaction, @TaurenFaction, @GnomeFaction, @TrollFaction, @BloodElfFaction, @DraeneiFaction, @GoblinFaction, @WorgenFaction, @HighElfFaction, @MagharOrcFaction, @OgreFaction)
-- 273 - 16 (PEACE_FORCED) + 2 (AT_WAR) = 259
