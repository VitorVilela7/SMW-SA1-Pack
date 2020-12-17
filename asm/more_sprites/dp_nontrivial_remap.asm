@includefrom sa1.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SPECIAL CASES (manually fixed)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These are easy fixes, not done automatically because my script is too stupid to know the addresses in these cases (due to the label name)
; InitYoshiEgg:       B5 E4         LDA RAM_SpriteXLo,X       
org $018339
LDA (!sprite_x_low_pointer)
; InitExplodingBlk:   B5 E4         LDA RAM_SpriteXLo,X       
org $0183A4
LDA (!sprite_x_low_pointer)
; InitUrchin:         B5 E4         LDA RAM_SpriteXLo,X       
org $01841B
LDA (!sprite_x_low_pointer)
; InitPeaBouncer:     B5 E4         LDA RAM_SpriteXLo,X       
org $01843E
LDA (!sprite_x_low_pointer)
; InitPSwitch:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $151C,x = Blue/Silver, 
org $01844E
LDA (!sprite_x_low_pointer)
; InitMontyMole:      B5 E4         LDA RAM_SpriteXLo,X       
org $0184CE
LDA (!sprite_x_low_pointer)
; InitPitchinChuck:   B5 E4         LDA RAM_SpriteXLo,X       
org $0184ED
LDA (!sprite_x_low_pointer)
; InitPiranha:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Center sprite between two tiles 
org $0185B0
LDA (!sprite_x_low_pointer)
; HandleJumpOver:     B9 E4 00      LDA.W RAM_SpriteXLo,Y     
org $0188AC
LDA !sprite_x_low,y
; InitFlying?Block:   B5 E4         LDA RAM_SpriteXLo,X       
org $01AD59
LDA (!sprite_x_low_pointer)
; InitClimbingDoor:   B5 E4         LDA RAM_SpriteXLo,X       
org $01BA87
LDA (!sprite_x_low_pointer)
; InitGoalTape:       B5 E4         LDA RAM_SpriteXLo,X       
org $01C075
LDA (!sprite_x_low_pointer)
; InitLinePlat:       B5 E4         LDA RAM_SpriteXLo,X       
org $01D6D2
LDA (!sprite_x_low_pointer)
; InitKeyHole:        B5 E4         LDA RAM_SpriteXLo,X       
org $01E1B8
LDA (!sprite_x_low_pointer)
; PrincessPeach:      B5 E4         LDA RAM_SpriteXLo,X       
org $03AC97
LDA (!sprite_x_low_pointer)
; InitWoodSpike:      B5 D8         LDA RAM_SpriteYLo,X       
org $01835B
LDA (!sprite_y_low_pointer)
; InitScalePlats:     B5 D8         LDA RAM_SpriteYLo,X       
org $0183B5
LDA (!sprite_y_low_pointer)
; InitGrnBounceKoopa: B5 D8         LDA RAM_SpriteYLo,X       
org $01856E
LDA (!sprite_y_low_pointer)
; InitThwomp:         B5 D8         LDA RAM_SpriteYLo,X       
org $01AE96
LDA (!sprite_y_low_pointer)
; InitKoopaKid:       B5 D8         LDA RAM_SpriteYLo,X       
org $01CD2F
LDA (!sprite_y_low_pointer)
; InitFireball:       B5 D8         LDA RAM_SpriteYLo,X       
org $01E050
LDA (!sprite_y_low_pointer)
; LvlEndStoreSpr:     99 9E 00      STA.W RAM_SpriteNum,Y     
org $00FB55
STA !sprite_num,y
; HandleSprStunned:   B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Yoshi shell 
org $01953C
LDA (!sprite_num_pointer)
; UnstunSprite:       B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Buzzy Beetle 
org $0196A9
LDA (!sprite_num_pointer)
; HandleSprKilled:    B5 9E         LDA RAM_SpriteNum,X       ; \ If Wiggler, call main sprite routine 
org $019AA2
LDA (!sprite_num_pointer)
; OffScrEraseSprite:  B5 9E         LDA RAM_SpriteNum,X       ; \ If MagiKoopa... 
org $01AC80
LDA (!sprite_num_pointer)
; EatSprite:          B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if sprite being eaten not Pokey 
org $01F5A7
LDA !sprite_num,y
; InvisBlk+DinosMain: B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if sprite isn't "Invisible solid block" 
org $039C34
LDA (!sprite_num_pointer)

; These instructions have no indirect addressing modes. I added the cached sprite number to handle these cases.
; CODE_0189EE:        B4 9E         LDY RAM_SpriteNum,X       ; \ Branch if Blue shelless
org $0189EE
LDY !sprite_num_cache
; CODE_018A04:        B4 9E         LDY RAM_SpriteNum,X       
org $018A04
LDY !sprite_num_cache
; CODE_018B0F:        B4 9E         LDY RAM_SpriteNum,X       ;  | 
org $018B0F
LDY !sprite_num_cache
; CODE_018B57:        B4 9E         LDY RAM_SpriteNum,X       ; \ 
org $018B57
LDY !sprite_num_cache
; SpriteInAir:        B4 9E         LDY RAM_SpriteNum,X       
org $018B84
LDY !sprite_num_cache
; CODE_018BDE:        B4 9E         LDY RAM_SpriteNum,X       ; \ Branch if sprite is 2 tiles high 
org $018BDE
LDY !sprite_num_cache
; CODE_018EB9:        B4 9E         LDY RAM_SpriteNum,X       ; \ Invert speed if upside-down piranha 
org $018EB9
LDY !sprite_num_cache
; CODE_019D04:        B4 9E         LDY RAM_SpriteNum,X       
org $019D04
LDY !sprite_num_cache
; CODE_019D79:        B4 9E         LDY RAM_SpriteNum,X       
org $019D79
LDY !sprite_num_cache
; CODE_019D83:        B4 9E         LDY RAM_SpriteNum,X       
org $019D83
LDY !sprite_num_cache
; CODE_019DE7:        B4 9E         LDY RAM_SpriteNum,X       
org $019DE7
LDY !sprite_num_cache
; CODE_019F17:        B4 9E         LDY RAM_SpriteNum,X       
org $019F17
LDY !sprite_num_cache
; CODE_01A960:        B4 9E         LDY RAM_SpriteNum,X       
org $01A960
LDY !sprite_num_cache
; CODE_01AA16:        B4 9E         LDY RAM_SpriteNum,X       ;  | 
org $01AA16
LDY !sprite_num_cache
; CODE_01B29A:        B4 9E         LDY RAM_SpriteNum,X       
org $01B29A
LDY !sprite_num_cache
; CODE_01F93B:        B4 9E         LDY RAM_SpriteNum,X       
org $01F93B
LDY !sprite_num_cache
; CODE_02BDD6:        B4 9E         LDY RAM_SpriteNum,X       ; \ Branch if Wall-follow Urchin 
org $02BDD6
LDY !sprite_num_cache
; CODE_02BDE9:        B4 9E         LDY RAM_SpriteNum,X       ; \ Branch if Wall-follow Urchin 
org $02BDE9
LDY !sprite_num_cache
; CODE_02E1A4:        B4 9E         LDY RAM_SpriteNum,X       
org $02E1A4
LDY !sprite_num_cache
; CODE_038C51:        B4 9E         LDY RAM_SpriteNum,X       
org $038C51
LDY !sprite_num_cache
; CODE_038C83:        B4 9E         LDY RAM_SpriteNum,X       
org $038C83
LDY !sprite_num_cache

; In all remaining special cases the pointer is ensured to be pointing to the correct address due to hijacks in more_sprites.asm

; These are part of cluster sprites.
; CODE_02F94C:        85 E4         STA RAM_SpriteXLo         
org $02F94C
STA (!sprite_x_low_pointer)
; CODE_02FBFF:        85 E4         STA RAM_SpriteXLo      
org $02FBFF
STA (!sprite_x_low_pointer)
; CODE_02F957:        85 D8         STA RAM_SpriteYLo         
org $02F957
STA (!sprite_y_low_pointer)
; CODE_02FC18:        85 D8         STA RAM_SpriteYLo         ;  |
org $02FC18
STA (!sprite_y_low_pointer)

; Reznor's sign
; CODE_0398AD:        85 E4         STA RAM_SpriteXLo         ;  | 
org $0398AD
STA (!sprite_x_low_pointer)
; CODE_0398B4:        85 D8         STA RAM_SpriteYLo         ;  | 
org $0398B4
STA (!sprite_y_low_pointer)

; A few places seem to check $A5 (sprite index 7) to see if Reznor is on screen. Instead simply use $140F, the Reznor on screen flag (which is
; fixed in the no more sprite tile limits patch).
; CODE_0296F4:        A5 A5         LDA $A5                   ; \  Branch if Reznor is on screen
org $0296F4
LDA $740F
BNE $51
NOP
; CODE_02994F:        A5 A5         LDA $A5                   ; \  Branch if Reznor is on screen
org $02994F
; The Reznor flag is checked immediately after this just remove this.
rep 6 : NOP
; CODE_02A02C:        A5 A5         LDA $A5                   ; \  Branch if Reznor is on screen
org $02A02C
LDA $740F
BNE $0A
NOP

; These are part of the ending credits, yoshi here seems to be hard-coded to use sprite slot 0. I think the pointer will be set correctly here without
; having to explicitly set it. TODO: Look into this and verify that this is the case.
; Level mode 19
; CODE_0CA006:        85 E4         STA RAM_SpriteXLo         
org $0CA006
STA (!sprite_x_low_pointer)
; CODE_0CA00D:        85 D8         STA RAM_SpriteYLo         
org $0CA00D
STA (!sprite_y_low_pointer)

