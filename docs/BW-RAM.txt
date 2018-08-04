; BW-RAM
$40:0000-$40:00FF -> Free. Originally $7E:0000-$7E:00FF, but now it is located at $XX:3000-$XX:30FF.
$40:0100-$40:010F -> SMW's $7E:0100-$7E:010F.
$40:0110-$40:01FF -> Free. Originally SNES's stack, but it is on WRAM ($7E:1FFF and below)
$40:0200-$40:1FFF -> SMW's $7E:0200-$7E:1FFF.
$40:2000-$40:3FFF -> Best area for using Character Conversion DMA. 4/2bpp: $60:4000-$60:7FFF/$60:8000-$60:FFFF.
$40:4000-$40:C7FF -> Free to use.
$40:C800-$40:FFFF -> SMW's $7E:C800-$7E:FFFF. Contains Map16 data, lower byte.

$41:0000-$41:7FFF -> Used as decompression buffer (32 KB), or RPG Hacker's VWF dialogues.
$41:8000-$41:87FF -> Old Dynamic Sprites buffer. If you don't use Dynamic Sprites, this should be free.
$41:8800-$41:89FF -> SMW's $7F9A7B. Used to make Wigglers SA-1 compatible.
$41:8A00-$41:8AFE -> SMW's $7E1938: "Sprite load status within the level.", extended to 255 entries.
$41:8AFF-$41:9FFF -> Free. It's 5377 bytes (~5.25 KB) free in total.
$41:A000-$41:BFFF -> SRAM Expansion Area. If you isn't using SA-1 SRAM Expand, this should be free.
$41:C000-$41:C7FF -> SMW's SRAM Area. Originally $70:0000-$70:07FF.
$41:C800-$41:FFFF -> SMW's $7F:C800-$7F:FFFF. Contains Map16 data, high byte.
