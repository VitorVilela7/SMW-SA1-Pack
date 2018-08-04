; This sub-patch gives a boost on level loading at general.
; DO NOT USE THIS PATCH!
@includefrom sa1.asm


pushpc

org $96D5
	JSL MarioStartGameMode
	RTS
org $9749
	RTS
	RTS
	RTS
org $009702
	INC $0100
	RTS

pullpc

MarioStartGameMode:
	STZ $4200
	LDA.B #.SA1Code
	STA $3180
	LDA.B #.SA1Code>>8
	STA $3181
	LDA.B #.SA1Code>>16
	STA $3182
	JSR $1E80
	LDA $3100
	BNE .Phrase2
	LDA #$81
	STA $4200
	RTL
.Phrase2
	LDA.B #.MultiThread_SA1
	STA $3180
	LDA.B #.MultiThread_SA1>>8
	STA $3181
	LDA.B #.MultiThread_SA1>>16
	STA $3182
	LDA #$80
	STA $2200
	JSR .MultiThread_SNES
	JSR $1E85
	PHK
	PEA.w .jslrtsreturn4-1
	PEA.w $0084CF-1
	JML $009712
.jslrtsreturn4
	LDA #$81
	STA $4200
	RTL

.SA1Code:
	PHB
	STZ $15
	STZ $16
	STZ $17
	STZ $18
	STZ $0100
	LDA #$00
	PHA
	PLB
	PHK
	PEA.w .jslrtsreturn-1
	PEA.w $0084CF-1
	JML $0096DB
.jslrtsreturn
	PLB
	RTL
	
; Warning: Watch out possible RAM collision
	
.MultiThread_SNES:
	PHK
	PEA.w .jslrtsreturn1-1
	PEA.w $0084CF-1
	JML $008134
.jslrtsreturn1
	RTS
	
.MultiThread_SA1:
	PHB
	LDA #$00
	PHA
	PLB
	PHK
	PEA.w .jslrtsreturn2-1
	PEA.w $0084CF-1
	JML $00A635
.jslrtsreturn2
	LDA #$20
	STA $5E
	PHK
	PEA.w .jslrtsreturn3-1
	PEA.w $0084CF-1
	JML $00A796
.jslrtsreturn3
	INC $1404
	PLB
	RTL
	
 