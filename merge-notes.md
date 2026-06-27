# Notes: Merging Worgoblin and AzerothCore High Elf

## azerothcore-highelf [repo](https://github.com/abracadaniel22/azerothcore-highelf)
### files in mod directory

### base mod
#### playerbots.patch
This one seems to be very outdated, so I mostly used it as a checklist and just added High Elf entries along the Worgoblin ones instead.

#### highelf.patch
This one is also outdated, so I mostly used it as a checklist and added High Elf entries to the Worgoblin ones.

### base mod/client/Data
I will adopt the Worgoblin practice of using a folder named patch-A.MPQ instead of actual MPQ files. This makes DBCs much easier to work with.

#### patch-7.mpq
None of the skin files contain filenames conflicting with any Worgoblin files, so I can simply add them to the working Worgoblin patch-A.MPQ.

However, the Interface files require merging. I have to:

1. Edit the two files in GLUES/CHARACTERCREATE, adding High Elf portraits to the working Worgoblin files.
2. Modify the Race selection buttons in CharacterCreate.xml.
3. Modify the coordinates for where the portraits are found in the GLUES/CHARACTERCREATE files.

---

#### patch-a.mpq and patch-t.mpq
Comparing the CSV exports of all the DBCs, I found that patch-t.mpq only contained five DBCs, all of which were already present in patch-a.mpq, four of which are exactly the same. The only one that differs is CharSections.dbc, and this is apparently due to issues with an HD patch.

There seem to be three differences:
1. The field containing *_Extra.blp has been populated in the patch-t.mpq version.
2. The patch-t.mpq version contains mappings for Goblins.
3. The patch-t.mpq version has higher IDs for High Elf mappings.

Since I am merging High Elves into an already working Worgoblin setup, the two first differences are of no consequence for me, but the third might be. The high IDs are [Blood Elf equivalent]+22000, as stated in the patch file. Might be important to know. Also: no overlap with any Worgoblin ID, which is good.

I will take the patch-t.mpq version, extract the mappings for race 12 (High Elf here, Worgen in Worgoblin) and change them to 13 (High Elf in my merger), then merely append them to my working DBC.

Once this is done, I don't need to think about patch-t.mpq and can concentrate on merging patch-a.mpq.

---

#### server
These DBCs are the same as the ones in patch-a.mpq, probably separated for user convenience. I don't need to include them.

---

#### Merging DBCs with Worgoblin ones

##### BarberShopStyle.dbc
- IDs conflict, but probably don't matter. 
- Race 12 –> 13
- Increment IDs starting from 1300 (for space and association with race 13)
- 56 High Elf entries

##### CharacterFacialHairStyles.dbc
- ID conflict, but probably don't matter.
- Contains race 13 (Naga): existing race 13 -> 22 (in every file)
- Race 12 -> 13
- Increment IDs from 530 (for space and association with race 13)
- 21 High Elf entries

##### CharBaseInfo.dbc
- IDs conflict, but don't matter.
- Incrementing naïvely.
- 8 High Elf entries
- 2 High Elf ARAC entries (10 total)

##### CharHairGeosets.dbc
- IDs conflict, but probably don't matter.
- Incrementing from 570 (for space)
- Existing race 13 -> 22
- Race 12 -> 13
- 36 High Elf entries

##### CharHairTextures.dbc
- IDs conflict, but probably don't matter.
- All entries have more or less the same values except race and gender, though races 1–5 have many entries.
- Some races are missing already.
- Get error trying to add entries.
- Leaving this one alone for now.

##### CharSections.dbc (patch-t.mpq version)
- No ID conflict: [Blood Elf equivalent] + 22000 = [High Elf ID]
- Existing race 13 -> 22
- Race 12 -> 13
- 1067 High Elf entries

##### CharStartOutfit.dbc
- No ID conflict, but ID doesn't matter here anyway.
- Existing race 13 -> 22
- Race 12 -> 13
- 16 High Elf entries
- 4 High Elf ARAC entries (20 total)

##### ChrRaces.dbc
- Existing race 13 -> 22
- Race 12 -> 13
- 1 High Elf entries

##### CreatureDisplayInfo.dbc
- No ID conflicts.
- 1526 High Elf entries

##### CreatureDisplayInfoExtra.dbc
- No ID conflicts.
- 1679 High Elf entries

