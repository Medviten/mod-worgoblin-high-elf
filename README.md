# This is an attempt at merging Worgoblin and AzerothCore High Elf modules, as well as (optionally) several other DBC-heavy modules

# Worgoblin Module

[![core-build](https://github.com/benjymansy123/mod-worgoblin/actions/workflows/core-build.yml/badge.svg)](https://github.com/benjymansy123/mod-worgoblin/actions/workflows/core-build.yml)

This is a module for [AzerothCore](http://www.azerothcore.org) that adds Worgen, Goblins, and numerous features related to their playability.

## Features

- Worgen as a playable Alliance race and goblins as a playable Horde race
- Optional alpha worgen models and Gilnean voices
- Mage and warlock class trainers in Teldrassil (worgen starting zone)
- Compatibility patches for PlayerBots and Individual Progression modules

### NYI Features
- Mount vendors
- Worgen druid forms (currently uses night elf forms)
- Vanilla goblin models

## Important Notes

This module makes *heavy* use of client patching and modification. Because of this, it is recommended to use a [clean, unmodified enUS WoW client](https://www.chromiecraft.com/downloads) as issues have been reported due to use of other clients, such as the one offered from Warmane. The HD patch included on the ChromieCraft website has been known to cause issues with this patch. It is for that reason that it's recommended for you to use the HD patch adapted to the Worgoblin module in particular, which can be found [here](https://github.com/benjymansy123/mod-worgoblin/releases/tag/hd-patch) with instructions on how to install it. (It may not work with this module, however.)

# AzerothCore High Elf

Mod to add High Elves as playable characters on Azeroth Core with support for mod-playerbots. By Abracadaniel22.

## Goals

The goals for this project are very simple and limited, allowing for quick feedback and a quick POC:

1. Duplicate blood elf models into a new high elf race
2. Copy everything else from humans (starting zone, mounts, reputation, quests, etc)

Anything extra or too intrusive should be added as optional features in the "extras" directory. The base mod should remain as clean as possible with the minimum changes to make the custom race reasonably work.

## Features

- A new High Elf alliance race is added
- - It shares the same models as the Blood Elf race
- - It shares the same starting zone, reputation, skills as the humans
- - High Elves can be any class except shaman or druid

- Compatible with HD models

### Extra features

The "extras" directory contains optional features that can be installed on top of the base installation:

- Compatibility patch to work with mod-individual-progression (thanks to Dasbadman)
- Arcane Torrent spell for High Elf warriors (thanks to Dasbadman)

## Known limitations

No audio in emotes (such as /hi, /joke, etc)

## Requirements

This requires a patched version of WoW.exe that allows interface edits (SIG & MD5 Protection removed). The version downloaded from Warmane or ChromieCraft should work. You can also download a patcher tool from the WoW Modding Community discord or from ownedcore.com and do it yourself. Without a patched version, the client will not accept the interface changes and will not allow you to play the game, throwing out errors such as "Your login interface files are corrupt".

# Fly Anywhere

AzerothCore mod that allows players to use flying mounts in Eastern Kingdoms and Kalimdor as soon as they can fly in Outland.

This mod also allows players to fly in the Burning Crusade starter zones, Isle of Quel'danas, and any other Outland area not flyable.

## Overview

When [Expert Riding]([url](https://www.wowhead.com/wotlk/spell=34090/expert-riding)) skill is learned, players can fly in the old world continents (Eastern Kingdoms and Kalimdor) and BC starter zones with any mount their skill and level allow them to use. Expert Riding can be learned at level 60.

## Extra info

### What was modified in the DBC file?
- server/AreaTable.dbc: for each area in which ContinentID is either 0 or 1, if Flags is greater than 0, add the AREA_FLAG_FLYING (value 0x00000400) and the AREA_FLAG_EnableFlightBoundsonMap (value 0x00004000) to the bit mask, basically mimicking the flags from the expansion continents. Also done the same for ContinentID 530 (Outlands) to include starter zones.

# ARAC

Allows all races to be all classes. The updated version fixed some bugs in the original. I noticed some missing combinations (e.g. Blood Elf Druid) were missing spells, so I have added those in there as well as extending the module to cover Worgen, Goblins and High Elves.

# Faction Free

Name: mod-Faction-Free
Author: gitdalisar
Repository: https://github.com/gitdalisar/mod-Faction-Free
Download: https://github.com/gitdalisar/mod-Faction-Free/archive/refs/heads/main.zip
License: GNU Affero General Public License v3.0

Designed and Implemented for AzerothCore (https://azerothcore.org). If you are running a different server version, please review the files before loading into your environment!

## Purpose
The goal of these changes are to allow for players of either faction to be able to gain repuatation for, take quests from, use cities of, earn the achievements for, and all other such features of the opposing faction. The concept was to truly be The Saviour of Azeroth and be able to assist and gain favor for all races and cities across the lands. Playing WOW you are always hailed as the hero, but if you truly were the hero everyone says you are, then wouldn't you maybe even be welcome in opposing faciton cities? The threats you have contained surely benefited them as well. These series of changes are to make that happen!

Please note though that these changes are strictly to the "Player-to-NPC" relationship. For the ability to have cross-faction groups, trade, guilds, etc. you will simply need to modify the worldserver.conf settings within your build path.

# How to Install

### 1) Replace the DBC files in your AzerothCore Data directory with the ones provided in DBFilesClient

Copy the contents of the DBFilesClient folder (`mod-worgoblin-high-elf/data/patch-A.MPQ/DBFilesClient`) to your AzerothCore `Data/dbc` directory (defined by `DataDir` in `worldserver.conf`). I recommend backing up your DBC folder before overwriting these files.

If you're using the alpha models and/or Gilnean voice files, overwrite the relevant DBC files.

### 2) Copy patch-A.MPQ from (`mod-worgoblin-high-elf/data/patch-A.MPQ`) to your Data folder in your WoW client

Overwrite the relevant files in `patch-A.MPQ/DBFilesClient` if you're using the alpha models and/or Gilnean voice files.

### 2.5) Optional: compatibility patches

#### [Playerbots](https://github.com/liyunfan1223/mod-playerbots)

This patch fixes the problem of bots failing to recognize Worgen and High Elf as Alliance races and allows playerbots to spawn as Worgen, Goblins and High Elves.

To apply the patch, copy playerbots.patch to the root of your Playerbots directory and run the following commands from there:

```
git apply --ignore-space-change --ignore-whitespace playerbots.patch
git add .
git commit -m "Add worgoblin-high-elf playerbots patch"
```

#### [Individual Progression](https://github.com/ZhengPeiRu21/mod-individual-progression)

The individual progression module modifies starting weapon skills, which has the side effect of causing certain classes for Worgen and Goblins to be unable to use their starting equipment. Additionally, the module removes many spells from trainers and reintroduces the quests that were originally required to learn them, which leaves Worgen Warlocks without any feasible way of learning how to summon their imp.

This patch fixes the issues with starting weapon skills and adds a custom quest for Worgen Warlocks to learn Summon Imp. After you apply the patch, add/overwrite the provided DBC files in both your AzerothCore server's `data/dbc` and your client's `Patch-A.MPQ/DBFilesClient` directories.

To apply the patch, copy individual-progression.patch to the root of your individual progression directory and run the following commands from there:

```
git apply --ignore-space-change --ignore-whitespace individual-progression.patch
git add .
git commit -m "Add worgoblin-high-elf individual progression patch"
```

### 3) Compile and install AzerothCore.

See AzerothCore's [official documentation](https://www.azerothcore.org/wiki/installing-a-module) for more details about compiling and installing modules. If you applied one of the compatibility patches after a previous installation, you will have to recompile AzerothCore.

### 4) Remove signature checks from your WoW executable
Windows users can use [this patcher](https://www.wowmodding.net/files/file/283-wow-335-patcher-custom-item-fix/) created by kebabstorm to patch Wow.exe file (also available from [this](https://github.com/anzz1/WoWPatcher335/releases) GitHub repository). macOS users can download this [pre-patched .app file](https://github.com/benjymansy123/custom-race-ac-12_6_21/releases/download/sig-check/WoW.app.zip), since no easy patcher exists for macOS.

Because WoW uses signature checks so as to not allow Interface files to be modified, we need to remove those checks in order to be able to use custom races. This is accomplished using the patcher included in the repo. Move the patcher into your WoW client directory and run it. Again, feel free to make a backup of your original executable.

There is a longstanding bug in WotLK that causes your mouse to reset to the center of the screen, resulting in frequent disorientation while playing. It requires a patched client executable to fix, which causes compatibility issues with this module. However, you can use the script provided [here](https://github.com/idempotentiation/mod-worgoblin/releases/tag/patched-client-merger) to merge the two patched executables, allowing you to use this module alongside the camera fix.

### 4) Run the provided SQL files against your world database

Some tables in the database override DBC files. I am not sure exactly how that works, but I know that sometimes things don't work until I change the DB to agree with the DBC.

Assuming you are using default names for your databases, log into MySQL and run:

```
use acore_world;
source /path/to/modules/mod-worgoblin-high-elf/data/sql/base/world/mod-worgoblin-high-elf.sql;
```

You can also do this with the extra SQL files per mod you want to make compatible.

And with that, you are all done!

# Credits

* heyitsbench and Helias for the [Worgoblin]([url](https://github.com/heyitsbench/mod-worgoblin)) [modules]([url](https://github.com/Helias/mod-worgoblin))
* idempotentiation for the [Worgoblin fork]([url](https://github.com/idempotentiation/mod-worgoblin)) with patches
* abracadaniel22 for the [High Elf custom race]([url](https://github.com/abracadaniel22/azerothcore-highelf)) and [Fly Anywhere]([url](https://github.com/abracadaniel22/mod-fly-anywhere)) modules
* heyitsbench (again) for the original [ARAC]([url](https://github.com/heyitsbench/mod-arac)) module
* ChromWolf for the updated [ARAC]([url](https://github.com/ChromWolf/mod-arac-updated)) module
* gitdalisar for the [Faction Free]([url](https://github.com/gitdalisar/mod-Faction-Free)) module
* Several people who helped on Discord
