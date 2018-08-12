; I-RAM
XX -> Any bank which has content mirrored. In other words, banks $00 to $3F and $80 to $BF.

$XX:3000-$XX:30FF -> SMW's $7E:0000-$7E:00FF + some Sprite Remap addresses.
$XX:3100-$XX:313F -> Extended Scratch RAM for SA-1. Sometimes $00-$07 is used.
$XX:3140-$XX:317E -> Free, gets cleared at reset.
$XX:317F          -> Character Conversion DMA Slots. If non-zero, the Character Conversion DMA runs on NMI.
$XX:3180-$XX:3182 -> SA-1 Code Pointer (SNES->SA-1).
$XX:3183-$XX:3185 -> SNES Code Pointer (SA-1->SNES).
$XX:3186-$XX:3188 -> SA-1 Background Mode Pointer.
$XX:3189          -> SA-1 Ready Flag (changes to #$01 when $3080-$3082 is finalized).
$XX:318A          -> SNES Ready Flag (changes to #$01 when $3083-$3085 is finalized).
$XX:318B          -> Backgrond Mode Flag (set to #$01 to start SA-1 Background Mode).
$XX:318C          -> SA-1 DMA Flag (changes to #$01 when a SA-1 DMA is finished).
$XX:318D          -> Character Conversion DMA Flag (changes to #$01 when Character
                  -> Conversion DMA is enabled).
                  ->
$XX:318E          -> Compability Flags (zw------)
                  -> w: Sets to 1 when Super MMC registers's value gets reversed, thus swaping 3rd bit at $2220-$2223.
		  -> z: ZSNES flag, used to change a few IRQ stuff.
		  ->
$XX:318F          -> Value of register $2225. If you change $2225, make sure to change this too.
$XX:3190-$XX:31DF -> Character Conversion DMA table. This table is 80 bytes long and allows up to 10 slots.
$XX:31E0-$XX:31FF -> Reserved for Background Mode.
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
$XX:3426-$XX:36FF -> Free, gets cleared at reset.
$XX:3700-$XX:377F -> Character Conversion DMA buffer. Uses 32 bytes for 2bpp mode, 64 bytes for 4bpp and 128 for 8bpp.
$XX:3780-$XX:37FF -> Stack. It's safe to override $3700-$377F when Character Conversion DMA is not running, or if the emulator isn't accurate (like ZSNES).