-- [F-032] mod-maghar: skillraceclassinfo: 1 inserts, 104 updates, 0 deletes

-- New entries
DELETE FROM `skillraceclassinfo` WHERE `id` = 1141; -- Skill 792: Racial - Mag'har Orc
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`) VALUES (1141, @MagharOrcRacials, @MagharOrcMask, @AllClassMask, 1170, 0, 0, 0);

-- Changed values
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 21; -- Skill 293: Plate Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 24; -- Skill 272: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 26; -- Skill 247: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 27; -- Skill 356: Fishing
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 28; -- Skill 182: Herbalism
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 29; -- Skill 186: Mining
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 30; -- Skill 393: Skinning
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 34; -- Skill 273: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 35; -- Skill 262: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 36; -- Skill 263: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 37; -- Skill 264: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 38; -- Skill 260: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 40; -- Skill 98: Language: Common
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 48; -- Skill 109: Language: Orcish
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 49; -- Skill 109: Language: Orcish
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 54; -- Skill 130: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 59; -- Skill 96: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 62; -- Skill 268: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 64; -- Skill 269: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 65; -- Skill 198: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 66; -- Skill 246: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 73; -- Skill 254: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 76; -- Skill 241: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 79; -- Skill 238: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 81; -- Skill 239: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 83; -- Skill 252: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 84; -- Skill 139: Language: Demon Tongue
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 85; -- Skill 138: Language: Draconic
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 87; -- Skill 148: Horse Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 88; -- Skill 141: Language: Old Tongue
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 89; -- Skill 152: Ram Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 92; -- Skill 150: Tiger Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 93; -- Skill 140: Language: Titan
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 94; -- Skill 149: Wolf Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 97; -- Skill 199: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 104; -- Skill 353: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 105; -- Skill 120: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 106; -- Skill 245: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 108; -- Skill 255: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 111; -- Skill 244: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 112; -- Skill 243: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 113; -- Skill 258: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 133; -- Skill 46: Guns
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 137; -- Skill 227: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 145; -- Skill 413: Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 146; -- Skill 413: Mail
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 147; -- Skill 414: Leather
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 148; -- Skill 415: Cloth
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 149; -- Skill 242: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 151; -- Skill 416: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 155; -- Skill 416: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 158; -- Skill 416: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 159; -- Skill 416: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 175; -- Skill 418: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 178; -- Skill 418: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 183; -- Skill 418: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 186; -- Skill 418: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 189; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 191; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 193; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 198; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 200; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 203; -- Skill 420: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 204; -- Skill 420: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 205; -- Skill 420: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 241; -- Skill 171: Alchemy
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 243; -- Skill 164: Blacksmithing
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 244; -- Skill 202: Engineering
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 246; -- Skill 433: Shield
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 265; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 266; -- Skill 419: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 268; -- Skill 420: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 269; -- Skill 420: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 270; -- Skill 418: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 271; -- Skill 416: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 272; -- Skill 453: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 281; -- Skill 333: Enchanting
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 282; -- Skill 185: Cooking
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 284; -- Skill 197: Tailoring
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 328; -- Skill 43: Swords
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 330; -- Skill 473: Fist Weapons
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 403; -- Skill 515: NULL
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 441; -- Skill 148: Horse Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 442; -- Skill 152: Ram Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 443; -- Skill 149: Wolf Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 446; -- Skill 533: Raptor Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 461; -- Skill 553: Mechanostrider Piloting
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 463; -- Skill 554: Undead Horsemanship
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 481; -- Skill 150: Tiger Riding
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 622; -- Skill 172: Two-Handed Axes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 628; -- Skill 44: Axes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 630; -- Skill 44: Axes
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 632; -- Skill 173: Daggers
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 634; -- Skill 173: Daggers
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 635; -- Skill 46: Guns
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 637; -- Skill 54: Maces
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 638; -- Skill 43: Swords
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 642; -- Skill 173: Daggers
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 644; -- Skill 54: Maces
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 742; -- Skill 673: Language: Gutterspeak
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 865; -- Skill 142: Survival
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 866; -- Skill 755: Jewelcrafting
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 886; -- Skill 43: Swords
UPDATE `skillraceclassinfo` SET `race_mask` = `race_mask` | @MagharOrcMask WHERE `id` = 899; -- Skill 165: Leatherworking
