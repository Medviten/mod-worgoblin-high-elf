# mod-worgoblin-high-elf
## F-008_move-npc-races

### Features
- Moves NPC-only races above the playable range (i.e. ID 32+) to make room for more playable races.

### Known Issues
- Not idempotent. Use with caution. (Should just fail to do anything if you run it twice, though.)
- Use unmodified DBCs! This will turn your ID 12 Worgen into ID 32 ones if you let it.
