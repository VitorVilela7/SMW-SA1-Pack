@includefrom sa1.asm
namespace level_mode
pushpc
org $00A2E6
	JSL optimize
	
org $05CBFF
	JML score_stuff
	
org $00E2BD
	JML optimize_00E2BD
	
org $00C47E
	JSL optimize_00C47E
	RTS
	
org $00C593
	JSL mario_animation
	RTS
	
org $00C0FB
	JSL stripe_help
pullpc

stripe_help:
	LDA $5B
	STA $00
	TSC
	AND #$FF00
	CMP #$3700
	BEQ .sa1
	RTL
.sa1
	SEP #$20
	LDA.b #.snes
	STA $0183
	LDA.b #.snes>>8
	STA $0184
	LDA.b #.snes>>16
	STA $0185
	LDA #$D0
	STA $2209
	STX $3100
	STY $3102
-	LDA $018A
	BEQ -
	STZ $018A
	LDX $3100
	LDY $3102
	PLA
	PLA
	PLA
	REP #$20
	JML $00C1AB
.snes
	LDA #$00
	PHA
	PLB
	REP #$30
	LDX $3100
	LDY $3102
	PHK
	PEA.w .jslrtsreturn-1
	PEA.w $0084CF-1
	JML $00C0FF
.jslrtsreturn
	STX $3100
	STY $3102
	SEP #$30
	RTL
	
; make sure all stuff from there are executed.
mario_animation:
	TSC
	XBA
	CMP #$37
	BNE .call
	LDA #$00
.go	PEA.w $84CF-1
	PHA
	PEA.w $C595+4-1
	LDA $71
	JML $0086DF

.call	LDA.b #.sa1
	STA $3180
	LDA.b #.sa1>>8
	STA $3181
	LDA.b #.sa1>>16
	STA $3182
	JSR $1E80
	RTL

.sa1	LDA #$00
	PHA
	PLB
	BRA .go

optimize_00E2BD:
	PHB
	LDA #$00
	PHA
	PLB
	TSC
	XBA
	CMP #$37
	BEQ .skip
	LDA.b #.sa1
	STA $3180
	LDA.b #.sa1>>8
	STA $3181
	LDA.b #.sa1>>16
	STA $3182
	JSR $1E80
	PLB
	RTL
.sa1
	PHB
	LDA #$00
	PHA
	PLB
.skip
	LDA $78
	JML $00E2C2

optimize_00C47E:
	LDA.b #.sa1
	STA $3180
	LDA.b #.sa1>>8
	STA $3181
	LDA.b #.sa1>>16
	STA $3182
	JSR $1E80
	RTL
.sa1
	LDA #$00
	PHA
	PLB
	STZ $78
	LDA $73CB	
	PEA.w $0084CF-1
	JML $00C483

score_stuff:
	PHB
	LDA #$05
	PHA
	PLB
	
	TSC
	XBA
	CMP #$37
	BEQ .sa1
.snes
	PHK
	PEA.w .jslrtsreturn-1
	PEA.w $058125-1
	JML $05CC07
.jslrtsreturn
	PLB
	RTL
.sa1
	LDA.b #.sa1_snes
	STA $0183
	LDA.b #.sa1_snes>>8
	STA $0184
	LDA.b #.sa1_snes>>16
	STA $0185
	LDA #$D0
	STA $2209
-	LDA $018A
	BEQ -
	STZ $018A
	PLB
	RTL
.sa1_snes
	PHB
	LDA #$05
	PHA
	PLB
	BRA .snes

optimize:
	LDA #$B1
	STA $3180
	LDA #$8A
	STA $3181
	LDA #$02
	STA $3182
	JSR $1E80
	RTL

namespace off