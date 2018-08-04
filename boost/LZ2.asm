@include
; LC_LZ2

.case_e0_or_end
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
	BRA .type
	
.case_80_or_else
	BMI .case_e0_or_end

	%ReadByte()
	XBA
	%ReadByte()
	
	STX.b $00+!S
	REP #$21
	ADC $00
	TAX
	LDA $8D
	SEP #$20
	
	LDA $02
	CMP #$40
	BNE +
	
	LDA $8D
	MVN $40,$40
	BRA .back2

+	LDA $8D
	MVN $41,$41
	
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
	BCS .case_80_or_else
	BMI .case_40_or_60_J
	ASL
	BMI .case_20

.case_00
-	PHB
	PHK
	PLB
	
	LDA #%11000100
	STA $2230
	
	REP #$21
	LDA $8D
	INC
	STA $8D
	STA $2238
	STY $2235
	STX $2232
	TYA
	ADC $8D
	TAY
	TXA
	ADC $8D
	TAX
	SEP #$20
	
	LDA $8C
	STA $2234
	LDA $02
	STA $2237
	
	BIT $018E ;ZSNES doesn't generate DMA IRQ
	STZ $2230
	BMI +
--	LDA $018C
	BEQ --
	STZ $018C
+
	
	PLB
.back
	BCC .main
	
	INC $8C
	CPX #$0000
	BEQ ++
	
	DEX
	STX.b $00+!S
	REP #$21
	LDX $02+!S ;#$8000 or #$0000
	STX $8D
	TYA
	SBC.b $00+!S
	TAY
	LDA.b $00+!S
	BRA -
	
++	LDX $02+!S ;#$8000 or #$0000
	BRA .main
.case_40_or_60_J
	BRA .case_40_or_60

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
	%ReadByte()
	STX.b $00+!S
	LDX $8D
-	STA $0000,Y
	INC
	INY
	DEX
	BPL -
	LDX.b $00+!S
	JMP .main