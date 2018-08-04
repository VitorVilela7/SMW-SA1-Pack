@includefrom sa1.asm

!Wiggers = $418800			; Don't touch!

pushpc

org $0CAB8A
	JSL window_stuff
	BRA +
	NOP #2
+	

org $03C575	; Make the light windowing gets updated every frame
	db $00

org $03CA39
	STZ $2250
	STA $2251
	STZ $2252
	LDA $06                   
	STA $2253
	STZ $2254
	CMP ($00)
	LDA $2307
	LDY $00
	BPL +
	EOR #$FF
	INC
+	STA $02                   
	LDA $01                   
	BPL +
	EOR #$FF                
	INC
+	JML fireworks_fix
fireworks_fix_back:
	NOP
	LDA $2307
warnpc $03CA64+3

org $03CB08
	STZ $2250
	STA $2251
	STZ $2252
	LDA $06                   
	STA $2253
	STZ $2254
	CMP ($00)
	LDA $2307
	LDY $00
	BPL +
	EOR #$FF
	INC
+	STA $02                   
	LDA $01                   
	BPL +
	EOR #$FF                
	INC
+	JML fireworks_fix2
fireworks_fix2_back:
	NOP
	LDA $2307
warnpc $03CB33+3

ORG $03D7AB
	JML ReznorFix
ReznorFix_Return:
	RTS

ORG $00BFC5
	JML CheckForSA1

ORG $01808C
	JML SpriteMain
	NOP #2

ORG $01CC28
	STZ $2250
	REP #$20
	LDA $00
	AND #$00FF
	STA $2251
	LDA $02
	AND #$00FF
	STA $2253
	NOP
	BRA $00
	LDA $2306
	STA $04
	LDA $03
	AND #$00FF
	STA $2253
	CLC
	BRA $00
	LDA $05
	AND #$00FF
	ADC $2306
	STA $05
	LDA $01
	AND #$00FF
	STA $2251
	LDA $02
	AND #$00FF
	STA $2253
	CLC
	BRA $00
	LDA $2306
	ADC $05
	STA $05
	LDA $03
	AND #$00FF
	STA $2253
	CLC
	BRA $00
	LDA $06
	AND #$00FF
	ADC $2306
	STA $06
	SEP #$20
	RTS
		
	fillbyte $00
	fill $08
	warnpc $01CC94

ORG $01C804
	PHA
	LDA #$01
	STA $2250
	PLA
	STA $2252
	STZ $2251
	LDA #$05
	STA $2253
	STZ $2254
	NOP
	BRA $00
	LDA $2306
	STA $02
	STA $06
	LDA $2307
	STA $03
	STA $07
	LDY #$00
	LDA $74B8
	SEC
	SBC $74B0
	BPL +
	EOR #$FF
	INC A
	INY
+	STY $01
	STA $2252
	STZ $2251
	LDA #$05
	STA $2253
	STZ $2254
	JSL Continue_01C804
	warnpc $01C84D
	
ORG $03DEDF
	JML Mode7Stuff
	NOP #2
Mode7Continue:

ORG $03DD7D
	JML MoreMode7
Mode7MoreContinue:

ORG $03DDE3
	NOP
	
ORG $03995E
	STZ $2250
	LDA $04
	STA $2251
	STZ $2252
	LDA #$38
	LDY $05
	BNE +
	STA $2253
	STZ $2254
	ASL $2306
	LDA $2307
	ADC #$00
+	LSR $01
	BCC +
	EOR #$FF
	INC A
+	STA $04
	LDA $06
	STA $2251
	LDA #$38
	LDY $07
	BNE +
	JML Continue_03995E
	NOP
Return_03995E:
	LDA $2307
	ADC #$00
+	LSR $03
	BCC +
	EOR #$FF
	INC A
+	STA $06
	warnpc $0399A4
	
ORG $02D870
	PHP
	BPL CODE_02D876
	EOR #$FF
	INC A
CODE_02D876:
	STA $2252
	LDA #$01
	STA $2250
	STZ $2251
	LDA $3410,X
	LSR
	STA $2253
	STZ $2254
	NOP
	BRA $00
	LDA $2306
	STA $0E
	LDA $2307
	JML MoreMultiplyFix
Tralalal:
	PLP
	BPL +
	EOR #$FF
	INC A
+	RTS
	warnpc $02D8A1

ORG $02F015
	LDA.B #!Wiggers
ORG $02F01D
	LDA.B #!Wiggers/256
ORG $02F024
	LDA.B #!Wiggers/65536
ORG $02F0F0
	MVP !Wiggers/65536,!Wiggers/65536
	
ORG $02D689
	LDA $04
	STZ $2250
	STA $2251
	STZ $2252
	LDA $3410,X
	LDY $05
	BNE CODE_02D6A3
	STA $2253
	STZ $2254
	NOP
	BRA $00
	ASL $2306
	LDA $2307
	ADC #$00
CODE_02D6A3:
	LSR $01
	BCC CODE_02D6AA
	EOR #$FF
	INC A
CODE_02D6AA:
	STA $04
	LDA $06
	STA $2251
	LDA $3410,X
	LDY $07
	BNE CODE_02D6C6
	JML MultiplyFix
	db $00
CODE_02D6C6:
	warnpc $02D6C6
	
ORG $02FB33
	STZ $2250
	LDA $04
	STA $2251
	STZ $2252
	LDA #$50
	LDY $05
	BNE +
	STA $2253
	STZ $2254
	NOP
	BRA $00
	ASL $2306
	LDA $2307
	ADC #$00
