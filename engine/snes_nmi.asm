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

NMIStart:
	REP #$30				; \ Preserve A/X/Y/D/B
	PHA					;  |
	PHX					;  |
	PHY					;  |
	PHD					;  |
	PHB					;  |
	PHK					;  |
	PLB					;  |
	LDA.w #$3000				;  |
	TCD					; /
	SEP #$30				; 8-bit A/X/Y
						;
	LDA.w snes_irq_mem+3			; \ Preserve BW-RAM Mapping and
	STZ.w snes_irq_mem+3			;  | reset to default value.
	STZ $2224				;  |
	PHA					; /
						;
Character_Conversion_DMA:			; CCDMA Routine.
	LDA !CCDMA_SLOTS			; \ If there are no slots to transfer,
	BNE +					;  | jump to Dynamic_Sprites.
	JMP Dynamic_Sprites			; /
						;
+	TAX					; Put CCDMA slot count into X.
	REP #$20				; 16-bit A
	LDA #$1801				; \ Dest: $2118
	STA $4310				; / Write twice
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

NMIEnd:
	PLA
	STA $2224
	STA.w snes_irq_mem+3
	
	REP #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	RTI

	