MaxTile
=======

MaxTile is a new feature developed for SA-1 Pack v1.40 designed to effectively use all available OAM slots on Super Mario World regardless of the sprite type or game mode and keeping the maximum possible compatibility with the vanilla sprites and custom sprites designed before the system.

## Features
- Provides four preconfigured OAM tables for different priorities;
- Leaves the standard OAM table untouched till the end of the frame;

## The priority structures

MaxTile provides four different priorities, from order #0 to #3, where #0 is the highest priority (appears in front of all other OAM tiles) and #3 is the lowest priority (appears behind all OAM tiles).

The buffers also have names. #0 is called max buffer, #1 is called high buffer, #2 normal buffer and #3 low buffer.

You write to each buffer in backwards order, which means that your first tile will have the lowest priority and your last tile will have the highest priority. This means that *if always use the same maxtile buffer*, tiles drawn at the beginning of the frame will have lowest priority and tiles drawn at end of the frame will have the highest priority.
If preferred, you can take one of the maxtile pointers, subtract by the amount of tiles you will draw and run your graphics routine normally incrementing Y without having to reorder your drawing priority.

When assembled, the OAM table ($0200-$03FF) will be built in the following order:

* maxtile buffer #0 (highest priority)
* maxtile buffer #1
* maxtile buffer #2
* maxtile buffer #3 (lowest priority)

They are copied to $0200-$03FF backwards, the copy will go to $03FC, then $03F8, $03F4, etc.

### SMW and NMSTL compatibility

Of course if nobody uses the MaxTile API directly, no tile from the original game nor from old sprites will ever appear because the buffers are completely empty. Because of that, MaxTile will automatically move OAM tiles from $0200-$03FF to the MaxTile buffers though the frame to keep compatibility with all existing resources. The copy works as the following:

1. at the beginning of the frame, all maxtile buffers are invalidated (cleared);
2. $0200-$03FF is cleared;
3. every time a sprite is executed NMSTL will select slot #$38;
4. before leaving, NMSTL calls a MaxTile routine that flushes the used OAM slots from range $0338-$03F8 to buffer #3;
5. if the player is behind scenery, MaxTile will flush slots $0338-$03CC, otherwise $0338-$03F8;
6. do the same procedure for every regular sprite;
7. at the end of the frame, copy $0200-$02FC to maxtile buffer #1 ($0200 >> B#1);
8. then copy $0300-$032C to maxtile buffer #2 ($0300 >> B#2);
9. then copy $03F8-$03FC to maxtile buffer #3 ($03F8 >> B#3);
10. then copy $0338-$03F4 at once to maxtile buffer #3 ($0338 >> $03F8 >> B#3);
11. copy maxtile buffer #3 to OAM table ($0338 >> $03F8 >> B#3);
12. copy maxtile buffer #2 to OAM table ($0300 >> B#2 >> $0338 >> $03F8 >> B#3);
13. copy maxtile buffer #1 to OAM table ($0200 >> B#1 >> $0300 >> B#2 >> $0338 >> $03F8 >> B#3); and
14. copy maxtile buffer #0 to OAM table (B#0 >> $0200 >> B#1 >> $0300 >> B#2 >> $0338 >> $03F8 >> B#3).

Priority will be: B#0 (always appear in front) >> $0200 >> B#1 >> $0300 >> B#2 >> $0338 >> $03F8 >> B#3 (always appear behind).

In practice, we end up with the following priorities (from highest to lowest):
1. maxtile buffer #0 (appears in front of everything)
2. $0200-$02FC (special tiles: cluster, extended, minor extended, etc.)
3. maxtile buffer #1
4. $0300-$032C (player and yoshi)
5. maxtile buffer #2
6. $0338-$03FC (each regular sprite previously pushed to buffer #3)
7. maxtile buffer #3 (appears behind everything, as long you draw before the first sprite)

**IMPORTANT**
* Above configuration is only valid for regular levels.
* Like NMSTL, Yoshi is hardcoded to slot $0328 and therefore will stay in front of all sprites. Original game yoshi normally stays *behind* other sprites.
* NMSTL makes sprites with lower table index has higher priority than sprites with higher table index. MaxTile restores the original game behavior of lower table indexed sprites having lower priority, with the exception of Yoshi.
* Tiles $0330 and $0334 are discarded (duplicate yoshi tiles)
* You must draw to buffer #3 before *any* regular sprite if you wanna make it stay behind everything (UberASM main label is the best choice)
* If the player is behind scenery, $03D0-$03F4 is only flushed to buffer #3 at the end of the frame.
* Sprites that doesn't use MaxTile are limited to slots $0338-$03F8

## Memory map

| BW-RAM address | VBW-RAM mirror | Size      | Description              |
|----------------|----------------|-----------|--------------------------|
| $40:B5E0       | $75E0          | 8 bytes   | OAM structure #0         |
| $40:B5E8       | $75E8          | 8 bytes   | OAM structure #1         |
| $40:B5F0       | $75F0          | 8 bytes   | OAM structure #2         |
| $40:B5F8       | $75F8          | 8 bytes   | OAM structure #3         |
| $40:B600       | $7600          | 128 bytes | OAM properties buffer #0 |
| $40:B680       | $7680          | 128 bytes | OAM properties buffer #1 |
| $40:B700       | $7700          | 128 bytes | OAM properties buffer #2 |
| $40:B780       | $7780          | 128 bytes | OAM properties buffer #3 |
| $40:B800       | $7800          | 512 bytes | OAM buffer #0            |
| $40:BA00       | $7A00          | 512 bytes | OAM buffer #1            |
| $40:BC00       | $7C00          | 512 bytes | OAM buffer #2            |
| $40:BE00       | $7E00          | 512 bytes | OAM buffer #3            |

