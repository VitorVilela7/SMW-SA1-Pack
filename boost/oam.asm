@includefrom sa1.asm
pushpc

ORG $008494
	LDA.B #oam_compress
	STA $3180
	LDA.B #oam_compress>>8
	STA $3181
	LDA.B #oam_compress>>16
	STA $3182
	JMP $1E80

	NOP #34 ; freespace
warnpc $0084C8

; This is one of favorite hijacks that many patches
; likes editing. Because of that, I'll NOP the entire
; routine and put the MVN code at a position that is
; unlikely to get modified.

org $008027
	NOP #15		; If any routine hijack this, things won't blow up.

	;PC is now $008036
	PHB
	LDA #oam_clear_invoke_end-oam_clear_invoke-1
	LDX #oam_clear_invoke
	LDY #$8000
	MVN $7F, oam_clear_invoke>>16
	LDA #$6B6B
	STA $812E
	PLB
	
warnpc $00804A

pullpc

; This code is uploaded to $7F:8000.
oam_clear_invoke:
	LDA.b #oam_clear
	STA $3180
	LDA.b #oam_clear>>8
	STA $3181
	LDA.b #oam_clear>>16
	STA $3182
	
	LDA #$80
	STA $2200
	
-	LDA $3189
	BEQ -
	
	STZ $3189
	RTL
.end

macro store()
	STA.B !x
	!x #= !x+2
endmacro

macro test_and_reset()
	TRB.B !x
	!x #= !x+2
endmacro

oam_clear:
	REP #$30
	; clear OAM attribute table
	; $0420 - $049F
	LDA #$6400
	TCD
	
	!x = $20
	LDA #$F0F0
	rep 64 : %store()
	
	LDA #$0000
	TCD
	
	SEP #$20
	
	LDA #$F0
	LDX #$0000
-	STA $6201,X
	INX #4
	CPX #$0200
	BNE -
	SEP #$10
	RTL

oam_compress:
	PHB
	LDA #$00
	PHA
	PLB
	
	REP #$20
	LDA $6110
	BEQ .return
	STA $00
	LDY $6112
	STY $02
	STZ $6110
	SEP #$20
	PHK
	PEA.w .return-1
	JML [$3000]
.return	
	SEP #$30
	
	REP #$30
	
	; remove all bits from OAM attribute table.
	; $0420 - $049F
	LDA #$6400
	TCD
	
	!x = $20
	LDA #$FCFC
	rep 64 : %test_and_reset()
	
	LDA #$0000
	TCD
	
	SEP #$30
	
	LDY #$1E
-	LDX $8475,Y
	LDA $6423,X
	ASL
	ASL
	ORA $6422,X
	ASL
	ASL
	ORA $6421,X
	ASL
	ASL
	ORA $6420,X
	STA $6400,Y
	LDA $6427,X
	ASL
	ASL
	ORA $6426,X
	ASL
	ASL
	ORA $6425,X
	ASL
	ASL
	ORA $6424,X
	STA $6401,Y
	DEY
	DEY
	BPL -
	
	PLB
	RTL
	