@asar 1.31
;===============================================;
; SA-1 Pack v1.03				;
;  by Vitor Vilela				;
;===============================================;

sa1rom						;\ Don't touch!
!c		= autoclean			;/

!SLOTSUSED 	= $66FE				; Don't change these defines below!
!CCDMA_TABLE 	= $3190				;
!CCDMA_SLOTS	= $317F				;
!CC_BUFFER	= $3700				;
!DSX_BUFFER 	= $418000			;

;===============================================;
; Hijacks					;
;===============================================;

incsrc "remap/dp.asm"				; Remaps $7E:0000-$7E:00FF
incsrc "remap/addr.asm"				; Remaps $7E:0100-$7E:1FFF
incsrc "remap/sram.asm"				; Remaps SRAM
incsrc "remap/map16.asm"			; Remaps Map16

org $FFFC					;\ Change Reset Vector.
	dw Reset2				;/

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
BankSwitch:					;\ $008A60 - Default Bank Switch
	db $80,$81,$82,$83			;/
	
Reset:						;\ Use the "unused" space
!c	JML SA1_Reset				; | to store some vectors.
						; |
IRQ:						; |
!c	JML SA1_IRQ				; |
						; |
NMI:						; |
!c	JML SA1_NMI				; |
						; |
Reset2:						; |
!c	JML SNES_Reset				;/

warnpc $8A78

ORG $8069					; Restore old code
	INC $10
	
if read1($806B) != $5C
ORG $806B
	JMP RAMCode_Wait
	NOP
endif

ORG $801F
	LDA #$3000				; Make sure that the Direct Page is $3000
	
ORG $8023
	LDA #$1FFF				; Set Stack Pointer to $1FFF.
	
ORG $816A					;\ Hijack NMIStart to
!c	JML NMIStart				;/ Dynamic Sprites and Character Conversion DMA Table

ORG $843B
!c	JML WaitForHBlank

;===============================================;
; Macros					;
;===============================================;

; A is 16-bit, X is 8-bit.
macro transferslot(slot, bytes, shift)
	LDA.W #$7C00+(<slot>*256)+<shift>	;\ VRAM address + line*slot
	STA.W $2116				;/
	LDA.W #(!DSX_BUFFER&65535)+(<slot>*512)+(<shift>*2) ;\ Set Buffer location
	STA.W $4302				;/
	LDA.W #<bytes>				;\ Set bytes to transfer
	STA.W $4305				;/
	STY.W $420B				; Run DMA.
endmacro

; A is 16-bit, Y is 8-bit.
; X is remain CDMA slots.
macro ccdmaslot(slot)
	LDY.W !CCDMA_TABLE+(<slot>*8)+0		; Load CDMA value
	BMI ?NormalDMA				; If is >= #$80, it's normal DMA
	STY $2231				; Otherwise store the CDMA register value.
						;
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+3		;\ Set source of bitmap in BW-RAM.
	STA $2232				; | (Both SA-1 and CPU Register.)
	STA $4302				; |
	LDY.W !CCDMA_TABLE+(<slot>*8)+5		; |
	STY $2234				; |
	STY $4304				;/
						;
	LDA.W #!CC_BUFFER			;\ Set I-RAM buffer.
	STA $2235				;/ (This is used as buffer in conversion, like the echo buffer.)
						;
	LDY $318E
	BMI +
						
	CLI					;\ Wait for SA-1 CCDMA.
