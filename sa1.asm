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

org $FFFC					; \ Change Reset Vector.
	dw Reset2				; /

org $FFD5					; Edit Internal ROM Header
	db $23					; ROM Mapper: SA1ROM
	db $35					; Cart Contents: ROM + BW-RAM(RAM + SRAM) + SA-1

org $FFD8					; Set BW-RAM Size
	db $07					; Setting BW-RAM size to 128 kB.

ORG $8375					; Hijack IRQ Routine.
!c	JML IRQStart				;

ORG $8A53					; Hijack ClearStack.
!c	JSL ClearStack				; to make clear new RAM area.
	RTS					;

	NOP #4					; $008A58 - Unused now.
!c	JML ResetBanks				; $008A5C - Reset Bank Allocation
BankSwitch:					; \ $008A60 - Default Bank Switch
	db $80,$81,$82,$83			; /
	
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
!c	JML SNES_Reset				; /


	JML SA1_Loop				; This points to SA-1 main loop.
						; Needed so the Dual ROM system can locate SA-1 main loop easier.

warnpc $8A78

ORG $8069					; \ Restore old code
	INC $10					; /
	
if read1($806B) != $5C				; \  This hijack lets Background Mode
ORG $806B					;  | run at 10.74 MHz while SNES is idle.
	JMP RAMCode_Wait			;  |
	NOP					;  |
endif						; /

ORG $801F					; \ Set Direct Page to $3000.
	LDA #$3000				; /
	
ORG $8023					; \ Set Stack Pointer to $1FFF.
	LDA #$1FFF				; /
	
ORG $816A					; \ Hijack NMIStart for Dynamic Sprites and 
!c	JML NMIStart				; / Character Conversion DMA Table

ORG $843B					; Restore old WaitForHBlank code
	BIT $4212
	BVS $F9
	
org $83F6
	JSR RAMCode_WaitForHBlank
	
org $8391
	JSR RAMCode_WaitForHBlank

org $83C8
	JSR RAMCode_WaitForHBlank

;===============================================;
; Macros					;
;===============================================;

; legacy DSX patch DMA base macro.
; A is 16-bit, X is 8-bit.
macro transferslot(slot, bytes, shift)
	LDA.W #$7C00+(<slot>*256)+<shift>	; \ VRAM address + line*slot
	STA.W $2116				; /
	LDA.W #(!DSX_BUFFER&65535)+(<slot>*512)+(<shift>*2) ;\ Set Buffer location
	STA.W $4312				; /
	LDA.W #<bytes>				; \ Set bytes to transfer
	STA.W $4315				; /
	STY.W $420B				; Run DMA.
endmacro

; Character Conversion DMA base macro.
; A is 16-bit, Y is 8-bit.
; X is remain CDMA slots.
macro ccdmaslot(slot)
	LDY.W !CCDMA_TABLE+(<slot>*8)+0		; Load CDMA value
	BMI ?NormalDMA				; If is >= #$80, it's normal DMA
	STY $2231				; Otherwise store the CDMA register value.
						;
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+3		; \ Set source of bitmap in BW-RAM.
	STA $2232				;  | (Both SA-1 and CPU Register.)
	STA $4312				;  |
	LDY.W !CCDMA_TABLE+(<slot>*8)+5		;  |
	STY $2234				;  |
	STY $4314				; /
						;
	LDA.W #!CC_BUFFER			; \ Set I-RAM buffer.
	STA $2235				; / (This is used as buffer in conversion, like the echo buffer.)
						;
	LDY $318E
	BMI +
						
	CLI					; \ Wait for SA-1 CCDMA.
