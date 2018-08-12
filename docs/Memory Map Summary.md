This is a quick summary of the changes that SA-1 makes in your ROM and the procedures you should take for converting a resource for SA-1 Pack compatibility.

16-bit addresses:

$0000-$00FF -> $3000-$30FF (Note that you don't need to change direct page opcodes, like LDA $19. This remap only applies to 16-bit opcodes like LDA $0019).
$0100-$1FFF -> $6100-$7FFF.

24-bit addresses:

$7E:0000-$7E:00FF -> $00:3000-$00:30FF.
$7E:0100-$7E:1FFF -> $00:6100-$00:7FFF or $40:0100-$40:1FFF.
$7E:C800-$7E:FFFF -> $40:C800-$40:FFFF.
$7F:C700-$7F:FFFF -> $41:C800-$41:FFFF.

SRAM:

$70:0000-$70:07FF to $41:C000-$41:C7FF.
$70:0800-$70:27FF to $41:A000-$41:BFFF (extended area).

Rare cases:

$7F:9A7B-$7F:9C7A to $41:8800-$41:89FF.
$7E:1938-$7E:19B7 to $41:8A00-$41:8AFE.

Sprite tables:

Because SA-1 Pack extends the maximum number of sprites on screen to 20, all its table had to be
moved to another place that allows more RAM available.

	-> Each address is 22 bytes long
	-> The first group are the addresses that are still at DP (I-RAM).
	-> The second group are the addresses that are at I-RAM.
	-> The third group are the addresses that are at BW-RAM.
	-> "!" means that the RAM got moved from Direct Page ($XX) to Absolute Addressing ($XXXX).

$XX:309E-$XX:30B3 -> SMW's $7E:00AA
$XX:30B6-$XX:30CB -> SMW's $7E:00B6
$XX:30D8-$XX:30ED -> SMW's $7E:00C2

$XX:3200-$XX:3215 -> SMW's $7E:009E !
$XX:3216-$XX:322B -> SMW's $7E:00D8 !
$XX:322C-$XX:3241 -> SMW's $7E:00E4 !
$XX:3242-$XX:3257 -> SMW's $7E:14C8
$XX:3258-$XX:326D -> SMW's $7E:14D4
$XX:326E-$XX:3283 -> SMW's $7E:14E0
$XX:3284-$XX:3299 -> SMW's $7E:151C
$XX:329A-$XX:32AF -> SMW's $7E:1528
$XX:32B0-$XX:32C5 -> SMW's $7E:1534
$XX:32C6-$XX:32DB -> SMW's $7E:1540
$XX:32DC-$XX:32F1 -> SMW's $7E:154C
$XX:32F2-$XX:3307 -> SMW's $7E:1558
$XX:3308-$XX:331D -> SMW's $7E:1564
$XX:331E-$XX:3333 -> SMW's $7E:1570
$XX:3334-$XX:3349 -> SMW's $7E:157C
$XX:334A-$XX:335F -> SMW's $7E:1588
$XX:3360-$XX:3375 -> SMW's $7E:1594
$XX:3376-$XX:338B -> SMW's $7E:15A0
$XX:338C-$XX:33A1 -> SMW's $7E:15AC
$XX:33A2-$XX:33B7 -> SMW's $7E:15EA
$XX:33B8-$XX:33CD -> SMW's $7E:15F6
$XX:33CE-$XX:33E3 -> SMW's $7E:1602
$XX:33E4-$XX:33F9 -> SMW's $7E:160E
$XX:33FA-$XX:340F -> SMW's $7E:163E
$XX:3410-$XX:3425 -> SMW's $7E:187B

$XX:74C8-$XX:74DD -> SMW's $7E:14EC
$XX:74DE-$XX:74F3 -> SMW's $7E:14F8
$XX:74F4-$XX:7509 -> SMW's $7E:1504
$XX:750A-$XX:751F -> SMW's $7E:1510
$XX:7520-$XX:7535 -> SMW's $7E:15B8
$XX:7536-$XX:754B -> SMW's $7E:15C4
$XX:754C-$XX:7561 -> SMW's $7E:15D0
$XX:7562-$XX:7577 -> SMW's $7E:15DC
$XX:7578-$XX:758D -> SMW's $7E:161A
$XX:758E-$XX:75A3 -> SMW's $7E:1626
$XX:75A4-$XX:75B9 -> SMW's $7E:1632
$XX:7658-$XX:766D -> SMW's $7E:190F
$XX:766E-$XX:7683 -> SMW's $7E:1FD6
$XX:7FD6-$XX:7FEB -> SMW's $7E:1FE2
$XX:75BA-$XX:75CF -> SMW's $7E:164A
$XX:75D0-$XX:75E5 -> SMW's $7E:1656
$XX:75EA-$XX:75FF -> SMW's $7E:1662
$XX:7600-$XX:7615 -> SMW's $7E:166E
$XX:7616-$XX:762B -> SMW's $7E:167A
$XX:762C-$XX:7641 -> SMW's $7E:1686
$XX:7642-$XX:7657 -> SMW's $7E:186C