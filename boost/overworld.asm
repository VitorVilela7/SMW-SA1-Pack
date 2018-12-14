@includefrom sa1.asm
namespace overworld

!SwitchBlocks = $418800 ; seems to use 480 bytes.
			; It's used when [!] blocks gets spread
			; on screen after beating a switch palace.
			; It's same address as wiggler's ram
			; which obviously is unused on OW.

pushpc

org $04F590
	JSL lives_exchange_fix

org $04827A
	JSL continue_fix

org $00A1C7
	JSL main

org $048267
	JSL animations
	NOP #2
	
macro old_code()
CODE_0494B2:        8D 02 42      STA.W $4202               ; Multiplicand A
CODE_0494B5:        A5 0C         LDA $0C                   
CODE_0494B7:        F0 21         BEQ CODE_0494DA           
CODE_0494B9:        8D 03 42      STA.W $4203               ; Multplier B
CODE_0494BC:        EA            NOP                       
CODE_0494BD:        EA            NOP                       
CODE_0494BE:        EA            NOP                       
CODE_0494BF:        EA            NOP                       
CODE_0494C0:        C2 20         REP #$20                  ; Accum (16 bit) 
CODE_0494C2:        AD 16 42      LDA.W $4216               ; Product/Remainder Result (Low Byte)
CODE_0494C5:        8D 04 42      STA.W $4204               ; Dividend (Low Byte)
CODE_0494C8:        E2 20         SEP #$20                  ; Accum (8 bit) 
CODE_0494CA:        A5 0A         LDA $0A                   
CODE_0494CC:        8D 06 42      STA.W $4206               ; Divisor B
CODE_0494CF:        EA            NOP                       
CODE_0494D0:        EA            NOP                       
CODE_0494D1:        EA            NOP                       
CODE_0494D2:        EA            NOP                       
CODE_0494D3:        EA            NOP                       
CODE_0494D4:        EA            NOP                       
CODE_0494D5:        C2 20         REP #$20                  ; Accum (16 bit) 
CODE_0494D7:        AD 14 42      LDA.W $4214               ; Quotient of Divide Result (Low Byte)
CODE_0494DA:        C2 20         REP #$20                  ; Accum (16 bit) 
endmacro
	
org $0494B2
	JML mulfixv2
	NOP #38
mulfixv2_back:
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
	
macro old_code2()
CODE_0482ED:        9C 04 42      STZ.W $4204               ; Dividend (Low Byte)
CODE_0482F0:        B4 04         LDY $04,X                 
CODE_0482F2:        8C 05 42      STY.W $4205               ; Dividend (High-Byte)
CODE_0482F5:        8D 06 42      STA.W $4206               ; Divisor B
CODE_0482F8:        EA            NOP                       ; \ 
CODE_0482F9:        EA            NOP                       ;  | 
CODE_0482FA:        EA            NOP                       ;  | Wait until division is done
CODE_0482FB:        EA            NOP                       ;  | 
CODE_0482FC:        EA            NOP                       ;  | 
CODE_0482FD:        EA            NOP                       ; / 
CODE_0482FE:        C2 20         REP #$20                  ; Accum (16 bit) 
CODE_048300:        AD 14 42      LDA.W $4214               ; Quotient of Divide Result (Low Byte)
CODE_048303:        4A            LSR                       
CODE_048304:        4A            LSR                       
CODE_048305:        E2 20         SEP #$20                  ; Accum (8 bit) 	
endmacro

org $0482ED
	JML mulfix2v2
	NOP #22
mulfix2v2_back:
warnpc $048307

pullpc

mulfixv2:
	PHA				; \ Run SNES code if anything.
	TSC				;  |
	XBA				;  |
	CMP #$37			;  |
	BNE .snes_code			;  |
	LDA #$00
	XBA
	PLA				; /
	
	
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
	SEP #$20
	LDA $0A
	STA $2253
	STZ $2254
	NOP
	REP #$20
	LDA $2306
+	REP #$20
	JML mulfixv2_back
.snes_code
	LDA #$00
	XBA
	PLA
	
	STA.W $4202               ; Multiplicand A
	LDA $0C                   
	BEQ CODE_0494DA           
	STA.W $4203               ; Multplier B
	NOP #4
	REP #$20                  ; Accum (16 bit) 
	LDA.W $4216               ; Product/Remainder Result (Low Byte)
	STA.W $4204               ; Dividend (Low Byte)
	SEP #$20                  ; Accum (8 bit) 
	LDA $0A                   
	STA.W $4206               ; Divisor B
	NOP #6
	REP #$20                  ; Accum (16 bit) 
	LDA.W $4214               ; Quotient of Divide Result (Low Byte)
CODE_0494DA:
	REP #$20                  ; Accum (16 bit) 
	JML mulfixv2_back
	
mulfix2v2:
	PHA				; \ Run SNES code if anything.
	TSC				;  |
	XBA				;  |
	CMP #$37			;  |
	;BNE .snes_code			;  |
	; i don't know why i commented out this @ 2017
	PLA				; /
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
	LDY #$00
	STY $2254
	NOP
	BRA $00
	LDA $2306
	LSR
	SEP #$20
	JML mulfix2v2_back
	
.snes_code
	PLA
	STZ.W $4204               ; Dividend (Low Byte)
	LDY $04,X                 
	STY.W $4205               ; Dividend (High-Byte)
	STA.W $4206               ; Divisor B
	NOP #6
	REP #$20                  ; Accum (16 bit) 
	LDA.W $4214               ; Quotient of Divide Result (Low Byte)
	LSR #2
	SEP #$20                  ; Accum (8 bit) 
	JML mulfix2v2_back

continue_fix:
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
	LDA $73C9
	JML $009B80
	
	
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
	
lives_exchange_fix:
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
	PHB
	LDA #$04
	PHA
	PLB
	JSL $05DBF2
	LDY #$50
	PHK
	PEA.w .end-1
	PEA.w $8574
	JML $04F596
.end    
	PLB
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