@includefrom sa1.asm
pushpc

ORG $008494
	LDA.B #CompressOAM
	STA $3180
	LDA.B #CompressOAM>>8
	STA $3181
	LDA.B #CompressOAM>>16
	STA $3182
	JMP $1E80

	NOP #34 ; freespace

; The reason I decided to NOP everything and don't branch
; is because some patches likes hijacking this region and
; skipping it would end up giving more trouble compared to
; executing the NOPs. 86 cycles takes 32 us to execute.

ORG $008027
	JSL ConfigureOAMClear
	BRA +
	NOP #37
+

warnpc $008052
	
;$008027:        A9 A9 F0      LDA #$F0A9                ;\ Create a routine in RAM (see Appendix A) 
;$00802A:        8F 00 80 7F   STA $7F8000               ;|>"LDA #$F0" [A9 F0]
;$00802E:        A2 7D 01      LDX #$017D                ;|\Loop counter for what OAM address for sprite tiles
;$008031:        A0 FD 03      LDY #$03FD                ;|/
;$008034:        A9 8D 00      LDA #$008D                ;|
;$008037:        9F 02 80 7F   STA $7F8002,X             ;|>"STA.w $xxxx" [8D xx xx]
;$00803B:        98            TYA                       ;|
;$00803C:        9F 03 80 7F   STA $7F8003,X             ;|> $xxxx [xx xx]
;$008040:        38            SEC                       ;|\Next index (this makes the code "repeat"
;$008041:        E9 04 00      SBC #$0004                ;||with different address; an unrolled loop in RAM).
;$008044:        A8            TAY                       ;||^This routine "clears" (move sprite off-screen; hiding) the OAM 
;$008045:        CA            DEX                       ;||The game will then use JSL.L RAM_7F8000 (runs every frame) to
;$008046:        CA            DEX                       ;||make sprite tiles disappear if a sprite itself disappear (or stops
;$008047:        CA            DEX                       ;||writing data into OAM)
;$008048:        10 EA         BPL $EA [$8034]           ;|/
;$00804A:        E2 30         SEP #$30                  ;|
;$00804C:        A9 6B         LDA #$6B                  ;|\"RTL" [6B]
;$00804E:        8F 82 81 7F   STA $7F8182               ;//
;$008052:        20 E8 80      JSR $80E8                 ; Jump to SPC Upload

warnpc $0084C8

org $8457
	LDA #$40C5	; Use $40:C500 as OAM source.
	
pullpc

ConfigureOAMClear:
	PHB
	LDA #.invoke_routine_end-.invoke_routine-1
	LDX #.invoke_routine
	LDY #$8000
	MVN $7F, .invoke_routine>>16
	SEP #$30
	LDA #$6B
	STA $812E
	PLB
	RTL
	
.invoke_routine
	LDA.b #ClearOAM
	STA $3180
	LDA.b #ClearOAM>>8
	STA $3181
	LDA.b #ClearOAM>>16
	STA $3182
	
	LDA #$80
	STA $2200
	
-	LDA $3189
	BEQ -
	
	STZ $3189
	RTL
..end

macro clear_oam_slot()
	STA.b !count
	!count #= !count+4
endmacro

; Rules:
; 1) $0200 - $033C are untouched.
; All its contents gets copied and compressed to the MaxTile buffer at the end of the frame.
; 2) $0340 - $03FC is the reserved buffer for all sprites or other things that wants to use MaxTile system.
; It is enough to render three 64x64 objects made of 16x16 tiles. If a sprite needs more than it, it might want
; to call flush OAM and then render on the region directly or use the MaxTile API directly.
; 3) when flushing the $0340 buffer, the user will have the following options:
;   I) max priority render: tiles are placed "before" $0200.
;  II) standard priority render: tiles are placed "after" $0340.
; III) low priority render: tiles are placed after all other tiles.
; for now I'm implementing II.
;
; in addition, the OAM buffer block is always stored to the end of the secondary max tile buffer,
; to keep original game behavior.

