# mod-worgoblin-high-elf

> [!WARNING]
>
> ## Work in Progress
>
> This module is **not finished yet** and is still in active development.
>
> It is currently intended for testing, development and experienced AzerothCore users. Features, DBC files, SQL structure and compatibility may still change between versions.
>
> Bugs are expected, especially with unusual race/class combinations, ARAC and PlayerBots integration.
>
> **Please make backups before installing or updating the module.**

This is designed to *replace* your DBCs and world DB! Back them up!

A highly modular approach to DBC-heavy mods, relying on DBCTool to bulk edit DBCs in MySQL before exporting them. First and foremost a custom race module for **AzerothCore 3.3.5a**.

This project started as a merger of Worgoblin and AzerothCore High Elf (which are mutually exclusive out of the box), as well as ARAC, and has since been expanded with additional playable races and mods like Faction Free.

Early on, my focus was primarily on merging the DBCs into one functioning package, but inspired by Justurn's Zeppelin-Craft project, it has increasingly shifted towards modularity and developer flexibility.

My SQL files make heavy use of variables for readability and editability. You're welcome. ;)

> If you don't want to modify anything and just want to add more races, it can seem daunting to have them all separated into SQL modpaks like this, but the original, clean and cut approach is carried forward by [Baercraft](https://github.com/Baercraft/mod-worgoblin-high-elf)'s fork. This division of labour lets us cater to both preferences.

---

# Purpose

Using several independent follow-up patches increases the possibility of mismatched files or installation-order problems because only the last of each DBC counts at runtime, with no automatic combination being possible.

To solve that, this repository lets you prepare the DBCs in MySQL before exporting them with DBCTool. Blacklist the modpaks you don't need, point build-dbc.sh to a disposable MySQL database, and watch it merge the DBCs for you.

If you want to change something, simply add or edit an SQL file and have it apply after the file it overrides.

---

# Features

## Playable Races
The project currently includes the following custom playable races:

* **Worgen**
* **Goblin**
* **High Elf**
* **Mag'har Orc**
* **Ogre**
* **Dark Iron Dwarf**
* **Zandalari Troll**

More details are found in each modpak's own readme file.

---

## ARAC – All Races All Classes

In addition to opening up all classes for stock races, this project also opens them up for custom ones.

Some unusual race/class combinations may still have missing abilities, incorrect proficiencies or other issues. Testing and detailed bug reports are very welcome.

---

# Client Patch

The project uses **`patch-A.MPQ`** as its primary client patch, but you can of course rename it to something else.

It contains the client-side files required by the custom races, including modified DBC files and other race-related client data.

On the other hand, `patch-J.MPQ` is entirely optional. It is intended to reverse as many changes as possible, client-side only, for purist users who still want to play on their friends' modified servers.

---

## PlayerBots

PlayerBots support is provided through whe-playerbots.patch. You can apply it to your playerbots root directory using Git:

```text
 git apply --ignore-space-change --ignore-whitespace whe-playerbots.patch
git add .
git commit -m "Add whe-playerbots patch"
```

In the future, there may be modularity support for this as well.

---

## Interface Files
Currently, patch-A assumes you'll install all custom races. If you don't, it should still work, but the character selection screen may look weird. I hope to provide modular support for this as well.

---

# Installation

## 1. Install the module

Copy the module into your AzerothCore modules directory:

```text
AzerothCore/
└── modules/
    └── mod-worgoblin-high-elf/
```

---

## 2. Apply whe-acore.patch

Copy mod-worgoblin-high-elf/integration/whe-acore.patch into your AzerothCore root directory. Apply it like this:

```text
 git apply --ignore-space-change --ignore-whitespace whe-playerbots.patch
git add .
git commit -m "Add whe-playerbots patch"
```

## 3. Set up the DBC-SQL pipeline

Edit the config file in worgoblin-high-elf/tools/dbctool/ and point it to a disposable database (default: dbc). It will drop and recreate it, which requires the proper permissions.

