@include
; LC_LZ3 from Lunar Magic

.case_c0
	%ReadByte()
	CMP #$00
	BPL +
	STY $00+!S
	REP #$21
	AND #$007F
	EOR #$FFFF
	ADC $00+!S
	BRA .lzcopy110
+	XBA
	%ReadByte()
	REP #$21
	ADC $00

.lzcopy110
	STX $00+!S
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
	ASL A
	BPL .case_c0
	LDA $8D
	CMP #$1F
	BEQ .end
	AND #$03
	STA $8E
	EOR $8D
	ASL A
	ASL A
	ASL A
	XBA
	%ReadByte()
	STA $8D
	XBA
	JMP .type

.case_80_or_else
	BMI .case_e0_or_else
	ASL A
	BMI .case_a0
	%ReadByte()
	CMP #$00
	BPL +
	STY $00+!S
	REP #$21
	AND #$007F
	EOR #$FFFF
	ADC $00+!S
	BRA ++
	
+	XBA
	%ReadByte()
	REP #$21
	ADC $00
	
++	STX $00+!S
	TAX
	LDA $8D
	SEP #$20
	
	LDA $02
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
	STY $00+!S
	REP #$21
	AND #$007F
	EOR #$FFFF
	ADC $00+!S
	BRA .lz_copy101

+	XBA
	%ReadByte()
	REP #$21
	ADC $00

.lz_copy101
	STX $00+!S
	TAX
	LDA #$0000
	ASL $8D
	SEP #$20
--
	LSR $8D
-
	LDA $0000,x
	STZ $04+!S
	ASL A
	ROR $04+!S
	ASL A
	ROR $04+!S
	ASL A
	ROR $04+!S
	ASL A
	ROR $04+!S
	ASL A
	ROR $04+!S
	ASL A
	ROR $04+!S
	ASL A
	ROR $04+!S
	ASL A
	LDA $04+!S
	ROR A
	STA $0000,y
	INY
	INX
	DEC $8D
	BPL -
	DEC $8E
	BPL --

.back2
	LDX $00+!S

.main
	%ReadByte()
	STA $8D
	STZ $8E
	AND #$E0
	TRB $8D

.type
	ASL A
	BCS .case_80_or_else_J
	BMI .case_40_or_60_J
	ASL A
	BMI .case_20

.case_00
	REP #$20
	LDA $8D
	STX $8D
	
-	SEP #$20

	INC
	STA $02+!S
--	PHB
	LDA $8C
	PHA
	PLB
	LDA $0000,x
	PLB
	STA $0000,y
	INX
	INY
	DEC $02+!S
	BNE --
.back
	CPX $8D
	BCS .main

	INC $8C
	CPX #$0000
	BEQ +
	DEX
	STX $00+!S
	REP #$21
	LDX $02+!S ;#$8000 or #$0000
	STX $8D
	TYA
	SBC $00+!S
	TAY
	LDA $00+!S
	BRA .case_00
+
	LDX $02+!S ;#$8000 or #$0000
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
	LDA $8D
	BEQ +
	INC A
	LSR A
	STX $00+!S
	TYX
-	STZ $0000,x
	INX
	INX
	DEC A
	BNE -
	TXY
	LDX $00+!S
	BCS +
	SEP #$20
	JMP .main

+	SEP #$20
	STA $0000,y
	INY
	JMP .main
