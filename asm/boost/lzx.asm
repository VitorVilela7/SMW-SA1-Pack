@includefrom sa1.asm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LC_LZ2/LC_LZ3 Optimization Patch v1.2
; SA-1 Version.
;
; By:
; - Ersanio
; - edit1754
; - 33953YoShI
; - Min
; - smkdan
;
; In addition to being much faster than the original
; this one also stores the decompressed size to $8D,
; which may be useful in patches that upload ExGFX files
;
; NEW in v1.1:
; - rearranged some branches so they branch in the less-likely case rather than
;   the more-likely case (Ex: BEQ .end rather than BEQ .notEnd)
; - rewrote the MVN $7E7E / MVN $7F7F portion of code because it destroyed
;   the ability to decompress to SRAM.
;
; NEW in v1.2
; - should have no issues with interrupts.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!S = $9E			; 0x10 bytes in $30XX that aren't touched during interrupts (NMI or IRQ)

if read1($0FFFEB) == 2
	!LZ3 = 1
else
	!LZ3 = 0
	
pushpc
ORG $0FFFEB
	db $01
pullpc
endif
	
macro ReadByte()
	STX $8A
	LDA [$8A]
	INX
	BNE +
	LDX.b $02+!S ;can be #$8000 or #$0000
	INC $8C
	INC $08+!S
+
endmacro

pushpc
org $00B8E3
	JSL CodeStart		;was JML before
	RTS
pullpc
	
CodeStart:
	PHB
	PHK
	PLB
	SEP #$20
	REP #$10

	LDX.W #Decompress
	STX $3180
	LDA.B #Decompress>>16
	STA $3182
	JSR $1E80
	
	BIT $3100
	BMI .RAM_DMA
	
	PLB
	SEP #$30
	RTL
	
.RAM_DMA
	LDX #$8000
	STX $4300
	LDX $00
	STX $2181
	LDA $02
	STA $2183
	LDX #$0000
	STX $4302
	LDA #$41
	STA $4304
	LDX $8D
	STX $4305
	LDA #$01
-	STA $420B
	LDX $4305
	BNE -

	PLB
	SEP #$30
	RTL
	
Decompress:
	PEI ($00+!S)
	PEI ($02+!S)
	PEI ($04+!S)
	PEI ($06+!S) ;mvn, byte1
	PEI ($08+!S) ;byte 2, jmp
	PEI ($0A+!S) ;jmp addr
	PEI ($0C+!S) ;mvn, byte1
	PEI ($0E+!S) ;byte 2, jmp
	PEI ($10+!S) ;jmp addr
	PEI ($8A)
	
	LDA #$80
	STA.b $03+!S
	STZ.b $02+!S
	
	LDA $8C
	CMP #$C0
	BCC +
	STZ.b $03+!S
+
	LDA #$00
	PHA
	
	LDA $02
	CMP #$7E
	BEQ .RAM_DMA
	CMP #$7F
	BNE .Continue
.RAM_DMA
	PLA
	
	PEI ($00)
	LDA $02
	PHA
	
	LDA #$41
	STZ $00
	STZ $01
	STA $02
	
	LDA #$FF
	PHA
.Continue
	PHB
	REP #$10
	
	LDA #$54
	BIT $318E
	BPL +
	LDA #$FF
+	STA.b $06+!S
	STA.b $0C+!S
	LDA #$4C
	STA.b $09+!S
	STA.b $0F+!S
	LDX.w #.back
	STX.b $0A+!S
	LDX.w #.back2
	STX.b $10+!S
	LDA.b $8C
	STA.b $08+!S
	LDA $02
	STA.b $07+!S
	STA.b $0D+!S
	STA.b $0E+!S
	PHA
	PLB
	
	LDY $00		; dest_low
	LDX $8A		; src_low
	STZ $8A
	STZ $8B
	JMP .main
.done
	REP #$20
	TYA
	SEC
	SBC $00
	STA $8D		; size!!!
	SEP #$20
	PLB
	
	PLA
	STA $0100
	BPL +
	PLA
	STA $02
	PLX
	STX $00
	
+	PLX : STX $8A
	PLX : STX.b $10+!S
	PLX : STX.b $0E+!S
	PLX : STX.b $0C+!S
	PLX : STX.b $0A+!S
	PLX : STX.b $08+!S
	PLX : STX.b $06+!S
	PLX : STX.b $04+!S
	PLX : STX.b $02+!S
	PLX : STX.b $00+!S
	SEP #$30
	RTL
.end	JMP .done
	
if !LZ3 == 0
	incsrc lz2.asm
else
	incsrc lz3.asm
endif

