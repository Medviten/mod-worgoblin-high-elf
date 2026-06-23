# This is an attempt at merging Worgoblin and AzerothCore High Elf modules, as well as (optionally) several other DBC-heavy modules

# Worgoblin Module

[![core-build](https://github.com/benjymansy123/mod-worgoblin/actions/workflows/core-build.yml/badge.svg)](https://github.com/benjymansy123/mod-worgoblin/actions/workflows/core-build.yml)

This is a module for [AzerothCore](http://www.azerothcore.org) that adds worgen, goblins, and numerous features related to their playability.

# AzerothCore High Elf

# Fly Anywhere

# ARAC

# Faction Free


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

## How to Install

### 1) Replace the DBC files in your AzerothCore Data directory with the ones provided in [DBFilesClient](https://github.com/idempotentiation/mod-worgoblin/tree/master/data/patch-A.MPQ/DBFilesClient)

Copy the contents of the DBFilesClient folder (`mod-worgoblin/data/patch-A.MPQ/DBFilesClient`) to your AzerothCore `Data/dbc` directory (defined by `DataDir` in `worldserver.conf`). I recommend backing up your dbc folder before overwriting these files.

If you're using the alpha models and/or Gilnean voice files, overwrite the relevant DBC files.

### 2) Copy [patch-A.MPQ](https://github.com/idempotentiation/mod-worgoblin/tree/master/data/patch-A.MPQ) from (`mod-worgoblin/data/patch-A.MPQ`) to your Data folder in your WoW client

Overwrite the relevant files in `patch-A.MPQ/DBFilesClient` if you're using the alpha models and/or Gilnean voice files.

### 2.5) Optional: compatibility patches

#### [Playerbots](https://github.com/liyunfan1223/mod-playerbots)

This patch fixes the problem of bots failing to recognize Worgen and High Elf as Alliance races and allows playerbots to spawn as Worgen, Goblins and High Elves.

To apply the patch, copy [playerbots.patch](https://github.com/idempotentiation/mod-worgoblin/tree/master/patch/playerbots.patch) to the root of your Playerbots directory and run the following commands from there:

```
git apply --ignore-space-change --ignore-whitespace playerbots.patch
git add .
git commit -m "Add worgoblin-high-elf playerbots patch"
```

#### [Individual Progression](https://github.com/ZhengPeiRu21/mod-individual-progression)

The individual progression module modifies starting weapon skills, which has the side effect of causing certain classes for worgen and goblins to be unable to use their starting equipment. Additionally, the module removes many spells from trainers and reintroduces the quests that were originally required to learn them, which leaves worgen warlocks without any feasible way of learning how to summon their imp.

This patch fixes the issues with starting weapon skills and adds a custom quest for worgen warlocks to learn Summon Imp. After you apply the patch, add/overwrite the provided DBC files in both your AzerothCore server's `data/dbc` and your client's `Patch-A.MPQ/DBFilesClient` directories.

To apply the patch, copy [individual-progression.patch](https://github.com/idempotentiation/mod-worgoblin/tree/master/patch/individual-progression.patch) to the root of your individual progression directory and run the following commands from there:

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

And with that, you are all done!

## Credits

* heyitsbench and Helias for the [Worgoblin]([url](https://github.com/heyitsbench/mod-worgoblin)) [modules]([url](https://github.com/Helias/mod-worgoblin))
* idempotentiation for the [Worgoblin fork]([url](https://github.com/idempotentiation/mod-worgoblin)) with patches
* abracadaniel22 for the [High Elf custom race]([url](https://github.com/abracadaniel22/azerothcore-highelf)) and [Fly Anywhere]([url](https://github.com/abracadaniel22/mod-fly-anywhere)) modules
* heyitsbench (again) for the original [ARAC]([url](https://github.com/heyitsbench/mod-arac)) module
* ChromWolf for the updated [ARAC]([url](https://github.com/ChromWolf/mod-arac-updated)) module
* gitdalisar for the [Faction Free]([url](https://github.com/gitdalisar/mod-Faction-Free)) module
* Several people who helped on Discord
