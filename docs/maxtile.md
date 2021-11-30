MaxTile
=======

MaxTile is a new feature developed for SA-1 Pack v1.40 designed to effectively use all available
OAM slots on Super Mario World regardless of the sprite type or game mode and keeping the maximum
possible compatibility with the vanilla sprites and custom sprites designed before the system.

## Features
* Provides four OAM tables for different sprite<->sprite priorities;
* Shared MaxTile routines for easier integration;
* Leaves the standard OAM table untouched till the end of the frame (with exceptions of regular sprites);
* Allows up to 128 sprites *tiles* on screen;
* High compatibility with already designed sprites, including vanilla sprites, mode 7 bosses, overworld, behind scenery behavior, Yoshi and Lakitu;
* Restores the original priority behavior of Super Mario World, which was incorrectly reserved on NMSTL; and
* Compatible with NMSTL sprites.

## The priority structure

MaxTile provides four different priorities, from #0 to #3, where #0 is the highest priority
(appears in front of all other OAM tiles) and #3 is the lowest priority (appears behind all OAM
tiles).

The buffers also have names. #0 is called max buffer, #1 is called high buffer, #2 normal buffer
and #3 low buffer.

You write to each buffer in backwards order, which means that your first tile will have the lowest
priority and your last tile will have the highest priority. This means that *if you always use the
same maxtile buffer*, tiles drawn at the beginning of the frame will have lowest priority and
tiles drawn at end of the frame will have the highest priority.

If preferred, you can take one of the maxtile pointers, subtract by the amount of tiles you will
draw and run your graphics routine normally incrementing Y without having to reorder your drawing
priority.

When the four priority buffers are assembled into a single buffer, the OAM table ($0200-$03FF) will
be built in the following way:

* maxtile buffer #0 (highest priority)
* maxtile buffer #1
* maxtile buffer #2
* maxtile buffer #3 (lowest priority)

They are copied to $0200-$03FF backwards, the copy will start at $03FC, then $03F8, $03F4, etc.,
until it reaches $0200.

