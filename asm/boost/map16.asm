@includefrom sa1.asm

pushpc
ORG $0586DD
	BEQ +
ORG $0586E9
+

ORG $0586DF
	JML KeepLoading

ORG $0585FF
	JSL CallSA1
	RTS
pullpc
	
CallSA1:
	SEP #$20
	LDA.B #SA1Code
	STA $3180
	LDA.B #SA1Code>>8
	STA $3181
	LDA.B #SA1Code>>16
	STA $3182
	JSR $1E80
	RTL

KeepLoading:
	SEP #$30
	LDY #$00
	LDA [$65],Y
	JML $058605

SA1Code:
	PHB
	LDY #$00
	PHY
	PLB
	LDA [$65],Y
	
	PHK
	PEA.w .Return-1
	PEA.w $058125-1
	JML $058605
.Return	PLB
	RTL
	