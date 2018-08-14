W-RAM
=====

W-RAM (work RAM) is the SNES onboard memory. 128 kB (131072 bytes) big, it's clocked at 2.68 MHz and can be accessed though addresses`$7E:0000-$7F:FFFF`, as well on addresses`$0000-$1FFF`though banks`$00-$3F`/`$80-$BF`and though ports`$2180-$2183`on the address bus B. The SA-1 CPU can't access the W-RAM.

SA-1 Pack moves most of the W-RAM addresses to either I-RAM or BW-RAM to make the contents accessible and faster for the SA-1 system. Because of that, a good portion of the W-RAM is either left unused or modified for another cause which does not involve SA-1 CPU access.

### Code Memory
The patch places some routines on the W-RAM for several reasons, but the most important of them is to allow that SA-1 CPU will always access the ROM memory at 10.74 MHz when the SNES CPU is idle or busy doing a process that does not need ROM access.

### W-RAM Memory Map
Only modified W-RAM addresses are displayed on this document. For checking other SMW addresses, look for the SMW Central RAM map.

#### Bank $7E
Start  |  End  | Description
:-----:|:-----:|-------------
`$0000`|`$000F`| Scratch Memory. Some codes does not use the I-RAM at all for certain reasons, such as for executing code on the memory. FuSoYa's SA-1 version of LC_LZ2 and LC_LZ3 implementation are examples of that. The reason of that is ZSNES. See [Known Issues](/docs/known-issues.md) to understand why.
`$0010`|`$0FFF`| Empty. Not cleared.
`$1000`|`$1E7F`| Empty. Not cleared. **Reserved by SA-1 Pack for future expansion.**
`$1E80`|`$1E8D`| SA-1 Execute Pointer. When called, the routine will invoke the SA-1 CPU to run a certain code and wait until the execution is finished.
`$1E8E`|`$1E95`| The game main loop. It waits for a NMI and then resumes executing.
`$1E96`|`$1EA6`| The wait for H-Blank routine. Waits until h-blank starts. When the emulator is ZSNES, this routine is replaced with a special version.
`$1EA7`|`$1EFF`| Empty. Not cleared. **Reserved by SA-1 Pack for future expansion.**
`$1F00`|`$1FFF`| Reserved for the SNES CPU stack.
`$2000`|`$C7FF`| Untouched by SA-1 Pack.
`$C800`|`$FFFF`| Empty. Not cleared. **Reserved by SA-1 Pack for future expansion.**

#### Bank $7F
Start  |  End  | Description
:-----:|:-----:|-------------
`$0000`|`$9A7A`| Untouched by SA-1 Pack.
`$9A7B`|`$9C7A`| Empty. Not cleared.
`$9C7B`|`$C7FF`| Untouched by SA-1 Pack.
`$C800`|`$FFFF`| Empty. Not cleared. **Reserved by SA-1 Pack for future expansion.**