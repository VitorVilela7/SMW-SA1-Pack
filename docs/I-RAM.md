I-RAM
=====

I-RAM is the SA-1 internal memory. 2 kB (2048 bytes) big, it's clocked at 10.74 MHz and can be accessed though addresses `$3000-$37FF` on the S-CPU and `$0000-$07FF` or `$3000-$37FF` on the C-CPU
though banks `$00-$3F` and `$80-$BF`.

Being the fastest memory available, it's used mainly to hold the SMW's Direct Page,
as cache/scratch memory, some sprite tables as well C-CPU's stack and
Character Conversion DMA buffer.

The I-RAM has unrestricted memory access. C-CPU always accesses it at 10.74 MHz and S-CPU accesses at 2.68 MHz. The memory also offers write protection, useful for preventing data loss in case of a game crash. See SA-1 registers `$2229` and `$222A` for more information.

***

### I-RAM Memory Map

**Page** in this document refers to a block of `0x100` or 256 bytes.

##### Page 0
Start  |  End  | Description
:-----:|:-----:|-------------
`$3000`|`$30FF`| SMW's $7E:0000-$7E:00FF -- the Direct Page.

##### Page 1
Start  |  End  | Description
:-----:|:-----:|-------------
`$3100`|`$313F`| Extended scratch memory for the SA-1. Sometimes`$00-$07`is used in part of the boost patches, for sharing information between C-CPU and S-CPU.
`$3140`|`$317E`| Empty. Cleared on reset.
`$317F`|`-`    | Total character conversions to be done during NMI. If non-zero, the CC-DMA is executed on the next V-Blank period.
`$3180`|`$3182`| SA-1 Code Pointer (from S-CPU to C-CPU).
`$3183`|`$3185`| SNES Code Pointer (from C-CPU to S-CPU).
`$3186`|`$3188`| SA-1 Parallel Mode Pointer.
`$3189`|`-`    | SA-1 done flag (sets when the code pointed at `$3080-$3082`returns).
`$318A`|`-`    | SNES done flag (sets when the code pointed at `$3083-$3085`returns).
`$318B`|`-`    | Parallel Mode flag (set to start SA-1 Parallel Mode).
`$318C`|`-`    | SA-1 DMA done flag (sets when finished).
`$318D`|`-`    | Character Conversion DMA flag (sets when enabled).
`$318E`|`-`    | **Special Flags (zw------)** <ul><li>w: Sets to 1 when the emulator (usually Snes9x) swaps the lower and upper part of a 6 or 8MB ROM, altering the behavior of the Super MMC registers`$2220-$2223`.</li><li>z: ZSNES flag, which is used by certain parts of the patch to correct eventual emulator-specific issues.</li></ul>
`$318F`|`-`    | Copy of the register`$2225`. If you change`$2225`, make sure to change this too. It's used to preserve the register value on SA-1 IRQs.
`$3190`|`$31DF`| Character Conversion DMA table. The table is 80 bytes long and allows up to 10 slots. See also `$317F`.
`$31E0`|`$31FF`| Memory reserved and dedicated for the Parallel Mode.

##### Page 2
Start  |  End  | Description
:-----:|:-----:|-------------
`$3200`|`$3215`| SMW's`$7E:009E` *(used to be Direct Page)*
`$3216`|`$322B`| SMW's`$7E:00D8` *(used to be Direct Page)*
`$322C`|`$3241`| SMW's`$7E:00E4` *(used to be Direct Page)*
`$3242`|`$3257`| SMW's`$7E:14C8`
`$3258`|`$326D`| SMW's`$7E:14D4`
`$326E`|`$3283`| SMW's`$7E:14E0`
`$3284`|`$3299`| SMW's`$7E:151C`
`$329A`|`$32AF`| SMW's`$7E:1528`
`$32B0`|`$32C5`| SMW's`$7E:1534`
`$32C6`|`$32DB`| SMW's`$7E:1540`
`$32DC`|`$32F1`| SMW's`$7E:154C`
`$32F2`| **`$3307`** | SMW's`$7E:1558`

##### Page 3
Start  |  End  | Description
:-----:|:-----:|-------------
**`$3308`** |`$331D`| SMW's`$7E:1564`
`$331E`|`$3333`| SMW's`$7E:1570`
`$3334`|`$3349`| SMW's`$7E:157C`
`$334A`|`$335F`| SMW's`$7E:1588`
`$3360`|`$3375`| SMW's`$7E:1594`
`$3376`|`$338B`| SMW's`$7E:15A0`
`$338C`|`$33A1`| SMW's`$7E:15AC`
`$33A2`|`$33B7`| SMW's`$7E:15EA`
`$33B8`|`$33CD`| SMW's`$7E:15F6`
`$33CE`|`$33E3`| SMW's`$7E:1602`
`$33E4`|`$33F9`| SMW's`$7E:160E`
`$33FA`| **`$340F`** | SMW's`$7E:163E`

##### Page 4
Start  |  End  | Description
:-----:|:-----:|-------------
 **`$3410`** |`$3425`| SMW's`$7E:187B`
`$3426`|`$34FF`| Empty. Cleared on reset.

##### Page 5
Start  |  End  | Description
:-----:|:-----:|-------------
`$3500`|`$35FF`| Empty. Cleared on reset.

##### Page 6
Start  |  End  | Description
:-----:|:-----:|-------------
`$3600`|`$36FF`| Empty. Cleared on reset.

##### Page 7
Start  |  End  | Description
:-----:|:-----:|-------------
`$3700`|`$377F`| Character Conversion output. This memory region is used by the hardware either as a buffer during the Character Conversion 1 DMA operation or as the character output during the Character Conversion 2 operation. Uses 32 bytes for 2BPP mode, 64 bytes for 4BPP mode and 128 bytes for 8BPP mode. See the SNES development book II, Section 1, Chapter 6 for more information.
`$3780`|`$37FF`| Reserved for the SA-1 CPU stack.
