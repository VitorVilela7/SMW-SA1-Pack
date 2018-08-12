# Memory Map Summary

This is a quick summary of the memory changes made by the SAS Memory Map and by SA-1 Pack.

## Hybrid Remapping
It's possible to write code that works with both SA-1 Pack SMW ROMs and regular SMW ROMs by detecting the ROM mapper and using a couple of defines depending of the ROM type detected. Take a look at [remap.asm](/docs/remap.asm).

More important than making hybrid ASM code, it's understanding how the SA-1 memory map works and how you can make your code potentially much faster and with a higher compatibility on SA-1 SMW ROMs. This document contains a well-summarized information about the SA-1 memory map.

## ROM Memory Map
SA-1 features the Super MMC, a memory controller that can support ROMs larger than 4 MB. It offers bank switching support though registers`$2220-$2223`, which allows switching ROM data in blocks of 1 MB.

### LoROM banks
Applies for any ROM size.

Bank Range | Description
-----------|-------------
`$00-$1F`|1st Mbyte of the ROM. Super MMC register`$2220`CXB.
`$20-$3F`|2nd Mbyte of the ROM. Super MMC register`$2221`DXB.
`$80-$9F`|3rd Mbyte of the ROM. Super MMC register`$2222`EXB.
`$A0-$BF`|4th Mbyte of the ROM. Super MMC register`$2223`FXB.

### HiROM banks
Applies for ROMs up to 4 MB.

Bank Range | Description
-----------|-------------
`$C0-$CF`|1st Mbyte of the ROM. Super MMC register`$2220`CXB.
`$D0-$DF`|2nd Mbyte of the ROM. Super MMC register`$2221`DXB.
`$E0-$EF`|3rd Mbyte of the ROM. Super MMC register`$2222`EXB.
`$F0-$FF`|4th Mbyte of the ROM. Super MMC register`$2223`FXB.

### ExHiROM banks
Applies for ROMs larger than 4 MB and up to 8 MB. LoROM mapping is not affected for the way SA-1 Pack configures the SAS Memory Map.

Bank Range | Description
-----------|-------------
`$C0-$CF`|5th Mbyte of the ROM. Super MMC register`$2220`CXB.
`$D0-$DF`|6th Mbyte of the ROM. Super MMC register`$2221`DXB.
`$E0-$EF`|7th Mbyte of the ROM. Super MMC register`$2222`EXB.
`$F0-$FF`|8th Mbyte of the ROM. Super MMC register`$2223`FXB.

### Dual ROM System
The Dual ROM system works by merging two or more ROMs in a single one and selecting which ROM image to project using the Super MMC registers. For example, two 4 MB ROMs can be merged and the first ROM can be loaded by loading values`$00-$03`to the registers`$2220-$2223` and the second ROM can be loaded by loading values`$04-$07`to the same registers.

In practice, the Dual ROM system allows to either merge two games together or double the amount of resources available (levels, map16, music, sprites, overworlds, etc.) with the compromise of having to control two or more gamepak ROMs at the same time.

SA-1 Pack currently does not include a Dual ROM system controller.

## RAM Memory Map
The SA-1 CPU (C-CPU) can't access the W-RAM, therefore to transfer some routine to it it's required to remap most of the game memory either to I-RAM or BW-RAM. Other than that, both S-CPU and C-CPU memory maps are fairly similar.

### RAM banks
Banks    | Access | Description
:-------:|:------:|-------------
`$00-$3F`| C-CPU  | I-RAM at addresses`$0000-$07FF` @ 10.74 MHz
`$00-$3F`| S-CPU  | W-RAM at addresses`$0000-$1FFF` @ 2.68 MHz
`$00-$3F`| Both   | I-RAM at addresses`$3000-$37FF` @ 10.74 MHz
`$00-$3F`| Both   | BW-RAM Virtual Memory at addresses`$6000-$7FFF` @ 5.37 MHz
`$40-$4F`| Both   | BW-RAM @ 5.37 MHz
`$60-$6F`| C-CPU  | BW-RAM Virtual Bitmap Memory @ 5.37 MHz
`$7E-$7F`| S-CPU  | W-RAM @ 2.68 MHz
`$80-$BF`| C-CPU  | I-RAM at addresses`$0000-$07FF` @ 10.74 MHz
`$80-$BF`| S-CPU  | W-RAM at addresses`$0000-$1FFF` @ 2.68 MHz
`$80-$BF`| Both   | I-RAM at addresses`$3000-$37FF` @ 10.74 MHz
`$80-$BF`| Both   | BW-RAM Virtual Memory at addresses`$6000-$7FFF` @ 5.37 MHz

### 16-bit (Absolute) Addresses

From | To | Comment
:---:|:--:|---------
`$0000-$00FF`|`$3000-$30FF`| Note that you don't need to change direct page opcodes, like`LDA $19`. The remap only applies to 16-bit opcodes such as`JML [$0000]`or`LDX $00B6,y`.
`$0100-$1FFF`|`$6100-$7FFF`|You also can change data bank to `$40` and stay with the address, paying attention to the other RAM addresses outside the range.

### 24-bit (Absolute Long) Addresses

From               | To                | Comment
:-----------------:|:-----------------:|---------
`$7E:1938-$7E:19B7`|`$41:8A00-$41:8AFE`| Used to be 16-bit (absolute) addressed, now 24-bit (absolute long) to accommodate more sprite entries per level (from 128 to 255).
`$7E:C800-$7E:FFFF`|`$40:C800-$40:FFFF`| Map16 low byte plus Overworld related data.
`$7F:9A7B-$7F:9C7A`|`$41:8800-$41:89FF`| Wiggler's segment buffer.
`$7F:C700-$7F:FFFF`|`$41:C800-$41:FFFF`| Map16 high byte.

### S-RAM
The S-RAM (static memory) banks used to be banks`$70-$71`, but the SAS Memory Map replaces it with BW-RAM, which is also used as work RAM and has is allocated though banks`$40-$43`. The remapped addresses are stated below.

From               | To                | Comment
:-----------------:|:-----------------:|---------
`$70:0000-$70:07FF`|`$41:C000-$41:C7FF`| Original save memory (2 kB big). Not everything is used.
`$70:0800-$70:27FF`|`$41:A000-$41:BFFF`| Expansion area planned for SMW hacks.


### Sprite Tables
Although the sprite tables are all 16-bit (absolute) addresses and therefore were remapped together to the BW-RAM, Arujus's More Sprites patch had to move them again to accommodate the expanded 22 sprites slots limits. Read more at [Sprite Remap](/docs/Sprite-Remap.md) doc.