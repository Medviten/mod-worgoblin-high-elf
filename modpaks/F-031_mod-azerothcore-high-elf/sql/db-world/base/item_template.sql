/* Ensures that faction-restricted items include high elves */
UPDATE `item_template` SET `allowablerace` = `allowablerace`| @HighElf WHERE `allowablerace` & @HumanMask; -- AND `allowablerace` != -1 AND `allowablerace` != 2147483647 AND `allowablerace` != 2047 AND `allowablerace` != 4095 AND `allowablerace` != 16383 AND `allowablerace` != 32767 AND `allowablerace` != 65535 AND `allowablerace` != 131071 AND `allowablerace` != 262143 AND `allowablerace` != 524287 AND `allowablerace` != 1048575 AND `allowablerace` != 2097151;

/* Allow high elves to obtain certain items and mounts
If humans can have it, high elves also can (this section is probably redundant) */
/*
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1029; -- Tablet of Serpent Totem, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1057; -- Tablet of Restoration III, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1122; -- Deprecated Amulet of the White Stallion, old mask: 415
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1123; -- Deprecated Amulet of the Pinto, old mask: 415
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1124; -- Deprecated Amulet of the Palomino, old mask: 415
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1125; -- Deprecated Amulet of the Nightmare, old mask: 415
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1133; -- Horn of the Winter Wolf, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 1134; -- Horn of the Gray Wolf, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2128; -- Scratched Claymore, old mask: 2047
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 2411; -- Black Stallion Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2412; -- Deprecated Nightmare Bridle, old mask: 415
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2413; -- Palomino, old mask: 415
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 2414; -- Pinto Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2415; -- White Stallion, old mask: 415
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2484; -- Small Knife, old mask: 2047
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2502; -- Scuffed Dagger, old mask: 2047
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 2556; -- Recipe: Elixir of Tongues, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 3144; -- Grimoire of Burning Spirit II, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 4143; -- Tome of Conjure Food II, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 4273; -- Codex of Heal, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 5000; -- Coral Band, old mask: 2047
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 5150; -- Book of Healing Touch III, old mask: 511
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 5655; -- Chestnut Mare Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 5656; -- Brown Horse Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 5657; -- Recipe: Instant Toxin, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 5660; -- Libram: Seal of Righteousness, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 5663; -- Horn of the Red Wolf, old mask: 223
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 5864; -- Gray Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 5872; -- Brown Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 5873; -- White Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 6516; -- Imp Summoning Scroll, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 6544; -- Voidwalker Summoning Scroll, old mask: 511
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 6623; -- Succubus Summoning Scroll, old mask: 511
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 8563; -- Red Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 8583; -- Horn of the Skeletal Mount, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 8589; -- Old Whistle of the Ivory Raptor, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 8590; -- Old Whistle of the Obsidian Raptor, old mask: 223
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 8595; -- Blue Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 8627; -- Reins of the Night saber, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 8628; -- Reins of the Spotted Nightsaber, old mask: 223
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 8629; -- Reins of the Striped Nightsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 8631; -- Reins of the Striped Frostsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 8632; -- Reins of the Spotted Frostsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 12302; -- Reins of the Ancient Frostsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 12303; -- Reins of the Nightsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 12353; -- White Stallion Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 12354; -- Palomino Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13086; -- Reins of the Winterspring Frostsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13321; -- Green Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13322; -- Unpainted Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13325; -- Fluorescent Green Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13326; -- White Mechanostrider Mod B, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13327; -- Icy Blue Mechanostrider Mod A, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13328; -- Black Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 13329; -- Frost Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 16338; -- Knight-Lieutenant's Steed, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 16339; -- Commander's Steed, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 16343; -- Blood Guard's Mount, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 16344; -- Lieutenant General's Mount, old mask: 223
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 17019; -- Arcane Dust, old mask: 2047
UPDATE `item_template` SET `allowablerace` = `allowablerace` | @HighElf WHERE entry = 17027; -- Scented Candle, old mask: 2047
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18241; -- Black War Steed Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18242; -- Reins of the Black War Tiger, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18243; -- Black Battlestrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18244; -- Black War Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18766; -- Reins of the Swift Frostsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18767; -- Reins of the Swift Mistsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18772; -- Swift Green Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18773; -- Swift White Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18774; -- Swift Yellow Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18776; -- Swift Palomino, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18777; -- Swift Brown Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18778; -- Swift White Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18785; -- Swift White Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18786; -- Swift Brown Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18787; -- Swift Gray Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 18902; -- Reins of the Swift Stormsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25471; -- Ebon Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25472; -- Snowy Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25470; -- Golden Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25473; -- Swift Blue Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25527; -- Swift Red Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25528; -- Swift Green Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 25529; -- Swift Purple Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 28234; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 28235; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 28236; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 28237; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 28238; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 28481; -- Brown Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29227; -- Reins of the Cobalt War Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29229; -- Reins of the Silver War Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29230; -- Reins of the Tan War Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29231; -- Reins of the White War Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29465; -- Black Battlestrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29467; -- Black War Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29468; -- Black War Steed Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29471; -- Reins of the Black War Tiger, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29743; -- Purple Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29744; -- Gray Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29745; -- Great Blue Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29746; -- Great Green Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 29747; -- Great Purple Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 30348; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 30349; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 30350; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 30351; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 31830; -- Reins of the Cobalt Riding Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 31832; -- Reins of the Silver Riding Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 31834; -- Reins of the Tan Riding Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 31836; -- Reins of the White Riding Talbuk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 35906; -- Reins of the Black War Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 37864; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 40476; -- Insignia of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 42123; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 42124; -- Medallion of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 43956; -- Reins of the Black War Mammoth, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 43958; -- Reins of the Ice Mammoth, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 43959; -- Reins of the Grand Black War Mammoth, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 43961; -- Reins of the Grand Ice Mammoth, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44098; -- Inherited Insignia of the Alliance, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44223; -- Reins of the Black War Bear, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44225; -- Reins of the Armored Brown Bear, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44230; -- Reins of the Wooly Mammoth, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44235; -- Reins of the Traveler's Tundra Mammoth, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44413; -- Mekgineer's Chopper, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 44689; -- Armored Snowy Gryphon, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45125; -- Stormwind Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45586; -- Ironforge Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45589; -- Gnomeregan Mechanostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45590; -- Exodar Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45591; -- Darnassian Nightsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45666; -- Ironforge Doublet, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45667; -- Stormwind Doublet, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45668; -- Exodar Doublet, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45670; -- Darnassus Doublet, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 45671; -- Gnomeregan Doublet, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46744; -- Swift Moonsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46745; -- Great Red Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46747; -- Turbostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46748; -- Swift Violet Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46752; -- Swift Gray Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46756; -- Great Red Elekk, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46758; -- Swift Gray Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46759; -- Swift Moonsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46762; -- Swift Violet Ram, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46763; -- Turbostrider, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46815; -- Quel'dorei Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46970; -- Drape of the Untamed Predator, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 46971; -- Drape of the Untamed Predator, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47089; -- Cloak of Displacement, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47095; -- Cloak of Displacement, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47100; -- Reins of the Striped Dawnsaber, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47105; -- The Executioner's Malice, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47110; -- The Executioner's Malice, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47149; -- Signet of the Traitor King, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47157; -- Signet of the Traitor King, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47223; -- Ring of the Darkmender, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47224; -- Ring of the Darkmender, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47570; -- Saronite Swordbreakers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47572; -- Titanium Spikeguards, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47574; -- Sunforged Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47576; -- Crusader's Dragonscale Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47579; -- Black Chitin Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47581; -- Bracers of Swift Death, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47583; -- Moonshadow Armguards, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47585; -- Bejeweled Wizard's Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47587; -- Royal Moonshroud Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47589; -- Titanium Razorplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47591; -- Breastplate of the White Knight, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47593; -- Sunforged Breastplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47595; -- Crusader's Dragonscale Breastplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47597; -- Ensorcelled Nerubian Breastplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47599; -- Knightbane Carapace, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47602; -- Lunar Eclipse Robes, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47603; -- Merlin's Robe, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47605; -- Royal Moonshroud Robe, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47622; -- Plans: Breastplate of the White Knight, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47623; -- Plans: Saronite Swordbreakers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47624; -- Plans: Titanium Razorplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47625; -- Plans: Titanium Spikeguards, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47626; -- Plans: Sunforged Breastplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47627; -- Plans: Sunforged Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47628; -- Pattern: Ensorcelled Nerubian Breastplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47629; -- Pattern: Black Chitin Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47630; -- Pattern: Crusader's Dragonscale Breastplate, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47631; -- Pattern: Crusader's Dragonscale Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47632; -- Pattern: Lunar Eclipse Robes, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47633; -- Pattern: Moonshadow Armguards, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47634; -- Pattern: Knightbane Carapace, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47635; -- Pattern: Bracers of Swift Death, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47654; -- Pattern: Bejeweled Wizard's Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47655; -- Pattern: Merlin's Robe, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47656; -- Pattern: Royal Moonshroud Bracers, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 47657; -- Pattern: Royal Moonshroud Robe, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 49044; -- Swift Alliance Steed, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 49096; -- Crusader's White Warhorse, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 49289; -- Little White Stallion Bridle, old mask: 1101
UPDATE `item_template` SET `allowablerace` = 7245 WHERE entry = 51377; -- Medallion of the Alliance, old mask: 1101
/*