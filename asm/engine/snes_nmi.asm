; legacy DSX patch DMA base macro.
; A is 16-bit, X is 8-bit.
macro transfer_slot(slot, bytes, shift)
	LDA.W #$7C00+(<slot>*256)+<shift>	; \ VRAM address + line*slot
	STA.W $2116				; /
	LDA.W #(!DSX_BUFFER&65535)+(<slot>*512)+(<shift>*2) ;\ Set Buffer location
	STA.W $4322				; /
	LDA.W #<bytes>				; \ Set bytes to transfer
	STA.W $4325				; /
	STY.W $420B				; Run DMA.
endmacro

; Character Conversion DMA base macro.
; A is 16-bit, Y is 8-bit.
; X is remain CDMA slots.
macro cc1_dma_slot(slot)
	LDY.W !CCDMA_TABLE+(<slot>*8)+0		; Load CDMA value
	BMI ?normal_dma				; If is >= #$80, it's normal DMA
	STY $2231				; Otherwise store the CDMA register value.
						;
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+3		; \ Set source of bitmap in BW-RAM.
	STA $2232				;  | (Both SA-1 and CPU Register.)
	STA $4322				;  |
	LDY.W !CCDMA_TABLE+(<slot>*8)+5		;  |
	STY $2234				;  |
	STY $4324				; /
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
	STA $4325				; /
	LDA.W !CCDMA_TABLE+(<slot>*8)+1		; \ Store VRAM address.
	STA $2116				; /
						;
	LDY #$04				; \ Run SA-1 AND CPU DMA
	STY $420B				; /
						;
	DEX					; \ If there are no more remaining,
	BNE +					;  | jump to CCDMA_END routine, otherwise,
	JMP .cc1_end				; / continue.

?normal_dma:
	LDY #$80				; \ Make sure that CCDMA is turned off.
	STY $2231				;  |
	LDY #$82				;  |
	STY $2200				; /
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+1		; \ Set VRAM address
	STA $2116				; /
	LDA.W !CCDMA_TABLE+(<slot>*8)+3		; \ Set source address
	STA $4322				;  |
	LDY.W !CCDMA_TABLE+(<slot>*8)+5		;  |
	STY $2234				; /
	LDA.W !CCDMA_TABLE+(<slot>*8)+6		; \ Store size of conversion+transfer
	STA $4325				; /
						;
	LDY #$04				; \ Transfer.
	STY $420B				; /
						;
	LDY #$81				; \ Enable again Character Conversion DMA.
	STY $2200				; /
						;
;?end:						;
	DEX					; \ If there are no more remaining,
	BNE +					;  | jump to CCDMA End routine, otherwise,
	JMP .cc1_end				; / continue.
+
endmacro

snes_nmi:
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
.main:						;
	LDA !CCDMA_SLOTS			; \ If there are no slots to transfer,
	BNE +					;  | jump to Dynamic_Sprites.
	JMP .dsx_sprites			; /
						;
+	TAX					; Put CCDMA slot count into X.
	REP #$20				; 16-bit A
	LDA #$1801				; \ Dest: $2118
	STA $4320				; / Write twice
	LDY #$81				; \ Tell SA-1 to enable Character Conversion DMA #1
	STY $2200				; /
	DEY					; \ Increase $2116/$2117 then writing to $2119
	STY $2115				; /
-	LDA $318D				; \ Make sure that Character Conversion is ON. 
	BEQ -					; |
	STZ $318D				; /
						;
	%cc1_dma_slot(0)			; \ Unrolled loop
	%cc1_dma_slot(1)			;  | to run each character conversion DMA table slot.
	%cc1_dma_slot(2)			;  |
	%cc1_dma_slot(3)			;  |
	%cc1_dma_slot(4)			;  |
	%cc1_dma_slot(5)			;  |
	%cc1_dma_slot(6)			;  |
	%cc1_dma_slot(7)			;  |
	%cc1_dma_slot(8)			;  |
	%cc1_dma_slot(9)			; /
						;
