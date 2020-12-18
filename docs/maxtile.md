MaxTile
=======

MaxTile is a new feature developed for SA-1 Pack v1.40 designed to effectively use all available OAM slots on Super Mario World regardless of the sprite type or game mode and keeping the maximum possible compatibility with the vanilla sprites and custom sprites designed before the system.

## Features
* Provides four OAM tables for different sprite<->sprite priorities;
* Leaves the standard OAM table untouched till the end of the frame (with exceptions of regular sprites);
* Allows up to 128 sprites *tiles* on screen;
* High compatibility with already deisgned sprites, including vanilla sprites, mode 7 bosses, overworld, behind scenery behavior, yoshi and lakitu;
* Compatible with NMSTL sprites

## The priority structure

MaxTile provides four different priorities, from #0 to #3, where #0 is the highest priority (appears in front of all other OAM tiles) and #3 is the lowest priority (appears behind all OAM tiles).

The buffers also have names. #0 is called max buffer, #1 is called high buffer, #2 normal buffer and #3 low buffer.

You write to each buffer in backwards order, which means that your first tile will have the lowest priority and your last tile will have the highest priority. This means that *if you always use the same maxtile buffer*, tiles drawn at the beginning of the frame will have lowest priority and tiles drawn at end of the frame will have the highest priority.
If preferred, you can take one of the maxtile pointers, subtract by the amount of tiles you will draw and run your graphics routine normally incrementing Y without having to reorder your drawing priority.

When the four priority buffers are assembled into a single buffer, the OAM table ($0200-$03FF) will be built in the following way:

* maxtile buffer #0 (highest priority)
* maxtile buffer #1
* maxtile buffer #2
* maxtile buffer #3 (lowest priority)

They are copied to $0200-$03FF backwards, the copy will start at $03FC, then $03F8, $03F4, etc., until it reaches $0200.