##### EmotesTextSound.dbc
- ID conflicts, but ID probably doesn't matter here.
- I used the [larger DBC](https://github.com/Helias/mod-worgoblin/blob/master/patch-contents/DBFilesClient/EmotesTextSound.dbc) from Helias's repository. Not sure if that matters.
- Increment from 2500

##### Faction.dbc
- No ID conflicts
- 1040 is "REUSE" in Worgoblin, and has been renamed "PLAYER, High Elf" in the AzerothCore High Elf mod. I left it as "REUSE".
- 1 High Elf entry

##### HelmetGeosetVisData.dbc
- In this file, racemasks don't work like normal (1 = Human, 2 = Orc, etc.). Instead, Human is 2, Orc is 4, etc., so they're all moved one to the right. That means that whenever the AHE mod adds 4096 to an entry, I need to take the Worgoblin DBC's entry and add 8192 to it.
- Similarly, where AHE removes 4096 from a negative number, I have to remove 8192 from that number in the Worgoblin DBC.

##### NameGen.dbc
- ID conflicts, but ID probably doesn't matter.
- Increment from 18600
- 394 High Elf entries

##### SkillLineAbility.dbc
- No new IDs, but many changed entries
- Add High Elf to "all races" (4095 -> 8191)
- Add High Elf to Alliance (3149 -> 7245)
- Add High Elf to any other appropriate field (value + 4096)

##### SkillRaceClassInfo.dbc
- No new IDs, but many changed entries
- Add High Elf to "all races" (4095 -> 8191)
- Add High Elf to Alliance (3149 -> 7245)
- Add High Elf to any other appropriate field (value + 4096)

##### TalentTab.dbc
- No new IDs, but many changed entries
- Add High Elf to "all races" (4095 -> 8191)

##### VocalUISounds.dbc
- ID conflicts, but ID probably doesn't matter.
- Existing race 13 -> 22
- Race 12 -> 13
- Increment from 2300
- 54 High Elf entries

---

### extras
With the exception of adding Arcane Torrent to High Elf Warriors, this seems to be all Individual Progression stuff. I don't use that mod myself, and Arcane Torrent is added to Blood Elf Warriors in the updated ARAC I'm merging into this anyway (tested and it works), so I'm skipping this folder for now.

---

## mod-worgoblin [repo](https://github.com/idempotentiation/mod-worgoblin)
### data/patch-A.MPQ/DBFilesClient
All AzerothCore High Elf DBCs are also in Worgoblin, but below are the ones that are only in Worgoblin. They should probably have been in AzerothCore High Elf too, but weren't. I will try to include High Elves here as much as possible.

---

#### Adding High Elves to DBCs

##### Achievement.dbc
- Added achievement 1431: Realm first! Level 80 High Elf (based on Worgen equivalent).

##### Achievement_Criteria.dbc
- Added four lines. More may be needed, but I'm not sure.
- It looks like 13471 and 13472 have the opposite achievement IDs, so I changed them around.

##### AnimationData.dbc
- Probably irrelevant because High Elves are based on Blood Elves.

##### CreatureModelData.dbc
- Probably irrelevant because High Elves are based on Blood Elves.

##### CreatureSoundData.dbc
- Probably irrelevant because High Elves are based on Blood Elves.

##### Item.dbc
- Probably irrelevant for High Elves.

##### ItemDisplayInfo.dbc
- Probably irrelevant for High Elves.

##### SkillLine.dbc
- Probably irrelevant for High Elves.

##### SoundEntries.dbc
- Probably irrelevant because High Elves are based on Blood Elves.

##### Spell.dbc
- Probably irrelevant because High Elves are based on Blood Elves.

##### SpellIcon.dbc
- Probably irrelevant for High Elves.

##### SummonProperties.dbc
- Probably irrelevant for High Elves.

---

### data/sql

#### db-world

#### dbc
It is tempting to just export the entire DBC and import it into the DB that way, since I just edited them, but I'll try the Worgoblin way first.

##### achievement_criteria_dbc.sql
- Add new entries from the DBC.

##### chrraces_dbc.sql
- Add new entries from the DBC.

##### creaturedisplayinfo_dbc.sql
- Add new entries from the DBC.

##### creaturedisplayinfoextra_dbc.sql
- Add new entries from the DBC.

##### creaturemodeldata_dbc.sql
- Irrelevant to AHE.

##### itemdisplayinfo_dbc.sql
- Irrelevant to AHE.

##### skillline_dbc.sql
- Irrelevant to AHE.

##### skilllineability_dbc.sql
- Edit race masks from the DBC.

##### skillraceclassinfo_dbc.sql
- Edit race masks from the DBC.

##### soundentries_dbc.sql
- Irrelevant to AHE.

##### spell_dbc.sql
- Irrelevant to AHE.

##### summonproperties_dbc.sql
- Irrelevant to AHE.