-	LDY $318D				; | (probably it's doing the first character conversion)
	BEQ -					; |
	DEY					; |
	STY $318D				; |
	SEI					;/
						;
+	LDA.W !CCDMA_TABLE+(<slot>*8)+6		;\ Store size of conversion+transfer
	STA $4305				;/
	LDA.W !CCDMA_TABLE+(<slot>*8)+1		;\ Store VRAM address.
	STA $2116				;/
						;
	LDY #$01				;\ Run SA-1 AND CPU DMA
	STY $420B				;/
						;
	DEX					;\ If there are no more remaining,
	BNE +					; | jump to CCDMA_END routine, otherwise,
	JMP CCDMA_END				;/ continue.

?NormalDMA:
	LDY #$80				;\ Make sure that CCDMA is turned off.
	STY $2231				; |
	LDY #$82				; |
	STY $2200				;/
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+1		;\ Set VRAM address
	STA $2116				;/
	LDA.W !CCDMA_TABLE+(<slot>*8)+3		;\ Set source address
	STA $4302				; |
	LDY.W !CCDMA_TABLE+(<slot>*8)+5		; |
	STY $2234				;/
	LDA.W !CCDMA_TABLE+(<slot>*8)+6		;\ Store size of conversion+transfer
	STA $4305				;/
						;
	LDY #$01				;\ Transfer.
	STY $420B				;/
						;
	LDY #$81				;\ Enable again Character Conversion DMA.
	STY $2200				;/
?End:						;
	DEX					;\ If there are no more remaining,
	BNE +					; | jump to CCDMA End routine, otherwise,
	JMP CCDMA_END				;/ continue.
+
endmacro

;===============================================;
; Main Code					;
;===============================================;

freecode
incsrc "boost/oam.asm"				; OAM speed up.
incsrc "boost/sprites.asm"			; Sprites speed up.
incsrc "boost/map16.asm"			; Level speed up.
incsrc "boost/lzx.asm"				; LZ2 or LZ3 speed up.

ResetBanks:					; Reset Bank Switch to Default.
	BIT $318E				; Overflow = Swap bug flag.
						;
	LDX #$03				; Foreach Bank Register
-	LDA.L BankSwitch,X			; Load Bank Switch
	BVC +					;\ If Swap bug flag is set, invert register value.
	EOR #$04				;/
+	STA $2220,X				; Store to Bank register.
	DEX					;\ Foreach loop.
	BPL -					;/
	RTL					; Return

ClearStack:					; Based from QuickROM, by Alcaro.
	SEP #$20				; 8-bit A
						;
	LDA.b #.SA1				;\ Call SA-1
	STA $3180				; |
	LDA.b #.SA1/256				; |
	STA $3181				; |
	LDA.b #.SA1/65536			; |
	STA $3182				; |
	JSR $1E80				;/
						;
	LDA $6100				;\ Don't waste time if game mode isn't 00
	BNE .DoNotWasteTime			;/
	LDX #$1000				;\ Wait for SPC700
-	DEX					; |
	BPL -					;/
.DoNotWasteTime					;
	LDA #$00				;\ Setup/Init other RAM.		
	STA $7E837B				; |
	STA $7E837C				; |
	LDA #$FF				; |
	STA $7F837D				;/
	SEP #$10				; 8-bit X/Y
	RTL					; And Return.
						;
.SA1						; SA-1 Code
	PHB					; Preserve Bank
	STZ $7FFF				;\ Set "Fixed" byte for MVP.
	STZ $30FF				;/
	REP #$30				; 16-bit A/X/Y
	LDA #$1EF3				;\ Clear $610B-$7FFF
	LDX #$7FFF				; |
	LDY #$7FFE				; |
	MVP $00,$00				;/
	LDA #$00FF				;\ Clear $3000-$30FF
	LDX #$30FF				; |
	LDY #$30FE				; |
	MVP $00,$00				;/
	SEP #$30				; 8-bit A/X/Y
	PLB					; Restore Bank
	RTL					; Return

SwapDetected:
	REP #$28				;\ Custom code for
	SEP #$50				; | SNES9X 8MB ROM bug.
	BRA SNES_Reset_Continue			;/
	
SNES_Reset:					; Super NES Reset
	SEI					; Disable IRQ
	CLC					;\ Disable Emulation Mode
	XCE					;/
	BCC SwapDetected			; hmm... Emulation mode already disabled?
	REP #$68				;\ Disable Decimal Mode, A = 16-bit, X/Y = 8-bit, Clear Overflow
	SEP #$10				;/
.Continue					;
						;
	LDA #$3000				;\ Set Direct Page and Stack.
	TCD					; |
	LDA #$1FFF				; |
	TCS					;/
						;
	LDA #Reset				;\ Setup SA-1 Vectors
	STA $2203				; |
	LDA #NMI				; |
	STA $2205				; |
	LDA #IRQ				; |
	STA $2207				;/
						;
	LDA #$816A				;\ Set IRQ and NMI Vectors
	STA $220C				; | (Dynamic vectors)
	LDA #$8374				; |
	STA $220E				;/
						;
	SEP #$20				; A = 8-bit
						;
	JSL ResetBanks+$03			; Reset SA-1 Banks
						;
	LDA #$80				;\ Disable BW-RAM write protection (S-CPU)
	STA $2226				;/
						;
	STZ $2224				; Map $6000-$7FFF to $40:0000-$40:1FFF (S-CPU)
	STZ $2228				; Disable BW-RAM write protection
						;
	LDA #$FF				;\ Enable I-RAM Write (S-CPU)
	STA $2229				;/
						;
	LDA #$A0				;\ Enable IRQ from SA-1 CPU
	STA $2201				; | Enable Character Conversion DMA IRQ
	STA $2202				;/
						;
	STZ $2200				; Enable SA-1
						;
	STZ $318E				; Clear general flag.
	STZ $3189				; Clear init flag.
						;
	PHK					;\ Set bank
	PLB					;/
						;
	REP #$30				;\ Transfer RAM Program
	LDA #RAMCode_End-RAMCode-1		; |
	LDX #RAMCode				; |
	LDY #$1E80				; |
	MVN $00,RAMCode>>16			; |
	SEP #$30				;/
						;	
	BVC +					;\ If emulator have the Swap ROM bug,
	LDA #$40				; | set flag.
	TSB $318E				; |
+						;/
						;
	SED					;\ Auto detect ZSNES
	LDA #$FF				; |
	CLC					; |	
	ADC #$FF				; |
	CLD					; |
	CMP #$64				; |
	BNE +					; |
	LDA #$80				; |
	TSB $318E				;/
						;
+	JSR $1E85				; Wait for SA-1.
						;
	JML $008000				; Don't reenabling emulation mode to don't reset Stack and Direct Page.
	
WaitForHBlank:
	BIT $318E				;\ If ZSNES, instead of
	BPL +					; | waiting for H-Blank, waste
	LDY #$30				; | some time and return.
-	DEY					; |
	BNE -					; |
	JML $008448				;/

+	DEY #4
	BRA +
	
-	LDY #$20-4				;\ Wait For H-Blank
+	BIT $4212				; |
	BVS -					; |
-	BIT $4212				; |
	BVC -					; |
- 	DEY					; |
	BNE -					; |
	JML $008448				;/

RAMCode:					; RAM Code.
base $1E80					; This will get uploaded to $7E:1E80
.ProcessCode					;
	LDA #$80				;\ Send IRQ to SA-1
	STA $2200				;/
-	LDA $3189				;\ Wait for SA-1
	BEQ -					;/
	STZ $3189				; Clear flag.
	RTS					; Return
						;
-	WAI					; Wait for any interrupt.
.Wait	LDA $10					;\ If NMI isn't ran yet, wait for interrupt.
	BEQ -					;/
	JMP $806F				; Return
base off
.End
	
IRQStart:					; IRQ Start
	PHP					;
	REP #$30				;
	PHA					;
	PHX					;
	PHY					;
	PHB					;
	PHK					;
	PLB					;
	SEP #$30				;
						;
	LDA $4211				;\ If this is not a PPU IRQ,
	BPL .OtherIRQ				;/ skip to OtherIRQ
						;
	LDA #$00				;\ Return to SMW's IRQ routine
	PHA					; |
	PLB					; |
	JML $008385				;/
	
.OtherIRQ			
	LDA #$20				;\ If this isn't a CCDMA, goto SA-1 IRQ
	BIT $2300				; |
	BEQ .NotCCDMA				;/
						;
	LDA #$01				;\ Set Character Conversion DMA flag
	STA $318D 				;/
	LDA #$20 				;\ Clear CDMA (IRQ) flag
	STA $2202				;/
						;
	REP #$30				;\ Restore everything and return.
	PLB					; |
	PLY					; |
	PLX					; |
	PLA					; |
	PLP					; |
	RTI					;/
						; ------------------------------
.NotCCDMA					;
	BPL .UnknownIRQ				; If not a SA-1 IRQ, goto UnknownIRQ
						;
	LDA #$80				;\ Clear IRQ from SA-1
	STA $2202				;/
						;
	CLI					; Enable IRQ
						;
	PHK					;\ Jump to SA-1 Requested Pointer
	PEA.w .Return-1				; |
	JML.w [$3183]				;/
.Return						;
						;
	SEI					; Disable IRQ
	INC $318A				; Set SNES Ready Flag
						;
.UnknownIRQ					;
	REP #$30				;\ Restore everything and return.
	PLB					; |
	PLY					; |
	PLX					; |
	PLA					; |
	PLP					; |
	RTI					;/
						; -----------------------------
.PPUFire					;
	LDA $4211				;\ If IRQ not fired, return.
	BPL .UnknownIRQ				;/
						;
	
NMIStart:
	PHP					;\
	REP #$30				; |
	PHA					; |
	PHX					; |
	PHY					; |
	PHB					; |
	PHK					; |
	PLB					; |
	SEP #$30				;/
						;
Character_Conversion_DMA:			; CCDMA Routine.
	LDA !CCDMA_SLOTS			;\ If there are no slots to transfer,
	BNE +					; | jump to Dynamic_Sprites.
	JMP Dynamic_Sprites			;/
						;
+	TAX					; Put CCDMA slot count into X.
	REP #$20				; 16-bit A
	LDA #$1801				;\ Dest: $2118
	STA $4300				;/ Write twice
	LDY #$81				;\ Tell SA-1 to enable Character Conversion DMA #1
	STY $2200				;/
	DEY					;\ Increase $2116/$2117 then writting to $2119
	STY $2115				;/
						;
	%ccdmaslot(0)				;\ Untroll loop
	%ccdmaslot(1)				; | to run each character conversion dma table slot.
	%ccdmaslot(2)				; |
	%ccdmaslot(3)				; |
	%ccdmaslot(4)				; |
	%ccdmaslot(5)				; |
	%ccdmaslot(6)				; |
	%ccdmaslot(7)				; |
	%ccdmaslot(8)				; |
	%ccdmaslot(9)				;/
						;
CCDMA_END:					;
	LDY #$80				;\ Tell to SA-1 that Character Conversion is done.
	STY $2231				;/
	LDY #$82				;\ Tell to SA-1 disable DMA/CCDMA
	STY $2200				;/
						;
	SEP #$20				; 8-bit A
	STZ !CCDMA_SLOTS			; Clear CCDMA Slots
						;					
Dynamic_Sprites:				; --------------------------------------
	LDA !SLOTSUSED				; Load Dynamic Sprites Slots
	BNE +					; Don't return to NMI if there are slots to transfer.
	JML $008172				; Otherwise, return to NMI.
	
+	ASL					;\ Jump to fastest routine for this.
	TAX					; |
	JMP (.DSX_MODES-2,x)			;/

.DSX_MODES:					; Dynamic Sprites Slot.
	dw .TRANSFER_ONE			; 01 - One slot transfer.
	dw .TRANSFER_TWO			; 02 - Two slots transfer.
	dw .TRANSFER_THREE			; 03 - Three slots transfer.
	dw .TRANSFER_FOUR			; 04 - Transfer four slots.

.TRANSFER_ONE:					; Transfer one slot.
	REP #$20				; 16-bit A
	LDY #$80				;\ Setup DMA
	STY $2115				; |
	LDA #$1801				; |
	STA $4300				;/
	LDY.B #!DSX_BUFFER/65536		;\ Set Tranfer Bank
	STY $4304				;/
	LDY #$01				; This value is written to $420B
						;
	%transferslot(0, $0080, $C0)		; Transfer Slot 1, line 1.
	%transferslot(1, $0080, $C0)		; Transfer Slot 1, line 2.
	%transferslot(2, $0080, $C0)		; Transfer Slot 1, line 3.
	%transferslot(3, $0080, $C0)		; Transfer Slot 1, line 4.
						;
	DEY					;\ Zero slots used.
	STY !SLOTSUSED				;/
						;
	JML $008172				; Return to NMI (PHK, PLB, SEP #$30, perfect.)
	
.TRANSFER_TWO:					; Transfer two slots.
	REP #$20				; 16-bit A
	LDY #$80				;\ Setup DMA
	STY $2115				; |
	LDA #$1801				; |
	STA $4300				;/
	LDY.B #!DSX_BUFFER/65536		;\ Set Transfer Bank
	STY $4304				;/
	LDY #$01				; This value is written to $420B
						;
	%transferslot(0, $0100, $80)		; Transfer Slot 1 & 2, line 1.
	%transferslot(1, $0100, $80)		; Transfer Slot 1 & 2, line 2.
	%transferslot(2, $0100, $80)		; Transfer Slot 1 & 2, line 3.
	%transferslot(3, $0100, $80)		; Transfer Slot 1 & 2, line 4.
						;
	DEY					;\ Zero slots used.
	STY !SLOTSUSED				;/
						;
	JML $008172				; Return to NMI.
	
.TRANSFER_THREE:				; Transfer three slots.
	REP #$20				; 16-bit A
	LDY #$80				;\ Setup DMA
	STY $2115				; |
	LDA #$1801				; |
	STA $4300				;/
	LDY.B #!DSX_BUFFER/65536		;\ Set Transfer Bank
	STY $4304				;/
	LDY #$01				; This value is written to $420B
						;
	%transferslot(0, $0180, $40)		; Tranfer Slot 1, 2 & 3, line 1.
	%transferslot(1, $0180, $40)		; Tranfer Slot 1, 2 & 3, line 2.
	%transferslot(2, $0180, $40)		; Tranfer Slot 1, 2 & 3, line 3.
	%transferslot(3, $0180, $40)		; Tranfer Slot 1, 2 & 3, line 4.
						;
	DEY					;\ Zero slots used.
	STY !SLOTSUSED				;/
						;
	JML $008172				; Return to NMI.
	
.TRANSFER_FOUR:					; Transfer all slots.
	REP #$20				; 16-bit A
	LDA #$7C00				;\ Dest: SP4, line 5.
	STA $2116				;/
	LDY #$80				;\ Setup DMA
	STY $2115				; |
	LDA #$1801				; |
	STA $4300				;/
	LDA.W #!DSX_BUFFER&65535		;\ Set DMA source
	STA $4302				; |
	LDY.B #!DSX_BUFFER/65536		; |
	STY $4304				;/
	LDA #$0800				;\ Set Length of transfer.
	STA $4305				;/
	LDY #$01				;\ Run DMA
	STY $420B				;/
						;
	DEY					;\ Zero slots used.
	STY !SLOTSUSED				;/
						;
	JML $008172				; Return to NMI.
	
SA1_Reset:					;
	SEI					;\ Disable IRQ and Emulation Mode
	CLC					; |
	XCE					;/
						;
	REP #$38				; A/X/Y 16-bit, Disable Decimal Mode
						;
	LDA #$0000				;\ Set Direct Page to $0000,
	TCD					; | Stack Pointer to $37FF and
	LDA #$37FF				; | Data Bank to current.
	TCS					; |
	PHK					; |
	PLB					;/
						;
	SEP #$30				; A/X/Y 8-bit
						;
	LDA #$80				;\ Enable I-RAM and BW-RAM write
	STA $2227				; |
	STZ $2225				; |
	LDA #$FF				; |
	STA $222A				;/
						;
	LDA #$B0				;\ Enable IRQ from S-CPU
	STA $220A				; | Enable IRQ from DMA
	STA $220B				;/ Enable NMI from S-CPU
						;
	STZ $223F				; This is new from previous patches
						; This will setup a 4bpp Virtual RAM at $60:0000-$63:FFFF
						; Settings this to #$01 will make a 2bpp Virtual RAM at $60:0000-$67:FFFF.
						;
	LDA #$50				;\ Enable dynamic NMI/IRQ vector.
	STA $2209				;/
						;
	STZ $3200				;\ Clear $3200, $3000 and $318F
	STZ $318F				; |
	STZ $00					;/
						;
	PHB					;\ Then, start a "fixed" MVN
	REP #$30				; | and clear $3200-$36FF, $3000-$318D, $318F-$31FF
	LDA #$04FE				; |
	LDX #$3200				; | $3700-$37FF is Stack and CCDMA buffer.
	LDY #$3201				; |
	MVN $00,$00				; |
	LDA #$018C				; |
	LDX #$3000				; |
	LDY #$3001				; |
	MVN $00,$00				; |
	LDA #$006F				; |
	LDX #$318F				; |
	LDY #$3190				; |
	MVN $00,$00				; |
	SEP #$30				; |
	PLB					;/
						;
	CLI					; Enable Interrupts
						;
						;\ A = 0xFFFF
	STA $0189				;/ Tell S-CPU to continue processing
						;
	PEA $0100				;\ Set DP to $0100
	PLD					;/
						;
-	LDA $8B					;\ Loop until a Parallel Mode is enabled
	BEQ -					;/ (or wait for a IRQ for SNES call)
						;
ParallelMode:					;
	PHK					;\ Jump to Parallel Address
	PEA.w .End-1				; |
	JML [$3186]				;/
.End						;
	STZ $8B					;\ Clear Parallel Flag and Return to Main Loop.
	BRA -					;/
							
SA1_IRQ:					; SA-1 CPU IRQ
	;PHP					;\ Preserve P/A/X/Y/D/B
	REP #$30				; |
	PHA					; |
	PHX					; |
	PHY					; |
	PHD					; |
	PHB					; |
	PHK					; |
	PLB					; |
	LDA #$0000				; |
	TCD					;/
	SEP #$30				; 8-bit A/X/Y
						;
	LDA $318F				;\ Preserve BW-RAM Mapping and
	STZ $318F				; | reset to default value.
	STZ $2225				; |
	PHA					;/
						;
	LDA $2301				; Read status register
	BIT #$40				;\ If $40 is set, goto Timer IRQ
	BNE SA1_IRQEnding			;/ 
	BIT #$20				;\ If $20 is set, goto DMA end code
	BNE DMA_End				;/
						;
	AND #$0F				;\ Get S-CPU Message
	ASL A					; | x2
	TAX					; | A->X
	JMP (SA1IRQ_Ptr,x)			;/ Goto Messages Code
						;
DMA_End:					;
	LDA #$01				;\ Set DMA Flag and Return
	STA $018C				;/
SA1_IRQEnding:
	LDA #$F0				;\ Clear IRQ from S-CPU
	STA $220B				;/
						;
	PLA					;\ Restore BW-RAM Mapping
	STA $2225				; |
	STA $318F				;/
						;
	REP #$30				;\ Restore B/D/Y/X/A/P
	PLB					; |
	PLD					; |
	PLY					; |
	PLX					; |
	PLA					; |
	;PLP					;/
SA1_NMI:					; SA-1 NMI - not used on this patch. Also, only a few emulators handle this.
	RTI					; Return

SA1IRQ_Ptr:					; SA-1 IRQ Message List
dw ProcessRequest				; #$00 - Process Request (aka Jump to Code)
dw EnableChvDMA					; #$01 - Enable Character Conversion DMA #1
dw DisableDMA					; #$02 - Disable DMA / Character Conversion DMA
dw ProcessIRQRequest				; #$03 - IRQ Compatible Process Request

ProcessRequest:
	LDA #$B0				;\ Clear IRQ from S-CPU
	STA $220B				;/
	CLI					; Enable IRQ
	PHK					;\
	PEA.w .return-1				; | JSL [$3180]
	JML.w [$3180]				; |
.return						;/
	SEI					; Disable IRQ
	INC $0189				; Set Ready Flag
	BRA SA1_IRQEnding			; Return
	
EnableChvDMA:
	LDA #$B0				;\ Enable Character Conversion DMA CC1 (BW-RAM->I-RAM)
	STA $2230				;/
	BRA SA1_IRQEnding			; Return
	
DisableDMA:					;\ Disable SA-1 DMA (of any type)
	STZ $2230				; |
	BRA SA1_IRQEnding			;/
	
ProcessIRQRequest:				;\ Same as Process Request, but
	LDA #$B0				; | it's to use in a S-CPU IRQ/NMI
	STA $220B				; | and this doens't accept any
	PHK					; | interrupt.
	PEA.w .return-1				; |
	JML.w [$318F]				; |
.return						; |
	INC $0192				; |
NoMessage:					; |
	BRA SA1_IRQEnding			;/

print "Insert size: ", freespaceuse, " bytes."