# mod-worgoblin-high-elf
## F-002_move-npc-races

### Purpose
This takes clean DBCs and moves NPC-only races above the playable range to make room for more playable races.

### Known Issues
- Not idempotent. Use with caution. (Should just fail to do anything if you run it twice, though.)
- Requires clean DBCs, not edited ones. It will turn your ID 12 Worgen into ID 32 ones if you let it.
