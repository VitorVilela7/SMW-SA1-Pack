@includefrom sa1.asm
namespace overworld

!SwitchBlocks = $418800 ; seems to use 480 bytes.
			; It's used when [!] blocks gets spreaded
			; on screen after beating a switch palace.
			; It's same address as wiggler's ram
			; which obviously is unused on OW.

pushpc

org $00A1C7
	JSL main

org $048267
	JSL animations
	NOP #2
	
org $0494B2
	STZ $2250
	STA $2251
	STZ $2252
	LDA $0C
	BEQ +
	STA $2253
	STZ $2254
	LDY #$0001
	REP #$20
	LDA $2306
	STY $2250
	STA $2251
	JML mulfix
mulfix_back:
	LDA $2306
+	REP #$20
warnpc $0494DC

org $048576
	JSL events
	RTS
	NOP #2
	
org $04F3FA
	JSL blinking_cursor

org $04F2B6
	STA.l !SwitchBlocks+$0078,x
org $04F2BD
	STA.l !SwitchBlocks+$0000,x
org $04F2C4
	STA.l !SwitchBlocks+$00A0,x
org $04F2CB
	STA.l !SwitchBlocks+$0028,x
org $04F2D1
	STA.l !SwitchBlocks+$00C8,x
org $04F2D5
	STA.l !SwitchBlocks+$0050,x
org $04F2DE
	STA.l !SwitchBlocks+$00F0,x
org $04F2E5
	STA.l !SwitchBlocks+$0118,x
org $04F2EB
	STA.l !SwitchBlocks+$0140,x
org $04F32B
	LDA.l !SwitchBlocks+$0140,x
org $04F33A
	STA.l !SwitchBlocks+$0140,x
org $04F33E
	LDA.l !SwitchBlocks+$0050,x
org $04F343
	LDA.l !SwitchBlocks+$00C8,x
org $04F39D
	LDA.l !SwitchBlocks+$00F0,x
org $04F3A6
	ADC.l !SwitchBlocks+$0168,x
org $04F3AA
	STA.l !SwitchBlocks+$0168,x
org $04F3AE
	LDA.l !SwitchBlocks+$00F0,x
org $04F3BF
	ADC.l !SwitchBlocks+$0078,x
org $04F3C3
	STA.l !SwitchBlocks+$0078,x
org $04F3C9
	ADC.l !SwitchBlocks+$0000,x
org $04F3CD
	STA.l !SwitchBlocks+$0000,x
	
org $0482ED
	LDY #$01
	STY $2250
	TAY
	REP #$20
	LDA $04,x
	XBA
	LSR
	AND #$7F00
	STA $2251
	STY $2253
	JML mapview
	NOP
mapview_back:
warnpc $048307

pullpc

mapview:
	LDY #$00
	STY $2254
	NOP
	BRA $00
	LDA $2306
	LSR
	SEP #$20
	JML .back

blinking_cursor:
	LDA #$A8
	STA $0183
	LDA #$9B
	STA $0184
	STZ $0185
	LDA #$D0
	STA $2209
-	LDA $018A
	BEQ -
	STZ $018A
	RTL

events:
	LDA.b #.snes
	STA $0183
	LDA.b #.snes>>8
	STA $0184
	LDA.b #.snes>>16
	STA $0185
	LDA #$D0
	STA $2209
-	LDA $018A
	BEQ -
	STZ $018A
	RTL
.snes
	LDA #$04
	PHA
	PLB
	PEA.w $048575-1
	PHA
	PEA.w $857D-1
	LDA $73D9
	JML $0086FA

mulfix:
	SEP #$20
	LDA $0A
	STA $2253
	STZ $2254
	NOP
	REP #$20
	JML .back

animations:
	BIT $318E
	BMI .zsnes
	LDA.b #.snes
	STA $0183
	LDA.b #.snes>>8
	STA $0184
	LDA.b #.snes>>16
	STA $0185
	LDA #$D0
	STA $2209
-	LDA $018A
	BEQ -
	STZ $018A
	LDA $73D2
	RTL
.snes
	PHB
	LDA #$04
	PHA
	PLB
	PHK
	PEA.w .ret-1
	PEA.w $048575-1
	JML $0480E0
.ret	PLB
	RTL

.zsnes					; fix a ZSNES bug with another ZSNES bug?!?
	PHK
	PEA.w .ret2-1
	PEA.w $048575-1
	JML $0480E0
.ret2	LDA $73D2
	RTL

	
main:
	LDA #$41
	STA $3180
	LDA #$82
	STA $3181
	LDA #$04
	STA $3182
	JSR $1E80
	RTL

namespace off