# Known Issues

Developed since 2012, one of the biggest SA-1 Pack challenges is to deal with potential emulation issues, because of the chip complexity and the so little known, accurate information about the SA-1 system.

Along that, there is always some issues that is from the SA-1 Pack itself and needs to be corrected. This document will attempt to list some potential issues the patch will present on emulators as well on real consoles.

For consistency, only issues from latest version of each emulator will be listed, with rare exceptions.

## sd2snes
* TO DO

## Real SA-1 cart
* TO DO

## bsnes
bsnes refers to the SNES part of higan.
* TO DO

## Snes9x
* TO DO

## ZSNES
* The SA-1 CPU is 42% slower than the nominal 10.74 MHz clock. It's clocked at ~6.18 MHz instead.
* Random crashes and freezes are often common, with an unknown reason for that.
* It's not possible to execute code on I-RAM nor BW-RAM. Applies to both SA-1 CPU and SNES CPU. To workaround, code must be placed and executed on the W-RAM.
* There is no Character Conversion support, with the exception from the one that Super Mario RPG uses.
* Can drop frames out of sudden depending of the code executed on the SNES CPU.
* Does not lock access to any of the SNES registers. SA-1 can even DMA to the VRAM.
* Does not generate IRQ after SA-1 DMA execution.
* Does not support 256 kB BW-RAM.
* Does not support 8 MB ROMs.
* The first 128 kB on the last 2 megabytes on 6 MB ROMs is unusable because ZSNES uses it as an actual memory and for other tables.
* The H-Blank flag from bit 6 of $4212 does not work correctly.
* And more coming.