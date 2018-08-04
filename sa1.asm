@asar 1.31
;===============================================;
; SA-1 Pack v1.02				;
;  by Vitor Vilela				;
;===============================================;

sa1rom						;\ Don't touch!
!c		= autoclean			;/

; Various remappings
incsrc "remap/dp.asm"
incsrc "remap/addr.asm"
incsrc "remap/sram.asm"
incsrc "remap/map16.asm"

; Game Boosts
incsrc "boost/oam.asm"
incsrc "boost/sprites.asm"
incsrc "boost/map16.asm"
incsrc "boost/lzx.asm"

!FPS_PLUS	= $00				; Increases FPS on bsnes/unknown emulators. ($01 - Enable, $00 - Disable)
						; WARNING: This command adds VARIOUS hacks.
						
!SLOTSUSED 	= $66FE				; Don't change these defines below!
!CCDMA_TABLE 	= $3190				;
!CCDMA_SLOTS	= $317F				;
!CC_BUFFER	= $3700				;
!DSX_BUFFER 	= $418000			;

;===============================================;
; Hijacks					;
;===============================================;

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

!c	JML DynamicBank				; $008A58 - Dynamic Bank Allocation System (DBAS).
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
macro transferslot(slot, bytes)
	LDA.W #$7C00+(<slot>*256)		;\ VRAM address + line*slot
	STA.W $2116				;/
	LDA.W #(!DSX_BUFFER&65535)+(<slot>*512)	;\ Set Buffer location
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
	LDY $318E				;\ But if the emulator is ZSNES,
	BMI ?NormalDMA				;/ don't execute Character Conversion DMA.
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
	CLI					;\ Wait for SA-1 CCDMA.
