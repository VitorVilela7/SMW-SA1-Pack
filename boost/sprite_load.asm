@includefrom sa1.asm
namespace SpriteLoading
pushpc

; Make most of the sprite cleanup routine run on SA-1 CPU now.

org $058098
	JSL Sprite_Load_Reset
	
; Instead of jumping to a SNES -> SA-1 invoke (CODE_01808C),
; jump directly to the code since we're already running over SA-1 CPU
; now.

org $02A75F
	JSL SA1_Sprites

;CODE_02A802:        A4 55         LDY $55                   
;CODE_02A804:        A5 5B         LDA RAM_IsVerticalLvl     ; \ Branch if horizontal level 
;CODE_02A806:        4A            LSR                       ;  | 
;CODE_02A807:        90 0E         BCC CODE_02A817           ; / 

org $02A802
	JML LoadSprites
	RTS
	
org $02A82A
	LDY #$01
	REP #$10
	
org $02A884
	JSL ScrollSprite
	
org $02A8E1
	JML NSprite_FixY
	NOP
Haxor:
	RTI
NSprite_FixY_Back:
	
org $02A936
	JML NSprite_FixY2
NSprite_FixY2_Back:
	RTS
	NOP
	
org $02A9DA
	JML NSprite_FixY3
	
org $02A859
	JML Label
	
org $02A93C
	JML Label2
	
org $02A984
;	JML Label3
	JMP Label3_J
	NOP
	
org $02A9A7
	JML Label4
	
org $02A9B9
	JSL InitSpriteTablesFix

org $02A9C9
	JSL InitSpriteTablesFix
	
org $02AB78
	JML ShooterFix1
	NOP
	
org $02AB9E
	JML ShooterFix2
	
org $02ABEE
	JML ShooterFix3
	
org $02A8C7
	JML SpecialSpriteFix
	NOP
	
org $02AA54
	JML SpriteE4Fix
	
org $02AB46
	JML SpriteE2Fix
	
org $02AF9D
	JML FiveEeriesFix
	
org $02A893
	JML FiveEeriesFix2
	NOP
	
org $02A8A3
	JML ThreePlatformsFix
	NOP #5
	
org $02AF33
	JML ThreePlatformsFix2
	
org $01AC9C
	JSL CODE_01AC9C
	NOP
	
org $02A856
	JML CODE_02A856
	NOP #6
	
org $02A8BB
	JML CODE_02A8BB

org $02AB99
	JSL CODE_01AC9C
	NOP
	
org $02D088
	JSL CODE_01AC9C
	NOP
	
org $02ABF2
	JML ClearIt
;	NOP #4
Label3_J:
	JML Label3
	
org $02FAE9
	JML CODE_02FAE9
	
org $02FF15
	JSL CODE_01AC9C
	NOP
	
org $038712
	JSL CODE_01AC9C
	NOP
	
org $03B8BA
	JSL CODE_01AC9C
	NOP
	
pullpc

Sprite_Load_Reset:
	LDA.B #$02A751
	STA $3180
	LDA.B #$02A751>>8
	STA $3181
	LDA.B #$02A751>>16
	STA $3182
	JSR $1E80
	RTL

LoadSprites:
	LDX #$00
	
	LDA #$02
	PHA
	PEA.w $02A806
	PHP
	PEA.w Haxor-1
	
	LDY $55
	LDA $5B
	LSR
	JML $02A807
	
ScrollSprite:
	SEP #$10
	JSL $05BCD6
	REP #$10
	RTL
	
NSprite_FixY:
	DEY
	PHY
	SEP #$10
	LDY $7692
	JML .Back
	
NSprite_FixY2:
	LDX $02
	LDA #$00
	STA !SprLoadStatus,x
	REP #$10
	PLY
	JML .Back
	
NSprite_FixY3:
	INX
	PHY
	SEP #$10
	REP #$10
	PLY
	PLA
	PLA
	JML $02A82E
	
Label:
	BNE +
	LDA $03
	STX $02
	STA $03
	JML $02A85D
+	JML $02A846

Label2:
	REP #$10
	PLY
	PHY
	LDA $5B
	JML $02A940
	
Label3:
	PHY
	SEP #$10
	LDY $7EEB
	REP #$10
	JML $02A988

Label4:
	PHY
	SEP #$10
	REP #$10
	PLY
	LDA $07F659,x
	JML $02A9AB
	
InitSpriteTablesFix:
	PHX
	PHY
	SEP #$10
	JSL $07F7D2
	REP #$10
	PLY
	PLX
	RTL
	
ShooterFix1:
	DEY
	PHY
	SEP #$10
	STX $02
	JML $02AB7D
	
ShooterFix2:
	REP #$10
	PLY
	LDA $04
	JML $02ABA2
	
ShooterFix3:
	PHY
	SEP #$10
	REP #$10
	PLY
	INX
	JML $02A82E
	
SpecialSpriteFix:
	STY $3100
	SEP #$10
	PHK
	PEA.w .back-1
	PEA.w $02B889-1
	JML $02AAC0
.back	REP #$10
	JML $02A8CC
	
SpriteE4Fix:
	REP #$10
	LDY $3100
	LDA [$CE],y
	JML $02AA58
	
SpriteE2Fix:
	REP #$10
	LDY $3100
	LDA [$CE],y
	SEP #$10
	JML $02AB4A
	
FiveEeriesFix:
	REP #$10
	LDY $3100
	LDA [$CE],y
	SEP #$10
	JML $02AFA1
	
FiveEeriesFix2:
	STY $3100
	SEP #$10
	PHK
	PEA.w .back-1
	PEA.w $02B889-1
	JML $02AF9D
.back	REP #$10
	JML $02A898
	
ThreePlatformsFix:
	STY $3100
	SEP #$10
	PHK
	PEA.w .back-1
	PEA.w $02B889-1
	JML $02AF33
.back	REP #$10
	JML $02A898 ; This is propositional the correct address should be $02A8A8
	
ThreePlatformsFix2:
	REP #$10
	LDY $3100
	LDA [$CE],y
	SEP #$10
	JML $02AF37
	
CODE_01AC9C:
	PHX
	TYX
	LDA #$00
	STA !SprLoadStatus,x
	PLX
	RTL
	
CODE_02A856:
	LDA !SprLoadStatus,x
	BNE +
	INC
	STA !SprLoadStatus,x
	STX $02
	JML $02A860
+	JML $02A846

CODE_02A8BB:
	LDA #$00
	STA !SprLoadStatus,x
	JML $02A846
	
ClearIt:
	LDX #$FF
	LDA #$00
-	STA !SprLoadStatus-1,x
	DEX
	BNE -
	JML $02ABFA
	
CODE_02FAE9:
	LDA #$00
	STA !SprLoadStatus,x
	PLX
	JML $02FAED
	
namespace off