-	LDY $318D				;  | (probably it's doing the first character conversion)
	BEQ -					;  |
	DEY					;  |
	STY $318D				;  |
	SEI					; /
						;
+	LDA.W !CCDMA_TABLE+(<slot>*8)+6		; \ Store size of conversion+transfer
	STA $4315				; /
	LDA.W !CCDMA_TABLE+(<slot>*8)+1		; \ Store VRAM address.
	STA $2116				; /
						;
	LDY #$02				; \ Run SA-1 AND CPU DMA
	STY $420B				; /
						;
	DEX					; \ If there are no more remaining,
	BNE +					;  | jump to CCDMA_END routine, otherwise,
	JMP CCDMA_END				; / continue.

?NormalDMA:
	LDY #$80				; \ Make sure that CCDMA is turned off.
	STY $2231				;  |
	LDY #$82				;  |
	STY $2200				; /
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+1		; \ Set VRAM address
	STA $2116				; /
	LDA.W !CCDMA_TABLE+(<slot>*8)+3		; \ Set source address
	STA $4312				;  |
	LDY.W !CCDMA_TABLE+(<slot>*8)+5		;  |
	STY $2234				; /
	LDA.W !CCDMA_TABLE+(<slot>*8)+6		; \ Store size of conversion+transfer
	STA $4315				; /
						;
	LDY #$02				; \ Transfer.
	STY $420B				; /
						;
	LDY #$81				; \ Enable again Character Conversion DMA.
	STY $2200				; /
?End:						;
	DEX					; \ If there are no more remaining,
	BNE +					;  | jump to CCDMA End routine, otherwise,
	JMP CCDMA_END				; / continue.
+
endmacro

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

ResetBanks:					; Reset Bank Switch to Default.
	BIT $318E				; Overflow = Swap bug flag.
						;
	LDX #$03				; For each Super MMC Register
-	LDA.L BankSwitch,X			; Load Bank Switch
	BVC +					; \ If Swap bug flag is set, invert register value.
	EOR #$04				; /
+	STA $2220,X				; Store to Bank register.
	DEX					; \ For each loop.
	BPL -					; /
	RTL					; Return

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
	LDX #$0E80				; \ Wait for SPC700
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
	LDA #$1EF3				; \ Clear $610B-$7FFF
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

SwapDetected:
	REP #$28				; \ Custom code for
	SEP #$50				;  | SNES9X 8MB ROM bug.
	BRA SNES_Reset_Continue			; /
	
SNES_Reset:					; Super NES Reset
	SEI					; Disable IRQ
	CLC					; \ Disable Emulation Mode
	XCE					; /
	BCC SwapDetected			; hmm... Emulation mode already disabled?
	REP #$68				; \ Disable Decimal Mode, A = 16-bit, X/Y = 8-bit, Clear Overflow
	SEP #$10				; /
.Continue					;
						;
	LDA #$3000				; \ Set Direct Page and Stack.
	TCD					;  |
	LDA #$1FFF				;  |
	TCS					; /
						;
	LDA #$0020				; \ Set SA-1 to sleep/reset state.
	STA $2200				; /
						;
	LDA #Reset				; \ Set up SA-1 Vectors
	STA $2203				;  |
	LDA #NMI				;  |
	STA $2205				;  |
	LDA #IRQ				;  |
	STA $2207				; /
						;
	SEP #$20				; A = 8-bit
						;
	JSL ResetBanks+$03			; Reset SA-1 Banks
						;
	LDA #$80				; \ Disable BW-RAM write protection (S-CPU)
	STA $2226				; /
						;
	STZ $2224				; Map $6000-$7FFF to $40:0000-$40:1FFF (S-CPU)
	STZ $2228				; Disable BW-RAM write protection
						;
	LDA #$FF				; \ Enable I-RAM Write (S-CPU)
	STA $2229				; /
						;
	LDA #$A0				; \ Enable IRQ from SA-1 CPU
	STA $2201				;  | Enable Character Conversion DMA IRQ
	STA $2202				; /
						;
	STZ $2200				; Enable SA-1
						;
	STZ $318E				; Clear general flag.
	STZ $3189				; Clear initialization flag.
						;
	PHK					; \ Set bank
	PLB					; /
						;
	REP #$30				; \ Transfer RAM Program
	LDA #RAMCode_End-RAMCode-1		;  |
	LDX #RAMCode				;  |
	LDY #$1E80				;  |
	MVN $00,RAMCode>>16			;  |
	SEP #$30				; /
						;	
	BVC +					; \ If emulator have the Swap ROM bug,
	LDA #$40				;  | set flag.
	TSB $318E				;  |
+						; /
						;
if !ZSNES					;
	SED					; \ Detect ZSNES
	LDA #$FF				;  |
	CLC					;  |	
	ADC #$FF				;  |
	CLD					;  |
	CMP #$64				;  |
	BNE +					;  |
	LDA #$80				;  |
	TSB $318E				; /
						;
	REP #$30				; \ If ZSNES, transfer a
	LDA #RAMCode_ZSNES_End-RAMCode_ZSNES-1	;  | special version of WaitForHBlank code.
	LDX #RAMCode_ZSNES			;  |
	LDY #RAMCode_WaitForHBlank		;  |
	MVN $00,RAMCode>>16			;  |
	SEP #$30				; /			
						;
+						;
endif						;
	JSR $1E85				; Wait for SA-1.
						;
	JML $008000				; Don't re-enable emulation mode to don't reset Stack and Direct Page.
	
RAMCode:					; RAM Code.
base $1E80					; This will get uploaded to $7E:1E80
.ProcessCode					;
	LDA #$80				; \ Send IRQ to SA-1
	STA $2200				; /
-	LDA $3189				; \ Wait for SA-1
	BEQ -					; /
	STZ $3189				; Clear flag.
	RTS					; Return
						;
-	WAI					; Wait for any interrupt.
.Wait	LDA $10					; \ If NMI isn't ran yet, wait for interrupt.
	BEQ -					; /
	JMP $806F				; Return

-	LDY #$20
.WaitForHBlank
	BIT $4212
	BVS -
-	BIT $4212
	BVC -
-	DEY
	BNE -
	RTS

base off
.End

RAMCode_ZSNES:
	LDY #$70
-	DEY
	BNE -
	RTS
.End
	
IRQStart:					; IRQ Start
	PHP					; \ Preserve (almost) everything.
	REP #$30				;  |
	PHA					;  |
	PHX					;  |
	PHY					;  |
	PHB					;  |
	PHK					;  |
	PLB					;  |
	SEP #$30				; /
						;
	LDA $2300				; \ If this is a SA-1 IRQ,
	AND #%10100000				;  | skip to OtherIRQ.
	BNE .OtherIRQ				; /
						;
	LDA $4211				; \ If not a PPU IRQ, go to UnknownIRQ.
	BPL .UnknownIRQ				; /
						;
	LDA #$00				; \ Return to SMW's IRQ routine
	PHA					;  |
	PLB					;  |
	JML $008385				; /
	
.OtherIRQ					;
	BMI .NotCCDMA				; If this isn't a CCDMA, go to SA-1 IRQ
						;
	LDA #$01				; \ Set Character Conversion DMA flag
	STA $318D 				; /
	LDA #$20 				; \ Clear CDMA (IRQ) flag
	STA $2202				; /
						;
	REP #$30				; \ Restore everything and return.
	PLB					;  |
	PLY					;  |
	PLX					;  |
	PLA					;  |
	PLP					;  |
	RTI					; /
						; ------------------------------
.NotCCDMA					;
	LDA #$80				; \ Clear IRQ from SA-1
	STA $2202				; /
						;
	CLI					; Enable IRQ
						;
	PHK					; \ Jump to SA-1 Requested Pointer
	PEA.w .Return-1				;  |
	JML.w [$3183]				; /
.Return						;
						;
	SEI					; Disable IRQ
	INC $318A				; Set SNES Ready Flag
						;
.UnknownIRQ					;
	REP #$30				; \ Restore (almost) everything and return.
	PLB					;  |
	PLY					;  |
	PLX					;  |
	PLA					;  |
	PLP					;  |
	RTI					; /
	
NMIStart:
	PHP					; \ Preserve (almost) everything.
	REP #$30				;  |
	PHA					;  |
	PHX					;  |
	PHY					;  |
	PHB					;  |
	PHK					;  |
	PLB					;  |
	SEP #$30				; /
						;
Character_Conversion_DMA:			; CCDMA Routine.
	LDA !CCDMA_SLOTS			; \ If there are no slots to transfer,
	BNE +					;  | jump to Dynamic_Sprites.
	JMP Dynamic_Sprites			; /
						;
+	TAX					; Put CCDMA slot count into X.
	REP #$20				; 16-bit A
	LDA #$1801				; \ Dest: $2118
	STA $4300				; / Write twice
	LDY #$81				; \ Tell SA-1 to enable Character Conversion DMA #1
	STY $2200				; /
	DEY					; \ Increase $2116/$2117 then writing to $2119
	STY $2115				; /
-	LDA $318D				; \ Make sure that Character Conversion is ON. 
	BEQ -					; |
	STZ $318D				; /
						;
	%ccdmaslot(0)				; \ Unrolled loop
	%ccdmaslot(1)				;  | to run each character conversion DMA table slot.
	%ccdmaslot(2)				;  |
	%ccdmaslot(3)				;  |
	%ccdmaslot(4)				;  |
	%ccdmaslot(5)				;  |
	%ccdmaslot(6)				;  |
	%ccdmaslot(7)				;  |
	%ccdmaslot(8)				;  |
	%ccdmaslot(9)				; /
						;
CCDMA_END:					;
	LDY #$80				; \ Tell SA-1 that Character Conversion is done.
	STY $2231				; /
	LDY #$82				; \ Tell SA-1 to disable DMA/CCDMA
	STY $2200				; /
						;
	SEP #$20				; 8-bit A
	STZ !CCDMA_SLOTS			; Clear CCDMA Slots
						;					
Dynamic_Sprites:				; --------------------------------------
if !DSX						;
	LDA $6100				; \ Don't run Dynamic Sprites system
	CMP #$07				;  | if the game mode isn't #$07 nor #$14
	BEQ +					;  |
	CMP #$14				;  |
	BEQ +					; /
	STZ !SLOTSUSED				; \ Reset slots used and return
endif						; |
	JML $008172				; /
	
if !DSX						;
+	LDA !SLOTSUSED				; Load Dynamic Sprites Slots
	BNE +					; Don't return to NMI if there are slots to transfer.
	JML $008172				; Otherwise, return to NMI.
	
+	STZ !SLOTSUSED				; Zero out slots used.
	ASL					; \ Jump to fastest routine for this.
	TAX					;  |
	JMP (.DSX_MODES-2,x)			; /

.DSX_MODES:					; Dynamic Sprites Slot.
	dw .TRANSFER_ONE			; 01 - One slot transfer.
	dw .TRANSFER_TWO			; 02 - Two slots transfer.
	dw .TRANSFER_THREE			; 03 - Three slots transfer.
	dw .TRANSFER_FOUR			; 04 - Transfer four slots.

.TRANSFER_ONE:					; Transfer one slot.
	REP #$20				; 16-bit A
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4310				; /
	LDY.B #!DSX_BUFFER/65536		; \ Set Transfer Bank
	STY $4314				; /
	LDY #$02				; This value is written to $420B
						;
	%transferslot(0, $0080, $C0)		; \ Transfer Slot 1, line 1.
	%transferslot(1, $0080, $C0)		;  | Transfer Slot 1, line 2.
	%transferslot(2, $0080, $C0)		;  | Transfer Slot 1, line 3.
	%transferslot(3, $0080, $C0)		; / Transfer Slot 1, line 4.
						;
	JML $008172				; Return to NMI (PHK, PLB, SEP #$30, perfect.)
	
.TRANSFER_TWO:					; Transfer two slots.
	REP #$20				; 16-bit A
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4310				; /
	LDY.B #!DSX_BUFFER/65536		; \ Set Transfer Bank
	STY $4314				; /
	LDY #$02				; This value is written to $420B
						;
	%transferslot(0, $0100, $80)		; \ Transfer Slot 1 & 2, line 1.
	%transferslot(1, $0100, $80)		;  | Transfer Slot 1 & 2, line 2.
	%transferslot(2, $0100, $80)		;  | Transfer Slot 1 & 2, line 3.
	%transferslot(3, $0100, $80)		; / Transfer Slot 1 & 2, line 4.
						;
	JML $008172				; Return to NMI.
	
.TRANSFER_THREE:				; Transfer three slots.
	REP #$20				; 16-bit A
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4310				; /
	LDY.B #!DSX_BUFFER/65536		; \ Set Transfer Bank
	STY $4314				; /
	LDY #$02				; This value is written to $420B
						;
	%transferslot(0, $0180, $40)		; \ Transfer Slot 1, 2 & 3, line 1.
	%transferslot(1, $0180, $40)		;  | Transfer Slot 1, 2 & 3, line 2.
	%transferslot(2, $0180, $40)		;  | Transfer Slot 1, 2 & 3, line 3.
	%transferslot(3, $0180, $40)		; / Transfer Slot 1, 2 & 3, line 4.
						;
	JML $008172				; Return to NMI.
	
.TRANSFER_FOUR:					; Transfer all slots.
	REP #$20				; 16-bit A
	LDA #$7C00				; \ Destination: SP4, line 5.
	STA $2116				; /
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4310				; /
	LDA.W #!DSX_BUFFER&65535		; \ Set DMA source
	STA $4312				;  |
	LDY.B #!DSX_BUFFER/65536		;  |
	STY $4314				; /
	LDA #$0800				; \ Set Length of transfer.
	STA $4315				; /
	LDY #$02				; \ Run DMA
	STY $420B				; /
						;
	JML $008172				; Return to NMI.
endif						;
	
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
	REP #$20
	LDA #$816A				; \ Set SNES IRQ and NMI Vectors
	STA $220C				;  | (Dynamic vectors)
	LDA #$8374				;  |
	STA $220E				; /
	SEP #$20
						
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