> :warning: **IMPORTANT**
> * Although the four buffers combined allows up to 512 sprite tiles, the SNES PPU has the limit of 128 sprite tiles. If MaxTile notices that the 128 tile limit was exceeded, it will stop copying further tiles.
> * Even if the buffer copy order is reversed (buffer #3 is copied to end of OAM table then buffer #2, buffer #1 and buffer #0), earlier buffers will always have priority over latter buffers. MaxTile always calculates how many tiles each buffer has before copying the lowest priority and will **always** priorize buffers with higher priority.

## SMW and NMSTL compatibility

Of course if nobody uses the MaxTile API directly, no tile from the original game nor from old sprites will ever appear because the buffers are completely empty. Because of that, MaxTile will automatically move OAM tiles from $0200-$03FF to the MaxTile buffers though the frame to keep compatibility with all existing resources. The copy works as the following:

1. at the beginning of the frame, all maxtile buffers are invalidated (cleared);
2. $0200-$03FF is cleared;
3. every time a sprite is executed NMSTL will select slot #$38;
4. before leaving, NMSTL calls a MaxTile routine that flushes the used OAM slots from range $0338-$03F8 to buffer #3;
5. if the player is behind scenery, MaxTile will flush slots $0338-$03CC;
6. if the player is on a boss battle, MaxTile will flush slots $0338-$03AC;
7. otherwise, MaxTile will flush $0338-$03F8;
8. do the same procedure for every regular sprite;
9. at the end of the frame, if $3F is not zero, copy ``$0200+2*(value&$FE)``-``$03FC`` to maxtile buffer #0 ([$3F] >> B#0)
10. copy $0200-$02FC to maxtile buffer #1 ($0200 >> B#1);
11. then copy $0300-$032C to maxtile buffer #2 ($0300 >> B#2);
12. then copy $03F8-$03FC to maxtile buffer #3 ($03F8 >> B#3);
13. then copy $0338-$03F4 at once to maxtile buffer #3 ($0338 >> $03F8 >> B#3);
14. copy maxtile buffer #3 to OAM table ($0338 >> $03F8 >> B#3);
15. copy maxtile buffer #2 to OAM table ($0300 >> B#2 >> $0338 >> $03F8 >> B#3);
16. copy maxtile buffer #1 to OAM table ($0200 >> B#1 >> $0300 >> B#2 >> $0338 >> $03F8 >> B#3); and
17. copy maxtile buffer #0 to OAM table ([$3F] >> B#0 >> $0200 >> B#1 >> $0300 >> B#2 >> $0338 >> $03F8 >> B#3).

Priority will be: [$3F] (always appear in front) >> B#0 >> $0200 >> B#1 >> $0300 >> B#2 >> $0338 >> $03F8 >> B#3 (always appear behind).

In practice, we end up with the following priorities (from highest to lowest):
1. maxtile buffer #0 (appears in front of everything)
2. $0200-$02FC (special tiles: cluster, extended, minor extended, etc.)
3. maxtile buffer #1
4. $0300-$032C (player and yoshi)
5. maxtile buffer #2
6. $0338-$03FC (each regular sprite previously pushed to buffer #3)
7. maxtile buffer #3 (appears behind everything, as long you draw before the first regular sprite)

> :warning: **IMPORTANT**
> * Above configuration is only valid for regular levels.
> * Like NMSTL, Yoshi is hardcoded to slot $0328 and therefore will stay in front of all sprites. Original game yoshi normally stays *behind* other sprites.
> * NMSTL makes sprites with lower table index has higher priority than sprites with higher table index. MaxTile restores the original game behavior of lower table indexed sprites having lower priority, with the exception of Yoshi.
> * Tiles $0330 and $0334 are discarded (duplicate yoshi tiles)
> * You must draw to buffer #3 before *any* regular sprite if you wanna make it stay behind everything (UberASM main label is the best choice)
> * If the player is behind scenery, $03D0-$03F4 is only flushed to buffer #3 at the end of the frame.
> * Sprites that doesn't use MaxTile are limited to slots $0338-$03F8
> * If $3F is not zero, MaxTile will assume the tiles starting at address ``$0200+2*(value&$FE)`` and ending at $03FC as maximum possible priority and will copy to maxtile buffer #0. This special behavior is only present on overworld and mode 7 bosses and it is not recommended to use for other usages.

## Memory map

| BW-RAM address | VBW-RAM mirror  | Size      | Description              |
|----------------|-----------------|-----------|--------------------------|
| $40:01C0       | $61C0 (default) | 16 bytes  | OAM structure #0         |
| $40:01D0       | $61D0 (default) | 16 bytes  | OAM structure #1         |
| $40:01E0       | $61E0 (default) | 16 bytes  | OAM structure #2         |
| $40:01F0       | $61F0 (default) | 16 bytes  | OAM structure #3         |
| $40:B600       | $7600 (#$05)    | 128 bytes | OAM properties buffer #0 |
| $40:B680       | $7680 (#$05)    | 128 bytes | OAM properties buffer #1 |
| $40:B700       | $7700 (#$05)    | 128 bytes | OAM properties buffer #2 |
| $40:B780       | $7780 (#$05)    | 128 bytes | OAM properties buffer #3 |
| $40:B800       | $7800 (#$05)    | 512 bytes | OAM buffer #0            |
| $40:BA00       | $7A00 (#$05)    | 512 bytes | OAM buffer #1            |
| $40:BC00       | $7C00 (#$05)    | 512 bytes | OAM buffer #2            |
| $40:BE00       | $7E00 (#$05)    | 512 bytes | OAM buffer #3            |

VBW-RAM is the BW-RAM mirror basically combo'ed with $318F and $2225, an alternative for accessing the buffer using the Direct Page or RAM data banks.

## How to use

> :warning: **WORK IN PROGRESS**
> The official MaxTile API is still work in progress and there might be notable changes that would break other sprites. For now, please code sprites using the classic SMW/NMSTL method and let MaxTile do the inner workings for you.
>
>
> Reason: although the internal memory structure if great for moving memory from SMW's OAM table, it does not seem to be very user-friendly to coders. Because of that, I decided to not release the API officially until I make a model that is easy enough to work. Use this documentation section for experiment and feedback.

First you must pick which buffer you want to work with. It's preferred to work on a single buffer per time, since the 65c816 architecture only has three registers.

```
!maxtile_pointer_max        = $61C0       ; 16 bytes
!maxtile_pointer_high       = $61D0       ; 16 bytes
!maxtile_pointer_normal     = $61E0       ; 16 bytes
!maxtile_pointer_low        = $61F0       ; 16 bytes
```

Recommended AXY flags: 16-bit A/X/Y or 8-bit A, 16-bit X/Y.

Each buffer pointer provides four 16-bit values which are the following:
* !pointer+0 = tile buffer pointer (16-bit): normally pointer + #$01FC and decrements though the frame
* !pointer+2 = tile prop buffer pointer (16-bit): normally pointer + #$7F and decrements though the frame
* !pointer+4 = tile buffer initial pointer (16-bit): normally pointer + #$01FC
* !pointer+6 = tile prop initial pointer (16-bit): normally pointer + #$7F
* !pointer+8 = tile buffer zero pointer (16-bit): when the value on this address equals !pointer+0, it means the buffer is out of slots and you should not continue.
(pointer+10, pointer+12 and pointer+14 are currently reserved for future use)

All pointers belongs to bank $40. All pointers are in range $40:A000-$40:BFFF.

The tile buffer pointer points to the main OAM table for the buffer priority. The table has four tables: X positions, Y position, tile and tile properties. In binary format, it's: ``xxxx xxxx yyyy yyyy TTTT TTTT YXPPCCCt`` where xxxxxxxx is the x-position, yyyyyyyy is the y-position, tTTTTTTTT is the tile to be used, Y is y-flip flag, X is the x-flip flag, PP is priority bits against layers and CCC is the palette based index 8. Four bytes per OAM slot.

The tile prop pointer points to the attribute OAM table for setting the size and the X-position high byte. Format: ``---- --sx``. If s is set, your tile will be 16x16, otherwise 8x8. If x is set, your x-position will be negative in 2's complement format. One byte per OAM slot.

When drawing, you load !pointer+0 value. Compared if !pointer+0 is equals to !pointer+4. If it is, it means the buffer ran out of slots and you **must** stop the drawing.
If the slot is available, then you draw your tile and decrement the slot by 4. Do the same for the !pointer+2 and !pointer+6.

Example UberASM file:

```
!maxtile_pointer_max = $61C0

main:
	REP #$10
	
	; Retrieve MaxTile pointer and check if it's free
	LDX !maxtile_pointer_max+0
	CPX !maxtile_pointer_max+8
	BEQ .no_slot
	
	; Draw at position ($78, $68)
	LDA #$78
	STA $400000,x
	LDA #$68
	STA $400001,x
	
	; Draw a star tile
	LDA #$48
	STA $400002,x
	
	; Use palette A and maximum priority
	LDA.b #%00110100
	STA $400003,x
	
	; Decrement slot and store back to pointer
    DEX #4
    STX !maxtile_pointer_max+0
    
    LDX !maxtile_pointer_max+2
    
	; Now store the properties of our new sprite
	LDA #$02
	STA $400000,x
    
    ; Decrement and store back to pointer
    DEX
    STX !maxtile_pointer_max+2
	
	; End of the routine.
.no_slot
	SEP #$30
	RTL
```

This code should draw a 16x16 star on the center of the screen and it should have priority over absolutely all other sprites!
