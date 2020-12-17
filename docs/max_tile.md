MaxTile
=======

MaxTile is a new feature developed for SA-1 Pack v1.40 designed to effectively use all available OAM slots on Super Mario World regardless of the sprite type or game mode and keeping the maximum possible compatibility with the vanilla sprites and custom sprites designed before the system.

## Features
- Provides four preconfigured OAM tables for different priorities;
- Leaves the standard OAM table untouched till the end of the frame;

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