.cc1_end:					;
	LDY #$80				; \ Tell SA-1 that Character Conversion is done.
	STY $2231				; /
	LDY #$82				; \ Tell SA-1 to disable DMA/CCDMA
	STY $2200				; /
						;
	SEP #$20				; 8-bit A
	STZ !CCDMA_SLOTS			; Clear CCDMA Slots
						;					
.dsx_sprites:					; --------------------------------------
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
	JMP (.dsx_modes-2,x)			; /

.dsx_modes:					; Dynamic Sprites Slot.
	dw .transfer_one			; 01 - One slot transfer.
	dw .transfer_two			; 02 - Two slots transfer.
	dw .transfer_three			; 03 - Three slots transfer.
	dw .transfer_four			; 04 - Transfer four slots.

.transfer_one:					; Transfer one slot.
	REP #$20				; 16-bit A
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4320				; /
	LDY.B #!DSX_BUFFER/65536		; \ Set Transfer Bank
	STY $4324				; /
	LDY #$04				; This value is written to $420B
						;
	%transfer_slot(0, $0080, $C0)		; \ Transfer Slot 1, line 1.
	%transfer_slot(1, $0080, $C0)		;  | Transfer Slot 1, line 2.
	%transfer_slot(2, $0080, $C0)		;  | Transfer Slot 1, line 3.
	%transfer_slot(3, $0080, $C0)		; / Transfer Slot 1, line 4.
						;
	JML $008172				; Return to NMI (PHK, PLB, SEP #$30, perfect.)
	
.transfer_two:					; Transfer two slots.
	REP #$20				; 16-bit A
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4320				; /
	LDY.B #!DSX_BUFFER/65536		; \ Set Transfer Bank
	STY $4324				; /
	LDY #$04				; This value is written to $420B
						;
	%transfer_slot(0, $0100, $80)		; \ Transfer Slot 1 & 2, line 1.
	%transfer_slot(1, $0100, $80)		;  | Transfer Slot 1 & 2, line 2.
	%transfer_slot(2, $0100, $80)		;  | Transfer Slot 1 & 2, line 3.
	%transfer_slot(3, $0100, $80)		; / Transfer Slot 1 & 2, line 4.
						;
	JML $008172				; Return to NMI.
	
.transfer_three:				; Transfer three slots.
	REP #$20				; 16-bit A
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4320				; /
	LDY.B #!DSX_BUFFER/65536		; \ Set Transfer Bank
	STY $4324				; /
	LDY #$04				; This value is written to $420B
						;
	%transfer_slot(0, $0180, $40)		; \ Transfer Slot 1, 2 & 3, line 1.
	%transfer_slot(1, $0180, $40)		;  | Transfer Slot 1, 2 & 3, line 2.
	%transfer_slot(2, $0180, $40)		;  | Transfer Slot 1, 2 & 3, line 3.
	%transfer_slot(3, $0180, $40)		; / Transfer Slot 1, 2 & 3, line 4.
						;
	JML $008172				; Return to NMI.
	
.transfer_four:					; Transfer all slots.
	REP #$20				; 16-bit A
	LDA #$7C00				; \ Destination: SP4, line 5.
	STA $2116				; /
	LDY #$80				; \ Set up DMA
	STY $2115				;  |
	LDA #$1801				;  |
	STA $4320				; /
	LDA.W #!DSX_BUFFER&65535		; \ Set DMA source
	STA $4322				;  |
	LDY.B #!DSX_BUFFER/65536		;  |
	STY $4324				; /
	LDA #$0800				; \ Set Length of transfer.
	STA $4325				; /
	LDY #$04				; \ Run DMA
	STY $420B				; /
						;
	JML $008172				; Return to NMI.
endif						;

snes_nmi_end2:
	LDX #$81

snes_nmi_end:
	LDA.w snes_irq_mem+0
	AND #$7F
	STA.w snes_irq_mem+0
	BEQ .store
	
	TXA
	BIT #$20
	BEQ .fire
	AND #$7F
	TAX
	BRA .store
	
.fire:
	JSR.w fire_nmi_irq
	BRA .finish
	
.store:
	STX $4200

.finish:
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

	