Import clean DBCs, make any modifications you want, and then dump the database. Point DBCTool at this dump – it's your save state.

Edit the blacklist in worgoblin-high-elf/tools/scripts/ by uncommenting features to exclude. Edit build-dbc.conf with your paths and logins, then run build-dbc.sh.

It should put the new DBCs straight into your server's data/dbc directory, overwriting whatever is already in there.

**Back up your existing DBC directory before running any scripts! It will overwrite them!**

It can also reset your world database before running the modpak SQL files against it, so make a dump as backup!

---

## 4. Install patch-A.MPQ

Copy:

```text
patch-A.MPQ
```

into the `Data` directory of your WoW 3.3.5a client.

Example:

```text
World of Warcraft/
└── Data/
    └── patch-A.MPQ
```

You should also replace the DBCs with the ones from the pipeline to ensure compatibility with the server.

---

## 5. Compile AzerothCore

After installing or updating the module, compile AzerothCore normally, if the modpaks you installed require it. Worgoblin does, but others don't – only C++ code requires recompilation, really.

See the official AzerothCore documentation for information about installing and compiling modules:

https://www.azerothcore.org/wiki/installing-a-module

---

## 6. Client Executable

Custom races require a WoW 3.3.5a client that allows modified client files.

You may therefore need a patched WoW executable with signature checks disabled.

A commonly used patcher is available here:

https://github.com/anzz1/WoWPatcher335

Always keep a backup of your original executable.

Some [clients](https://drive.google.com/file/d/1M7QVeIaXHV5ru9s7mvo52P-eOjQedSkS/view?usp=sharing) are also downloadable with such checks already disabled.

---

# Bug Reports

Bug reports and testing feedback are very welcome.

When reporting a problem, please include whenever possible:

* Module version
* AzerothCore revision
* Race
* Class
* Client locale
* Whether the character was newly created
* Relevant worldserver log output

For race/class problems, please describe exactly which skill, spell, racial, armor type or weapon proficiency is missing.

This makes problems significantly easier to reproduce and fix.

---

# Updating

Because this project is still in active development, files and database structures may change between versions.

Before updating:

* Back up your world database
* Back up your working DBCs

Do not assume that characters created with one development version will always behave identically after a future update.

---

# Credits

This project builds upon the work of many developers in the AzerothCore and WoW modding communities.

Special thanks to:

* **heyitsbench** and **Helias** – original [Worgoblin]([url](https://github.com/heyitsbench/mod-worgoblin)) [module]([url](https://github.com/Helias/mod-worgoblin)) adaptations
* **idempotentiation** – [Worgoblin fork]([url](https://github.com/idempotentiation/mod-worgoblin)) and Playerbots compatibility work
* **abracadaniel22** – [AzerothCore High Elf]([url](https://github.com/abracadaniel22/azerothcore-highelf)) and [Fly Anywhere]([url](https://github.com/abracadaniel22/mod-fly-anywhere)) modules
* **heyitsbench** – original [ARAC]([url](https://github.com/heyitsbench/mod-arac)) module
* **ChromWolf** – updated [ARAC]([url](https://github.com/ChromWolf/mod-arac-updated)) module with custom spells for Blood Elves and Draenei
* **Mattiks** – playable Mag'har Orcs
* **Amarion** – playable Ogres
* **Baercraft** – lots of support and bugfixes, especially with Playerbots compatibility and the playable Dark Iron Dwarves
* **Justurn / Zeppelin-Craft** – inspiration for modular DBC handling in SQL
* **Nehyren** – [retroported](https://github.com/tbcstar/Nehyren) Shadowlands models
* The **Open Azeroth** team – Open Azeroth map edits
* **gitdalisar** – [Faction Free]([url](https://github.com/gitdalisar/mod-Faction-Free)) module
* The AzerothCore community
* Everyone else who has helped test, debug, translate and improve the project

---

**Current Status: 🚧 Work in Progress / Development Version**
