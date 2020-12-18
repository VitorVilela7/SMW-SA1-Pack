@asar 1.31
;===============================================;
; SA-1 Pack					;
;  by Vitor Vilela				;
;===============================================;


!ZSNES		= 1				; Put 0 if you don't want to SA-1 Pack automatically deal with ZSNES limitations.
						; (in other words, put 0 if you don't want ZSNES 1.51 or older support)
						
!DSX		= 1				; Put 0 if you want to turn off legacy (Dynamic Sprites) patch support.
						; (as anoni's Dynamic Z should obsolete it soon.)

sa1rom						; \ Don't touch!
!c		= autoclean			;  |
incsrc "more_sprites/sprite_tables.asm"		; /


!SLOTSUSED 	= $66FE				; \ Don't change these defines below!
!CCDMA_TABLE 	= $3190				;  |
!CCDMA_SLOTS	= $317F				;  |
!CC_BUFFER	= $3700				;  |
!DSX_BUFFER 	= $418000			;  |
!SprLoadStatus 	= $418A00			; /

;===============================================;
; Hijacks					;
;===============================================;

incsrc "remap/dp.asm"				; Remaps $7E:0000-$7E:00FF
incsrc "remap/addr.asm"				; Remaps $7E:0100-$7E:1FFF
incsrc "remap/sram.asm"				; Remaps SRAM
incsrc "remap/map16.asm"			; Remaps Map16
incsrc "remap/dma.asm"				; Remaps DMA channels*
incsrc "remap/sprite_memory.asm"		; Remaps Sprite Memory*

org $FFFC					; \ Change Reset Vector.
	dw Reset2				; /
	
org $FFEE					; \ Change S-CPU IRQ Vector.
	dw snes_irq				; / snes_irq points at W-RAM.

org $FFD5					; Edit Internal ROM Header
	db $23					; ROM Mapper: SA1ROM
	db $35					; Cart Contents: ROM + BW-RAM(RAM + SRAM) + SA-1

org $FFD8					; Set BW-RAM Size
	db $07					; Setting BW-RAM size to 128 kB.

ORG $8375					; Hijack IRQ Routine.
;!c	JML IRQStart				;
NOP #4

ORG $8A53					; Hijack ClearStack.
!c	JSL ClearStack				; to make clear new RAM area.
	RTS					;

	NOP #4					; $008A58 - Unused now.
!c	JML mmc_rom_reset			; $008A5C - Reset Bank Allocation


bank_switch:					; Ensure that bank switching is only written on clean ROMs.

if read1($0DA691+2) != $7E			; \ $00:8A60 - Default vanilla SA-1 ROM bank switch
	db $80,$81,$82,$83			;  | values for Super MMC registers.
endif						; /

org $8A64
	
Reset:						; \ Use the "unused" space
!c	JML SA1_Reset				;  | to store some vectors.
						;  |
IRQ:						;  |
!c	JML SA1_IRQ				;  |
						;  |
NMI:						;  |
!c	JML SA1_NMI				;  |
						;  |
Reset2:						;  |
!c	JML snes_init				; /


	JML SA1_Loop				; This points to SA-1 main loop.
						; Needed so the Dual ROM system can locate SA-1 main loop easier.

warnpc $8A78

ORG $8069					; \ Restore old code
	INC $10					; /
	
if read1($806B) != $5C				; \  This hijack lets Background Mode
ORG $806B					;  | run at 10.74 MHz while SNES is idle.
	JMP ram_main_loop_start			;  |
	NOP					;  |
endif						; /

ORG $801F					; \ Set Direct Page to $3000.
	LDA #$3000				; /
	
ORG $8023					; \ Set Stack Pointer to $1FFF.
	LDA #$1FFF				; /
	
ORG $816A					; \ Hijack NMIStart for Dynamic Sprites and 
!c	JML snes_nmi				; / Character Conversion DMA Table

ORG $843B					; Restore old WaitForHBlank code
	BIT $4212
	BVS $F9
	
org $83F6
	NOP #3
	;JSR RAMCode_WaitForHBlank
	
org $8391
	NOP #3
	;JSR RAMCode_WaitForHBlank

org $83C8
	NOP #3
	;JSR RAMCode_WaitForHBlank

org $82BC
	JML snes_nmi_end
	
org $83B2
	JML snes_nmi_end2

org $827A
	LDX #$81
	
org $829F
	LDX #$A1
	BRA +
	NOP
+
	
;===============================================;
; Main Code					;
;===============================================;

freecode

incsrc "boost/oam.asm"				; OAM speed up.
incsrc "boost/sprites.asm"			; Sprites speed up.
incsrc "boost/map16.asm"			; Level loading speed up.
incsrc "boost/lzx.asm"				; LZ2/LZ3 speed up.
incsrc "boost/sprite_load.asm"			; Sprite loading speed up.
incsrc "boost/circle.asm"			; Circle Handling speed up.
incsrc "boost/level_mode.asm"			; Level Game Mode speed up.
incsrc "boost/overworld.asm"			; Overworld Game Mode speed up.

; SAS Engine files.
incsrc "engine/mmc.asm"				; Super MMC system
incsrc "engine/snes_init.asm"			; SNES initialization routine
incsrc "engine/snes_irq.asm"			; SNES IRQ routine
incsrc "engine/snes_nmi.asm"			; SNES NMI routine

namespace zsnes
	incsrc "engine/snes_irq_zsnes.asm"	; SNES IRQ routine (ZSNES)
namespace off

ClearStack:					; Based from QuickROM, by Alcaro.
	SEP #$20				; 8-bit A
						;
	LDA.b #.SA1				; \ Call SA-1
	STA $3180				;  |
	LDA.b #.SA1/256				;  |
	STA $3181				;  |
	LDA.b #.SA1/65536			;  |
	STA $3182				;  |
	JSR $1E80				; /
						;
	LDA $6100				; \ Don't waste time if game mode isn't 00
	BNE .DoNotWasteTime			; /
	LDX #$1180				; \ Wait for SPC700
-	DEX					;  |
	BPL -					; /
.DoNotWasteTime					;
	LDA #$00				; \ Set up/Init other RAM.		
	STA $7F837B				;  |
	STA $7F837C				;  |
	LDA #$FF				;  |
	STA $7F837D				; /
	SEP #$10				; 8-bit X/Y
	RTL					; And Return.
						;
.SA1						; SA-1 Code
	PHB					; Preserve Bank
	STZ $7FFF				; \ Set "Fixed" byte for MVP/MVN.
	STZ $30FF				;  |
	STZ $3200				; /
	REP #$30				; 16-bit A/X/Y
	LDA #$1DFE				; \ Clear $610B-$7FFF
	LDX #$7FFF				;  |
	LDY #$7FFE				;  |
	MVP $00,$00				; /
	LDA #$00FF				; \ Clear $3000-$30FF
	LDX #$30FF				;  |
	LDY #$30FE				;  |
	MVP $00,$00				; /
	LDA #$0225				; \ Clear $3200-$3425
	LDX #$3200				;  |
	LDY #$3201				;  |
	MVN $00,$00				; /
	SEP #$30				; 8-bit A/X/Y
	PLB					; Restore Bank
	RTL					; Return
	
SA1_Reset:					;
	SEI					; \ Disable IRQ and Emulation Mode
	CLC					;  |
	XCE					; /
						;
	REP #$38				; A/X/Y 16-bit, Disable Decimal Mode
						;
	LDA #$0000				; \ Set Direct Page to $0000,
	TCD					;  | Stack Pointer to $37FF and
	LDA #$37FF				;  | Data Bank to current.
	TCS					;  |
	PHK					;  |
	PLB					; /
						;
	SEP #$30				; A/X/Y 8-bit
						;
	STZ $2230				; Reset SA-1 DMA settings.
						;
	LDA #$80				; \ Enable I-RAM and BW-RAM write
	STA $2227				;  |
	STZ $2225				;  |
	LDA #$FF				;  |
	STA $222A				; /
						;
	LDA #$B0				; \ Enable IRQ from S-CPU
	STA $220A				;  | Enable IRQ from DMA
	STA $220B				; / Enable NMI from S-CPU
						;
	STZ $223F				; This is new from previous patches
						; This will set up a 4bpp Virtual RAM at $60:0000-$63:FFFF
						; Settings this to #$01 will make a 2bpp Virtual RAM at $60:0000-$67:FFFF.
						;
	REP #$20				;
	LDA $00FFEE				; \ Set SNES IRQ and NMI vectors
	STA $220E				;  | Same from the cart ROM.
	LDA $00FFEA				;  |
	STA $220C				; /
	SEP #$20				;
						;
	LDA #$50				; \ Enable dynamic NMI/IRQ vector.
	STA $2209				; /
						;
	STZ $3200				; \ Clear $3200, $3000 and $318F
	STZ $318F				;  |
	STZ $00					; /
						;
	PHB					; \ Then, start a "fixed" MVN
	REP #$30				;  | and clear $3200-$36FF, $3000-$318D, $318F-$31FF
	LDA #$04FE				;  |
	LDX #$3200				;  | $3700-$37FF is Stack and CCDMA buffer.
	LDY #$3201				;  |
	MVN $00,$00				;  |
	LDA #$018C				;  |
	LDX #$3000				;  |
	LDY #$3001				;  |
	MVN $00,$00				;  |
	LDA #$006F				;  |
	LDX #$318F				;  |
	LDY #$3190				;  |
	MVN $00,$00				;  |
	SEP #$30				;  |
	PLB					; /
						;
	CLI					; Enable Interrupts
						;
						; \ A = 0xFFFF
	STA $0189				; / Tell S-CPU to continue processing
						;
	PEA $0100				; \ Set DP to $0100
	PLD					; /
						;
SA1_Loop:					;				
	LDA $8B					; \ Loop until a Background Mode is enabled
	BEQ SA1_Loop				; / (or wait for a IRQ for SNES call)
						;
BackgroundMode:					;
	PHK					; \ Jump to Background Mode Address
	PEA.w .End-1				;  |
	JML [$3186]				; /
.End						;
	STZ $8B					; \ Clear Background Flag and Return to Main Loop.
	BRA SA1_Loop				; /
							
SA1_IRQ:					; SA-1 CPU IRQ
	;PHP					; \ Preserve P/A/X/Y/D/B
	REP #$30				;  |
	PHA					;  |
	PHX					;  |
	PHY					;  |
	PHD					;  |
	PHB					;  |
	PHK					;  |
	PLB					;  |
	LDA #$0000				;  |
	TCD					; /
	SEP #$30				; 8-bit A/X/Y
						;
	LDA $318F				; \ Preserve BW-RAM Mapping and
	STZ $318F				;  | reset to default value.
	STZ $2225				;  |
	PHA					; /
						;
	LDA $2301				; Read status register
	BIT #$40				; \ If $40 is set, go to Timer IRQ
	BNE SA1_IRQEnding			; / 
	BIT #$20				; \ If $20 is set, go to DMA end code
	BNE DMA_End				; /
						;
	AND #$0F				; \ Get S-CPU Message
	ASL A					;  | x2
	TAX					;  | A->X
	JMP (SA1IRQ_Ptr,x)			; / Go to Messages Code
						;
DMA_End:					;
	LDA #$01				; \ Set DMA Flag and Return
	STA $018C				; /
SA1_IRQEnding:
	LDA #$F0				; \ Clear IRQ from S-CPU
	STA $220B				; /
						;
	PLA					; \ Restore BW-RAM Mapping
	STA $2225				;  |
	STA $318F				; /
						;
	REP #$30				; \ Restore B/D/Y/X/A/P
	PLB					;  |
	PLD					;  |
	PLY					;  |
	PLX					;  |
	PLA					;  |
	;PLP					; /
SA1_NMI:					; SA-1 NMI - not used on this patch. Also, only a few emulators even handle this.
	RTI					; Return

SA1IRQ_Ptr:					; SA-1 IRQ Message List
dw ProcessRequest				; #$00 - Process Request (aka Jump to Code)
dw EnableChvDMA					; #$01 - Enable Character Conversion DMA #1
dw DisableDMA					; #$02 - Disable DMA / Character Conversion DMA
dw ProcessIRQRequest				; #$03 - IRQ Compatible Process Request

ProcessRequest:
	LDA #$B0				; \ Clear IRQ from S-CPU
	STA $220B				; /
	CLI					; Enable IRQ
	PHK					; \
	PEA.w .return-1				;  | JSL [$3180]
	JML.w [$3180]				;  |
.return						; /
	SEI					; Disable IRQ
	INC $0189				; Set Ready Flag
	BRA SA1_IRQEnding			; Return
	
EnableChvDMA:
	LDA #$B0				; \ Enable Character Conversion DMA CC1 (BW-RAM->I-RAM)
	STA $318D				;  |
	STA $2230				; /
	BRA SA1_IRQEnding			; Return
	
DisableDMA:					; \ Disable SA-1 DMA (of any type)
	STZ $2230				;  |
	BRA SA1_IRQEnding			; /
	
ProcessIRQRequest:				; \ Same as Process Request, but
	LDA #$B0				;  | it's to use in a S-CPU IRQ/NMI
	STA $220B				;  | and this doesn't accept any
	PHK					;  | interrupt.
	PEA.w .return-1				;  |
	JML.w [$318F]				;  |
.return						;  |
	INC $0192				;  |
NoMessage:					;  |
	BRA SA1_IRQEnding			; /

incsrc "more_sprites/more_sprites.asm"
	
print "Insert size............. ", freespaceuse, " bytes."
print "Total bytes modified.... ", bytes, " bytes."