+	LSR $01
	BCC +
	EOR #$FF
	INC A
+	STA $04
	LDA $06
	STA $2251
	LDA #$50
	LDY $07
	BNE +
	STA $2253
	JML MultiplyFix3
Return_MultiplyFix3:
+	LSR $03
	BCC +
	EOR #$FF
	INC A
+	STA $06

warnpc $02FB77+2

ORG $01F43E
	LDA #$01
	STA $2250
	LDA $3284,x
	STA $2252
	STZ $2251
	LDA #$04
	STA $2253
	STZ $2254
	;NOP
	;BRA $00
	LDA $3334,x
	STA $07
	LSR
	LDA $2307
warnpc $01F45A+3
	
;=======================================;
; Macros				;
;=======================================;

macro Switch()
	LDA.B #.SNES
	STA $0183
	LDA.B #.SNES/256
	STA $0184
	LDA.B #.SNES/65536
	STA $0185
endmacro
	
pullpc

ReznorFix:
	%Switch()
	LDA #$D0
	STA $2209
	SEP #$10
-	LDA $018A
	BEQ -
	STZ $018A
	JML .Return
ReznorFix_SNES:
	REP #$31
	LDA.L $7F837B             
	TAX                       
	LDA.W #$C05A              
	ADC $00                   
	STA.L $7F837D,X           
	ORA.W #$2000              
	STA.L $7F8383,X           
	LDA.W #$0240              
	STA.L $7F837F,X           
	STA.L $7F8385,X           
	LDA.W #$38FC              
	STA.L $7F8381,X           
	STA.L $7F8387,X           
	LDA.W #$00FF              
	STA.L $7F8389,X           
	TXA                       
	CLC                       
	ADC.W #$000C              
	STA.L $7F837B             
	SEP #$30
	RTL

CheckForSA1:				; CPU: ???
	PHA				; Preserve A
	TSC				;\ You're SA-1?
	XBA				; |
	CMP #$37			; |
	BEQ .SwitchCPU			;/
	PLA				; Restore A
	JML $0086DF			; If SNES, just return.

.SwitchCPU				; CPU: SA-1
	%Switch()			;\ Call SNES and run the need.
	LDA #$D0			; |
	STA $2209			;/
	PLA				;\ Put all information need by
	STA $0100			; | SNES in XScratch RAM
	PLA				; |
	STA $0101			; |
	PLA				; |
	STA $0102			; |
	PLA				; |
	STA $0103			;/
					;
	PHA				;\ While SNES is busy,
	LDA $02,S			; | fix the return address
	STA $01,S			; | (appears to end with RTS D:)
	LDA $03,S			; |
	STA $02,S			; |
	LDA #$00			; |
	STA $03,S			;/
					;
	REP #$10			; Also another fix.
					;
-	LDA $018A			;\ Wait for SNES
	BEQ -				; |
	STZ $018A			;/
	RTL
.SNES					; CPU: SNES
	PEA.w $84CF-1			; Make the RTS return like a RTL.
	LDA $3103 : PHA			;\ Get the required information to Stack
	LDA $3102 : PHA			; | and A
	LDA $3101 : PHA			; |
	LDA $3100			;/
	JML $0086DF			; Jump to routine.

MultiplyFix3:
	STZ $2254
	NOP
	BRA $00
	ASL $2306
	LDA $2307
	ADC #$00
	JML Return_MultiplyFix3

MoreMultiplyFix:
	ASL $0E
	ROL
	ASL $0E
	ROL
	ASL $0E
	ROL
	ASL $0E
	ROL
	JML Tralalal

MultiplyFix:
	STA $2253
	STZ $2254
	NOP
	BRA $00
	ASL $2306
	LDA $2307
	ADC #$00
	JML CODE_02D6C6

Continue_03995E:
	STA $2253
	STZ $2254
	ASL $2306
	JML Return_03995E

MoreMode7:
	%Switch()
	LDA #$D0
	STA $2209
	STX $0100
-	LDA $018A
	BEQ -
	STZ $018A
	RTL
.SNES
	PHB
	LDA #$03
	PHA
	PLB
	LDX $3100
	JML Mode7MoreContinue
	
Mode7Stuff:
	%Switch()
	LDA #$D0
	STA $2209
	STX $0100
-	LDA $018A
	BEQ -
	STZ $018A
	RTL	
.SNES
	PHB
	LDA #$03
	PHA
	PLB
	LDX $3100
	LDA $326E,X
	JML Mode7Continue

Continue_01C804:
	LDA $2306
	STA $04
	STA $08
	LDA $2307
	STA $05
	STA $09
	RTL
	
fireworks_fix:
	STA $2251
	STZ $2252
	LDA $06
	STA $2253
	STZ $2254
	JML .back
fireworks_fix2:
	STA $2251
	STZ $2252
	LDA $06
	STA $2253
	STZ $2254
	JML .back

SA1_Sprites:
	PHB
	LDA #$01
	PHA
	PLB
	LDA $748F
	JML $018092

SpriteMain:
	LDA.B #SA1_Sprites
	STA $3180
	LDA.B #SA1_Sprites/256
	STA $3181
	LDA.B #SA1_Sprites/65536
	STA $3182
	JSR $1E80
	RTL

window_stuff:
	TSC
	XBA
	CMP #$37
	BNE .snes
	
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
	LDA #$13
	STA $212E
	STA $212F
	RTL
