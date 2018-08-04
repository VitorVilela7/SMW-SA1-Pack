@includefrom sa1.asm
; LC_LZ3 from Lunar Magic

.case_c0
	%ReadByte()
	CMP #$00
	BPL +
	STY.b $00+!S
	REP #$21
	AND #$007F
	EOR #$FFFF
	ADC.b $00+!S
	BRA .lzcopy110
+	XBA
	%ReadByte()
	REP #$21
	ADC $00

.lzcopy110
	STX.b $00+!S
	INC $8D
	TAX
	SEP #$20
-	LDA $0000,x
	STA $0000,y
	INY
	DEX
	DEC $8D
	BNE -
	DEC $8E
	BPL -
	JMP .back2

.case_e0_or_else
	ASL
	BPL .case_c0
	LDA $8D
	CMP #$1F
	BEQ .end
	AND #$03
	STA $8E
	EOR $8D
	ASL
	ASL
	ASL
	XBA
	%ReadByte()
	STA $8D
	XBA
	JMP .type

.case_80_or_else
	BMI .case_e0_or_else
	ASL
	BMI .case_a0

	%ReadByte()
	CMP #$00
	BPL +
	STY.b $00+!S
	REP #$21
	AND #$007F
	EOR #$FFFF
	ADC.b $00+!S
	BRA .lzcopy
+	XBA
	%ReadByte()
	REP #$21
	ADC $00

.lzcopy	
	STX.b $00+!S
	TAX
	LDA $8D
	SEP #$20
	
	BIT.b $0C+!S
	BMI +
	JMP.w $000C+!S
	
+	LDA $02
	CMP #$40
	BEQ +
	
	LDA $8D
	MVN $41,$41
	BRA .back2

+	LDA $8D
	MVN $40,$40
	BRA .back2
	
.case_a0
	%ReadByte()
	CMP #$00
	BPL +
	STY.b $00+!S
	REP #$21
	AND #$007F
	EOR #$FFFF
	ADC.b $00+!S
	BRA .lzcopy101
+	XBA
	%ReadByte()
	REP #$21
	ADC $00

.lzcopy101
	STX.b $00+!S
	TAX
	LDA.w #$0000
	ASL.b $8D
	SEP #$20
--	LSR.b $8D
-	LDA $0000,x
	STZ.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	ROR.b $04+!S
	ASL
	LDA.b $04+!S
	ROR
	STA $0000,y
	INY
	INX
	DEC $8D
	BPL -
	DEC $8E
	BPL --

.back2
	LDX.b $00+!S

.main
	%ReadByte()
	STA $8D
	STZ $8E
	AND #$E0
	TRB $8D

.type
	ASL
	BCS .case_80_or_else_J
	BMI .case_40_or_60_J
	ASL
	BMI .case_20

.case_00
	REP #$20
	LDA $8D
	STX $8D
	
-	SEP #$20
	BIT.b $06+!S
	BMI +
	JMP.w $0006+!S

+	REP #$20
	PEI ($02+!S)
	PEI ($00)
	STZ $00
	SEP #$20
	INC
	STA.b $02+!S
	XBA
	INC
	STA.b $03+!S
	PHB
	LDA $8C
	PHA
	PLB
--	LDA $0000,x
	STA [$00],y
	INX
	INY
	DEC.b $02+!S
	BNE --
	DEC.b $03+!S
	BNE --
	PLB	
	REP #$20
	PLA
	STA $00
	PLA
	STA.b $02+!S
	SEP #$20
.back
	CPX $8D
	BCS .main

	INC $8C
	INC $08+!S
	CPX #$0000
	BEQ +

	DEX
	STX.b $00+!S
	REP #$21
	LDX.b $02+!S ;#$8000 or #$0000
	STX $8D
	TYA
	SBC.b $00+!S
	TAY
	LDA.b $00+!S
	BRA -
+
	LDX.b $02+!S ;#$8000 or #$0000
	BRA .main

.case_80_or_else_J
	JMP .case_80_or_else

.case_40_or_60_J
	JMP .case_40_or_60

.case_20
	%ReadByte()
	STX.b $00+!S
	PHA
	PHA
	REP #$20
	
.case_20_main
	LDA $8D
	INC
	LSR
	TAX
	PLA
	
-	STA $0000,Y
	INY
	INY
	DEX
	BNE -
	
	SEP #$20
	BCC +
	STA $0000,Y
	INY
+	LDX.b $00+!S
	JMP .main

.case_40_or_60
	ASL
	BMI .case_60
	%ReadByte()
	XBA
	%ReadByte()

	XBA
	STX.b $00+!S
	REP #$20
	PHA
;Replace BRA .case_20_main the code itself
	LDA $8D
	INC
	LSR
	TAX
	PLA
-	STA $0000,Y
	INY
	INY
	DEX
	BNE -
	SEP #$20
	BCC +
	STA $0000,Y
	INY
+	LDX.b $00+!S
	JMP .main
	

.case_60
	REP #$20

.case_60_main
	LDA $8D
	BEQ .case_60_single
	INC
	LSR
	STX.b $00+!S
	TYX

-	STZ $0000,x
	INX
	INX
	DEC
	BNE -

	TXY
	LDX.b $00+!S
	BCS .case_60_single
	SEP #$20
	JMP .main

.case_60_single
	SEP #$20
	STA $0000,y
	INY
	JMP .main

	
	
	
	
	
	
	
	
	