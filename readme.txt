   _____             __     _____           _    
  / ____|  /\       /_ |   |  __ \         | |   
 | (___   /  \ ______| |   | |__) |_ _  ___| | __
  \___ \ / /\ \______| |   |  ___/ _` |/ __| |/ /
  ____) / ____ \     | |   | |  | (_| | (__|   < 
 |_____/_/    \_\    |_|   |_|   \__,_|\___|_|\_\
   by Vitor Vilela                 Version 1.0

The SA-1 Pack consist of a couple of patches that enable
SA-1 and prepare your SMW ROM to use the SA-1 CPU in the
best way possible.

;===================================================;
; Features                                          ;
;===================================================;

 - Features SA-1's 10.74 MHz speed, which is four
times faster than the SNES. Since SA-1 and SNES can
run at the same time, the game can run 5 times faster
than usual.

 - Decreases the level loading time and almost kills
all slowdown instances present in Super Mario World.
 
 - 8MB Support for bsnes and snes9x (requires a
custom build right now) and 6MB support for ZSNES.
8MB could work with ZSNES too if you use a custom
build.

Other features available to programmers:
 - New DMA modes (Character Conversion, ROM->I-RAM,
ROM->BW-RAM, I-RAM->BW-RAM, BW-RAM->I-RAM).
 
 - Variable Length Bit Processing (also known as bit
 stream).
 
 - High speed multiplication and division. Both operations
 take 5 cycles. You can also do accumulative sum(?).
 
 - Bank Switching.
 
 - Allows to dynamically change what part of BW-RAM
 is mapped to $6000-$7FFF.
 
 - Allows Direct Page usage which will only affect SA-1
 (the SNES DP stays the same).
 
 - Multi-threading.
 
;===================================================;
; Changes                                           ;
;===================================================;

When patched, the following changes will take effect:

 - Sprites will be processed by the SA-1 chip, killing
all slowdown instances, even with 10 sprites on screen
at the same time, in a ROM using the No More Sprite
Tile Limits patch.

 - SA-1 will load both level data and graphics, thus
decreasing the level loading time. This should make
the "MARIO START!" screen take much less time.

 - Side effect: the Nintendo Presents screen may
last for a shorter time, since Mario's graphics are
decompressed much more quickly taking advantage of
both SA-1 and the LZ2/3 optimized patch.

 - Various patches like VWF dialogues will run
more quickly, allowing new possibilities.

;===================================================;
; Warning                                           ;
;===================================================;

SA-1 Pack is the most complex patch created for SMW,
because it moves almost all RAM addresses to another
area, which is accessible by the SA-1 chip.

Because of that, you should be very careful when you
use anything else in your ROM. In other words, other
tools and patches. None of them will work until a
SA-1 compatible version is released. There are
exceptions, but 99.99% of patches and tools will not
work with SA-1, in their current state.

Lunar Magic is not officially SA-1 compatible, but
I created a tool called Lunar Fix that fixes all
Lunar Magic's ASM hacks. Note that in the future, Lunar
Magic MIGHT support SA-1, probably in 2013.
                                               
I am converting various patches and tools to make them
compatible with SA-1. If you're interested, check out
at the end of this readme.

Blocks and Sprites will not work either, even if you use
a SA-1 compatible Sprite Tool/Block Tool. Unless a future
Sprite/Block Tool will be able to convert a regular custom
sprite/block into a SA-1 friendly sprite/block.

Converting those is easier than converting patches or
tools, though.

;===================================================;
; Usage                                             ;
;===================================================;

Working with SA-1 may be tedious at first, but working
with this chip is simple and fun.

In order to get started, grab a new clean ROM. Japanese
or European versions will not work.

Now, open the ROM in Lunar Magic and expand it to 2MB,
without doing anything else.

Now, using Asar, apply sa1.asm to your ROM.

Then test it with an emulator of your choice. I'd
recommend Snes9X, BSNES or ZSNES. If it works normally
and Snes9X/ZSNES respectively display ROM+RAM+SRAM+SA-1
or Type:SA1 upon loading the game, then you've successfuly
activated SA-1 on your ROM!

Now apply all other patches/tools that should run
before Lunar Magic. Be sure that they support SA-1,
or else, if any of these patches/tools is not compatible
with SA-1, it will DESTROY your ROM.

Now you can save the first level with Lunar Magic! Note
that if you use a Lunar Magic version not compatible with
SA-1, you will need to use Lunar Fix, a small program
that I created in order to make Lunar Magic SA-1 compatible,
otherwise aww, why I would use SA-1 on a SMW Hack if
it isn't compatible with Lunar Magic?!

You should use Lunar Fix on your ROM after doing atleast 
one of the following actions:
 - Saving the first level with Lunar Magic;
 - Making a major change on your ROM (like inserting
ExGFX, enabling ExAnimation);
 - Editing the overworld;
 - Inserting a new ASM hack (Title Screen Recording,
 ExAnimation, Custom Palettes, etc.);
 
Using Lunar Fix is really simple: drag your ROM on
the program window, or in the command prompt, type
"lunarfix Your_ROM_Name.smc" without quotes.
Lunar Fix allows both unheadered and headered ROMs.

Warning: If you change the decompression option on
Lunar Magic, you MUST reapply sa1.asm or your ROM will
just crash.

;===================================================;
; F.A.Q                                             ;
;===================================================;

 Q: Is it really hard to work with SA-1?
 A: I would say yes, but after some time you'll be able
to see the benefits from using this SA-1 pack :).
Also once you learn how to make something SA-1
compatible, everything will become easier to work with.

 Q: When I edit my ROM in Lunar Magic and open it, the
ROM glitches during the Title Screen. What's going on?
 A: You forgot to use Lunar Fix. See "Usage" in line 106.

 Q: When I expanded my ROM to 8MB, ZSNES can't open
anymore.
 A: ZSNES doesn't support 8MB ROMs, only up to 6MB. Try
restoring your ROM to a previous state using Lunar Magic
or with a backup.

 Q: Whenever I apply a patch to my ROM, it crashes.
 A: Make sure that the patch is SA-1 compatible. You can
find a list of SA-1 compatible patches in the "Links"
section, line 791. Also on SMWC, SA-1 compatible patches
might have the [SA-1] tag, but I don't know yet.

 Q: Whenever I use any tool, the ROM simply crashes!
 A: Make sure that the tool is SA-1 compatible. You can
find SA-1 compatible tools in the "Links" section,
line 791. Also on SMWC, SA-1 compatible tools might have
the [SA-1] tag, but I don't know. If the tool isn't
on list, you will need to ask the author for adding SA-1
support or search for another solution, like a manual
patch or another tool.

 Q: If I insert a custom block or custom sprite, the
ROM crashes or glitches when the block/sprite is present.
 A: Blocks and sprites may need to be converted to SA-1.
Check out the "Links" section at line 791 for SA-1 compatible
blocks/sprites. SMWC blocks/sprites may have the tag
[SA-1], indicating SA-1 compatibility.

 Q: After editing something in Lunar Magic, the ROM glitches
or crashes.
 A: Make sure to run Lunar Fix every time you make any
major change on your ROM. See "Usage" at line 106.

 Q: How I can make something compatible with SA-1?
 A: See "Programming" in line 214. You will find all
the informations needed for that :)

 Q: If I change "Compression Options for this ROM" in
Lunar Magic, the ROM simply crashes. Why?
 A: You have to reapply sa1.asm after you change the
compression option, since SA-1 processes that specific part
and it needs a specific decompressor to work property.

;===================================================;
; Programming                                       ;
;===================================================;

Unlike the first version of the SA-1 pack, this one
is much complex because of the various RAM remapping,
not counting the different ROM mapping.

In other words, in order to making anything SA-1
compatible, you will need to change:

(assuming that XX is in the $00-$3F or $80-$BF range
and YY equals either XX or $7E)

$YY:0000-$YY:00FF to $XX:3000-$XX:30FF.
$YY:0100-$YY:1FFF to $XX:0100-$XX:1FFF.

Note that if you're using 16-bit addressing,
you should to use $3000-$30FF and $6100-$7FFF for that.
8-bit addresses should work fine since DP is set to $3000.

$7E:C800-$7E:FFFF to $40:C800-$40:FFFF.
$7F:C800-$7E:FFFF to $41:C800-$41:FFFF.

$7F:9A7B-$7F:9C7A to $41:8800-$41:89FF.

$70:0000-$70:07FF to $41:C000-$41:C7FF.

Also, note that $70:0800-$70:27FF is now $41:A000-$41:BFFF if you
want more SRAM, but only that much. 16 KB should be enough
for SRAM unless you're working on something that
really wastes space.

Now, knowing all the SRAM/RAM mapping changes, you may
ask: what is the data at $40:0000-$41:FFFF
and $XX:3000+ for?

When you activate SA-1, two types of RAM are added
and one is deleted. In other words, I-RAM and BW-RAM
are added while SRAM is deleted.

I-RAM is SA-1 Internal RAM, which is why it's called I-RAM.
The I-RAM runs at 10.74 MHz with no delay and is
the 2nd fastest RAM available on SNES, only beaten by
the Super FX 2's Cache RAM, which runs at 21 MHz.
The size of I-RAM is 2 KB (2048 bytes) and it's
located in banks $00-$3F and $80-$BF, in the
$3000-$37FF range.

$3000-$30FF is same as $7E:0000-$7E:00FF on SMW,
which increases the read/write speed by 4 times.
The game will access it even when running code from the
SNES side, because the Direct Page is now at $3000.

$3100-$31FF is internally used by my patch for
general and caching purposes.

$3200-$36FF is free to use.
$3700-$377F is the Character Conversion DMA buffer.
$3780-$37FF is the SA-1 stack.

A detailed I-RAM map is included in iram.txt

I-RAM is recommended to be used for RAM codes or as a place
for storing data which is accessed many times, since it'll
be accessed much faster than other type of RAM.

BW-RAM is SA-1's SRAM. As simple as that. But unlike the
SRAM (which means Static or Saveable RAM), BW-RAM means
Backup and Work RAM. In other words, BW-RAM is a
RAM created for both working and saving. I don't think
its purposes change that much, but could BW-RAM be a little
faster than SRAM..? I don't know.

BW-RAM runs at 5.37 MHz and is mapped to banks $40-$4F.
You can expand the BW-RAM size to 256 KB, according to the
SNES Dev. Manual Book II, but I only got up to 128 KB working,
perhaps because none of the emulators implemented that, or
no SA-1 game ever used 256 KB of BW-RAM.

This patch always uses the maximium BW-RAM size possible
(128 KB) in banks $40-$41. $42-$FF will mirror the first two
banks (e.g $42 and $40, $43 and $41, etc).

I remapped most RAM on SMW to BW-RAM and the SRAM of course.
For more details, see bwram.txt

Of course, if the BW-RAM is at bank $40+ now, where has the
ROM been moved to?

The ROM map changed in rather complex way. Look:

Bank Range -- Content
$00-$1F    -- ROM (CXB) (LoROM)
$20-$3F    -- ROM (DXB) (LoROM)
$40-$4F    -- BW-RAM
$50-$5F    -- Unmapped
$60-$6F    -- (SA-1 only) "Virtual" BW-RAM.
$70-$7D    -- Unmapped
$7E-$7F    -- (SNES only) WRAM/Work RAM
$80-$9F    -- ROM (EXB) (LoROM)
$A0-$BF    -- ROM (FXB) (LoROM)
$C0-$CF    -- ROM (CXB) (HiROM)
$D0-$DF    -- ROM (DXB) (HiROM)
$E0-$EF    -- ROM (EXB) (HiROM)
$F0-$FF    -- ROM (FXB) (HiROM)

Now the ROM is split into various locations, which
may act as LoROM or HiROM, and each part has an "ID", which
can be CXB, DXB, EXB or FXB. Those belong to the ROM area,
and their content may vary depending on what the bank switch
value is, which is set using the SA-1 registers $2220-$2223.
But my patch already takes care of that.

If the ROM is 4 MB or less, $00-$3F and $80-$BF will map to
the 1st&2nd MB and the 3rd&4th MB respectively. $C0-$FF will be
the HiROM area mirroring the same 4MB of data.

If the ROM is 5-8MB, the first 4MB are mapped to $00-$3F and $80-$BF
and the last 4MB of the ROM are mapped to $C0-$FF. Yeah, that will
make the first 4MB LoROM only and the last 4MB HiROM only.
This way you can access all the 8MB at once, though some emulators
may have some problems with it.

This also means that FastROM addresing will not work, so pay
attention to any strange jump to the $808000+ area, and subtract
$800000 from those.

Xkas doesn't support SA-1 mapping and because of that you'll
be fine using it only for patching in the first 2MB area.

You can try using org $408000 or org $C00000 with base $808000,
but xkas doesn't really like the base command that much.

Using Asar, you can access all the SA-1 data, but you will need to
switch the mapping every time you're accessing an area outside
of the current range.

Example:

sa1rom 0,1,2,3 ; access the first 4MB

org $018000 ; hijack something
	JSL CustomCode ; and run the custom code...
	
sa1rom 4,5,6,7

org $C00000
CustomCode: ;*put code here*;
	RTL

However freecode/freedata will not work with Asar when you are
accessing the 4MB+ area, atleast until Alcaro adds "sa1rom full"
to Asar (if he hasn't implemented it already).

-----------------------------------------------------

Now that you know how the memory (ROM/RAM) works,
you may ask: How can I invoke SA-1?

Going into SA-1 mode is really easy.
Store the 24-bit address to jump to into $3180-$3182 and
then JSR to $1E80, i.e.:

LDA.b #Label				; \ Put the address
STA $3180				;  | to jump in
LDA.b #Label>>8				;  | $3180 - $3182.
STA $3181				;  |
LDA.b #Label>>16			;  |
STA $3182				; /
JSR $1E80				; Invoke SA-1 and wait to finish.
[...]					; *other code*

Label:
PHB					; \ Set Bank
PHK					;  |
PLB					; /
; *The SA-1 CPU runs here.*
PLB					; Restore Bank
RTL					; Return.

So if you wanted to jump to the address $00974C, you'd do this:

LDA #$4C 				; \ Low
STA $3180				; /
LDA #$97 				; \ High
STA $3181				; /
LDA #$00				; \ Bank (in this case STZ $3182 would work better)
STA $3182 				; /
JSR $1E80				; Invoke SA-1

You can do multi-threaded operation too:

LDA.b #Label				; \ Put the address
STA $3180				;  | to jump in
LDA.b #Label>>8				;  | $3180 - $3182.
STA $3181				;  |
LDA.b #Label>>16			;  |
STA $3182				; /
LDA #$80				; \ Invoke SA-1
STA $2100				; /
; Do stuff while SA-1 is executing Label.
JSR $1E85				; Wait SA-1 if it didn't finished its operation.
[...]					; *other code*

Label:
PHB					; \ Set Bank
PHK					;  |
PLB					; /
; *The SA-1 CPU runs here.*
PLB					; Restore Bank
RTL					; Return.

This operation may be really useful, but be careful that if
you access the ROM in multi-threading mode, SA-1 may access
it at 5.37 MHz, decreasing processing speed.

To make sure that SA-1 will run at fullspeed, place the code
in WRAM and run it from there instead.

When you switch to SA-1 side, the system works a bit differently:

 - You can't access the PPU and CPU registers,
which are located at $2100-$21FF, $4200-$42FF and around $4000 too.

 - You can't access WRAM (Work RAM) in banks $7E and $7F.
Also $0000-$07FF are mapped to I-RAM instead, while
$0800-$1FFF is unused.

 - You can access the $600000-$6FFFFF range, which is the "Virtual"
BW-RAM.

 - The CPU runs 4x times faster than usual, specifically at 10.74 MHz
instead of 2.68 or 3.56 MHz (FastROM).
 
Since you can't access the other CPU registers, you'd think to be
unable to do DMA and Multiplication/Division, right? FALSE! You'll be
able to use the SA-1 registers located at $2200-$23FF!

Plus the Multiplication and DMA registers available using SA-1
are much faster than the SNES ones. But you can't DMA to VRAM or
any other PPU register, since while on SA-1 side, you can only access
the cart contents (ROM, BW-RAM, I-RAM and SA-1 Registers).

To execute a multiplication, do this:

LDA #$00				; \ Set Multiplication Mode.
STA $2250				; /

REP #$20				; 16-bit Accum
LDA #$XXXX 				; \ Set first multiplicand
STA $2251				; /
LDA #$YYYY 				; \ Set second multiplicand
STA $2253				; /

NOP     				; \ ... Wait 5 cycles!
BRA $00 				; /

; Then can you read the product from $2306, $2307, $2308 and $2309.
; Yes, the product of SA-1 Multiplication is 32-bit! Awesome, isn't it?
; While in SNES it's 8-bit x 8-bit = 16-bit, in SA-1 it is
; 16-bit x 16-bit = 32-bit. And you only need to wait 5 cycles
; which is ~62% of a NOP in SNES!
 
To execute a division, do this:

LDA #$01				; \ Set Division Mode
STA $2250 				; /

REP #$20				; 16-bit Accum
LDA #$XXXX				; \ Set dividend
STA $2251				; /
LDA #$YYYY				; \ Set divisor
STA $2253				; /
 
NOP     				; \ ... Wait 5 cycles!
BRA $00 				; /

; Then you can read the division result from $2306 & $2307
; and the remainder from $2308 & $2309

Other enhancement chips may work like a slave, because the
SNES sends a command to the chip, which then sends back the
result. But with SA-1 is different story, since both chips
can have interrupts so there's no slave in this case!

How can this be useful? When you can't access something from SA-1 side,
of course. Using this method, you can make a quick access on something
from SNES side, then come back with the value. Example: SA-1 wants to
read from an APU port, but it can't access it. To make it accessible,
call the the SNES so you can read from the APU port and then send
the value to SA-1. See below:

LDA.B #.SNES				; \ Put the SNES pointer to run
STA $0183				; | in $0183-$0185.
LDA.B #.SNES/256			; |
STA $0184				; | (Remember that $0000-$07FF
LDA.B #.SNES/65536			; |  is same as $3000-$37FF).
STA $0185				; /
LDA #$D0				; \ Invoke/Call SNES
STA $2209				; /
.Wait					; \ Wait for SNES.
LDA $018A				; |
BEQ .Wait				; |
STZ $018A				; /
; Now APU value is at $0100-$0103, because:

.SNES					; SNES code
;PHB					; \ Set Bank (not really required to access RAM)
;PHK					; |
;PLB					; /
LDA $2140				; \ Read $2140-$2143
STA $3100				; | and save in $3100-$3103
LDA $2141				; | (Remember that $0000-$07FF is 
STA $3101				; | NOT same as $3000-$37FF in SNES!)
LDA $2142				; |
STA $3102				; |
LDA $2143				; |
STA $3103				; /
;PLB					; Restore Bank
RTL					; Return.
	
Using said method you can get rid of almost all SA-1
limitations, but remember that the SNES's speed is 2 MHz,
so if you call it too many times, you may waste some time. 
	

There are a bunch of other useful features too, such as bit stream
and fast DMA which are only available while on SA-1 side.

The SA-1 DMA can transfer data from ROM to I-RAM (10 MHz (4x faster than SNES)),
from ROM to BW-RAM (5 MHz (2x faster)), from BW-RAM to I-RAM (5 MHz (2x faster)) 
and from I-RAM to BW-RAM (5 MHz (2x faster)). Although I-RAM <-> BW-RAM transfers
are 2x slower than ROM -> I-RAM ones, you can still run SA-1 and DMA in parallel.

SA-1 DMA example (ROM->BW-RAM):

LDA.b #%11000100 			; \ Enable DMA, DMA Priority, ROM->BWRAM
STA $2230				; /

REP #$20				; 16-bit Accum
LDA #Location 				; \ ROM source address
STA $2232				; /
LDX #Bank 				; \ ROM source bank
STX $2234				; /

LDA #Size				; \ Set size of transfer
STA $2238				; /

LDA #Dest				; \ BW-RAM destination address
STA $2235				; /
LDX #BWRAM_Bank				; \ BW-RAM destination bank (#$40 or #$41)
STX $2237				; / The DMA starts upon writing to $2237.
; Note that if the destination is I-RAM, then it'll start upon writing to $2236 instead.

.Wait
LDX $318C				; \ Wait for DMA flag.
BEQ .Wait				; /
LDX #$00				; \ Clear the DMA flag
STX $318C 				; /
STX $2230				; Disable SA-1 DMA

SEP #$20 				; 8-bit Accum

Although I only used the Variable Length Bit Processing (bit stream)
feature once, here is an example how to use it (In Fixed Mode):

STZ $2258				; Set Fixed Mode

REP #$20				; \ Set the address to start reading from
LDA #$Address				;  |
STA $2259				;  |
LDX #$Bank				;  |
STX $225B				;  |
SEP #$20				; /

; Now let me explain. $2306 and $2307 contain
; a virtually "infinite" value from ROM
; that you can read (only 16-bit at once)
; and shift by the desired amount of bits to the right.

; To make a little easier, imagine that $2258 is a seek function, but it uses bits instead of bytes,
; and $230C/$230D is a read function, but without seek if fixed mode is used.
; It works like this:

bitStream bs = new BitStream(romData); 		// romData is a byte array.

int someBits = bs.ReadByte() & 0x0F;		// read 4 bits
bs.Seek(4);					// seek / shift 4 bits

int moreBits = bs.ReadByte() & 0x07;		// read 3 bits
bs.Seek(3);					// seek / shift 3 bits

The code above, translated into ASM, would look like this:

LDA $230C
AND #%BitsToMask
[handle value]
LDA #$BitsToSeek
STA $2258

You can keep doing this until you want to stop the reading process.

Here's a simple pratical example.
In LZ2, the syntax of the header looks like this (in bits):

bits
76543210
CCCLLLLL

CCC:   Command bits
LLLLL: Length

So CCC is the command and LLLLL is the length.
To read that using bit stream, you can do this:

LDA $230C
AND #%00011111
; Handle length value
LDA #$05
STA $2258 ; Seek 5 bits, now CCCLLLLL -> ?????CCC

LDA $230C
AND #%00000111
; Handle command value
LDA #$03 ; Shift 3 bits now ?????CCC -> ????????
STA $2258

; Do stuff and/or keep reading, etc.

Well, that was all I could do about examples. Now have fun combinating
all features!

WARNING: bsnes 0.7x appears to have a bug with the bit stream, as the bank
switching doesn't work while using the Variable Length Bit feature,
thus making it impossible to access the 5-8MB area. Be careful!

Now, there's still one feature that I haven't explained yet, so it's time to
explain it, I guess. I said earlier that SA-1 can access banks $60-$6F,
aka the "Virtual" BW-RAM, right?

The "Virtual" BW-RAM (I'll name as VRAM, okay?) is a BW-RAM mirror, but with a
special added feature. The special feature of this area is that it only stores
certain bits to the actual BW-RAM: 4 or 2 bits, depending on the value in $223F.
If bit 7 of that one is clear, the VRAM will write 4 bits, otherwise only 2 bits
are used from each address. It basically works like this:

$40:0000 = ($60:0000 << 0) | ($60:0001 << 4);
	   
Or if bit 7 of $223F is set:

$40:0000 = ($60:0000 << 0) | ($60:0001 << 2) | ($60:0002 << 4) | ($60:0003 << 6);
	   
Similarly, in order to write to $40:0001, you'll need to use both $60:0002
and $60:0003 if bit 7 of $223F is clear, or else you'll want $60:0004, $60:0005,
$60:0006 and $60:0007.

So, if you write #$0F to $60:0000, it'll do:

LDA $400000
AND #$F0
ORA $600000
STA $400000

then, if $60:0001 is written:

LDA $600001
AND #$0F
ASL #4
STA $00
LDA $400000
AND #$0F
ORA $00
STA $400000

and if bit 7 of $223F is set, it'll work similarly,
but with $60:0000-$60:0003 and using 2 bits from each address.

Of course, making use of this VRAM will speed up the process of storing
a few bits to a RAM address, but why would we use this?
For the one and only reason: Character Conversion DMA.

But what is Character Conversion DMA?
You know, some games managed to use get some pretty nice effects such as rotating, scaling...
But you can't do that directly in SNES file format, because it's a bit too complex
to change its pixels.

To work around that, you will need to create a linear bitmap in RAM, then set all
the pixels and effects and convert the data into SNES format to store it into VRAM.
But the conversion is really tricky and to help that, SA-1 has a really great feature,
which happens to be the most complex DMA available, used to convert bitmaps into SNES
format and AT SAME TIME upload it in VRAM. This is done thanks to a combination of 2 DMAs,
the SNES DMA and SA-1 DMA. While the SNES DMA reads the BW-RAM and transfers data from
it to VRAM, the SA-1 DMA reads from BW-RAM, converts the data to SNES format and "gives"
to SNES, bypassing the value that the SNES reads from BW-RAM. All of this is done at the
same time and during NMI. So with Character Conversion DMA you can make a Framebuffer in
BW-RAM and upload into VRAM in a very easy and fast way, since the transfers will still
take the same time: 1 cycle per byte, except that SA-1 DMA converts the data simultaneously.

Fortunately, I've already accomplished the harder tasks and my patch already handles
Character Conversion DMA for you.
I created a table, which works much more like the OAM/Sprite Tiles one:

$3190+x - Character Conversion Settings. 80+ will act like a normal DMA transfer.
$3191+x - VRAM target (low).
$3192+x - VRAM target (high).
$3193+x - Data location (low).
$3194+x - Data location (high).
$3195+x - Data location (bank).
$3196+x - Length of data (low)
$3197+x - Length of data (high)
... Up to 10 slots, which means that the table will need 80 bytes.

$317F holds the number of used slots. If the number is 0xA (10), then all
slots are being used and no character conversion DMA will happen. To index the table
and enable the DMA, do this:

SetTable:
	LDA $317F			; Load Character Conversion DMA slot count
	CMP #$0A			; \ if all slots are used, skip
	BEQ .End			; /
	ASL				; \ multiply the count by 8
	ASL				;  |
	ASL				; /
	TAX				; and use it as an index
	
	LDA #$SETTINGS			; \ Set $2231 value
	STA $3190,x			; /
	
	LDA #$VRAM_Low			; \ Set VRAM Destination address
	STA $3191,x			;  |
	LDA #$VRAM_High			;  |
	STA $3192,x			; /
	
	LDA #$BWRAM_Low			; \ Set	the BW-RAM address
	STA $3193,x			;  | (The pointer of the Bitmap)
	LDA #$BWRAM_High		;  |
	STA $3194,x			;  |
	LDA #$BWRAM_Bank		;  |
	STA $3195,x			; /
	
	LDA #$Length_Low		; \ Set the length of the transfer
	STA $3196,x			;  | (Size of the bitmap)
	LDA #$Length_High		;  |
	STA $3197,x			; /
	
	INC $317F			; Increase the number of slots used.
.End
	RTS				; Return

You will also need to learn how register $2231 and SA-1 Bitmap work though.
Check out the SNES Dev. Book II, Super Accelerator (SA-1) -> Character Conversion.
You may find the file in "Links", line 791.

To see all the registers, check out here: http://wiki.superfamicom.org/snes/show/SA-1+Registers

;===================================================;
; Credits                                           ;
;===================================================;

Without these people, it would have been impossible for the SA-1 Pack 
to be created perfectly:

 - 33953YoShI (LC_LZ2/3 patches)
 - Adam (Testing / bugs)
 - Alcaro (ZSNES/SNES9X detection code)
 - Austin (Creating compatible tools/patches/blocks/sprite page)
 - edit1724 (LC_LZ2/3 patches)
 - Ersanio (LC_LZ2/3 patches)
 - FuSoYa (help on implementing 6-8MB support)
 - Lui37 (help on minor stuff)
 - Min (LC_LZ2/3 patches)
 - smkdan (LC_LZ2/3 patches and help on fixing VRAM patch)
 - Ripperon-X (bugs report)
 - Vitor Vilela (creating the patches)
 - You (for using the patches :D)
 
;===================================================;
; Links                                             ;
;===================================================;

List of compatible Tools: https://dl.dropbox.com/u/16203903/A/SA1/ctools.html
List of compatible Patches: https://dl.dropbox.com/u/16203903/A/SA1/cpatches.html
List of compatible Blocks: https://dl.dropbox.com/u/16203903/A/SA1/cblocks.html
List of compatible Sprites: https://dl.dropbox.com/u/16203903/A/SA1/csprites.html

SNES Dev. Book: http://www.romhacking.net/docs/226/
SA-1 Registers: http://wiki.superfamicom.org/snes/show/SA-1+Registers

My Profile on SMWC: http://smwc.me/u/8251