-	LDY $318D				; | (probably it's doing the first character conversion)
	BEQ -					; |
	DEY					; |
	STY $318D				; |
	SEI					;/
						;
	LDA.W !CCDMA_TABLE+(<slot>*8)+6		;\ Store size of conversion+transfer
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

;===============================================;
; Extra Routines				;
;===============================================;

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

; X - PC high byte to convert (pc >> 16 & 0xff)
;
; Returns:
; A - Bank byte to use
; X/Y - Register used.
DynamicBank:
	LDY #$03				; Bank Register to store (FXB)
	LDA $03,S				; Get Program Bank of source code.
	CMP #$A0-1				;\ If is >=#$A0
	BCC +					;/
	DEY					; Change Bank Register to EXB.
+	TXA					;\ Get PC bank 4-bit higher value.
	LSR					; |
	LSR					; |
	LSR					; |
	LSR					;/
	BIT $318E				;\ Invert bit 4 if Swap bug is present.
	BVC +					; |
	EOR #$04				;/
+	ORA #$80				;\ Store to Bank Register.
	STA $2220,Y				;/
	TXA					;\ Get lower 4-bit value of PC bank.
	AND #$0F				;/
	TYX					; Bank Register -> X
	ORA.L .Table-2,X			; Set Base bank to $00
	RTL					; Return.
.Table
	db $E0,$F0
	
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
	LDX #$0D80				;\ Wait for SPC700
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

;===============================================;
; SNES CPU Code					;
;===============================================;

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
if !FPS_PLUS == 1				; ------------- FPS++ CODE ---------------
	STZ $2121				; CGRAM Address
	LDY #$00				; Loop Index
						;
-	LDA $213B				;\ If palette is not same as
	CMP PaletteTable,y			; | SNES9X inits, break the loop.
	CLC					; |
	BNE .FinalResult			; |
	LDA $213B				; |
	BNE .FinalResult			;/
	INY					;\ Or continue.
	CPY #$08				; |
	BNE -					;/
						;
	SEC					;\ If carry = 1, it's SNES9X.
.FinalResult					; |
	LDA #$02				; |
	BCS +					; |
	LDA #$00				; |
+	TSB $318E				;/
						;
endif						; ------------- END OF FPS++ CODE ------------
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

if !FPS_PLUS == 1
PaletteTable:					; SNES9X inits with that palette.
	db $00,$04,$08,$0C			; (High byte is always 00).
	db $10,$14,$18,$1C			;
endif
	
WaitForHBlank:
	BIT $318E				;\ If ZSNES, instead of
	BPL +					; | waiting for H-Blank, waste
	LDY #$30				; | some time and return.
-	DEY					; |
	BNE -					; |
	JML $008448				;/
	
-	LDY #$20				;\ Wait For H-Blank
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
	PHP					;\ Preserve P/A/X/Y/B
	REP #$30				; |
	PHA					; |
	PHX					; |
	PHY					; |
	PHB					; |
	PHK					; |
	PLB					; |
	SEP #$30				;/
						;
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
	BPL .PPUFire				; If not a SA-1 IRQ, goto PPU IRQ
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
.PPUFired					;
	LDA #$00				;\ Return to SMW's IRQ routine
	PHA					; |
	PLB					; |
	JML $008385				;/
	

IntercalateNMI:					;
	BIT #$10				;\ If bit 5 in $318E is set,
	BNE +					;/ Don't run Character Conversion DMA, but Dynamic Sprites.
	LDA #$20				;\ Toggle bit 5
	TSB $318E				;/
	JMP Character_Conversion_DMA		; Jump to CCDMA routine.
						;
+	LDA #$20				;\ Toggle bit 5
	TRB $318E				;/
	JMP Dynamic_Sprites			; Jump to Dynamic Sprites routine.
	
NMIStart:
	;SEI					; Disable IRQ
	PHP					;\ Preserve P/A/X/Y/B
	REP #$30				; |
	PHA					; |
	PHX					; |
	PHY					; |
	PHB					; |
	PHK					; |
	PLB					; |
	SEP #$30				;/
						;
	LDA $318E				;\ If Intercalate NMI is set,
	LSR					; | goto special code.
	BCS IntercalateNMI			;/
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
	LDA $318E				;\ if NMI intercalate is NOT set,
	LSR					; | run Dynamic_Sprites, otherwise,
	BCC Dynamic_Sprites			;/ return.
	JML $008172				; to here.
						
Dynamic_Sprites:				; --------------------------------------
	LDA !SLOTSUSED				; Load Dynamic Sprites Slots
	BNE +					; Don't return to NMI if there are slots to transfer.
	JML $008172				; Otherwise, return to NMI.
	
+	ASL					;\ Jump to fastest routine for this.
	TAX					; |
	JMP (.DSX_MODES-2,x)			;/

.DSX_MODES:					; Dynamic Sprites Slot.
	dw .TRANSFER_ONE			; 01    - One slot transfer.
	dw .TRANSFER_TWO			; 02    - Two slots transfer.
	dw .TRANSFER_THREE			; 03    - Three slots transfer.
	dw .TRANSFER_FOUR			; 04    - Transfer four slots.
						; 05-FF - This will be fun.
	
; Character Conversion DMA Table:
; $0000+x - Character Conversion Settings. 80+ will act like a normal DMA transfer.
; $0001+x - VRAM target (low).
; $0002+x - VRAM target (high).
; $0003+x - Data location (low).
; $0004+x - Data location (high).
; $0005+x - Data location (bank).
; $0006+x - Length of data (low)
; $0007+x - Length of data (high)
; ... Up to 10 slots, this means that the table will need 80 bytes.
	
; SP4 diagram:
; * = 8x8 block
; 1 = slot 1 tile
; 2 = slot 2 tile
; 3 = slot 3 tile
; 4 = slot 4 tile
	
; SP4 is 128x64 and dynamic area is 128x32.
; 1 1 1 1|2 2 2 2|3 3 3 3|4 4 4 4
; 1 1 1 1|2 2 2 2|3 3 3 3|4 4 4 4
; 1 1 1 1|2 2 2 2|3 3 3 3|4 4 4 4
; 1 1 1 1|2 2 2 2|3 3 3 3|4 4 4 4

; transfer one slot will need four dmas,
; transfer two slots will need four dmas too,
; transfer three slots will need four dmas too,
; transfer four slots will need only one slot...

; whatever, setupping four DMAs isn't too waste time than sending all at once.
	
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
	%transferslot(0, $0080)			; Transfer Slot 1, line 1.
	%transferslot(1, $0080)			; Transfer Slot 1, line 2.
	%transferslot(2, $0080)			; Transfer Slot 1, line 3.
	%transferslot(3, $0080)			; Transfer Slot 1, line 4.
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
	%transferslot(0, $0100)			; Transfer Slot 1 & 2, line 1.
	%transferslot(1, $0100)			; Transfer Slot 1 & 2, line 2.
	%transferslot(2, $0100)			; Transfer Slot 1 & 2, line 3.
	%transferslot(3, $0100)			; Transfer Slot 1 & 2, line 4.
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
	%transferslot(0, $0180)			; Tranfer Slot 1, 2 & 3, line 1.
	%transferslot(1, $0180)			; Tranfer Slot 1, 2 & 3, line 2.
	%transferslot(2, $0180)			; Tranfer Slot 1, 2 & 3, line 3.
	%transferslot(3, $0180)			; Tranfer Slot 1, 2 & 3, line 4.
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
	STZ $2214				;\ Clear V-Count trigger.
	STZ $2215				;/
						;
	LDA #$F0				;\ Enable IRQ from S-CPU
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
	STZ $2210				; Disable IRQ by timer trigging.
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
	REP #$20				; 16-bit A
	LDA #$0100				;\ Set Direct Page.
	TCD					;/
						;
if !FPS_PLUS == 1				; ------------ FPS++ CODE --------------				
	LDA #MainLoop_WithTimer			;\ Set From Pointer.
	STA $01					;/
	SEP #$20				; 8-bit A
						;
	LDA $8E					;\ If ZSNES or SNES9X, use the standard pointer.
	BMI ++					; |
	BIT #$02				; |
	BEQ +					;/
						;
++	LDA.B #MainLoop_Standard		;\ Set From Pointer
	STA $01					; |
	LDA.B #MainLoop_Standard>>8		; |
	STA $02					;/
						;
+	LDY.B #18-1				;\ Transfer main loop
-	LDA ($01),y				; |
	STA $0160,y				; |
	DEY					; |
	BPL -					;/
						;
	JMP $0160				; Jump to Main Loop
else						; ----------- END OF FPS++ CODE ----------
	SEP #$20				;\ Old "Main Loop"
-	LDA $8B					; |
	BEQ -					;/
endif						;
						;
ParallelMode:					;
	PHK					;\ Jump to Parallel Address
	PEA.w .End-1				; |
	JML [$3186]				;/
.End						;
	STZ $8B ;$018B				;\ Clear Parallel Flag and Return to Main Loop.
if !FPS_PLUS == 1				; |
	JMP $0160				; |
else						; |
	BRA -					; |
endif						;/
	
if !FPS_PLUS == 1				;
MainLoop_Standard: 				;3+2+3 = 8
-	LDA $8B ;$018B				;\ If parallel mode is not set,
	BEQ -					;/ loop.
	JMP ParallelMode			; Otherwise, jump to parallel mode routine.
						;
MainLoop_WithTimer: 				;2+2+3+2+3+1+3+2 = 4+5+4+5 = 9+9 = 18
-	LDA $8B ;$018B				;\ If parallel mode is set...
	BEQ +					;/
	JMP ParallelMode			; ...goto parallel mode routine.
+	LDA #$02				;\ Enable firing a IRQ by timer
	STA $2210				;/
	WAI					; Wait for IRQ.
	STZ $2210				; Disable firing IRQ by timer
	BRA -					; and return to main loop.
endif						;
						
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
;dw NoMessage					; #$04
;dw NoMessage					; #$05
;dw NoMessage					; #$06
;dw NoMessage					; #$07
;dw NoMessage					; #$08
;dw NoMessage					; #$09
;dw NoMessage					; #$0A
;dw NoMessage					; #$0B
;dw NoMessage					; #$0C
;dw NoMessage					; #$0D
;dw NoMessage					; #$0E
;dw NoMessage					; #$0F

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