; MaxTile secondary OAM buffer: $40C300-$40C4FF
; MaxTile secondary OAM prop buffer: $40C280-$40C2FF
; MaxTile secondary pointer: $6114 (starts at #$01FC)

; MaxTile OAM buffer: $40C500
; MaxTile OAM packed prop buffer: $40C700
; MaxTile OAM prop buffer: $40C720

FlushOAM:
	PHX
	PHY
	
	PHB
	LDA #$40
	PHA
	PLB
	
	REP #$10
	LDX $0114
	BMI .abort
	LDY #$01FC
	
.loop
	CPY #$013C
	BEQ .abort
	
	LDA $0201,Y
	CMP #$F0
	BNE .ok
	DEY #4
	BRA .loop
.ok
	STA $C301,X
	LDA $0200,Y
	STA $C300,X
	LDA $0202,Y
	STA $C302,X
	LDA $0203,Y
	STA $C303,X
	
	LDA #$F0
	STA $0201,Y
	
	REP #$21
	TYA
	SBC #$0003
	STA $00
	LSR
	LSR
	TAY
	TXA
	SBC #$0003
	STA $02
	LSR
	LSR
	TAX
	SEP #$20
	
	LDA.w $0420+1,Y
	BIT #$01
	STA.w $C280+1,X
	BEQ .bound_ok
	
	LDX $02
	LDA #$EF
	CMP $C300+4,X
	BCC .no_bound_limit
	STA $C300+4,X
	INX #4
.no_bound_limit
	LDY $00
	BRA .loop
	
.bound_ok
	LDY $00
	LDX $02
	BPL .loop
	
.abort
	STX $0114
	SEP #$10
	
	PLB
	
	PLY
	PLX
	RTL
	
ClearOAM:
	PHD
	LDA #$F0
	
	PEA $6200
	PLD
	!count = 1
	rep 64 : %clear_oam_slot()
	
	PEA $6300
	PLD
	!count = 1
	rep 64 : %clear_oam_slot()
	
	
	LDA #$06
	STA $318F ; map $40:C000-$40:DFFF to $6000-$7FFF
	STA $2225
	
	LDA #$F0
	
	PEA $6500
	PLD
	!count = 1
	rep 64 : %clear_oam_slot()
	
	PEA $6600
	PLD
	!count = 1
	rep 64 : %clear_oam_slot()	
	
	PLD
	
	
	STZ $318F
	STZ $2225
	
	; #$00 - scan entire OAM
	STZ $6113 ; OAM MaxTile Status: frame early.
	
	
	LDA #$FC
	STA $6114 ; \ Reset OAM MaxTile outer pointer.
	LDA #$01
	STA $6115 ; /
	
	
	RTL
	
	
; called when everything is done.

FinishOAM:
	JSL FlushOAM ;flush what's left.

	PHB
	LDA #$40
	PHA
	PLB

	REP #$10
	LDY #$0000	; initial OAM pointer.
	LDX #$0000	; destination final buffer
.back
	CPY #$0140	; \ reached $0340?
	BCS .done	; /
	CPX #$0200	; \ out of OAM slots?
	BCS .done	; /
	
	LDA $0201,Y
	CMP #$F0
	BNE .not_empty
	INY #4
	BRA .back
	
.not_empty
	REP #$21
	LDA $0200,Y
	STA $C500,X
	LDA $0202,Y
	STA $C502,X
	
	TYA
	ADC #$0004
	STA $00
	LSR
	LSR
	TAY
	TXA
	ADC #$0004
	STA $02
	LSR
	LSR
	TAX
	SEP #$20
	
	LDA.w $0420-1,Y
	STA.w $C720-1,X

	LDX $02
	LDY $00
	BRA .back
	
.done

	TXY

	;step 2: copy secondary buffer.
;print pc
	REP #$20
	STY $04
	LDA #$0200
	SEC
	SBC $04
	DEC
	BMI .no_tiles
	STA $06

	LDA $0114 ;first slot free.
	CLC
	ADC #$0004
	TAX
	EOR #$FFFF
	CLC
	ADC #$0200
	BMI .no_tiles
	STA $00
	
	CMP $06
	BCC +
	LDA $06
	STA $00
+
	
	;A=count
	;X=src
	;Y=dest
	
	;first, copy prop tiles.
	TXA
	STA $02
	LSR
	LSR
	ADC #$C280
	TAX
	
	LDA $04
	LSR
	LSR
	ADC #$C720
	TAY
	
	LDA $00
	LSR
	LSR
	MVN $40,$40
	
	;now, copy the oam data.
	LDA $02
	ADC #$C300-1
	TAX
	
	LDA $04
	ADC #$C500
	TAY
	
	LDA $00

	MVN $40,$40
	
	TYA
	SEC
	SBC #$C500
	TAX
.no_tiles
	
	
	SEP #$20
	
	;step 3: clear remaining area.

	LDA #$F0
	
-	CPX #$0200
	BEQ +
	STA $C501,X
	INX #4
	BRA -
	

+	SEP #$30
	
	PLB
	RTS
	
	

CompressOAM:
	JSR FinishOAM

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
	
	LDA #$06
	STA $318F ; map $40:C000-$40:DFFF to $6000-$7FFF
	STA $2225
	
	LDX #$1E
-	LDY $8475,X
	LDA $6723,Y
	ASL
	ASL
	ORA $6722,Y
	ASL
	ASL
	ORA $6721,Y
	ASL
	ASL
	ORA $6720,Y
	STA $6700,X
	LDA $6727,Y
	ASL
	ASL
	ORA $6726,Y
	ASL
	ASL
	ORA $6725,Y
	ASL
	ASL
	ORA $6724,Y
	STA $6701,X
	DEX
	DEX
	BPL -
	
	STZ $318F ; map $40:0000-$40:1FFF to $6000-$7FFF
	STZ $2225
	
	PLB
	RTL
	