> :warning: **IMPORTANT**
> * Although the four buffers combined allows up to 512 sprite tiles, the SNES PPU has the limit of 128 sprite tiles. If MaxTile notices that the 128 tile limit was exceeded, it will stop copying further tiles.
> * Even if the buffer copy order is reversed (buffer #3 is copied to end of OAM table then buffer #2, buffer #1 and buffer #0), earlier buffers will always have priority over latter buffers. MaxTile always calculates how many tiles each buffer has before copying the lowest priority and will **always** priorize buffers with higher priority.

## SMW and NMSTL compatibility

Of course if nobody uses the MaxTile API directly, no tile from the original game nor from old
sprites will ever appear because the buffers are completely empty. Because of that, MaxTile will
automatically move OAM tiles from $0200-$03FF to the MaxTile buffers though the frame to keep
compatibility with all existing resources. The copy works as the following:

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
| $40:0180       | $6180 (default) | 16 bytes  | OAM structure #0         |
| $40:0190       | $6190 (default) | 16 bytes  | OAM structure #1         |
| $40:01A0       | $61A0 (default) | 16 bytes  | OAM structure #2         |
| $40:01B0       | $61B0 (default) | 16 bytes  | OAM structure #3         |
| $40:B600       | $7600 (#$05)    | 128 bytes | OAM properties buffer #0 |
| $40:B680       | $7680 (#$05)    | 128 bytes | OAM properties buffer #1 |
| $40:B700       | $7700 (#$05)    | 128 bytes | OAM properties buffer #2 |
| $40:B780       | $7780 (#$05)    | 128 bytes | OAM properties buffer #3 |
| $40:B800       | $7800 (#$05)    | 512 bytes | OAM buffer #0            |
| $40:BA00       | $7A00 (#$05)    | 512 bytes | OAM buffer #1            |
| $40:BC00       | $7C00 (#$05)    | 512 bytes | OAM buffer #2            |
| $40:BE00       | $7E00 (#$05)    | 512 bytes | OAM buffer #3            |

VBW-RAM is the BW-RAM mirror basically combo'ed with $318F and $2225, an alternative for accessing
the buffer using the Direct Page or RAM data banks.

> :warning: **IMPORTANT**
> Always use the pointers values from $6180+.
> The buffers located at $40:B600+ may change on newer SA-1 Pack versions.
> However, the $2225/$318F value will always be #$05 ($40:A000-$40:BFFF)

## API

```
; MaxTile shared routines
maxtile_flush_nmstl         = $0084A8
maxtile_get_sprite_slot     = $0084AC
maxtile_get_slot            = $0084B0
maxtile_finish_oam          = $0084B4
```

### maxtile_flush_nmstl
JSL $0084A8

Flushes $0338-$03FC to the MaxTile internal buffer (priority #3).

Input params:
> * AXY 8-bit

### maxtile_get_sprite_slot
JSL $0084AC

Allocate and get OAM pointer from MaxTile.
Difference between get_oam_slot_general is:
> * Amount of slots is passed via "A"
> * No 16-bit AXY required.
> * Slot is also copied to $0C ($3100) and $0E ($3102).

### maxtile_get_slot
JSL $0084B0

Allocate and get OAM pointer from MaxTile
The routine automatically adjusts internal MaxTile pointers for you.

Input params:
> * AXY 16-bit
> * Y = how many slots to be allocated (min: #$0001 - 1 slot, max: #$0080 - 128 slots)
> * A = priority (0: highest, 3: lowest)

Output params:
> * Carry set if the OAM allocation was success, carry clear otherwise. If you receive carry clear, drawing should be aborted for memory safety.
> * $3100-$3101 will contain the pointer to the OAM general buffer.
> * $3102-$3103 will contain the pointer to the OAM attribute buffer.
> * The pointer returned is intended to be incremented, just like normal OAM drawing routines.
> * $3100-$3103 will be used by FinishOAMWrite routine version MaxTile. Don't modify the values unless you don't plan to use FinishOAMWrite routine.

### maxtile_finish_oam
JSL $0084B4

Input params:
> * AXY 8-bit
> * Y = the tile size (#$00 or #$02) or #$FF to keep the tilesize unchanged.
> * A = how many slots minus 1

Same as FinishOAMWrite ($01B7B3), but it's made to use MaxTile pointers.
It will use the pointers placed on $3100 and $3102.

## How to use

There are three basic ways of working with MaxTile:
1. Legacy mode
2. Direct mode
3. Allocation mode

Each way provides advantagens and disadvantages and you should pick the one that is the most
comfortable for you.

When using the modes, MaxTile provides you a few shared routines that you can use. For details,
see the API section.

> :warning: **IMPORTANT**
> Direct mode and Allocation mode requires XY registers to be 16-bit.
> Caution when doing indexes calculation using the A register, specially in A 8-bit mode
> Remember that the high byte is passed to XY registers regardless if A is 8-bit or 16-bit mode.

### Legacy mode

Legacy mode is the easiest and the slowest way to work with MaxTile.
With legacy mode, you continue writing to $6200-$63FF normally (the OAM table) and MaxTile
will take the tiles for you at the end of the frame.

When you are on the NMSTL working area, $6338-$63FC, MaxTile includes a "flush" routine that
cleans up previously used slots on the region, so after calling it you can start writing at $6338
without having to worry about overwriting any tile.

Advantages:
* Compatible with all previous resources.
* Works with shared SMW routines that manipulates OAM tile buffer.
* You can override or change the priority directly against a SMW tile.
* You don't have to rewrite your routine for MaxTile suport.

Disadvantages:
* Slow, every time MaxTile has to scan for used slots and move to the internal buffers.
* You can't specify a priority, it will either be the one relative to the hardcoded slot or just before or after a standard sprite.
* You are limited to drawing 50 tiles at once, pretty much limited to a 112x112 sprite.

If you are *outside a regular sprite*, to use and draw in the $6338-$63FC area,
make a call to $0084A8 (maxtile_flush_nmstl).

### Direct mode

With direct mode, you write directly to one of the MaxTile buffers.
Being simple, this method is recommended for drawing a few, simple tiles per time.

Advantages:
* You can use the priority system (0-3)
* Fast, you write directly to the buffer.

Disadvantages:
* The buffer must be written backwards (DEX/DEY #4), which can screw up individual tile priority if not paid attention. It also makes harder to port routines that used to increment the buffer (INY #4) instead.
* You must check every time the pointer to see if you can continue writing to the buffer or if you ran out of slots.
* You must manipulate all the MaxTile pointers yourself. If you miss something, undefined behavior will happen.
* 16-bit X/Y mode (storing via STA $400000,x or STA $0000,y + DB) or indirect mode (STA ($0C) + DB) is required.

Example:

First you must pick which buffer you want to work with. It's preferred to work on a single buffer
per time, since the 65c816 architecture only has three registers.

```
!maxtile_pointer_max        = $6180       ; 16 bytes
!maxtile_pointer_high       = $6190       ; 16 bytes
!maxtile_pointer_normal     = $61A0       ; 16 bytes
!maxtile_pointer_low        = $61B0       ; 16 bytes
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

The tile buffer pointer points to the main OAM table for the buffer priority. The table has four
tables: X positions, Y position, tile and tile properties. In binary format, it's:
``xxxx xxxx yyyy yyyy TTTT TTTT YXPPCCCt`` where xxxxxxxx is the x-position, yyyyyyyy is the
y-position, tTTTTTTTT is the tile to be used, Y is y-flip flag, X is the x-flip flag, PP is
priority bits against layers and CCC is the palette based index 8. Four bytes per OAM slot.

The tile prop pointer points to the attribute OAM table for setting the size and the X-position
high byte. Format: ``---- --sx``. If s is set, your tile will be 16x16, otherwise 8x8. If x is set,
your x-position will be negative in 2's complement format. One byte per OAM slot.

When drawing, you load !pointer+0 value. Compared if !pointer+0 is equals to !pointer+8. If it is,
it means the buffer ran out of slots and you **must** stop the drawing.

If the slot is available, then you draw your tile and decrement the slot by 4. Do the same for the
!pointer+2 and !pointer+6.

Example UberASM file:

```
!maxtile_pointer_max = $6180

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

This code should draw a 16x16 star on the center of the screen and it should have
priority over absolutely all other sprites!

### Allocation mode

Allocation mode works by calling a MaxTile shared routine asking how many slots you want
and what priority you will use. Then MaxTile will give you an answer if the allocation was
successful (or if it ran out of slots) and the OAM main buffer pointer and the OAM attribute
pointer at $3100 and $3102.

Advantages:
* You can use the priority system (0-3).
* Fast, you write directly to the buffer.
* You know ahead of time if the game has sufficient slots before drawing.
* You don't need to know nor have to manipulate any of the control pointers of MaxTile. The only thing you have is to load the index given and write to $400000+index.
* You can write to the buffer in the forward direction (INX/INY #4), since the shared routines allocates at once the required values.

Disadvantages:
* You need to allocate a bunch of tiles at once, so you have to count how many tiles you will draw from the beginning.
* 16-bit X/Y mode (storing via STA $400000,x or STA $0000,y + DB) or indirect mode (STA ($0C) + DB) is required.

Example:

```
    rep #$30
    ; The amount of tiles to request (4 tiles)
    ldy.w #$0004
    ; The priority (buffer 1 - high priority)
    lda.w #$0001
    jsl maxtile_get_slot
    sep #$20
    
    ldx $3100
    ; draw your tiles here via sta $400000,x 
    
    ldx $3102
    ; draw your tiles properties here via sta $400000,x
```

Alternatively, you can set the databank to #$40 and you can use the Y index for writing.
Keeping in mind that $3100 and $3102 are absolute addresses and requires the databank to be
$00-$3F/$80-$BF.

It's recommended to copy them to $0C and $0E (Direct Page) since you can access them regardless of
the current value of the data bank register.
