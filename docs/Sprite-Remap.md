# Arujus's More Sprites Patch Remap

> The main task of the patch is to remap three sprite tables that were previously on the direct page off of the direct page, namely the sprite number table, the X position low byte table and the Y position low byte table. The main idea for doing this is to store three pointers on the direct page that point to the appropriate indices into these tables and then replace accesses to the old sprite tables indexed by x with indirect accesses to one of the pointers on the direct page, which will point to the correct address into the new sprite table.

Arujus's words extracted from `more_sprites.asm`. The main challenge of the sprite expansion patch wasn't to remap the sprite tables to I-RAM, nor expand them, but move three tables in particular from direct page addressing to absolute addressing without having to reallocate half of the game code. With the remapping done, it was fairly trivial to expand the direct page addressing sprite tables to 22 bytes long with the extra space freed from the other direct page tables.

## 'More Sprites' Special DP Addresses
These addresses are updated as soon as a sprite starts executing and are workarounds for when it's not possible to change a 2-byte to 3-byte opcode to accomodate`$3200+x`,`$3216+x`and`$322C+x`.

DP    | Size    | Description
:----:|:-------:|-------------
`$87` | 1 byte  | Holds the current sprite number. Used when a sprite can't load `$B4` indirectly, for example when it wants to load it on the X/Y register instead of the accumulator A.
`$B4` | 2 bytes | Points to`$3200`+ current sprite slot, which holds the current sprite number.
`$CC` | 2 bytes | Points to`$3216`+ current sprite slot, which holds the current sprite Y position low byte.
`$EE` | 2 bytes | Points to`$322C`+ current sprite slot, which holds the current sprite X position low byte.

## Sprite Tables Memory Map
Below is the memory map of all sprite tables. Each table is now 22 bytes long, compared to the original SMW which was 12 bytes long.
	
### Direct Page I-RAM Addresses
Start  |  End  | Description
:-----:|:-----:|-------------
`$309E`|`$30B3`| SMW's `$7E:00AA`
`$30B6`|`$30CB`| SMW's `$7E:00B6`
`$30D8`|`$30ED`| SMW's `$7E:00C2`

### Absolute I-RAM Addresses
Start  |  End  | Description
:-----:|:-----:|-------------
`$3200`|`$3215`| SMW's `$7E:009E` *(used to be Direct Page)*
`$3216`|`$322B`| SMW's `$7E:00D8` *(used to be Direct Page)*
`$322C`|`$3241`| SMW's `$7E:00E4` *(used to be Direct Page)*
`$3242`|`$3257`| SMW's `$7E:14C8`
`$3258`|`$326D`| SMW's `$7E:14D4`
`$326E`|`$3283`| SMW's `$7E:14E0`
`$3284`|`$3299`| SMW's `$7E:151C`
`$329A`|`$32AF`| SMW's `$7E:1528`
`$32B0`|`$32C5`| SMW's `$7E:1534`
`$32C6`|`$32DB`| SMW's `$7E:1540`
`$32DC`|`$32F1`| SMW's `$7E:154C`
`$32F2`|`$3307`| SMW's `$7E:1558`
`$3308`|`$331D`| SMW's `$7E:1564`
`$331E`|`$3333`| SMW's `$7E:1570`
`$3334`|`$3349`| SMW's `$7E:157C`
`$334A`|`$335F`| SMW's `$7E:1588`
`$3360`|`$3375`| SMW's `$7E:1594`
`$3376`|`$338B`| SMW's `$7E:15A0`
`$338C`|`$33A1`| SMW's `$7E:15AC`
`$33A2`|`$33B7`| SMW's `$7E:15EA`
`$33B8`|`$33CD`| SMW's `$7E:15F6`
`$33CE`|`$33E3`| SMW's `$7E:1602`
`$33E4`|`$33F9`| SMW's `$7E:160E`
`$33FA`|`$340F`| SMW's `$7E:163E`
`$3410`|`$3425`| SMW's `$7E:187B`

### Absolute BW-RAM Addresses
Start  |  End  | Description
:-----:|:-----:|-------------
`$74C8`|`$74DD`| SMW's `$7E:14EC`
`$74DE`|`$74F3`| SMW's `$7E:14F8`
`$74F4`|`$7509`| SMW's `$7E:1504`
`$750A`|`$751F`| SMW's `$7E:1510`
`$7520`|`$7535`| SMW's `$7E:15B8`
`$7536`|`$754B`| SMW's `$7E:15C4`
`$754C`|`$7561`| SMW's `$7E:15D0`
`$7562`|`$7577`| SMW's `$7E:15DC`
`$7578`|`$758D`| SMW's `$7E:161A`
`$758E`|`$75A3`| SMW's `$7E:1626`
`$75A4`|`$75B9`| SMW's `$7E:1632`
`$7658`|`$766D`| SMW's `$7E:190F`
`$766E`|`$7683`| SMW's `$7E:1FD6`
`$7FD6`|`$7FEB`| SMW's `$7E:1FE2`
`$75BA`|`$75CF`| SMW's `$7E:164A`
`$75D0`|`$75E5`| SMW's `$7E:1656`
`$75EA`|`$75FF`| SMW's `$7E:1662`
`$7600`|`$7615`| SMW's `$7E:166E`
`$7616`|`$762B`| SMW's `$7E:167A`
`$762C`|`$7641`| SMW's `$7E:1686`
`$7642`|`$7657`| SMW's `$7E:186C`
