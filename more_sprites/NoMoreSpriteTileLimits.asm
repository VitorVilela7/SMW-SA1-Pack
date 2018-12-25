@includefrom sa1.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; No More Sprite Tile Limits v2.0.0
;; coded by Edit1754, macro'd by MathOnNapkins,
;; improved by Arujus and optimized by VitorVilela.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

header
sa1rom

!foundSlot = PickOAMSlot_foundSlot

macro speedup(offset)
		CMP.b $FD+<offset>	; get Y position of PREVIOUS tile in OAM
		BEQ ?notFound		; \  if last isn't free
		LDA.b #<offset>		;  | (and this is), then
		JMP !foundSlot		; /  this is the index
?notFound:
endmacro

macro bulkSpeedup(arg)
		%speedup(<arg>+12)
		%speedup(<arg>+8)
		%speedup(<arg>+4)
		%speedup(<arg>)
endmacro

org $0180D2

SpriteOAMHook:            
		BRA .cutToTheChase	; skip the NOP's
		NOP			; \
		NOP			;  | use NOP
		NOP			;  | to take
		NOP			;  | up space
		NOP			;  | to overwrite
		NOP			;  | old code
		NOP			;  |
		NOP			;  |
		NOP			;  |
		NOP			;  |
		NOP			;  |
		NOP			;  |
		NOP			; /
.cutToTheChase	autoclean JSL PickOAMSlot		; JSL to new code

; Don't want climbing net door setting it's own OAM index
org $01BB33
JSL NetDoorFix
NOP

org $01BBFD
LDY $0F

; This table contains OAM indices for cluster sprites. Set them to use the highest indices so as not to conflict with ordinary sprites.
org $02FF50
db $E0,$E4,$E8,$EC,$F0,$F4,$F8,$FC
db $B0,$B4,$B8,$BC,$D0,$D4,$D8,$DC
db $C0,$C4,$C8,$CC

; Lakitu should not use a hard-coded OAM index for the fishing line
org $02E6EC
JSL FishingLineFix
NOP

; I'm pretty sure that $140F was meant to be used a flag indicating that Reznor is on screen but SMW has a bug where it increments every frame in
; which Reznor is present instead of just once, which means it can wrap around to zero for one frame. This can cause tiles to disappear among other
; problems for this patch so it is best to fix the bug and set $140F to a fixed value so that it's always non-zero during a Reznor fight.
org $039890
STA $740F

; Powerups sometimes use their own hard-coded OAM index, we don't want this so fix it.
;org $01C61F
;BRA SkipStuff
;rep 21 : NOP
;SkipStuff:

;Vitor Vilela: this screws up Roy/Morton/Ludwig, undo that.
;the hard-coded OAM index is only for their case anyways.
org $01C61F
	LDA.w $740F				;$01C61F	|
	BNE CODE_01C636				;$01C622	|
	LDA.w $6D9B				;$01C624	|
	CMP.b #$C1				;$01C627	|
	BEQ CODE_01C636				;$01C629	|
	BIT.w $6D9B				;$01C62B	|
	BVC CODE_01C636				;$01C62E	|
	LDA.b #$D8				;$01C630	|
	STA.w $33A2,X				;$01C632	|
	TAY					;$01C635	|
CODE_01C636:


; The hammer brother graphics routine is called by the hammer brother's platform. The OAM index for the hammer brother might not be set correctly
; so hijack here to set it.
org $02DB82
JSL HammerBroFix
NOP
NOP

freecode

HammerBroFix:
        LDA !sprite_x_high,x
        STA !sprite_x_high,y
        LDA !sprite_oam_index,x
        CLC
        ADC #$10        ; Add #$10 because the platform wrote 4 tiles (#$10 bytes) to OAM.
        STA !sprite_oam_index,y
        RTL

FishingLineFix:
        LDA !sprite_oam_index,x
        CLC
        ADC #$08
        STA !sprite_oam_index,x
        RTL

NetDoorFix:
        LDA !sprite_oam_index,x
        LSR
        LSR
        STA $0F
        LDA !sprite_oam_index,x
        RTL

PickOAMSlot:
		;LDA $7692		; \  if sprite header
		;CMP #$10		;  | setting is not 10,
		;BNE .default		; /  use the old code
.notLastSpr	LDA !sprite_status,x		; \ it's not necessary to get an index
		BEQ .return		; / if this sprite doesn't exist
		LDA !sprite_num,x		; \  give yoshi
		CMP #$35		;  | the first
		BEQ .yoshi		; /  two tiles
		BRA SearchAlgorithm	; search for a slot
.foundSlot	PLD
		STA !sprite_oam_index,x		; set the index
.return		RTL			

.yoshi		LDA #$28		; \ Yoshi always gets
		STA !sprite_oam_index,x		; / first 2 tiles (28,2C)
		RTL

.default	PHX			; \
		TXA			;  | for when not using
		LDX $7692		;  | custom OAM pointer
		CLC			;  | routine, this is
		ADC $07F0B4,x		;  | the original SMW
		TAX			;  | code.
		LDA $07F000,x		;  |
		PLX			;  |
		STA !sprite_oam_index,x		; /
		RTL
        
SearchAlgorithm:
	PHD
	PEA $6300
	PLD
        LDA $73F9
        BEQ .DontJump
        JMP .BehindScenery
.DontJump
        LDA $6D9B
        CMP #$80
        BNE .DontJump2
        JMP .IggyLarryBowser
        ; $F8 and $FC reserved for lakitu's cloud
.DontJump2
        CMP #$C1
        BNE .DontJump3
        JMP .IggyLarryBowser
.DontJump3
	LDA #$F0
        %speedup($F4)
        %speedup($F0)
		%bulkSpeedup($E0)	;  | pre-defined
		%bulkSpeedup($D0)	;  | macros with
.BehindScenery
	LDA #$F0
        %bulkSpeedup($C0)
		%bulkSpeedup($B0)	;  | code for each
.IggyLarryBowser
	LDA #$F0
		%bulkSpeedup($A0)	;  | individual
		%bulkSpeedup($90)	;  | slot check
		%bulkSpeedup($80)	;  |
		%bulkSpeedup($70)	;  |
		%bulkSpeedup($60)	;  |
		%bulkSpeedup($50)	;  |
		%bulkSpeedup($40)	;  |
		%speedup($3C)		;  |
		LDA.w $78E2		; \ Yoshi?
		BRA .yoshiExists	; /
        ; $30 and $34 are reserved for lakitu's cloud
		LDA #$F0
		%speedup($2C)		; / checks
		LDA.b #$28		; \ if none of the above yield which slot
		JMP !foundSlot		; / then use the slot at the beginning

; If none of the above yield which slot, then use the slot at the beginning (after Yoshi). Normally we would be able to use slot $30 as a minimum but
; unfortunately smw has a bug where sometimes Yoshi can be rendered twice on one frame, in which the 2nd rendering uses slot $2C and $30 instead of
; $28 and $2C, this will cause whatever other sprite is using slot $30 to flicker which isn't good, so don't use slot $30.
.yoshiExists	LDA.b #$38
		JMP !foundSlot