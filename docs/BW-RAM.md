BW-RAM
======

BW-RAM is the SA-1 backup and work memory. Plays a similar role to the S-RAM, but it is also part of the work memory considering the SA-1 CPU does not have W-RAM access.

Clocked at 5.37 MHz, the BW-RAM has a configurable size, varying from 2 kB to 256 kB. Currently SA-1 Pack sets the BW-RAM size to 128 kB.

The BW-RAM is mapped on banks`$40-$4F`, with its contents mirrored though banks`$42-$4F`(assuming 128 kB BW-RAM).

### Virtual Memory

The SAS (Super Accelerator System) Memory Map also mirrors a page of the BW-RAM on`$6000-$7FFF`though banks`$00-$3F`and`$80-$BF`. By default, SA-1 Pack maps`$6000-$7FFF` to`$40:0000-$40:1FFF`, **but the SAS allows to it be mapped to any page.** Using register `$2224` for the S-CPU and `$2225` for the C-CPU, you can define to which page`$6000-$7FFF`maps to. Currently SA-1 Pack preserves`$2225` by pushing `$318F` during interrupts and storing back to `$2225` during SA-1 IRQs.

### Virtual VRAM

Banks `$60-$6F` on the SA-1 CPU Memory Map are also known as **Virtual Bitmap VRAM** or **Bitmap Data Storage Area**. It's an area made for drawing 4BPP or 2BPP bitmap images. The SAS splits and projects the BW-RAM into blocks of four or two bits to the region. See the Memory Map document for more information about it.

The region can also be mirrored to`$6000-$7FFF`though bit 7 of the register`$2225`.

### Access Time

The BW-RAM has unrestricted access from both C-CPU and S-CPU. However, because it's clocked at 5.37 MHz, there's an additional memory cycle on the SA-1 CPU.

For example,`STA $400000`(8-bit A) will take six 10.74 MHz cycles and not five. The "effective speed" on this case will be ~8.95 MHz.
`STA $00`(DP =`$6000`, 16-bit A) will take six 10.74 MHz cycles compared to four. "Effective speed" will be ~7.16 MHz.

## BW-RAM Memory Map

**Page** in this document refers to a block of `0x2000` or 8192 bytes.

**Not cleared** means that the region is not cleared and is therefore saved to the cart S-RAM.

##### Page 0
Start     | End      | Description
:--------:|:--------:|-------------
`$40:0000`|`$40:00FF`| Empty. Not cleared. Strongly not recommended to use, because it's the memory region used by Sprite Tool to put additional sprite tables.
`$40:0100`|`$40:010A`| SMW's`$7E:0100-$7E:010A`.
`$40:010B`|`$40:010C`| Stores current level number on most LevelASM/UberASM patches/tool.
`$40:010D`|`$40:010F`| **Reserved by SA-1 Pack for future expansion.**
`$40:0110`|`$40:0112`| Finish OAM hook. This is a 24-bit pointer to execute custom code before finishing the OAM writing area. This is useful in case you want to take the remaining OAM slots or rearrange it before it's rendered to the screen. This also ensures that no other code will override the OAM table, since it's running on the end of the frame. SA-1 CPU will be used to execute the code. To activate it, store the 24-bit pointer *every frame* on $6110-$6112, since $6110-$6111 is automatically cleared before it jumps to the pointer you specified.
`$40:0113`|`$40:017F`| **Reserved by SA-1 Pack for future expansion.**
`$40:0180`|`$40:018F`| MaxTile pointer #0
`$40:0190`|`$40:019F`| MaxTile pointer #1
`$40:01A0`|`$40:01AF`| MaxTile pointer #2
`$40:01B0`|`$40:01BF`| MaxTile pointer #3
`$40:01C0`|`$40:01FF`| Empty. Cleared at reset and title screen load. Originally reserved for S-CPU's stack, which stayed at W-RAM and was moved to`$7E:1F00-$7E:1FFF`. **Reserved by SA-1 Pack for future expansion.**

`$40:0200`|`$40:1FFF`| SMW's`$7E:0200-$7E:1FFF`.
##### Page 1
Start     | End      | Description
:--------:|:--------:|-------------
`$40:2000`|`$40:3FFF`| Empty. Not cleared. Strongly recommended to use the region as Character Conversion 1 bitmap buffer, which is mapped to`$60:4000-$60:7FFF` (VRAM 4BPP mode) or `$60:8000-$60:FFFF` (VRAM 2BPP mode).
##### Pages 2-7
(`$4000-$5FFF`,`$6000-$7FFF`,`$8000-$9FFF`,`$A000-$BFFF`,`$C000-$DFFF`,`$E000-$FFFF`)

Start     | End      | Description
:--------:|:--------:|-------------
`$40:4000`|`$40:AFFF`| Empty. Not cleared.
`$40:B000`|`$40:BFFF`| **Reserved by SA-1 MaxTile**
`$40:C000`|`$40:C7FF`| Empty. Not cleared.
`$40:C800`|`$40:FFFF`| SMW's`$7E:C800-$7E:FFFF`.

##### Pages 8-11
(`$0000-$1FFF`,`$2000-$3FFF`,`$4000-$5FFF`,`$6000-$7FFF`)

Start     | End      | Description
:--------:|:--------:|-------------
`$41:0000`|`$41:7FFF`| Used as a general-purpose buffer by SA-1 Pack, including GFX decompression. Also used on RPG Hacker's VWF dialogues. 32 kB total.

##### Page 12

Start     | End      | Description
:--------:|:--------:|-------------
`$41:8000`|`$41:87FF`| smkdan's dynamic sprites (dsx) buffer. If dynamic sprites are not used, empty. Not cleared.
`$41:8800`|`$41:89FF`| SMW's`$7F:9A7B`. Wiggler's segment buffer.
`$41:8A00`|`$41:8AFE`| SMW's`$7E:1938`. Sprite load status within the level, extended to 255 entries.
`$41:8AFF`|`$41:9FFF`| Empty. Not cleared. It's 5377 bytes (~5.25 KB) free in total.

##### Page 13
Start     | End      | Description
:--------:|:--------:|-------------
`$41:A000`|`$41:BFFF`| Reserved for SRAM Expansion Area. May be used by S-RAM/BW-RAM Plus. Otherwise empty, not cleared.

##### Pages 14-15
(`$C000-$DFFF`,`$E000-$FFFF`)

Start     | End      | Description
:--------:|:--------:|-------------
`$41:C000`|`$41:C7FF`| SMW's SRAM Area. Originally`$70:0000-$70:07FF`, which is now unmapped and replaced by the BW-RAM.
`$41:C800`|`$41:FFFF`| SMW's`$7F:C800-$7F:FFFF`.