; Level mode 1D
; CODE_0CA21A:        A5 E4         LDA RAM_SpriteXLo         
org $0CA21A
LDA (!sprite_x_low_pointer)
; CODE_0CA273:        85 E4         STA RAM_SpriteXLo         
org $0CA273
STA (!sprite_x_low_pointer)
; CODE_0CA510:        A5 E4         LDA RAM_SpriteXLo         
org $0CA510
LDA (!sprite_x_low_pointer)
; CODE_0CA6D7:        A5 E4         LDA RAM_SpriteXLo         
org $0CA6D7
LDA (!sprite_x_low_pointer)
; CODE_0CA27F:        85 D8         STA RAM_SpriteYLo         
org $0CA27F
STA (!sprite_y_low_pointer)
; CODE_0CA77F:        85 9E         STA RAM_SpriteNum         
org $0CA77F
STA (!sprite_num_pointer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NORMAL CASES (automatically fixed by script)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sprite X low remapping

; CODE_00FA5A:        99 E4 00      STA.W RAM_SpriteXLo,Y     ; /  
org $00FA5A
STA !sprite_x_low,y
; CODE_00FB98:        B9 E4 00      LDA.W RAM_SpriteXLo,Y     
org $00FB98
LDA !sprite_x_low,y
; CODE_00FBBD:        75 E4         ADC RAM_SpriteXLo,X       
org $00FBBD
ADC (!sprite_x_low_pointer)
; CODE_00FBBF:        95 E4         STA RAM_SpriteXLo,X       
org $00FBBF
STA (!sprite_x_low_pointer)
; ADDR_00FC4F:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $00FC4F
STA !sprite_x_low,y
; CODE_00FCA3:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $00FCA3
STA (!sprite_x_low_pointer)
; CODE_00FCF7:        95 E4         STA RAM_SpriteXLo,X       
org $00FCF7
STA (!sprite_x_low_pointer)
; ADDR_00FF36:        B5 E4         LDA RAM_SpriteXLo,X       
org $00FF36
LDA (!sprite_x_low_pointer)
; CODE_00FF65:        B5 E4         LDA RAM_SpriteXLo,X       
org $00FF65
LDA (!sprite_x_low_pointer)
; CODE_018078:        B5 E4         LDA RAM_SpriteXLo,X       
org $018078
LDA (!sprite_x_low_pointer)
; CODE_018328:        B5 E4         LDA RAM_SpriteXLo,X       
org $018328
LDA (!sprite_x_low_pointer)
; CODE_0183C0:        B5 E4         LDA RAM_SpriteXLo,X       
org $0183C0
LDA (!sprite_x_low_pointer)
; CODE_0183C9:        B5 E4         LDA RAM_SpriteXLo,X       
org $0183C9
LDA (!sprite_x_low_pointer)
; CODE_018443:        95 E4         STA RAM_SpriteXLo,X       
org $018443
STA (!sprite_x_low_pointer)
; CODE_0184AE:        B5 E4         LDA RAM_SpriteXLo,X       
org $0184AE
LDA (!sprite_x_low_pointer)
; CODE_0184B0:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $0184B0
STA !sprite_x_low,y
; CODE_01850D:        B5 E4         LDA RAM_SpriteXLo,X       
org $01850D
LDA (!sprite_x_low_pointer)
; CODE_018531:        B5 E4         LDA RAM_SpriteXLo,X       
org $018531
LDA (!sprite_x_low_pointer)
; CODE_0185B5:        95 E4         STA RAM_SpriteXLo,X       ; / 
org $0185B5
STA (!sprite_x_low_pointer)
; CODE_018979:        B5 E4         LDA RAM_SpriteXLo,X		;KOOPA BLUE KICK SHELL!       
org $018979
LDA (!sprite_x_low_pointer)
; CODE_01897C:        F9 E4 00      SBC.W RAM_SpriteXLo,Y     
org $01897C
SBC !sprite_x_low,y
; CODE_018F6C:        B5 E4         LDA RAM_SpriteXLo,X       
org $018F6C
LDA (!sprite_x_low_pointer)
; CODE_01915F:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Sprite's X position += $26 
org $01915F
LDA (!sprite_x_low_pointer)
; CODE_019164:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $019164
STA (!sprite_x_low_pointer)
; CODE_019180:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Restore sprite's original position 
org $019180
LDA (!sprite_x_low_pointer)
; CODE_019185:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $019185
STA (!sprite_x_low_pointer)
; CODE_0191B3:        75 E4         ADC RAM_SpriteXLo,X       
org $0191B3
ADC (!sprite_x_low_pointer)
; CODE_0191B5:        95 E4         STA RAM_SpriteXLo,X       
org $0191B5
STA (!sprite_x_low_pointer)
; CODE_0191D0:        B5 E4         LDA RAM_SpriteXLo,X       
org $0191D0
LDA (!sprite_x_low_pointer)
; CODE_0191D6:        95 E4         STA RAM_SpriteXLo,X       
org $0191D6
STA (!sprite_x_low_pointer)
; ADDR_0193F4:        B5 E4         LDA RAM_SpriteXLo,X       
org $0193F4
LDA (!sprite_x_low_pointer)
; ADDR_0193FA:        95 E4         STA RAM_SpriteXLo,X       
org $0193FA
STA (!sprite_x_low_pointer)
; CODE_01946C:        B5 E4         LDA RAM_SpriteXLo,X       
org $01946C
LDA (!sprite_x_low_pointer)
; CODE_0194DD:        B5 E4         LDA RAM_SpriteXLo,X       
org $0194DD
LDA (!sprite_x_low_pointer)
; CODE_0195A6:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position + #$08 
org $0195A6
LDA (!sprite_x_low_pointer)
; CODE_0196FD:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Shelless Koopa position = Koopa position 
org $0196FD
LDA (!sprite_x_low_pointer)
; CODE_0196FF:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $0196FF
STA !sprite_x_low,y
; CODE_019780:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Copy X position to coin 
org $019780
LDA (!sprite_x_low_pointer)
; CODE_019782:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $019782
STA !sprite_x_low,y
; CODE_0199AB:        B5 E4         LDA RAM_SpriteXLo,X       
org $0199AB
LDA (!sprite_x_low_pointer)
; CODE_0199E6:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Store Y position in $9A-$9B 
org $0199E6
LDA (!sprite_x_low_pointer)
; CODE_019E3C:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $00 = X position low 
org $019E3C
LDA (!sprite_x_low_pointer)
; CODE_019EA6:        B5 E4         LDA RAM_SpriteXLo,X       
org $019EA6
LDA (!sprite_x_low_pointer)
; CODE_019EAC:        95 E4         STA RAM_SpriteXLo,X       
org $019EAC
STA (!sprite_x_low_pointer)
; CODE_019ED4:        B5 E4         LDA RAM_SpriteXLo,X       
org $019ED4
LDA (!sprite_x_low_pointer)
; CODE_019ED9:        95 E4         STA RAM_SpriteXLo,X       
org $019ED9
STA (!sprite_x_low_pointer)
; CODE_019EFF:        95 E4         STA RAM_SpriteXLo,X       
org $019EFF
STA (!sprite_x_low_pointer)
; CODE_01A04F:        95 E4         STA RAM_SpriteXLo,X       
org $01A04F
STA (!sprite_x_low_pointer)
; CODE_01A0FD:        95 E4         STA RAM_SpriteXLo,X       
org $01A0FD
STA (!sprite_x_low_pointer)
; CODE_01A230:        B5 E4         LDA RAM_SpriteXLo,X       
org $01A230
LDA (!sprite_x_low_pointer)
; CODE_01A332:        75 E4         ADC RAM_SpriteXLo,X       
org $01A332
ADC (!sprite_x_low_pointer)
; CODE_01A334:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01A334
STA !sprite_x_low,y
; CODE_01A36B:        B5 E4         LDA RAM_SpriteXLo,X       
org $01A36B
LDA (!sprite_x_low_pointer)
; CODE_01A37D:        B5 E4         LDA RAM_SpriteXLo,X       
org $01A37D
LDA (!sprite_x_low_pointer)
; CODE_01A3D0:        B5 E4         LDA RAM_SpriteXLo,X       
org $01A3D0
LDA (!sprite_x_low_pointer)
; CODE_01A446:        B9 E4 00      LDA.W RAM_SpriteXLo,Y     
org $01A446
LDA !sprite_x_low,y
; CODE_01A56D:        B5 E4         LDA RAM_SpriteXLo,X       
org $01A56D
LDA (!sprite_x_low_pointer)
; CODE_01A570:        F9 E4 00      SBC.W RAM_SpriteXLo,Y     
org $01A570
SBC !sprite_x_low,y
; CODE_01A6FB:        F9 E4 00      SBC.W RAM_SpriteXLo,Y     
org $01A6FB
SBC !sprite_x_low,y
; CODE_01A79F:        B5 E4         LDA RAM_SpriteXLo,X       
org $01A79F
LDA (!sprite_x_low_pointer)
; CODE_01A7A7:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01A7A7
STA !sprite_x_low,y
; CODE_01AB88:        B5 E4         LDA RAM_SpriteXLo,X       
org $01AB88
LDA (!sprite_x_low_pointer)
; CODE_01AC64:        D5 E4         CMP RAM_SpriteXLo,X       
org $01AC64
CMP (!sprite_x_low_pointer)
; CODE_01ACB1:        B5 E4         LDA RAM_SpriteXLo,X       ; \                                                           
org $01ACB1
LDA (!sprite_x_low_pointer)
; CODE_01AD35:        F5 E4         SBC RAM_SpriteXLo,X       
org $01AD35
SBC (!sprite_x_low_pointer)
; CODE_01AE16:        B5 E4         LDA RAM_SpriteXLo,X       
org $01AE16
LDA (!sprite_x_low_pointer)
; CODE_01AE9B:        B5 E4         LDA RAM_SpriteXLo,X       
org $01AE9B
LDA (!sprite_x_low_pointer)
; CODE_01AEA0:        95 E4         STA RAM_SpriteXLo,X       
org $01AEA0
STA (!sprite_x_low_pointer)
; CODE_01B168:        75 E4         ADC RAM_SpriteXLo,X       
org $01B168
ADC (!sprite_x_low_pointer)
; CODE_01B21C:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B21C
LDA (!sprite_x_low_pointer)
; CODE_01B302:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B302
LDA (!sprite_x_low_pointer)
; CODE_01B3F0:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B3F0
LDA (!sprite_x_low_pointer)
; CODE_01B526:        75 E4         ADC RAM_SpriteXLo,X       
org $01B526
ADC (!sprite_x_low_pointer)
; CODE_01B753:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B753
LDA (!sprite_x_low_pointer)
; CODE_01B7D0:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B7D0
LDA (!sprite_x_low_pointer)
; ADDR_01B8DE:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B8DE
LDA (!sprite_x_low_pointer)
; ADDR_01B8EF:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B8EF
LDA (!sprite_x_low_pointer)
; CODE_01B907:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B907
LDA (!sprite_x_low_pointer)
; CODE_01B950:        B5 E4         LDA RAM_SpriteXLo,X       
org $01B950
LDA (!sprite_x_low_pointer)
; CODE_01BA8C:        95 E4         STA RAM_SpriteXLo,X       
org $01BA8C
STA (!sprite_x_low_pointer)
; CODE_01BAF0:        F5 E4         SBC RAM_SpriteXLo,X       
org $01BAF0
SBC (!sprite_x_low_pointer)
; CODE_01BB3B:        B5 E4         LDA RAM_SpriteXLo,X       
org $01BB3B
LDA (!sprite_x_low_pointer)
; CODE_01BCA4:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $01BCA4
STA (!sprite_x_low_pointer)
; CODE_01BDA8:        B5 E4         LDA RAM_SpriteXLo,X       
org $01BDA8
LDA (!sprite_x_low_pointer)
; CODE_01BE27:        95 E4         STA RAM_SpriteXLo,X       
org $01BE27
STA (!sprite_x_low_pointer)
; CODE_01BED8:        B5 E4         LDA RAM_SpriteXLo,X       
org $01BED8
LDA (!sprite_x_low_pointer)
; CODE_01BF37:        B5 E4         LDA RAM_SpriteXLo,X       
org $01BF37
LDA (!sprite_x_low_pointer)
; CODE_01BF39:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01BF39
STA !sprite_x_low,y
; CODE_01C1D3:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $01C1D3
LDA (!sprite_x_low_pointer)
; CODE_01C500:        B5 E4         LDA RAM_SpriteXLo,X       
org $01C500
LDA (!sprite_x_low_pointer)
; CODE_01C754:        B5 E4         LDA RAM_SpriteXLo,X       
org $01C754
LDA (!sprite_x_low_pointer)
; CODE_01C759:        95 E4         STA RAM_SpriteXLo,X       
org $01C759
STA (!sprite_x_low_pointer)
; CODE_01CAD9:        B5 E4         LDA RAM_SpriteXLo,X       
org $01CAD9
LDA (!sprite_x_low_pointer)
; CODE_01CD3D:        95 E4         STA RAM_SpriteXLo,X       
org $01CD3D
STA (!sprite_x_low_pointer)
; CODE_01CD7F:        95 E4         STA RAM_SpriteXLo,X       
org $01CD7F
STA (!sprite_x_low_pointer)
; CODE_01D01F:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D01F
LDA (!sprite_x_low_pointer)
; CODE_01D073:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D073
LDA (!sprite_x_low_pointer)
; CODE_01D097:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01D097
STA !sprite_x_low,y
; CODE_01D1A1:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D1A1
LDA (!sprite_x_low_pointer)
; CODE_01D1C1:        95 E4         STA RAM_SpriteXLo,X       
org $01D1C1
STA (!sprite_x_low_pointer)
; ADDR_01D30B:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D30B
LDA (!sprite_x_low_pointer)
; CODE_01D344:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D344
LDA (!sprite_x_low_pointer)
; CODE_01D351:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D351
LDA (!sprite_x_low_pointer)
; CODE_01D357:        95 E4         STA RAM_SpriteXLo,X       
org $01D357
STA (!sprite_x_low_pointer)
; CODE_01D376:        95 E4         STA RAM_SpriteXLo,X       
org $01D376
STA (!sprite_x_low_pointer)
; CODE_01D40B:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D40B
LDA (!sprite_x_low_pointer)
; CODE_01D46B:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D46B
LDA (!sprite_x_low_pointer)
; CODE_01D607:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D607
LDA (!sprite_x_low_pointer)
; CODE_01D60E:        95 E4         STA RAM_SpriteXLo,X       
org $01D60E
STA (!sprite_x_low_pointer)
; CODE_01D6BA:        95 E4         STA RAM_SpriteXLo,X       
org $01D6BA
STA (!sprite_x_low_pointer)
; CODE_01D6F0:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D6F0
LDA (!sprite_x_low_pointer)
; CODE_01D6F6:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D6F6
LDA (!sprite_x_low_pointer)
; CODE_01D6FB:        95 E4         STA RAM_SpriteXLo,X       
org $01D6FB
STA (!sprite_x_low_pointer)
; CODE_01D70A:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D70A
LDA (!sprite_x_low_pointer)
; CODE_01D70F:        95 E4         STA RAM_SpriteXLo,X       
org $01D70F
STA (!sprite_x_low_pointer)
; CODE_01D7D7:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D7D7
LDA (!sprite_x_low_pointer)
; CODE_01D7DE:        95 E4         STA RAM_SpriteXLo,X       
org $01D7DE
STA (!sprite_x_low_pointer)
; CODE_01D7F9:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D7F9
LDA (!sprite_x_low_pointer)
; CODE_01D832:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D832
LDA (!sprite_x_low_pointer)
; CODE_01D8AD:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D8AD
LDA (!sprite_x_low_pointer)
; CODE_01D8C1:        95 E4         STA RAM_SpriteXLo,X       
org $01D8C1
STA (!sprite_x_low_pointer)
; CODE_01D8FF:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D8FF
LDA (!sprite_x_low_pointer)
; CODE_01D914:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D914
LDA (!sprite_x_low_pointer)
; CODE_01D92A:        F5 E4         SBC RAM_SpriteXLo,X       
org $01D92A
SBC (!sprite_x_low_pointer)
; CODE_01D943:        95 E4         STA RAM_SpriteXLo,X       
org $01D943
STA (!sprite_x_low_pointer)
; CODE_01D9D6:        B5 E4         LDA RAM_SpriteXLo,X       
org $01D9D6
LDA (!sprite_x_low_pointer)
; CODE_01D9EB:        F5 E4         SBC RAM_SpriteXLo,X       
org $01D9EB
SBC (!sprite_x_low_pointer)
; CODE_01DA70:        B5 E4         LDA RAM_SpriteXLo,X       
org $01DA70
LDA (!sprite_x_low_pointer)
; CODE_01DAAD:        B5 E4         LDA RAM_SpriteXLo,X       
org $01DAAD
LDA (!sprite_x_low_pointer)
; CODE_01DAB3:        95 E4         STA RAM_SpriteXLo,X       
org $01DAB3
STA (!sprite_x_low_pointer)
; CODE_01DADE:        95 E4         STA RAM_SpriteXLo,X       
org $01DADE
STA (!sprite_x_low_pointer)
; CODE_01DAE0:        B5 E4         LDA RAM_SpriteXLo,X       
org $01DAE0
LDA (!sprite_x_low_pointer)
; CODE_01DAE8:        F5 E4         SBC RAM_SpriteXLo,X       
org $01DAE8
SBC (!sprite_x_low_pointer)
; CODE_01DAFF:        B5 E4         LDA RAM_SpriteXLo,X       
org $01DAFF
LDA (!sprite_x_low_pointer)
; CODE_01DB05:        95 E4         STA RAM_SpriteXLo,X       
org $01DB05
STA (!sprite_x_low_pointer)
; CODE_01DB3D:        95 E4         STA RAM_SpriteXLo,X       
org $01DB3D
STA (!sprite_x_low_pointer)
; CODE_01DDC4:        95 E4         STA RAM_SpriteXLo,X       
org $01DDC4
STA (!sprite_x_low_pointer)
; CODE_01DE91:        B5 E4         LDA RAM_SpriteXLo,X       
org $01DE91
LDA (!sprite_x_low_pointer)
; CODE_01DEC2:        B9 E4 00      LDA.W RAM_SpriteXLo,Y     
org $01DEC2
LDA !sprite_x_low,y
; CODE_01DECA:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01DECA
STA !sprite_x_low,y
; CODE_01DF26:        B5 E4         LDA RAM_SpriteXLo,X       
org $01DF26
LDA (!sprite_x_low_pointer)
; CODE_01E001:        B9 E4 00      LDA.W RAM_SpriteXLo,Y     
org $01E001
LDA !sprite_x_low,y
; CODE_01E1BD:        95 E4         STA RAM_SpriteXLo,X       
org $01E1BD
STA (!sprite_x_low_pointer)
; CODE_01E225:        B5 E4         LDA RAM_SpriteXLo,X       
org $01E225
LDA (!sprite_x_low_pointer)
; CODE_01E329:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $01E329
LDA (!sprite_x_low_pointer)
; CODE_01E82B:        95 E4         STA RAM_SpriteXLo,X       
org $01E82B
STA (!sprite_x_low_pointer)
; CODE_01E868:        95 E4         STA RAM_SpriteXLo,X       
org $01E868
STA (!sprite_x_low_pointer)
; CODE_01E8AA:        B5 E4         LDA RAM_SpriteXLo,X       
org $01E8AA
LDA (!sprite_x_low_pointer)
; CODE_01E8AC:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01E8AC
STA !sprite_x_low,y
; CODE_01EA3A:        B5 E4         LDA RAM_SpriteXLo,X       
org $01EA3A
LDA (!sprite_x_low_pointer)
; CODE_01EA3C:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01EA3C
STA !sprite_x_low,y
; CODE_01EB57:        95 E4         STA RAM_SpriteXLo,X       
org $01EB57
STA (!sprite_x_low_pointer)
; CODE_01EC9C:        B5 E4         LDA RAM_SpriteXLo,X       
org $01EC9C
LDA (!sprite_x_low_pointer)
; CODE_01ECA3:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01ECA3
STA !sprite_x_low,y
; CODE_01ED0F:        75 E4         ADC RAM_SpriteXLo,X       
org $01ED0F
ADC (!sprite_x_low_pointer)
; CODE_01EF42:        B5 E4         LDA RAM_SpriteXLo,X       
org $01EF42
LDA (!sprite_x_low_pointer)
; CODE_01EF49:        95 E4         STA RAM_SpriteXLo,X       
org $01EF49
STA (!sprite_x_low_pointer)
; CODE_01EF8C:        95 E4         STA RAM_SpriteXLo,X       
org $01EF8C
STA (!sprite_x_low_pointer)
; CODE_01F065:        B5 E4         LDA RAM_SpriteXLo,X       
org $01F065
LDA (!sprite_x_low_pointer)
; CODE_01F1FC:        B5 E4         LDA RAM_SpriteXLo,X       
org $01F1FC
LDA (!sprite_x_low_pointer)
; CODE_01F203:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01F203
STA !sprite_x_low,y
; CODE_01F29D:        B5 E4         LDA RAM_SpriteXLo,X       
org $01F29D
LDA (!sprite_x_low_pointer)
; CODE_01F429:        B5 E4         LDA RAM_SpriteXLo,X       
org $01F429
LDA (!sprite_x_low_pointer)
; CODE_01F4D4:        75 E4         ADC RAM_SpriteXLo,X       
org $01F4D4
ADC (!sprite_x_low_pointer)
; CODE_01F4D9:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01F4D9
STA !sprite_x_low,y
; CODE_01F541:        75 E4         ADC RAM_SpriteXLo,X       
org $01F541
ADC (!sprite_x_low_pointer)
; CODE_01F5D3:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $01F5D3
STA !sprite_x_low,y
; CODE_01F7CD:        B5 E4         LDA RAM_SpriteXLo,X       
org $01F7CD
LDA (!sprite_x_low_pointer)
; CODE_01FB6E:        B5 E4         LDA RAM_SpriteXLo,X       
org $01FB6E
LDA (!sprite_x_low_pointer)
; CODE_01FBBB:        B5 E4         LDA RAM_SpriteXLo,X       
org $01FBBB
LDA (!sprite_x_low_pointer)
; CODE_01FBCB:        B5 E4         LDA RAM_SpriteXLo,X       
org $01FBCB
LDA (!sprite_x_low_pointer)
; CODE_01FC6D:        B5 E4         LDA RAM_SpriteXLo,X       
org $01FC6D
LDA (!sprite_x_low_pointer)
; CODE_01FC7A:        95 E4         STA RAM_SpriteXLo,X       
org $01FC7A
STA (!sprite_x_low_pointer)
; CODE_01FCD7:        B5 E4         LDA RAM_SpriteXLo,X       
org $01FCD7
LDA (!sprite_x_low_pointer)
; CODE_01FCE3:        95 E4         STA RAM_SpriteXLo,X       
org $01FCE3
STA (!sprite_x_low_pointer)
; CODE_01FCF8:        95 E4         STA RAM_SpriteXLo,X       
org $01FCF8
STA (!sprite_x_low_pointer)
; CODE_01FD50:        B5 E4         LDA RAM_SpriteXLo,X       
org $01FD50
LDA (!sprite_x_low_pointer)
; CODE_01FDD9:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $01FDD9
STA !sprite_x_low,y
; CODE_01FF98:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $14B4,$14B5 = Sprite X position + #$08 
org $01FF98
LDA (!sprite_x_low_pointer)
; CODE_028056:        95 E4         STA RAM_SpriteXLo,X       
org $028056
STA (!sprite_x_low_pointer)
; CODE_0280CD:        B5 E4         LDA RAM_SpriteXLo,X       
org $0280CD
LDA (!sprite_x_low_pointer)
; CODE_028492:        F5 E4         SBC RAM_SpriteXLo,X       
org $028492
SBC (!sprite_x_low_pointer)
; CODE_0284F5:        B5 E4         LDA RAM_SpriteXLo,X       
org $0284F5
LDA (!sprite_x_low_pointer)
; CODE_02854F:        B5 E4         LDA RAM_SpriteXLo,X       
org $02854F
LDA (!sprite_x_low_pointer)
; CODE_028606:        75 E4         ADC RAM_SpriteXLo,X       
org $028606
ADC (!sprite_x_low_pointer)
; CODE_028646:        95 E4         STA RAM_SpriteXLo,X       
org $028646
STA (!sprite_x_low_pointer)
; CODE_028974:        95 E4         STA RAM_SpriteXLo,X       
org $028974
STA (!sprite_x_low_pointer)
; ADDR_02898E:        95 E4         STA RAM_SpriteXLo,X       
org $02898E
STA (!sprite_x_low_pointer)
; CODE_0289AB:        B5 E4         LDA RAM_SpriteXLo,X       
org $0289AB
LDA (!sprite_x_low_pointer)
; CODE_028A2A:        B5 E4         LDA RAM_SpriteXLo,X       
org $028A2A
LDA (!sprite_x_low_pointer)
; CODE_028B4D:        95 E4         STA RAM_SpriteXLo,X       
org $028B4D
STA (!sprite_x_low_pointer)
; CODE_02A948:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $02A948
STA (!sprite_x_low_pointer)
; CODE_02A96A:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $02A96A
STA (!sprite_x_low_pointer)
; CODE_02AC26:        B5 E4         LDA RAM_SpriteXLo,X       
org $02AC26
LDA (!sprite_x_low_pointer)
; CODE_02AD22:        B5 E4         LDA RAM_SpriteXLo,X       ; \ 
org $02AD22
LDA (!sprite_x_low_pointer)
; CODE_02AF5B:        95 E4         STA RAM_SpriteXLo,X       
org $02AF5B
STA (!sprite_x_low_pointer)
; CODE_02AFCB:        95 E4         STA RAM_SpriteXLo,X       
org $02AFCB
STA (!sprite_x_low_pointer)
; CODE_02B06F:        95 E4         STA RAM_SpriteXLo,X       
org $02B06F
STA (!sprite_x_low_pointer)
; CODE_02B0BB:        95 E4         STA RAM_SpriteXLo,X       
org $02B0BB
STA (!sprite_x_low_pointer)
; CODE_02B132:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02B132
STA !sprite_x_low,y
; CODE_02B199:        95 E4         STA RAM_SpriteXLo,X       
org $02B199
STA (!sprite_x_low_pointer)
; CODE_02B1F8:        95 E4         STA RAM_SpriteXLo,X       
org $02B1F8
STA (!sprite_x_low_pointer)
; CODE_02B23F:        95 E4         STA RAM_SpriteXLo,X       
org $02B23F
STA (!sprite_x_low_pointer)
; CODE_02B2BD:        95 E4         STA RAM_SpriteXLo,X       
org $02B2BD
STA (!sprite_x_low_pointer)
; ADDR_02B30F:        95 E4         STA RAM_SpriteXLo,X       
org $02B30F
STA (!sprite_x_low_pointer)
; CODE_02B36A:        95 E4         STA RAM_SpriteXLo,X       
org $02B36A
STA (!sprite_x_low_pointer)
; CODE_02B3F8:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $02B3F8
STA !sprite_x_low,y
; CODE_02B4B9:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  |							 
org $02B4B9
STA !sprite_x_low,y
; CODE_02B83E:        B5 E4         LDA RAM_SpriteXLo,X       
org $02B83E
LDA (!sprite_x_low_pointer)
; CODE_02B840:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02B840
STA !sprite_x_low,y
; CODE_02B969:        B5 E4         LDA RAM_SpriteXLo,X       
org $02B969
LDA (!sprite_x_low_pointer)
; ADDR_02B9A6:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $02B9A6
LDA (!sprite_x_low_pointer)
; CODE_02BACC:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $02BACC
STA !sprite_x_low,y
; CODE_02BB2A:        B5 E4         LDA RAM_SpriteXLo,X       
org $02BB2A
LDA (!sprite_x_low_pointer)
; CODE_02C10B:        B5 E4         LDA RAM_SpriteXLo,X       
org $02C10B
LDA (!sprite_x_low_pointer)
; CODE_02C1AF:        B5 E4         LDA RAM_SpriteXLo,X       
org $02C1AF
LDA (!sprite_x_low_pointer)
; CODE_02C1C6:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02C1C6
STA !sprite_x_low,y
; CODE_02C288:        B5 E4         LDA RAM_SpriteXLo,X       
org $02C288
LDA (!sprite_x_low_pointer)
; CODE_02C3A1:        B5 E4         LDA RAM_SpriteXLo,X       
org $02C3A1
LDA (!sprite_x_low_pointer)
; CODE_02C47E:        B5 E4         LDA RAM_SpriteXLo,X       
org $02C47E
LDA (!sprite_x_low_pointer)
; CODE_02C5CC:        B5 E4         LDA RAM_SpriteXLo,X       
org $02C5CC
LDA (!sprite_x_low_pointer)
; CODE_02C5CE:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02C5CE
STA !sprite_x_low,y
; ADDR_02CC0E:        B5 E4         LDA RAM_SpriteXLo,X       
org $02CC0E
LDA (!sprite_x_low_pointer)
; ADDR_02CC14:        95 E4         STA RAM_SpriteXLo,X       
org $02CC14
STA (!sprite_x_low_pointer)
; ADDR_02CC41:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $00 = Sprite X position 
org $02CC41
LDA (!sprite_x_low_pointer)
; ADDR_02CCBD:        B5 E4         LDA RAM_SpriteXLo,X       
org $02CCBD
LDA (!sprite_x_low_pointer)
; CODE_02CD64:        B5 E4         LDA RAM_SpriteXLo,X       
org $02CD64
LDA (!sprite_x_low_pointer)
; CODE_02D05E:        D5 E4         CMP RAM_SpriteXLo,X       
org $02D05E
CMP (!sprite_x_low_pointer)
; ADDR_02D105:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D105
LDA (!sprite_x_low_pointer)
; CODE_02D166:        B5 E4         LDA RAM_SpriteXLo,X       ;  | 
org $02D166
LDA (!sprite_x_low_pointer)
; ADDR_02D2D5:        B9 E4 00      LDA.W RAM_SpriteXLo,Y     ; \ Mario's position = Sprite position 
org $02D2D5
LDA !sprite_x_low,y
; CODE_02D37E:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D37E
LDA (!sprite_x_low_pointer)
; CODE_02D390:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D390
LDA (!sprite_x_low_pointer)
; CODE_02D3D8:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D3D8
LDA (!sprite_x_low_pointer)
; CODE_02D3FE:        75 E4         ADC RAM_SpriteXLo,X       
org $02D3FE
ADC (!sprite_x_low_pointer)
; CODE_02D400:        95 E4         STA RAM_SpriteXLo,X       
org $02D400
STA (!sprite_x_low_pointer)
; CODE_02D436:        95 E4         STA RAM_SpriteXLo,X       
org $02D436
STA (!sprite_x_low_pointer)
; CODE_02D4AF:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D4AF
LDA (!sprite_x_low_pointer)
; CODE_02D4FF:        F5 E4         SBC RAM_SpriteXLo,X       
org $02D4FF
SBC (!sprite_x_low_pointer)
; CODE_02D631:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D631
LDA (!sprite_x_low_pointer)
; CODE_02D6CF:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D6CF
LDA (!sprite_x_low_pointer)
; CODE_02D6E9:        75 E4         ADC RAM_SpriteXLo,X       
org $02D6E9
ADC (!sprite_x_low_pointer)
; CODE_02D6EB:        95 E4         STA RAM_SpriteXLo,X       
org $02D6EB
STA (!sprite_x_low_pointer)
; CODE_02D763:        95 E4         STA RAM_SpriteXLo,X       
org $02D763
STA (!sprite_x_low_pointer)
; CODE_02D76B:        F5 E4         SBC RAM_SpriteXLo,X       
org $02D76B
SBC (!sprite_x_low_pointer)
; CODE_02D771:        75 E4         ADC RAM_SpriteXLo,X       
org $02D771
ADC (!sprite_x_low_pointer)
; CODE_02D798:        B5 E4         LDA RAM_SpriteXLo,X       
org $02D798
LDA (!sprite_x_low_pointer)
; CODE_02DAC8:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Hammer X pos = sprite X pos 
org $02DAC8
LDA (!sprite_x_low_pointer)
; CODE_02DB7D:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Hammer Bro X postion = Platform X position 
org $02DB7D
LDA (!sprite_x_low_pointer)
; CODE_02DB7F:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $02DB7F
STA !sprite_x_low,y
; CODE_02DD9F:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Lightning X position = Sprite X position + #$04 
org $02DD9F
LDA (!sprite_x_low_pointer)
; CODE_02DDA3:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  | 
org $02DDA3
STA !sprite_x_low,y
; CODE_02DEDE:        B5 E4         LDA RAM_SpriteXLo,X       
org $02DEDE
LDA (!sprite_x_low_pointer)
; CODE_02DF2C:        B5 E4         LDA RAM_SpriteXLo,X       
org $02DF2C
LDA (!sprite_x_low_pointer)
; CODE_02E095:        B5 E4         LDA RAM_SpriteXLo,X       
org $02E095
LDA (!sprite_x_low_pointer)
; CODE_02E1D2:        B5 E4         LDA RAM_SpriteXLo,X       
org $02E1D2
LDA (!sprite_x_low_pointer)
; CODE_02E2B6:        B5 E4         LDA RAM_SpriteXLo,X       
org $02E2B6
LDA (!sprite_x_low_pointer)
; CODE_02E2C3:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $02E2C3
LDA (!sprite_x_low_pointer)
; CODE_02E476:        B5 E4         LDA RAM_SpriteXLo,X       
org $02E476
LDA (!sprite_x_low_pointer)
; CODE_02E4AB:        B5 E4         LDA RAM_SpriteXLo,X       
org $02E4AB
LDA (!sprite_x_low_pointer)
; CODE_02E4C6:        95 E4         STA RAM_SpriteXLo,X       
org $02E4C6
STA (!sprite_x_low_pointer)
; CODE_02E4DF:        95 E4         STA RAM_SpriteXLo,X       
org $02E4DF
STA (!sprite_x_low_pointer)
; CODE_02E538:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $02E538
LDA (!sprite_x_low_pointer)
; CODE_02E8CB:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $02E8CB
LDA (!sprite_x_low_pointer)
; CODE_02E8E6:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position + #$10 
org $02E8E6
LDA (!sprite_x_low_pointer)
; CODE_02EABD:        B5 E4         LDA RAM_SpriteXLo,X       
org $02EABD
LDA (!sprite_x_low_pointer)
; CODE_02EABF:        D9 E4 00      CMP.W RAM_SpriteXLo,Y     
org $02EABF
CMP !sprite_x_low,y
; ADDR_02EAE2:        B5 E4         LDA RAM_SpriteXLo,X       
org $02EAE2
LDA (!sprite_x_low_pointer)
; CODE_02EB02:        B5 E4         LDA RAM_SpriteXLo,X       
org $02EB02
LDA (!sprite_x_low_pointer)
; CODE_02EB04:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02EB04
STA !sprite_x_low,y
; CODE_02EDB7:        75 E4         ADC RAM_SpriteXLo,X       
org $02EDB7
ADC (!sprite_x_low_pointer)
; CODE_02EDB9:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02EDB9
STA !sprite_x_low,y
; ADDR_02EF85:        B5 E4         LDA RAM_SpriteXLo,X       
org $02EF85
LDA (!sprite_x_low_pointer)
; ADDR_02EF87:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $02EF87
STA !sprite_x_low,y
; ADDR_02EFC1:        B5 E4         LDA RAM_SpriteXLo,X       
org $02EFC1
LDA (!sprite_x_low_pointer)
; CODE_02EFFA:        B5 E4         LDA RAM_SpriteXLo,X       
org $02EFFA
LDA (!sprite_x_low_pointer)
; CODE_02F0F9:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F0F9
LDA (!sprite_x_low_pointer)
; CODE_02F202:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F202
LDA (!sprite_x_low_pointer)
; CODE_02F2EC:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F2EC
LDA (!sprite_x_low_pointer)
; CODE_02F35F:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F35F
LDA (!sprite_x_low_pointer)
; CODE_02F401:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F401
LDA (!sprite_x_low_pointer)
; CODE_02F490:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F490
LDA (!sprite_x_low_pointer)
; CODE_02F4DA:        B5 E4         LDA RAM_SpriteXLo,X       
org $02F4DA
LDA (!sprite_x_low_pointer)
; CODE_02F565:        95 E4         STA RAM_SpriteXLo,X       
org $02F565
STA (!sprite_x_low_pointer)
; CODE_038214:        B5 E4         LDA RAM_SpriteXLo,X       
org $038214
LDA (!sprite_x_low_pointer)
; CODE_038A26:        B5 E4         LDA RAM_SpriteXLo,X       
org $038A26
LDA (!sprite_x_low_pointer)
; CODE_038AE9:        B5 E4         LDA RAM_SpriteXLo,X       
org $038AE9
LDA (!sprite_x_low_pointer)
; CODE_038AFD:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $038AFD
STA !sprite_x_low,y
; CODE_038C60:        B5 E4         LDA RAM_SpriteXLo,X       
org $038C60
LDA (!sprite_x_low_pointer)
; CODE_038D87:        B5 E4         LDA RAM_SpriteXLo,X       
org $038D87
LDA (!sprite_x_low_pointer)
; CODE_03903C:        B5 E4         LDA RAM_SpriteXLo,X       
org $03903C
LDA (!sprite_x_low_pointer)
; CODE_0390FB:        B5 E4         LDA RAM_SpriteXLo,X       
org $0390FB
LDA (!sprite_x_low_pointer)
; CODE_0392E6:        15 E4         ORA RAM_SpriteXLo,X       
org $0392E6
ORA (!sprite_x_low_pointer)
; CODE_039345:        B5 E4         LDA RAM_SpriteXLo,X       
org $039345
LDA (!sprite_x_low_pointer)
; CODE_03934B:        95 E4         STA RAM_SpriteXLo,X       
org $03934B
STA (!sprite_x_low_pointer)
; CODE_039377:        95 E4         STA RAM_SpriteXLo,X       
org $039377
STA (!sprite_x_low_pointer)
; CODE_03938D:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position 
org $03938D
LDA (!sprite_x_low_pointer)
; CODE_0399A7:        B5 E4         LDA RAM_SpriteXLo,X       
org $0399A7
LDA (!sprite_x_low_pointer)
; CODE_0399B9:        95 E4         STA RAM_SpriteXLo,X       
org $0399B9
STA (!sprite_x_low_pointer)
; CODE_0399C7:        F5 E4         SBC RAM_SpriteXLo,X       
org $0399C7
SBC (!sprite_x_low_pointer)
; CODE_039AD6:        B5 E4         LDA RAM_SpriteXLo,X       ; \ Transfer x position to dead Reznor							   
org $039AD6
LDA (!sprite_x_low_pointer)
; CODE_039AD8:        99 E4 00      STA.W RAM_SpriteXLo,Y     ;  |											   
org $039AD8
STA !sprite_x_low,y
; CODE_039B0D:        B5 E4         LDA RAM_SpriteXLo,X       
org $039B0D
LDA (!sprite_x_low_pointer)
; CODE_039B16:        95 E4         STA RAM_SpriteXLo,X       
org $039B16
STA (!sprite_x_low_pointer)
; CODE_039B44:        95 E4         STA RAM_SpriteXLo,X       
org $039B44
STA (!sprite_x_low_pointer)
; CODE_039C92:        B5 E4         LDA RAM_SpriteXLo,X       
org $039C92
LDA (!sprite_x_low_pointer)
; CODE_039C98:        95 E4         STA RAM_SpriteXLo,X       
org $039C98
STA (!sprite_x_low_pointer)
; CODE_039DC4:        B5 E4         LDA RAM_SpriteXLo,X       
org $039DC4
LDA (!sprite_x_low_pointer)
; CODE_039F75:        B5 E4         LDA RAM_SpriteXLo,X       
org $039F75
LDA (!sprite_x_low_pointer)
; CODE_03A026:        95 E4         STA RAM_SpriteXLo,X       
org $03A026
STA (!sprite_x_low_pointer)
; CODE_03A103:        95 E4         STA RAM_SpriteXLo,X       
org $03A103
STA (!sprite_x_low_pointer)
; CODE_03A626:        B5 E4         LDA RAM_SpriteXLo,X       
org $03A626
LDA (!sprite_x_low_pointer)
; CODE_03A7BA:        95 E4         STA RAM_SpriteXLo,X       
org $03A7BA
STA (!sprite_x_low_pointer)
; CODE_03A809:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $03A809
STA !sprite_x_low,y
; CODE_03A8F2:        B5 E4         LDA RAM_SpriteXLo,X       
org $03A8F2
LDA (!sprite_x_low_pointer)
; CODE_03A8F7:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $03A8F7
STA !sprite_x_low,y
; CODE_03A921:        B5 E4         LDA RAM_SpriteXLo,X       
org $03A921
LDA (!sprite_x_low_pointer)
; CODE_03AA6E:        B5 E4         LDA RAM_SpriteXLo,X       
org $03AA6E
LDA (!sprite_x_low_pointer)
; CODE_03AB32:        B5 E4         LDA RAM_SpriteXLo,X       
org $03AB32
LDA (!sprite_x_low_pointer)
; CODE_03AC6C:        B5 E4         LDA RAM_SpriteXLo,X       
org $03AC6C
LDA (!sprite_x_low_pointer)
; CODE_03AD89:        75 E4         ADC RAM_SpriteXLo,X       
org $03AD89
ADC (!sprite_x_low_pointer)
; CODE_03B045:        B5 E4         LDA RAM_SpriteXLo,X       
org $03B045
LDA (!sprite_x_low_pointer)
; CODE_03B057:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $03B057
STA !sprite_x_low,y
; CODE_03B6B3:        79 E4 00      ADC.W RAM_SpriteXLo,Y     ;  | 
org $03B6B3
ADC !sprite_x_low,y
; CODE_03B6F9:        79 E4 00      ADC.W RAM_SpriteXLo,Y     ;  | 
org $03B6F9
ADC !sprite_x_low,y
; CODE_03B766:        B5 E4         LDA RAM_SpriteXLo,X       ; \ 
org $03B766
LDA (!sprite_x_low_pointer)
; CODE_03B778:        B5 E4         LDA RAM_SpriteXLo,X       ;  | 
org $03B778
LDA (!sprite_x_low_pointer)
; CODE_03B7C0:        B5 E4         LDA RAM_SpriteXLo,X       ; \ 
org $03B7C0
LDA (!sprite_x_low_pointer)
; CODE_03B81C:        F5 E4         SBC RAM_SpriteXLo,X       
org $03B81C
SBC (!sprite_x_low_pointer)
; CODE_03B890:        D5 E4         CMP RAM_SpriteXLo,X       
org $03B890
CMP (!sprite_x_low_pointer)
; CODE_03C002:        B5 E4         LDA RAM_SpriteXLo,X       ; \ $9A = Sprite X position + #$08 
org $03C002
LDA (!sprite_x_low_pointer)
; CODE_03C1D5:        B5 E4         LDA RAM_SpriteXLo,X       
org $03C1D5
LDA (!sprite_x_low_pointer)
; CODE_03C1DB:        95 E4         STA RAM_SpriteXLo,X       
org $03C1DB
STA (!sprite_x_low_pointer)
; CODE_03C2F1:        95 E4         STA RAM_SpriteXLo,X       ;  | 
org $03C2F1
STA (!sprite_x_low_pointer)
; CODE_03C476:        B5 E4         LDA RAM_SpriteXLo,X       
org $03C476
LDA (!sprite_x_low_pointer)
; CODE_03C808:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $03C808
STA !sprite_x_low,y
; CODE_03C9F8:        B5 E4         LDA RAM_SpriteXLo,X       
org $03C9F8
LDA (!sprite_x_low_pointer)
; CODE_03CBD5:        B5 E4         LDA RAM_SpriteXLo,X       
org $03CBD5
LDA (!sprite_x_low_pointer)
; CODE_03CBEA:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $03CBEA
STA !sprite_x_low,y
; CODE_03CCAB:        95 E4         STA RAM_SpriteXLo,X       
org $03CCAB
STA (!sprite_x_low_pointer)
; CODE_03CD0A:        B5 E4         LDA RAM_SpriteXLo,X       
org $03CD0A
LDA (!sprite_x_low_pointer)
; CODE_03CD0C:        99 E4 00      STA.W RAM_SpriteXLo,Y     
org $03CD0C
STA !sprite_x_low,y
; CODE_03DEE6:        B5 E4         LDA RAM_SpriteXLo,X       
org $03DEE6
LDA (!sprite_x_low_pointer)
; CODE_07FC6B:        B5 E4         LDA RAM_SpriteXLo,X       
org $07FC6B
LDA (!sprite_x_low_pointer)

; Sprite Y low remapping

; CODE_00FA69:        99 D8 00      STA.W RAM_SpriteYLo,Y     ; /  
org $00FA69
STA !sprite_y_low,y
; CODE_00FB92:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     
org $00FB92
LDA !sprite_y_low,y
; ADDR_00FC5B:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $00FC5B
STA !sprite_y_low,y
; CODE_00FCB1:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $00FCB1
STA (!sprite_y_low_pointer)
; CODE_00FD00:        95 D8         STA RAM_SpriteYLo,X       
org $00FD00
STA (!sprite_y_low_pointer)
; ADDR_00FF4D:        B5 D8         LDA RAM_SpriteYLo,X       
org $00FF4D
LDA (!sprite_y_low_pointer)
; CODE_00FF7E:        B5 D8         LDA RAM_SpriteYLo,X       
org $00FF7E
LDA (!sprite_y_low_pointer)
; CODE_01807F:        B5 D8         LDA RAM_SpriteYLo,X       
org $01807F
LDA (!sprite_y_low_pointer)
; CODE_018360:        95 D8         STA RAM_SpriteYLo,X       
org $018360
STA (!sprite_y_low_pointer)
; CODE_018490:        B5 D8         LDA RAM_SpriteYLo,X       
org $018490
LDA (!sprite_y_low_pointer)
; CODE_0184B9:        B5 D8         LDA RAM_SpriteYLo,X       
org $0184B9
LDA (!sprite_y_low_pointer)
; CODE_0184BB:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $0184BB
STA !sprite_y_low,y
; CODE_0185A1:        B5 D8         LDA RAM_SpriteYLo,X       
org $0185A1
LDA (!sprite_y_low_pointer)
; CODE_0185A6:        95 D8         STA RAM_SpriteYLo,X       
org $0185A6
STA (!sprite_y_low_pointer)
; CODE_0188BF:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     
org $0188BF
LDA !sprite_y_low,y
; CODE_018BF0:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Y position -= #$0F (temporarily) 
org $018BF0
LDA (!sprite_y_low_pointer)
; CODE_018BF5:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $018BF5
STA (!sprite_y_low_pointer)
; CODE_018C08:        95 D8         STA RAM_SpriteYLo,X       ; / 
org $018C08
STA (!sprite_y_low_pointer)
; CODE_018F7C:        B5 D8         LDA RAM_SpriteYLo,X       
org $018F7C
LDA (!sprite_y_low_pointer)
; CODE_019017:        B5 D8         LDA RAM_SpriteYLo,X       
org $019017
LDA (!sprite_y_low_pointer)
; CODE_01916E:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Sprite's Y position += $28 
org $01916E
LDA (!sprite_y_low_pointer)
; CODE_019173:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $019173
STA (!sprite_y_low_pointer)
; CODE_01918F:        B5 D8         LDA RAM_SpriteYLo,X       ;  | 
org $01918F
LDA (!sprite_y_low_pointer)
; CODE_019194:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $019194
STA (!sprite_y_low_pointer)
; CODE_01939D:        B5 D8         LDA RAM_SpriteYLo,X       
org $01939D
LDA (!sprite_y_low_pointer)
; CODE_0193A2:        95 D8         STA RAM_SpriteYLo,X       
org $0193A2
STA (!sprite_y_low_pointer)
; CODE_01940A:        B5 D8         LDA RAM_SpriteYLo,X       
org $01940A
LDA (!sprite_y_low_pointer)
; CODE_019412:        95 D8         STA RAM_SpriteYLo,X       
org $019412
STA (!sprite_y_low_pointer)
; CODE_019455:        B5 D8         LDA RAM_SpriteYLo,X       
org $019455
LDA (!sprite_y_low_pointer)
; CODE_0194BF:        B5 D8         LDA RAM_SpriteYLo,X       
org $0194BF
LDA (!sprite_y_low_pointer)
; CODE_0195B4:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $9A = Sprite X position 
org $0195B4
LDA (!sprite_y_low_pointer)
; CODE_019708:        B5 D8         LDA RAM_SpriteYLo,X       ;  | 
org $019708
LDA (!sprite_y_low_pointer)
; CODE_01970A:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $01970A
STA !sprite_y_low,y
; CODE_01978B:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Copy Y position to coin 
org $01978B
LDA (!sprite_y_low_pointer)
; CODE_01978D:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $01978D
STA !sprite_y_low,y
; CODE_0199EF:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Store X position in $98-$99 
org $0199EF
LDA (!sprite_y_low_pointer)
; CODE_019E45:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $01 = Y position low 
org $019E45
LDA (!sprite_y_low_pointer)
; CODE_019E95:        B5 D8         LDA RAM_SpriteYLo,X       
org $019E95
LDA (!sprite_y_low_pointer)
; CODE_019E9B:        95 D8         STA RAM_SpriteYLo,X       
org $019E9B
STA (!sprite_y_low_pointer)
; CODE_019F06:        95 D8         STA RAM_SpriteYLo,X       
org $019F06
STA (!sprite_y_low_pointer)
; CODE_01A11D:        95 D8         STA RAM_SpriteYLo,X       
org $01A11D
STA (!sprite_y_low_pointer)
; CODE_01A23E:        B5 D8         LDA RAM_SpriteYLo,X       
org $01A23E
LDA (!sprite_y_low_pointer)
; CODE_01A2CA:        B5 D8         LDA RAM_SpriteYLo,X       
org $01A2CA
LDA (!sprite_y_low_pointer)
; CODE_01A2CE:        95 D8         STA RAM_SpriteYLo,X       
org $01A2CE
STA (!sprite_y_low_pointer)
; CODE_01A33F:        B5 D8         LDA RAM_SpriteYLo,X       
org $01A33F
LDA (!sprite_y_low_pointer)
; CODE_01A344:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01A344
STA !sprite_y_low,y
; CODE_01A3A6:        B5 D8         LDA RAM_SpriteYLo,X       
org $01A3A6
LDA (!sprite_y_low_pointer)
; CODE_01A3D7:        B5 D8         LDA RAM_SpriteYLo,X       
org $01A3D7
LDA (!sprite_y_low_pointer)
; CODE_01A46C:        B5 D8         LDA RAM_SpriteYLo,X       
org $01A46C
LDA (!sprite_y_low_pointer)
; CODE_01A488:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     
org $01A488
LDA !sprite_y_low,y
; CODE_01AABA:        B5 D8         LDA RAM_SpriteYLo,X       
org $01AABA
LDA (!sprite_y_low_pointer)
; CODE_01AAE3:        B5 D8         LDA RAM_SpriteYLo,X       
org $01AAE3
LDA (!sprite_y_low_pointer)
; CODE_01AB8D:        B5 D8         LDA RAM_SpriteYLo,X       
org $01AB8D
LDA (!sprite_y_low_pointer)
; CODE_01ABFA:        75 D8         ADC RAM_SpriteYLo,X       ; \ Add value to current sprite's Y position 
org $01ABFA
ADC (!sprite_y_low_pointer)
; CODE_01ABFC:        95 D8         STA RAM_SpriteYLo,X       ; /  
org $01ABFC
STA (!sprite_y_low_pointer)
; CODE_01AC3E:        B5 D8         LDA RAM_SpriteYLo,X       ; \                                                                           
org $01AC3E
LDA (!sprite_y_low_pointer)
; CODE_01ACDA:        D5 D8         CMP RAM_SpriteYLo,X       
org $01ACDA
CMP (!sprite_y_low_pointer)
; CODE_01AD47:        F5 D8         SBC RAM_SpriteYLo,X       
org $01AD47
SBC (!sprite_y_low_pointer)
; CODE_01AE1F:        B5 D8         LDA RAM_SpriteYLo,X       
org $01AE1F
LDA (!sprite_y_low_pointer)
; CODE_01AF2C:        B5 D8         LDA RAM_SpriteYLo,X       
org $01AF2C
LDA (!sprite_y_low_pointer)
; CODE_01B182:        75 D8         ADC RAM_SpriteYLo,X       
org $01B182
ADC (!sprite_y_low_pointer)
; CODE_01B248:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B248
LDA (!sprite_y_low_pointer)
; CODE_01B24D:        95 D8         STA RAM_SpriteYLo,X       
org $01B24D
STA (!sprite_y_low_pointer)
; CODE_01B2E7:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B2E7
LDA (!sprite_y_low_pointer)
; CODE_01B3A5:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B3A5
LDA (!sprite_y_low_pointer)
; CODE_01B45C:        B5 D8         LDA RAM_SpriteYLo,X       ; \  Store Y position relative to screen boundary in $00
org $01B45C
LDA (!sprite_y_low_pointer)
; CODE_01B48A:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B48A
LDA (!sprite_y_low_pointer)
; CODE_01B633:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B633
LDA (!sprite_y_low_pointer)
; CODE_01B639:        95 D8         STA RAM_SpriteYLo,X       
org $01B639
STA (!sprite_y_low_pointer)
; CODE_01B64C:        95 D8         STA RAM_SpriteYLo,X       
org $01B64C
STA (!sprite_y_low_pointer)
; CODE_01B72D:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B72D
LDA (!sprite_y_low_pointer)
; CODE_01B7C2:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B7C2
LDA (!sprite_y_low_pointer)
; CODE_01B862:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B862
LDA (!sprite_y_low_pointer)
; CODE_01B891:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B891
LDA (!sprite_y_low_pointer)
; CODE_01B91D:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B91D
LDA (!sprite_y_low_pointer)
; CODE_01B9B7:        B5 D8         LDA RAM_SpriteYLo,X       
org $01B9B7
LDA (!sprite_y_low_pointer)
; CODE_01B9BC:        95 D8         STA RAM_SpriteYLo,X       
org $01B9BC
STA (!sprite_y_low_pointer)
; CODE_01B9F8:        95 D8         STA RAM_SpriteYLo,X       
org $01B9F8
STA (!sprite_y_low_pointer)
; CODE_01BA8E:        B5 D8         LDA RAM_SpriteYLo,X       
org $01BA8E
LDA (!sprite_y_low_pointer)
; CODE_01BA92:        95 D8         STA RAM_SpriteYLo,X       
org $01BA92
STA (!sprite_y_low_pointer)
; CODE_01BB42:        B5 D8         LDA RAM_SpriteYLo,X       
org $01BB42
LDA (!sprite_y_low_pointer)
; CODE_01BCAF:        95 D8         STA RAM_SpriteYLo,X       ; / 
org $01BCAF
STA (!sprite_y_low_pointer)
; CODE_01BCD3:        B5 D8         LDA RAM_SpriteYLo,X       
org $01BCD3
LDA (!sprite_y_low_pointer)
; CODE_01BDAD:        B5 D8         LDA RAM_SpriteYLo,X       
org $01BDAD
LDA (!sprite_y_low_pointer)
; CODE_01BE15:        95 D8         STA RAM_SpriteYLo,X       
org $01BE15
STA (!sprite_y_low_pointer)
; CODE_01BEE7:        B5 D8         LDA RAM_SpriteYLo,X       
org $01BEE7
LDA (!sprite_y_low_pointer)
; CODE_01BF42:        B5 D8         LDA RAM_SpriteYLo,X       
org $01BF42
LDA (!sprite_y_low_pointer)
; CODE_01BF47:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01BF47
STA !sprite_y_low,y
; ADDR_01C065:        B5 D8         LDA RAM_SpriteYLo,X       ;  | Call Goal Tape INIT, then 
org $01C065
LDA (!sprite_y_low_pointer)
; ADDR_01C06A:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $01C06A
STA (!sprite_y_low_pointer)
; CODE_01C084:        B5 D8         LDA RAM_SpriteYLo,X       
org $01C084
LDA (!sprite_y_low_pointer)
; CODE_01C115:        F5 D8         SBC RAM_SpriteYLo,X       
org $01C115
SBC (!sprite_y_low_pointer)
; CODE_01C1CB:        B5 D8         LDA RAM_SpriteYLo,X       
org $01C1CB
LDA (!sprite_y_low_pointer)
; CODE_01C1DC:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $01C1DC
LDA (!sprite_y_low_pointer)
; ADDR_01C409:        B5 D8         LDA RAM_SpriteYLo,X       
org $01C409
LDA (!sprite_y_low_pointer)
; ADDR_01C411:        95 D8         STA RAM_SpriteYLo,X       
org $01C411
STA (!sprite_y_low_pointer)
; CODE_01C505:        B5 D8         LDA RAM_SpriteYLo,X       
org $01C505
LDA (!sprite_y_low_pointer)
; CODE_01C763:        B5 D8         LDA RAM_SpriteYLo,X       
org $01C763
LDA (!sprite_y_low_pointer)
; CODE_01C768:        95 D8         STA RAM_SpriteYLo,X       
org $01C768
STA (!sprite_y_low_pointer)
; CODE_01CAF7:        B5 D8         LDA RAM_SpriteYLo,X       
org $01CAF7
LDA (!sprite_y_low_pointer)
; CODE_01CD41:        95 D8         STA RAM_SpriteYLo,X       
org $01CD41
STA (!sprite_y_low_pointer)
; CODE_01CFE5:        B5 D8         LDA RAM_SpriteYLo,X       
org $01CFE5
LDA (!sprite_y_low_pointer)
; CODE_01CFEA:        95 D8         STA RAM_SpriteYLo,X       
org $01CFEA
STA (!sprite_y_low_pointer)
; CODE_01D026:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D026
LDA (!sprite_y_low_pointer)
; CODE_01D034:        95 D8         STA RAM_SpriteYLo,X       
org $01D034
STA (!sprite_y_low_pointer)
; CODE_01D07C:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D07C
LDA (!sprite_y_low_pointer)
; CODE_01D081:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01D081
STA !sprite_y_low,y
; CODE_01D0CD:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D0CD
LDA (!sprite_y_low_pointer)
; CODE_01D0D7:        95 D8         STA RAM_SpriteYLo,X       
org $01D0D7
STA (!sprite_y_low_pointer)
; CODE_01D1C6:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D1C6
LDA (!sprite_y_low_pointer)
; CODE_01D2E8:        D5 D8         CMP RAM_SpriteYLo,X       
org $01D2E8
CMP (!sprite_y_low_pointer)
; CODE_01D362:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D362
LDA (!sprite_y_low_pointer)
; CODE_01D368:        95 D8         STA RAM_SpriteYLo,X       
org $01D368
STA (!sprite_y_low_pointer)
; CODE_01D36F:        95 D8         STA RAM_SpriteYLo,X       
org $01D36F
STA (!sprite_y_low_pointer)
; CODE_01D391:        75 D8         ADC RAM_SpriteYLo,X       
org $01D391
ADC (!sprite_y_low_pointer)
; CODE_01D393:        95 D8         STA RAM_SpriteYLo,X       
org $01D393
STA (!sprite_y_low_pointer)
; CODE_01D42D:        75 D8         ADC RAM_SpriteYLo,X       
org $01D42D
ADC (!sprite_y_low_pointer)
; CODE_01D5C9:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D5C9
LDA (!sprite_y_low_pointer)
; CODE_01D5CF:        95 D8         STA RAM_SpriteYLo,X       
org $01D5CF
STA (!sprite_y_low_pointer)
; CODE_01D628:        75 D8         ADC RAM_SpriteYLo,X       
org $01D628
ADC (!sprite_y_low_pointer)
; CODE_01D62A:        95 D8         STA RAM_SpriteYLo,X       
org $01D62A
STA (!sprite_y_low_pointer)
; CODE_01D66A:        95 D8         STA RAM_SpriteYLo,X       
org $01D66A
STA (!sprite_y_low_pointer)
; CODE_01D6C1:        95 D8         STA RAM_SpriteYLo,X       
org $01D6C1
STA (!sprite_y_low_pointer)
; CODE_01D7CE:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D7CE
LDA (!sprite_y_low_pointer)
; CODE_01D7D5:        95 D8         STA RAM_SpriteYLo,X       
org $01D7D5
STA (!sprite_y_low_pointer)
; CODE_01D809:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D809
LDA (!sprite_y_low_pointer)
; CODE_01D824:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D824
LDA (!sprite_y_low_pointer)
; CODE_01D8A4:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D8A4
LDA (!sprite_y_low_pointer)
; CODE_01D8B8:        95 D8         STA RAM_SpriteYLo,X       
org $01D8B8
STA (!sprite_y_low_pointer)
; CODE_01D8F5:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D8F5
LDA (!sprite_y_low_pointer)
; CODE_01D910:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D910
LDA (!sprite_y_low_pointer)
; CODE_01D91E:        F5 D8         SBC RAM_SpriteYLo,X       
org $01D91E
SBC (!sprite_y_low_pointer)
; CODE_01D93A:        95 D8         STA RAM_SpriteYLo,X       
org $01D93A
STA (!sprite_y_low_pointer)
; CODE_01D9D9:        B5 D8         LDA RAM_SpriteYLo,X       
org $01D9D9
LDA (!sprite_y_low_pointer)
; CODE_01D9E1:        F5 D8         SBC RAM_SpriteYLo,X       
org $01D9E1
SBC (!sprite_y_low_pointer)
; CODE_01DA51:        B5 D8         LDA RAM_SpriteYLo,X       
org $01DA51
LDA (!sprite_y_low_pointer)
; CODE_01DABE:        B5 D8         LDA RAM_SpriteYLo,X       
org $01DABE
LDA (!sprite_y_low_pointer)
; CODE_01DAC4:        95 D8         STA RAM_SpriteYLo,X       
org $01DAC4
STA (!sprite_y_low_pointer)
; CODE_01DAD7:        95 D8         STA RAM_SpriteYLo,X       
org $01DAD7
STA (!sprite_y_low_pointer)
; CODE_01DB10:        B5 D8         LDA RAM_SpriteYLo,X       
org $01DB10
LDA (!sprite_y_low_pointer)
; CODE_01DB16:        95 D8         STA RAM_SpriteYLo,X       
org $01DB16
STA (!sprite_y_low_pointer)
; CODE_01DB36:        95 D8         STA RAM_SpriteYLo,X       
org $01DB36
STA (!sprite_y_low_pointer)
; CODE_01DDCE:        95 D8         STA RAM_SpriteYLo,X       
org $01DDCE
STA (!sprite_y_low_pointer)
; CODE_01DE6A:        75 D8         ADC RAM_SpriteYLo,X       
org $01DE6A
ADC (!sprite_y_low_pointer)
; CODE_01DE98:        B5 D8         LDA RAM_SpriteYLo,X       
org $01DE98
LDA (!sprite_y_low_pointer)
; CODE_01DEB7:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     
org $01DEB7
LDA !sprite_y_low,y
; CODE_01DEBF:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01DEBF
STA !sprite_y_low,y
; CODE_01DF4F:        B5 D8         LDA RAM_SpriteYLo,X       
org $01DF4F
LDA (!sprite_y_low_pointer)
; CODE_01DFFA:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     
org $01DFFA
LDA !sprite_y_low,y
; CODE_01E05B:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E05B
LDA (!sprite_y_low_pointer)
; CODE_01E060:        95 D8         STA RAM_SpriteYLo,X       
org $01E060
STA (!sprite_y_low_pointer)
; CODE_01E0E2:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E0E2
LDA (!sprite_y_low_pointer)
; CODE_01E164:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E164
LDA (!sprite_y_low_pointer)
; CODE_01E230:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E230
LDA (!sprite_y_low_pointer)
; CODE_01E332:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $01E332
LDA (!sprite_y_low_pointer)
; CODE_01E5CE:        D5 D8         CMP RAM_SpriteYLo,X       
org $01E5CE
CMP (!sprite_y_low_pointer)
; CODE_01E66C:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E66C
LDA (!sprite_y_low_pointer)
; CODE_01E6B8:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E6B8
LDA (!sprite_y_low_pointer)
; CODE_01E820:        95 D8         STA RAM_SpriteYLo,X       
org $01E820
STA (!sprite_y_low_pointer)
; CODE_01E875:        95 D8         STA RAM_SpriteYLo,X       
org $01E875
STA (!sprite_y_low_pointer)
; CODE_01E8B5:        B5 D8         LDA RAM_SpriteYLo,X       
org $01E8B5
LDA (!sprite_y_low_pointer)
; CODE_01E8BA:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01E8BA
STA !sprite_y_low,y
; CODE_01EA45:        B5 D8         LDA RAM_SpriteYLo,X       
org $01EA45
LDA (!sprite_y_low_pointer)
; CODE_01EA47:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01EA47
STA !sprite_y_low,y
; CODE_01EB69:        95 D8         STA RAM_SpriteYLo,X       
org $01EB69
STA (!sprite_y_low_pointer)
; CODE_01ECB3:        B5 D8         LDA RAM_SpriteYLo,X       
org $01ECB3
LDA (!sprite_y_low_pointer)
; CODE_01ECB8:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01ECB8
STA !sprite_y_low,y
; CODE_01ED1D:        75 D8         ADC RAM_SpriteYLo,X       
org $01ED1D
ADC (!sprite_y_low_pointer)
; CODE_01EDCE:        B5 D8         LDA RAM_SpriteYLo,X       
org $01EDCE
LDA (!sprite_y_low_pointer)
; CODE_01EF26:        B5 D8         LDA RAM_SpriteYLo,X       
org $01EF26
LDA (!sprite_y_low_pointer)
; CODE_01EF2D:        95 D8         STA RAM_SpriteYLo,X       
org $01EF2D
STA (!sprite_y_low_pointer)
; CODE_01EF97:        B5 D8         LDA RAM_SpriteYLo,X       
org $01EF97
LDA (!sprite_y_low_pointer)
; CODE_01EF9C:        95 D8         STA RAM_SpriteYLo,X       
org $01EF9C
STA (!sprite_y_low_pointer)
; CODE_01EFAB:        95 D8         STA RAM_SpriteYLo,X       
org $01EFAB
STA (!sprite_y_low_pointer)
; CODE_01F06C:        B5 D8         LDA RAM_SpriteYLo,X       
org $01F06C
LDA (!sprite_y_low_pointer)
; CODE_01F213:        B5 D8         LDA RAM_SpriteYLo,X       
org $01F213
LDA (!sprite_y_low_pointer)
; CODE_01F215:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01F215
STA !sprite_y_low,y
; CODE_01F2A8:        B5 D8         LDA RAM_SpriteYLo,X       
org $01F2A8
LDA (!sprite_y_low_pointer)
; CODE_01F413:        75 D8         ADC RAM_SpriteYLo,X       
org $01F413
ADC (!sprite_y_low_pointer)
; CODE_01F50A:        75 D8         ADC RAM_SpriteYLo,X       
org $01F50A
ADC (!sprite_y_low_pointer)
; CODE_01F50C:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01F50C
STA !sprite_y_low,y
; CODE_01F553:        75 D8         ADC RAM_SpriteYLo,X       
org $01F553
ADC (!sprite_y_low_pointer)
; CODE_01F5B4:        F9 D8 00      SBC.W RAM_SpriteYLo,Y     
org $01F5B4
SBC !sprite_y_low,y
; CODE_01F5DD:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $01F5DD
STA !sprite_y_low,y
; CODE_01F6AD:        F9 D8 00      SBC.W RAM_SpriteYLo,Y     
org $01F6AD
SBC !sprite_y_low,y
; CODE_01F7D1:        B5 D8         LDA RAM_SpriteYLo,X       
org $01F7D1
LDA (!sprite_y_low_pointer)
; CODE_01FAA6:        B5 D8         LDA RAM_SpriteYLo,X       
org $01FAA6
LDA (!sprite_y_low_pointer)
; CODE_01FB56:        B5 D8         LDA RAM_SpriteYLo,X       
org $01FB56
LDA (!sprite_y_low_pointer)
; CODE_01FB73:        B5 D8         LDA RAM_SpriteYLo,X       
org $01FB73
LDA (!sprite_y_low_pointer)
; CODE_01FC7F:        95 D8         STA RAM_SpriteYLo,X       
org $01FC7F
STA (!sprite_y_low_pointer)
; CODE_01FCDA:        B5 D8         LDA RAM_SpriteYLo,X       
org $01FCDA
LDA (!sprite_y_low_pointer)
; CODE_01FCEB:        95 D8         STA RAM_SpriteYLo,X       
org $01FCEB
STA (!sprite_y_low_pointer)
; CODE_01FCF5:        95 D8         STA RAM_SpriteYLo,X       
org $01FCF5
STA (!sprite_y_low_pointer)
; CODE_01FD60:        B5 D8         LDA RAM_SpriteYLo,X       
org $01FD60
LDA (!sprite_y_low_pointer)
; CODE_01FDE7:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $01FDE7
STA !sprite_y_low,y
; CODE_01FFA8:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $14B6,$14B7 = Sprite Y position + #$0F 
org $01FFA8
LDA (!sprite_y_low_pointer)
; CODE_028064:        95 D8         STA RAM_SpriteYLo,X       ;  |
org $028064
STA (!sprite_y_low_pointer)
; CODE_0280D7:        B5 D8         LDA RAM_SpriteYLo,X       
org $0280D7
LDA (!sprite_y_low_pointer)
; CODE_0284E8:        B5 D8         LDA RAM_SpriteYLo,X       
org $0284E8
LDA (!sprite_y_low_pointer)
; CODE_028544:        B5 D8         LDA RAM_SpriteYLo,X       
org $028544
LDA (!sprite_y_low_pointer)
; CODE_02861C:        75 D8         ADC RAM_SpriteYLo,X       
org $02861C
ADC (!sprite_y_low_pointer)
; CODE_02863D:        95 D8         STA RAM_SpriteYLo,X       
org $02863D
STA (!sprite_y_low_pointer)
; CODE_02897D:        95 D8         STA RAM_SpriteYLo,X       ;  |
org $02897D
STA (!sprite_y_low_pointer)
; ADDR_02899C:        95 D8         STA RAM_SpriteYLo,X       ;  |
org $02899C
STA (!sprite_y_low_pointer)
; CODE_028B59:        95 D8         STA RAM_SpriteYLo,X       
org $028B59
STA (!sprite_y_low_pointer)
; ADDR_028BD5:        B5 D8         LDA RAM_SpriteYLo,X       
org $028BD5
LDA (!sprite_y_low_pointer)
; CODE_02A952:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $02A952
STA (!sprite_y_low_pointer)
; CODE_02A960:        95 D8         STA RAM_SpriteYLo,X       ; / 
org $02A960
STA (!sprite_y_low_pointer)
; CODE_02ACF9:        B5 D8         LDA RAM_SpriteYLo,X       ; Load y position of sprite jumped on 
org $02ACF9
LDA (!sprite_y_low_pointer)
; CODE_02AF64:        95 D8         STA RAM_SpriteYLo,X       
org $02AF64
STA (!sprite_y_low_pointer)
; CODE_02AFD7:        95 D8         STA RAM_SpriteYLo,X       
org $02AFD7
STA (!sprite_y_low_pointer)
; CODE_02B061:        95 D8         STA RAM_SpriteYLo,X       
org $02B061
STA (!sprite_y_low_pointer)
; CODE_02B0A8:        95 D8         STA RAM_SpriteYLo,X       
org $02B0A8
STA (!sprite_y_low_pointer)
; CODE_02B142:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02B142
STA !sprite_y_low,y
; CODE_02B17A:        95 D8         STA RAM_SpriteYLo,X       
org $02B17A
STA (!sprite_y_low_pointer)
; CODE_02B1E1:        95 D8         STA RAM_SpriteYLo,X       
org $02B1E1
STA (!sprite_y_low_pointer)
; CODE_02B22C:        95 D8         STA RAM_SpriteYLo,X       
org $02B22C
STA (!sprite_y_low_pointer)
; CODE_02B29F:        95 D8         STA RAM_SpriteYLo,X       
org $02B29F
STA (!sprite_y_low_pointer)
; ADDR_02B2FA:        95 D8         STA RAM_SpriteYLo,X       
org $02B2FA
STA (!sprite_y_low_pointer)
; CODE_02B356:        95 D8         STA RAM_SpriteYLo,X       
org $02B356
STA (!sprite_y_low_pointer)
; CODE_02B404:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $02B404
STA !sprite_y_low,y
; CODE_02B4C8:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  |							 
org $02B4C8
STA !sprite_y_low,y
; CODE_02B7DB:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     
org $02B7DB
LDA !sprite_y_low,y
; CODE_02B7DF:        F5 D8         SBC RAM_SpriteYLo,X       
org $02B7DF
SBC (!sprite_y_low_pointer)
; CODE_02B852:        B5 D8         LDA RAM_SpriteYLo,X       
org $02B852
LDA (!sprite_y_low_pointer)
; CODE_02B854:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02B854
STA !sprite_y_low,y
; CODE_02B999:        B5 D8         LDA RAM_SpriteYLo,X       
org $02B999
LDA (!sprite_y_low_pointer)
; ADDR_02B9AF:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $02B9AF
LDA (!sprite_y_low_pointer)
; CODE_02BADA:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $02BADA
STA !sprite_y_low,y
; CODE_02BB33:        B5 D8         LDA RAM_SpriteYLo,X       
org $02BB33
LDA (!sprite_y_low_pointer)
; CODE_02BDA7:        B5 D8         LDA RAM_SpriteYLo,X       
org $02BDA7
LDA (!sprite_y_low_pointer)
; CODE_02C04D:        B5 D8         LDA RAM_SpriteYLo,X       
org $02C04D
LDA (!sprite_y_low_pointer)
; CODE_02C051:        95 D8         STA RAM_SpriteYLo,X       
org $02C051
STA (!sprite_y_low_pointer)
; CODE_02C113:        B5 D8         LDA RAM_SpriteYLo,X       
org $02C113
LDA (!sprite_y_low_pointer)
; CODE_02C1D8:        B5 D8         LDA RAM_SpriteYLo,X       
org $02C1D8
LDA (!sprite_y_low_pointer)
; CODE_02C1DD:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02C1DD
STA !sprite_y_low,y
; CODE_02C487:        B5 D8         LDA RAM_SpriteYLo,X       
org $02C487
LDA (!sprite_y_low_pointer)
; CODE_02C5D7:        B5 D8         LDA RAM_SpriteYLo,X       
org $02C5D7
LDA (!sprite_y_low_pointer)
; CODE_02C5D9:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02C5D9
STA !sprite_y_low,y
; ADDR_02CC36:        75 D8         ADC RAM_SpriteYLo,X       
org $02CC36
ADC (!sprite_y_low_pointer)
; ADDR_02CC38:        95 D8         STA RAM_SpriteYLo,X       
org $02CC38
STA (!sprite_y_low_pointer)
; ADDR_02CC4A:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $02 = Sprite Y position 
org $02CC4A
LDA (!sprite_y_low_pointer)
; ADDR_02CCC4:        B5 D8         LDA RAM_SpriteYLo,X       
org $02CCC4
LDA (!sprite_y_low_pointer)
; CODE_02CD6D:        B5 D8         LDA RAM_SpriteYLo,X       
org $02CD6D
LDA (!sprite_y_low_pointer)
; CODE_02D038:        B5 D8         LDA RAM_SpriteYLo,X       ; \ 
org $02D038
LDA (!sprite_y_low_pointer)
; CODE_02D0AA:        D5 D8         CMP RAM_SpriteYLo,X       
org $02D0AA
CMP (!sprite_y_low_pointer)
; ADDR_02D0EA:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Unreachable 
org $02D0EA
LDA (!sprite_y_low_pointer)
; CODE_02D149:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $18B2 = Sprite Y position + #$08 
org $02D149
LDA (!sprite_y_low_pointer)
; CODE_02D2B4:        75 D8         ADC RAM_SpriteYLo,X       ;  | 
org $02D2B4
ADC (!sprite_y_low_pointer)
; CODE_02D2B6:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $02D2B6
STA (!sprite_y_low_pointer)
; ADDR_02D2DF:        B9 D8 00      LDA.W RAM_SpriteYLo,Y     ;  | 
org $02D2DF
LDA !sprite_y_low,y
; CODE_02D3B2:        B5 D8         LDA RAM_SpriteYLo,X       
org $02D3B2
LDA (!sprite_y_low_pointer)
; CODE_02D3DF:        B5 D8         LDA RAM_SpriteYLo,X       
org $02D3DF
LDA (!sprite_y_low_pointer)
; CODE_02D465:        B5 D8         LDA RAM_SpriteYLo,X       
org $02D465
LDA (!sprite_y_low_pointer)
; CODE_02D46D:        95 D8         STA RAM_SpriteYLo,X       
org $02D46D
STA (!sprite_y_low_pointer)
; CODE_02D490:        B5 D8         LDA RAM_SpriteYLo,X       
org $02D490
LDA (!sprite_y_low_pointer)
; CODE_02D4A9:        75 D8         ADC RAM_SpriteYLo,X       
org $02D4A9
ADC (!sprite_y_low_pointer)
; CODE_02D511:        F5 D8         SBC RAM_SpriteYLo,X       
org $02D511
SBC (!sprite_y_low_pointer)
; CODE_02D6D6:        B5 D8         LDA RAM_SpriteYLo,X       ;  |
org $02D6D6
LDA (!sprite_y_low_pointer)
; CODE_02D70C:        75 D8         ADC RAM_SpriteYLo,X       ;  |
org $02D70C
ADC (!sprite_y_low_pointer)
; CODE_02D70E:        95 D8         STA RAM_SpriteYLo,X       ;  |
org $02D70E
STA (!sprite_y_low_pointer)
; CODE_02D75C:        95 D8         STA RAM_SpriteYLo,X       
org $02D75C
STA (!sprite_y_low_pointer)
; CODE_02D77E:        F5 D8         SBC RAM_SpriteYLo,X       
org $02D77E
SBC (!sprite_y_low_pointer)
; CODE_02D784:        75 D8         ADC RAM_SpriteYLo,X       
org $02D784
ADC (!sprite_y_low_pointer)
; CODE_02D79C:        B5 D8         LDA RAM_SpriteYLo,X       
org $02D79C
LDA (!sprite_y_low_pointer)
; CODE_02DAD3:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Hammer Y pos = sprite Y pos 
org $02DAD3
LDA (!sprite_y_low_pointer)
; CODE_02DB88:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Hammer Bro Y position = Platform Y position - #$10 
org $02DB88
LDA (!sprite_y_low_pointer)
; CODE_02DB8D:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $02DB8D
STA !sprite_y_low,y
; CODE_02DDAE:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Lightning Y position = Sprite Y position 
org $02DDAE
LDA (!sprite_y_low_pointer)
; CODE_02DDB0:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  | 
org $02DDB0
STA !sprite_y_low,y
; CODE_02DEE2:        B5 D8         LDA RAM_SpriteYLo,X       
org $02DEE2
LDA (!sprite_y_low_pointer)
; CODE_02DF63:        B5 D8         LDA RAM_SpriteYLo,X       
org $02DF63
LDA (!sprite_y_low_pointer)
; CODE_02E0A5:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E0A5
LDA (!sprite_y_low_pointer)
; CODE_02E0FC:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E0FC
LDA (!sprite_y_low_pointer)
; CODE_02E102:        95 D8         STA RAM_SpriteYLo,X       
org $02E102
STA (!sprite_y_low_pointer)
; CODE_02E11D:        95 D8         STA RAM_SpriteYLo,X       
org $02E11D
STA (!sprite_y_low_pointer)
; CODE_02E1E2:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E1E2
LDA (!sprite_y_low_pointer)
; CODE_02E2B0:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E2B0
LDA (!sprite_y_low_pointer)
; CODE_02E2CC:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $02E2CC
LDA (!sprite_y_low_pointer)
; CODE_02E47F:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E47F
LDA (!sprite_y_low_pointer)
; CODE_02E4B2:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E4B2
LDA (!sprite_y_low_pointer)
; CODE_02E4C2:        95 D8         STA RAM_SpriteYLo,X       
org $02E4C2
STA (!sprite_y_low_pointer)
; CODE_02E4D8:        95 D8         STA RAM_SpriteYLo,X       
org $02E4D8
STA (!sprite_y_low_pointer)
; CODE_02E50A:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E50A
LDA (!sprite_y_low_pointer)
; CODE_02E524:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E524
LDA (!sprite_y_low_pointer)
; CODE_02E541:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $02E541
LDA (!sprite_y_low_pointer)
; CODE_02E7A4:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E7A4
LDA (!sprite_y_low_pointer)
; CODE_02E7A8:        95 D8         STA RAM_SpriteYLo,X       
org $02E7A8
STA (!sprite_y_low_pointer)
; CODE_02E84A:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E84A
LDA (!sprite_y_low_pointer)
; CODE_02E851:        95 D8         STA RAM_SpriteYLo,X       
org $02E851
STA (!sprite_y_low_pointer)
; CODE_02E866:        95 D8         STA RAM_SpriteYLo,X       
org $02E866
STA (!sprite_y_low_pointer)
; CODE_02E8A9:        B5 D8         LDA RAM_SpriteYLo,X       
org $02E8A9
LDA (!sprite_y_low_pointer)
; CODE_02E8D4:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $02E8D4
LDA (!sprite_y_low_pointer)
; CODE_02E8F4:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $02E8F4
LDA (!sprite_y_low_pointer)
; CODE_02EB0D:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EB0D
LDA (!sprite_y_low_pointer)
; CODE_02EB0F:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02EB0F
STA !sprite_y_low,y
; CODE_02EDA3:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EDA3
LDA (!sprite_y_low_pointer)
; CODE_02EDA5:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02EDA5
STA !sprite_y_low,y
; CODE_02EE82:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EE82
LDA (!sprite_y_low_pointer)
; ADDR_02EEDB:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EEDB
LDA (!sprite_y_low_pointer)
; ADDR_02EF90:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EF90
LDA (!sprite_y_low_pointer)
; ADDR_02EF92:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $02EF92
STA !sprite_y_low,y
; ADDR_02EFD1:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EFD1
LDA (!sprite_y_low_pointer)
; CODE_02EFFE:        B5 D8         LDA RAM_SpriteYLo,X       
org $02EFFE
LDA (!sprite_y_low_pointer)
; CODE_02F0FD:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F0FD
LDA (!sprite_y_low_pointer)
; CODE_02F2F7:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F2F7
LDA (!sprite_y_low_pointer)
; CODE_02F2FC:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F2FC
LDA (!sprite_y_low_pointer)
; CODE_02F351:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F351
LDA (!sprite_y_low_pointer)
; CODE_02F359:        95 D8         STA RAM_SpriteYLo,X       
org $02F359
STA (!sprite_y_low_pointer)
; CODE_02F409:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F409
LDA (!sprite_y_low_pointer)
; CODE_02F456:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F456
LDA (!sprite_y_low_pointer)
; CODE_02F4A3:        B5 D8         LDA RAM_SpriteYLo,X       
org $02F4A3
LDA (!sprite_y_low_pointer)
; CODE_02F573:        95 D8         STA RAM_SpriteYLo,X       
org $02F573
STA (!sprite_y_low_pointer)
; CODE_03821D:        B5 D8         LDA RAM_SpriteYLo,X       
org $03821D
LDA (!sprite_y_low_pointer)
; CODE_038800:        75 D8         ADC RAM_SpriteYLo,X       ; |							     
org $038800
ADC (!sprite_y_low_pointer)
; CODE_038A2E:        B5 D8         LDA RAM_SpriteYLo,X       
org $038A2E
LDA (!sprite_y_low_pointer)
; CODE_038B0E:        B5 D8         LDA RAM_SpriteYLo,X       
org $038B0E
LDA (!sprite_y_low_pointer)
; CODE_038B13:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $038B13
STA !sprite_y_low,y
; CODE_038C9D:        B5 D8         LDA RAM_SpriteYLo,X       
org $038C9D
LDA (!sprite_y_low_pointer)
; CODE_038CB4:        B5 D8         LDA RAM_SpriteYLo,X       
org $038CB4
LDA (!sprite_y_low_pointer)
; CODE_039047:        B5 D8         LDA RAM_SpriteYLo,X       
org $039047
LDA (!sprite_y_low_pointer)
; CODE_039111:        B5 D8         LDA RAM_SpriteYLo,X       
org $039111
LDA (!sprite_y_low_pointer)
; CODE_0392E4:        B5 D8         LDA RAM_SpriteYLo,X       
org $0392E4
LDA (!sprite_y_low_pointer)
; CODE_039356:        B5 D8         LDA RAM_SpriteYLo,X       
org $039356
LDA (!sprite_y_low_pointer)
; CODE_03935C:        95 D8         STA RAM_SpriteYLo,X       
org $03935C
STA (!sprite_y_low_pointer)
; CODE_039370:        95 D8         STA RAM_SpriteYLo,X       
org $039370
STA (!sprite_y_low_pointer)
; CODE_039396:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position 
org $039396
LDA (!sprite_y_low_pointer)
; CODE_0399DD:        95 D8         STA RAM_SpriteYLo,X       
org $0399DD
STA (!sprite_y_low_pointer)
; CODE_039A4A:        F5 D8         SBC RAM_SpriteYLo,X       ;  |							   
org $039A4A
SBC (!sprite_y_low_pointer)
; CODE_039AE1:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Transfer y position to dead Reznor							   
org $039AE1
LDA (!sprite_y_low_pointer)
; CODE_039AE3:        99 D8 00      STA.W RAM_SpriteYLo,Y     ;  |											   
org $039AE3
STA !sprite_y_low,y
; CODE_039B20:        B5 D8         LDA RAM_SpriteYLo,X       
org $039B20
LDA (!sprite_y_low_pointer)
; CODE_039B26:        95 D8         STA RAM_SpriteYLo,X       
org $039B26
STA (!sprite_y_low_pointer)
; CODE_039B41:        95 D8         STA RAM_SpriteYLo,X       
org $039B41
STA (!sprite_y_low_pointer)
; CODE_039DD9:        B5 D8         LDA RAM_SpriteYLo,X       
org $039DD9
LDA (!sprite_y_low_pointer)
; CODE_039F80:        B5 D8         LDA RAM_SpriteYLo,X       
org $039F80
LDA (!sprite_y_low_pointer)
; CODE_03A031:        95 D8         STA RAM_SpriteYLo,X       
org $03A031
STA (!sprite_y_low_pointer)
; CODE_03A045:        B5 D8         LDA RAM_SpriteYLo,X       
org $03A045
LDA (!sprite_y_low_pointer)
; CODE_03A04B:        95 D8         STA RAM_SpriteYLo,X       
org $03A04B
STA (!sprite_y_low_pointer)
; CODE_03A05F:        95 D8         STA RAM_SpriteYLo,X       
org $03A05F
STA (!sprite_y_low_pointer)
; CODE_03A0FA:        95 D8         STA RAM_SpriteYLo,X       
org $03A0FA
STA (!sprite_y_low_pointer)
; CODE_03A456:        B5 D8         LDA RAM_SpriteYLo,X       
org $03A456
LDA (!sprite_y_low_pointer)
; CODE_03A635:        B5 D8         LDA RAM_SpriteYLo,X       
org $03A635
LDA (!sprite_y_low_pointer)
; CODE_03A7CD:        95 D8         STA RAM_SpriteYLo,X       
org $03A7CD
STA (!sprite_y_low_pointer)
; CODE_03A819:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $03A819
STA !sprite_y_low,y
; CODE_03A902:        B5 D8         LDA RAM_SpriteYLo,X       
org $03A902
LDA (!sprite_y_low_pointer)
; CODE_03A907:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $03A907
STA !sprite_y_low,y
; CODE_03AA78:        B5 D8         LDA RAM_SpriteYLo,X       
org $03AA78
LDA (!sprite_y_low_pointer)
; CODE_03AB4D:        B5 D8         LDA RAM_SpriteYLo,X       
org $03AB4D
LDA (!sprite_y_low_pointer)
; CODE_03AB79:        B5 D8         LDA RAM_SpriteYLo,X       
org $03AB79
LDA (!sprite_y_low_pointer)
; CODE_03AB86:        95 D8         STA RAM_SpriteYLo,X       
org $03AB86
STA (!sprite_y_low_pointer)
; CODE_03ABA9:        B5 D8         LDA RAM_SpriteYLo,X       
org $03ABA9
LDA (!sprite_y_low_pointer)
; CODE_03AC7B:        B5 D8         LDA RAM_SpriteYLo,X       
org $03AC7B
LDA (!sprite_y_low_pointer)
; CODE_03AC9E:        B5 D8         LDA RAM_SpriteYLo,X       
org $03AC9E
LDA (!sprite_y_low_pointer)
; CODE_03AD50:        B5 D8         LDA RAM_SpriteYLo,X       
org $03AD50
LDA (!sprite_y_low_pointer)
; CODE_03AD58:        95 D8         STA RAM_SpriteYLo,X       
org $03AD58
STA (!sprite_y_low_pointer)
; CODE_03AD9B:        75 D8         ADC RAM_SpriteYLo,X       
org $03AD9B
ADC (!sprite_y_low_pointer)
; CODE_03B035:        B5 D8         LDA RAM_SpriteYLo,X       
org $03B035
LDA (!sprite_y_low_pointer)
; CODE_03B03A:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $03B03A
STA !sprite_y_low,y
; CODE_03B193:        B5 D8         LDA RAM_SpriteYLo,X       
org $03B193
LDA (!sprite_y_low_pointer)
; CODE_03B19B:        95 D8         STA RAM_SpriteYLo,X       
org $03B19B
STA (!sprite_y_low_pointer)
; CODE_03B6D0:        79 D8 00      ADC.W RAM_SpriteYLo,Y     ;  | 
org $03B6D0
ADC !sprite_y_low,y
; CODE_03B716:        79 D8 00      ADC.W RAM_SpriteYLo,Y     ;  | 
org $03B716
ADC !sprite_y_low,y
; CODE_03B79A:        B5 D8         LDA RAM_SpriteYLo,X       ; \                        
org $03B79A
LDA (!sprite_y_low_pointer)
; CODE_03B7C7:        B5 D8         LDA RAM_SpriteYLo,X       ; \                                                     
org $03B7C7
LDA (!sprite_y_low_pointer)
; CODE_03B82E:        F5 D8         SBC RAM_SpriteYLo,X       
org $03B82E
SBC (!sprite_y_low_pointer)
; CODE_03B86A:        B5 D8         LDA RAM_SpriteYLo,X       ; \ 
org $03B86A
LDA (!sprite_y_low_pointer)
; CODE_03B8DC:        D5 D8         CMP RAM_SpriteYLo,X       
org $03B8DC
CMP (!sprite_y_low_pointer)
; CODE_03C010:        B5 D8         LDA RAM_SpriteYLo,X       ; \ $98 = Sprite Y position + #$08 
org $03C010
LDA (!sprite_y_low_pointer)
; ADDR_03C071:        B5 D8         LDA RAM_SpriteYLo,X       
org $03C071
LDA (!sprite_y_low_pointer)
; ADDR_03C075:        95 D8         STA RAM_SpriteYLo,X       
org $03C075
STA (!sprite_y_low_pointer)
; CODE_03C2FA:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $03C2FA
STA (!sprite_y_low_pointer)
; CODE_03C325:        B5 D8         LDA RAM_SpriteYLo,X       ; \ Sprite Y position = Mario Y position - $000F 
org $03C325
LDA (!sprite_y_low_pointer)
; CODE_03C32A:        95 D8         STA RAM_SpriteYLo,X       ;  | 
org $03C32A
STA (!sprite_y_low_pointer)
; CODE_03C466:        B5 D8         LDA RAM_SpriteYLo,X       
org $03C466
LDA (!sprite_y_low_pointer)
; CODE_03C7E4:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $03C7E4
STA !sprite_y_low,y
; CODE_03C9FC:        B5 D8         LDA RAM_SpriteYLo,X       
org $03C9FC
LDA (!sprite_y_low_pointer)
; CODE_03CBCA:        B5 D8         LDA RAM_SpriteYLo,X       
org $03CBCA
LDA (!sprite_y_low_pointer)
; CODE_03CBCC:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $03CBCC
STA !sprite_y_low,y
; CODE_03CCB8:        95 D8         STA RAM_SpriteYLo,X       
org $03CCB8
STA (!sprite_y_low_pointer)
; CODE_03CD15:        B5 D8         LDA RAM_SpriteYLo,X       
org $03CD15
LDA (!sprite_y_low_pointer)
; CODE_03CD17:        99 D8 00      STA.W RAM_SpriteYLo,Y     
org $03CD17
STA !sprite_y_low,y
; CODE_03CE6E:        B5 D8         LDA RAM_SpriteYLo,X       
org $03CE6E
LDA (!sprite_y_low_pointer)
; CODE_03DEF1:        B5 D8         LDA RAM_SpriteYLo,X       
org $03DEF1
LDA (!sprite_y_low_pointer)
; CODE_07FC5B:        B5 D8         LDA RAM_SpriteYLo,X       
org $07FC5B
LDA (!sprite_y_low_pointer)

; Sprite num remapping

; CODE_00FA4E:        99 9E 00      STA.W RAM_SpriteNum,Y     ; /  
org $00FA4E
STA !sprite_num,y
; CODE_00FAA3:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if goal tape 
org $00FAA3
LDA !sprite_num,y
; CODE_00FB10:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ If Spring Board, X += #$07 
org $00FB10
LDA !sprite_num,y
; ADDR_00FC2C:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $00FC2C
LDA !sprite_num,y
; CODE_018177:        B5 9E         LDA RAM_SpriteNum,X       
org $018177
LDA (!sprite_num_pointer)
; CODE_018479:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $018479
LDA !sprite_num,y
; CODE_0184A6:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $0184A6
STA !sprite_num,y
; CODE_0185C6:        B5 9E         LDA RAM_SpriteNum,X       
org $0185C6
LDA (!sprite_num_pointer)
; CODE_018931:        B5 9E         LDA RAM_SpriteNum,X       ; \  
org $018931
LDA (!sprite_num_pointer)
; CODE_01895E:        B5 9E         LDA RAM_SpriteNum,X       ; \  
org $01895E
LDA (!sprite_num_pointer)
; CODE_018AB1:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Return if Coin sprite
org $018AB1
LDA !sprite_num,y
; CODE_018AD4:        B5 9E         LDA RAM_SpriteNum,X       
org $018AD4
LDA (!sprite_num_pointer)
; CODE_018C0A:        B5 9E         LDA RAM_SpriteNum,X       ; \ Add wings if sprite number > #$08 
org $018C0A
LDA (!sprite_num_pointer)
; CODE_018C32:        95 9E         STA RAM_SpriteNum,X       ; / 
org $018C32
STA (!sprite_num_pointer)
; CODE_018C71:        B5 9E         LDA RAM_SpriteNum,X       ; \ If flying left Green Koopa...
org $018C71
LDA (!sprite_num_pointer)
; CODE_018CDF:        B5 9E         LDA RAM_SpriteNum,X       
org $018CDF
LDA (!sprite_num_pointer)
; CODE_019245:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Yoshi 
org $019245
LDA (!sprite_num_pointer)
; CODE_019323:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if sprite == Yoshi 
org $019323
LDA (!sprite_num_pointer)
; CODE_01957F:        B5 9E         LDA RAM_SpriteNum,X       
org $01957F
LDA (!sprite_num_pointer)
; CODE_0195E0:        B5 9E         LDA RAM_SpriteNum,X       ; \ Call $0195E9 if sprite number < #$0D 
org $0195E0
LDA (!sprite_num_pointer)
; CODE_019624:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch away if sprite isn't a Bob-omb 
org $019624
LDA (!sprite_num_pointer)
; CODE_0196EC:        B5 9E         LDA RAM_SpriteNum,X       ; \ Store sprite number for shelless koopa 
org $0196EC
LDA (!sprite_num_pointer)
; CODE_0196F2:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $0196F2
STA !sprite_num,y
; CODE_019765:        B5 9E         LDA RAM_SpriteNum,X       ; \ If Yellow Koopa... 
org $019765
LDA (!sprite_num_pointer)
; CODE_01977D:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $01977D
STA !sprite_num,y
; CODE_0197F0:        B5 9E         LDA RAM_SpriteNum,X       ; \ If Goomba, Y += #$13 
org $0197F0
LDA (!sprite_num_pointer)
; CODE_01984D:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch away if a Buzzy Beetle 
org $01984D
LDA (!sprite_num_pointer)
; CODE_019992:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if throw block sprite 
org $019992
LDA (!sprite_num_pointer)
; CODE_0199D2:        B5 9E         LDA RAM_SpriteNum,X       ; \ If Throw Block, break it 
org $0199D2
LDA (!sprite_num_pointer)
; CODE_019AFE:        B5 9E         LDA RAM_SpriteNum,X       ; \ If Dino Torch... 
org $019AFE
LDA (!sprite_num_pointer)
; CODE_019B2E:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Lakitu 
org $019B2E
LDA (!sprite_num_pointer)
; CODE_019F9B:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Balloon 
org $019F9B
LDA (!sprite_num_pointer)
; CODE_01A01A:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Goomba 
org $01A01A
LDA (!sprite_num_pointer)
; CODE_01A033:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if sprite >= #$15 
org $01A033
LDA (!sprite_num_pointer)
; CODE_01A18E:        B5 9E         LDA RAM_SpriteNum,X       
org $01A18E
LDA (!sprite_num_pointer)
; CODE_01A29A:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if not Changing power up 
org $01A29A
LDA !sprite_num,y
; CODE_01A2BD:        9D 9E 00      STA.W RAM_SpriteNum,X     ; / 
org $01A2BD
STA !sprite_num,x
; CODE_01A4E9:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if Goomba 
org $01A4E9
LDA !sprite_num,y
; CODE_01A561:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Goomba 
org $01A561
LDA (!sprite_num_pointer)
; CODE_01A5C4:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01A5C4
LDA !sprite_num,y
; CODE_01A625:        B5 9E         LDA RAM_SpriteNum,X       
org $01A625
LDA (!sprite_num_pointer)
; CODE_01A685:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Flying Question Block 
org $01A685
LDA (!sprite_num_pointer)
; CODE_01A69D:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if Flying Question Block or Key 
org $01A69D
LDA !sprite_num,y
; CODE_01A710:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Blue Shelless 
org $01A710
LDA (!sprite_num_pointer)
; CODE_01A733:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Return if sprite >= #$0F 
org $01A733
LDA !sprite_num,y
; CODE_01A77C:        B5 9E         LDA RAM_SpriteNum,X       
org $01A77C
LDA (!sprite_num_pointer)
; CODE_01A911:        B5 9E         LDA RAM_SpriteNum,X       
org $01A911
LDA (!sprite_num_pointer)
; CODE_01A99B:        95 9E         STA RAM_SpriteNum,X       
org $01A99B
STA (!sprite_num_pointer)
; CODE_01A9B4:        B5 9E         LDA RAM_SpriteNum,X       
org $01A9B4
LDA (!sprite_num_pointer)
; CODE_01A9BE:        B5 9E         LDA RAM_SpriteNum,X       
org $01A9BE
LDA (!sprite_num_pointer)
; CODE_01A9F2:        B5 9E         LDA RAM_SpriteNum,X       ; \ Return if NOT Lakitu 
org $01A9F2
LDA (!sprite_num_pointer)
; CODE_01AA74:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Key 
org $01AA74
LDA (!sprite_num_pointer)
; CODE_01AAF1:        B5 9E         LDA RAM_SpriteNum,X       
org $01AAF1
LDA (!sprite_num_pointer)
; CODE_01ACC8:        B5 9E         LDA RAM_SpriteNum,X       ; \ Return if Green Net Koopa 
org $01ACC8
LDA (!sprite_num_pointer)
; CODE_01ADBA:        B5 9E         LDA RAM_SpriteNum,X       
org $01ADBA
LDA (!sprite_num_pointer)
; CODE_01AE50:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01AE50
LDA !sprite_num,y
; CODE_01B2A5:        B5 9E         LDA RAM_SpriteNum,X       
org $01B2A5
LDA (!sprite_num_pointer)
; CODE_01B2D1:        B5 9E         LDA RAM_SpriteNum,X       
org $01B2D1
LDA (!sprite_num_pointer)
; CODE_01B39B:        B5 9E         LDA RAM_SpriteNum,X       
org $01B39B
LDA (!sprite_num_pointer)
; CODE_01B3E5:        B5 9E         LDA RAM_SpriteNum,X       
org $01B3E5
LDA (!sprite_num_pointer)
; CODE_01B428:        B5 9E         LDA RAM_SpriteNum,X       
org $01B428
LDA (!sprite_num_pointer)
; CODE_01B4DC:        B5 9E         LDA RAM_SpriteNum,X       
org $01B4DC
LDA (!sprite_num_pointer)
; CODE_01B508:        B5 9E         LDA RAM_SpriteNum,X       
org $01B508
LDA (!sprite_num_pointer)
; CODE_01B577:        B5 9E         LDA RAM_SpriteNum,X       
org $01B577
LDA (!sprite_num_pointer)
; CODE_01B58F:        B5 9E         LDA RAM_SpriteNum,X       
org $01B58F
LDA (!sprite_num_pointer)
; CODE_01B5A9:        B5 9E         LDA RAM_SpriteNum,X       
org $01B5A9
LDA (!sprite_num_pointer)
; CODE_01B5C0:        B5 9E         LDA RAM_SpriteNum,X       
org $01B5C0
LDA (!sprite_num_pointer)
; CODE_01B651:        B5 9E         LDA RAM_SpriteNum,X       
org $01B651
LDA (!sprite_num_pointer)
; CODE_01BDC4:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01BDC4
LDA !sprite_num,y
; CODE_01BF34:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $01BF34
STA !sprite_num,y
; CODE_01C1FD:        B5 9E         LDA RAM_SpriteNum,X       
org $01C1FD
LDA (!sprite_num_pointer)
; CODE_01C255:        B5 9E         LDA RAM_SpriteNum,X       
org $01C255
LDA (!sprite_num_pointer)
; CODE_01C28F:        B5 9E         LDA RAM_SpriteNum,X       
org $01C28F
LDA (!sprite_num_pointer)
; CODE_01C2DC:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01C2DC
LDA !sprite_num,y
; CODE_01C333:        95 9E         STA RAM_SpriteNum,X       ; \ Change into the appropriate power up 
org $01C333
STA (!sprite_num_pointer)
; CODE_01C33E:        95 9E         STA RAM_SpriteNum,X       ;  | 
org $01C33E
STA (!sprite_num_pointer)
; CODE_01C3B9:        B5 9E         LDA RAM_SpriteNum,X       
org $01C3B9
LDA (!sprite_num_pointer)
; CODE_01C3C5:        B5 9E         LDA RAM_SpriteNum,X       
org $01C3C5
LDA (!sprite_num_pointer)
; CODE_01C44A:        B5 9E         LDA RAM_SpriteNum,X       
org $01C44A
LDA (!sprite_num_pointer)
; CODE_01C474:        B5 9E         LDA RAM_SpriteNum,X       
org $01C474
LDA (!sprite_num_pointer)
; CODE_01C4C9:        B5 9E         LDA RAM_SpriteNum,X       
org $01C4C9
LDA (!sprite_num_pointer)
; CODE_01C636:        B5 9E         LDA RAM_SpriteNum,X       
org $01C636
LDA (!sprite_num_pointer)
; CODE_01C6D1:        B5 9E         LDA RAM_SpriteNum,X       ; \ Set powerup tile 
org $01C6D1
LDA (!sprite_num_pointer)
; CODE_01D070:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $01D070
STA !sprite_num,y
; CODE_01D671:        B5 9E         LDA RAM_SpriteNum,X       
org $01D671
LDA (!sprite_num_pointer)
; CODE_01D67A:        95 9E         STA RAM_SpriteNum,X       
org $01D67A
STA (!sprite_num_pointer)
; CODE_01D9A7:        B5 9E         LDA RAM_SpriteNum,X	;LINE GUIDE PLATFORM FUZZY       
org $01D9A7
LDA (!sprite_num_pointer)
; CODE_01DDBE:        9D 9E 00      STA.W RAM_SpriteNum,X     
org $01DDBE
STA !sprite_num,x
; CODE_01E1D1:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01E1D1
LDA !sprite_num,y
; CODE_01E323:        B5 9E         LDA RAM_SpriteNum,X       
org $01E323
LDA (!sprite_num_pointer)
; CODE_01E343:        B5 9E         LDA RAM_SpriteNum,X       
org $01E343
LDA (!sprite_num_pointer)
; CODE_01E4FC:        B5 9E         LDA RAM_SpriteNum,X       
org $01E4FC
LDA (!sprite_num_pointer)
; CODE_01E54D:        B5 9E         LDA RAM_SpriteNum,X       
org $01E54D
LDA (!sprite_num_pointer)
; CODE_01E566:        B5 9E         LDA RAM_SpriteNum,X       
org $01E566
LDA (!sprite_num_pointer)
; CODE_01E57B:        B5 9E         LDA RAM_SpriteNum,X       
org $01E57B
LDA (!sprite_num_pointer)
; CODE_01E5DB:        B5 9E         LDA RAM_SpriteNum,X       
org $01E5DB
LDA (!sprite_num_pointer)
; CODE_01E71F:        B5 9E         LDA RAM_SpriteNum,X       
org $01E71F
LDA (!sprite_num_pointer)
; CODE_01E7E4:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01E7E4
LDA !sprite_num,y
; CODE_01EA37:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $01EA37
STA !sprite_num,y
; CODE_01EA62:        B5 9E         LDA RAM_SpriteNum,X       
org $01EA62
LDA (!sprite_num_pointer)
; CODE_01EC92:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $01EC92
STA !sprite_num,y
; CODE_01F15D:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F15D
LDA !sprite_num,y
; CODE_01F25E:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F25E
LDA !sprite_num,y
; CODE_01F2EC:        BE 9E 00      LDX.W RAM_SpriteNum,Y     ;  | 
org $01F2EC
LDX !sprite_num,y
; CODE_01F2F4:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $01F2F4
STA !sprite_num,y
; CODE_01F360:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if not a Koopa 
org $01F360
LDA !sprite_num,y
; CODE_01F36C:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $01F36C
STA !sprite_num,y
; CODE_01F384:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F384
LDA !sprite_num,y
; ADDR_01F394:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $01F394
STA !sprite_num,y
; CODE_01F39F:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ; \ Branch if not Changing Item 
org $01F39F
LDA !sprite_num,y
; ADDR_01F3B7:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $01F3B7
STA !sprite_num,y
; CODE_01F5CE:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $01F5CE
STA !sprite_num,y
; CODE_01F647:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F647
LDA !sprite_num,y
; CODE_01F679:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F679
LDA !sprite_num,y
; CODE_01F6A3:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F6A3
LDA !sprite_num,y
; CODE_01F6B4:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $01F6B4
LDA !sprite_num,y
; CODE_01F840:        95 9E         STA RAM_SpriteNum,X       
org $01F840
STA (!sprite_num_pointer)
; CODE_01F89E:        B5 9E         LDA RAM_SpriteNum,X       
org $01F89E
LDA (!sprite_num_pointer)
; CODE_01F9CE:        B5 9E         LDA RAM_SpriteNum,X       
org $01F9CE
LDA (!sprite_num_pointer)
; CODE_01FDBE:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $01FDBE
STA !sprite_num,y
; ADDR_028032:        B5 9E         LDA RAM_SpriteNum,X       ; \  If overwriting a p-balloon that the player just collected set $13f3 to 0 (hmm, not
org $028032
LDA (!sprite_num_pointer)
; CODE_0284C6:        B5 9E         LDA RAM_SpriteNum,X       
org $0284C6
LDA (!sprite_num_pointer)
; CODE_02864F:        95 9E         STA RAM_SpriteNum,X       ; / 
org $02864F
STA (!sprite_num_pointer)
; CODE_02893D:        95 9E         STA RAM_SpriteNum,X       ; / 
org $02893D
STA (!sprite_num_pointer)
; CODE_028956:        B5 9E         LDA RAM_SpriteNum,X       ; \  Branch if new sprite not directional coins
org $028956
LDA (!sprite_num_pointer)
; CODE_0289A5:        B5 9E         LDA RAM_SpriteNum,X       ; \  Branch if not p-balloon
org $0289A5
LDA (!sprite_num_pointer)
; CODE_0289BD:        95 9E         STA RAM_SpriteNum,X       ; / 
org $0289BD
STA (!sprite_num_pointer)
; CODE_0289E8:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ;  |
org $0289E8
LDA !sprite_num,y
; CODE_029439:        B5 9E         LDA RAM_SpriteNum,X       
org $029439
LDA (!sprite_num_pointer)
; CODE_029460:        B5 9E         LDA RAM_SpriteNum,X       
org $029460
LDA (!sprite_num_pointer)
; CODE_029494:        B5 9E         LDA RAM_SpriteNum,X       
org $029494
LDA (!sprite_num_pointer)
; CODE_02949C:        95 9E         STA RAM_SpriteNum,X       
org $02949C
STA (!sprite_num_pointer)
; CODE_02A12B:        95 9E         STA RAM_SpriteNum,X       ;  | 
org $02A12B
STA (!sprite_num_pointer)
; CODE_02A996:        95 9E         STA RAM_SpriteNum,X       
org $02A996
STA (!sprite_num_pointer)
; CODE_02A9A4:        B5 9E         LDA RAM_SpriteNum,X       
org $02A9A4
LDA (!sprite_num_pointer)
; CODE_02A9B2:        95 9E         STA RAM_SpriteNum,X       ; / 
org $02A9B2
STA (!sprite_num_pointer)
; CODE_02B04F:        95 9E         STA RAM_SpriteNum,X       ; / 
org $02B04F
STA (!sprite_num_pointer)
; CODE_02B095:        95 9E         STA RAM_SpriteNum,X       ; / 
org $02B095
STA (!sprite_num_pointer)
; CODE_02B11D:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $02B11D
STA !sprite_num,y
; CODE_02B16F:        95 9E         STA RAM_SpriteNum,X       ; / 
org $02B16F
STA (!sprite_num_pointer)
; CODE_02B1D0:        95 9E         STA RAM_SpriteNum,X       
org $02B1D0
STA (!sprite_num_pointer)
; CODE_02B21B:        95 9E         STA RAM_SpriteNum,X       
org $02B21B
STA (!sprite_num_pointer)
; ADDR_02B2EA:        95 9E         STA RAM_SpriteNum,X       
org $02B2EA
STA (!sprite_num_pointer)
; CODE_02B34B:        95 9E         STA RAM_SpriteNum,X       
org $02B34B
STA (!sprite_num_pointer)
; CODE_02B3F2:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $02B3F2
STA !sprite_num,y
; CODE_02B4B3:        99 9E 00      STA.W RAM_SpriteNum,Y     ; /								 
org $02B4B3
STA !sprite_num,y
; CODE_02B83B:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02B83B
STA !sprite_num,y
; CODE_02B9DB:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02B9DB
STA !sprite_num,y
; CODE_02BAC7:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $02BAC7
STA !sprite_num,y
; CODE_02BBE0:        B5 9E         LDA RAM_SpriteNum,X       
org $02BBE0
LDA (!sprite_num_pointer)
; CODE_02BC14:        B5 9E         LDA RAM_SpriteNum,X       
org $02BC14
LDA (!sprite_num_pointer)
; CODE_02BCEE:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Spike Top 
org $02BCEE
LDA (!sprite_num_pointer)
; CODE_02BD4A:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Spike Top 
org $02BD4A
LDA (!sprite_num_pointer)
; CODE_02BD75:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if Wall-detect Urchin 
org $02BD75
LDA (!sprite_num_pointer)
; CODE_02BE3B:        B5 9E         LDA RAM_SpriteNum,X       ; \ Branch if not Ground-guided Fuzzball/Sparky 
org $02BE3B
LDA (!sprite_num_pointer)
; CODE_02BE4E:        B5 9E         LDA RAM_SpriteNum,X       
org $02BE4E
LDA (!sprite_num_pointer)
; CODE_02C1A7:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02C1A7
STA !sprite_num,y
; CODE_02C58E:        B5 9E         LDA RAM_SpriteNum,X       
org $02C58E
LDA (!sprite_num_pointer)
; CODE_02C5C9:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02C5C9
STA !sprite_num,y
; CODE_02C777:        B5 9E         LDA RAM_SpriteNum,X       
org $02C777
LDA (!sprite_num_pointer)
; CODE_02C783:        95 9E         STA RAM_SpriteNum,X       
org $02C783
STA (!sprite_num_pointer)
; CODE_02CBA1:        B5 9E         LDA RAM_SpriteNum,X       
org $02CBA1
LDA (!sprite_num_pointer)
; CODE_02CEE7:        B5 9E         LDA RAM_SpriteNum,X       
org $02CEE7
LDA (!sprite_num_pointer)
; CODE_02D249:        B5 9E         LDA RAM_SpriteNum,X       
org $02D249
LDA (!sprite_num_pointer)
; CODE_02D61A:        B5 9E         LDA RAM_SpriteNum,X       ; \  Branch if sprite not banzai bill
org $02D61A
LDA (!sprite_num_pointer)
; CODE_02D718:        B5 9E         LDA RAM_SpriteNum,X       ; \  Branch if sprite is ball and chain
org $02D718
LDA (!sprite_num_pointer)
; CODE_02D7A0:        B5 9E         LDA RAM_SpriteNum,X       
org $02D7A0
LDA (!sprite_num_pointer)
; CODE_02D97D:        95 9E         STA RAM_SpriteNum,X       
org $02D97D
STA (!sprite_num_pointer)
; CODE_02D990:        B5 9E         LDA RAM_SpriteNum,X       
org $02D990
LDA (!sprite_num_pointer)
; CODE_02DB6D:        B9 9E 00      LDA.W RAM_SpriteNum,Y     ;  | 
org $02DB6D
LDA !sprite_num,y
; CODE_02DD97:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $02DD97
STA !sprite_num,y
; CODE_02E465:        95 9E         STA RAM_SpriteNum,X       
org $02E465
STA (!sprite_num_pointer)
; CODE_02EA6A:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $02EA6A
LDA !sprite_num,y
; CODE_02EAFF:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02EAFF
STA !sprite_num,y
; CODE_02EB5A:        B5 9E         LDA RAM_SpriteNum,X       
org $02EB5A
LDA (!sprite_num_pointer)
; CODE_02ED3B:        B5 9E         LDA RAM_SpriteNum,X       
org $02ED3B
LDA (!sprite_num_pointer)
; CODE_02EDA0:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02EDA0
STA !sprite_num,y
; CODE_02EDE6:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $02EDE6
LDA !sprite_num,y
; CODE_02EE26:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $02EE26
LDA !sprite_num,y
; ADDR_02EF82:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02EF82
STA !sprite_num,y
; CODE_02F555:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $02F555
STA !sprite_num,y
; CODE_0383A0:        B5 9E         LDA RAM_SpriteNum,X       
org $0383A0
LDA (!sprite_num_pointer)
; CODE_038665:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $038665
LDA !sprite_num,y
; CODE_038978:        95 9E         STA RAM_SpriteNum,X       
org $038978
STA (!sprite_num_pointer)
; CODE_038AE6:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $038AE6
STA !sprite_num,y
; CODE_038D28:        B5 9E         LDA RAM_SpriteNum,X       
org $038D28
LDA (!sprite_num_pointer)
; CODE_038FB9:        B5 9E         LDA RAM_SpriteNum,X       
org $038FB9
LDA (!sprite_num_pointer)
; CODE_0394D4:        B5 9E         LDA RAM_SpriteNum,X       ;  | 
org $0394D4
LDA (!sprite_num_pointer)
; CODE_039AD3:        99 9E 00      STA.W RAM_SpriteNum,Y     ; /												   
org $039AD3
STA !sprite_num,y
; CODE_039CB4:        B5 9E         LDA RAM_SpriteNum,X       
org $039CB4
LDA (!sprite_num_pointer)
; CODE_039CE1:        B5 9E         LDA RAM_SpriteNum,X       ;  | 
org $039CE1
LDA (!sprite_num_pointer)
; CODE_039D7A:        B5 9E         LDA RAM_SpriteNum,X       
org $039D7A
LDA (!sprite_num_pointer)
; CODE_039E56:        B5 9E         LDA RAM_SpriteNum,X       
org $039E56
LDA (!sprite_num_pointer)
; CODE_03A11B:        B5 9E         LDA RAM_SpriteNum,X       
org $03A11B
LDA (!sprite_num_pointer)
; CODE_03A1E7:        B5 9E         LDA RAM_SpriteNum,X       
org $03A1E7
LDA (!sprite_num_pointer)
; CODE_03A6CF:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $03A6CF
LDA !sprite_num,y
; CODE_03A802:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $03A802
STA !sprite_num,y
; CODE_03A8EF:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $03A8EF
STA !sprite_num,y
; CODE_03B032:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $03B032
STA !sprite_num,y
; CODE_03B801:        B5 9E         LDA RAM_SpriteNum,X       
org $03B801
LDA (!sprite_num_pointer)
; CODE_03C041:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $03C041
LDA !sprite_num,y
; ADDR_03C064:        9D 9E 00      STA.W RAM_SpriteNum,X     
org $03C064
STA !sprite_num,x
; CODE_03C218:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $03C218
LDA !sprite_num,y
; CODE_03C26F:        B5 9E         LDA RAM_SpriteNum,X       
org $03C26F
LDA (!sprite_num_pointer)
; CODE_03C2ED:        95 9E         STA RAM_SpriteNum,X       ; / 
org $03C2ED
STA (!sprite_num_pointer)
; CODE_03C31A:        95 9E         STA RAM_SpriteNum,X       ; / 
org $03C31A
STA (!sprite_num_pointer)
; CODE_03C3DA:        B5 9E         LDA RAM_SpriteNum,X       
org $03C3DA
LDA (!sprite_num_pointer)
; CODE_03C4EF:        B9 9E 00      LDA.W RAM_SpriteNum,Y     
org $03C4EF
LDA !sprite_num,y
; CODE_03C7D7:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $03C7D7
STA !sprite_num,y
; CODE_03CBBB:        99 9E 00      STA.W RAM_SpriteNum,Y     ; / 
org $03CBBB
STA !sprite_num,y
; CODE_03CCEF:        99 9E 00      STA.W RAM_SpriteNum,Y     
org $03CCEF
STA !sprite_num,y