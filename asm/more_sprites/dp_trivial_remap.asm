@includefrom sa1.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SPECIAL CASES (manually fixed)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; SubSprYPosNoGrvty:  B5 AA         LDA RAM_SpriteSpeedY,X    ; Load current sprite's Y speed 
org $01ABD8
LDA.b !sprite_speed_y_w,x
; UpdateYPosNoGrvty:  B5 AA         LDA RAM_SpriteSpeedY,X    ; \ $14EC or $14F8 += 16 * speed 
org $02D294
LDA.b !sprite_speed_y_w,x
; InitChangingItem:   F6 C2         INC RAM_SpriteState,X     
org $01843B
INC.b !sprite_misc_c2_w,x
; InitPowerUp:        F6 C2         INC RAM_SpriteState,X     
org $01858B
INC.b !sprite_misc_c2_w,x
; ChangePiranhaState: B5 C2         LDA RAM_SpriteState,X     ; \ $00 = Sprite state (00 - 03) 
org $018EC8
LDA.b !sprite_misc_c2_w,x
; OrangePlatform:     B5 C2         LDA RAM_SpriteState,X     
org $01B536
LDA.b !sprite_misc_c2_w,x
; InitVertNetKoopa:   F6 C2         INC RAM_SpriteState,X     
org $01B948
INC.b !sprite_misc_c2_w,x
; KoopaKid:           B5 C2         LDA RAM_SpriteState,X     
org $01FAC1
LDA.b !sprite_misc_c2_w,x
; Firework:           B5 C2         LDA RAM_SpriteState,X     
org $03C816
LDA.b !sprite_misc_c2_w,x

; CODE_02A49C:        95 B5         STA $B5,X                 
org $02A49C
STA.b !sprite_speed_x_w-1,x
; CODE_02A488:        95 C1         STA $C1,X                 
org $02A488
STA.b !sprite_misc_c2_w-1,x
; CODE_01DE08:        85 CB         STA $CB                   
org $01DE08
STA.b !sprite_misc_c2_w+9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NORMAL CASES (automatically fixed by script)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sprite Y speed remapping

; CODE_00FB70:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $00FB70
STA.w !sprite_speed_y_w,y
; CODE_00FBD3:        95 AA         STA RAM_SpriteSpeedY,X    
org $00FBD3
STA.b !sprite_speed_y_w,x
; CODE_00FBF7:        F6 AA         INC RAM_SpriteSpeedY,X    
org $00FBF7
INC.b !sprite_speed_y_w,x
; CODE_00FBF9:        F6 AA         INC RAM_SpriteSpeedY,X    
org $00FBF9
INC.b !sprite_speed_y_w,x
; CODE_00FBFB:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $00FBFB
LDA.b !sprite_speed_y_w,x
; CODE_018160:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $018160
DEC.b !sprite_speed_y_w,x
; CODE_018162:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $018162
DEC.b !sprite_speed_y_w,x
; CODE_018358:        95 AA         STA RAM_SpriteSpeedY,X    
org $018358
STA.b !sprite_speed_y_w,x
; CODE_01842F:        95 AA         STA RAM_SpriteSpeedY,X    
org $01842F
STA.b !sprite_speed_y_w,x
; CODE_01852A:        95 AA         STA RAM_SpriteSpeedY,X    
org $01852A
STA.b !sprite_speed_y_w,x
; CODE_0188E6:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $0188E6
STA.b !sprite_speed_y_w,x
; CODE_01892C:        74 AA         STZ RAM_SpriteSpeedY,X    ; /  
org $01892C
STZ.b !sprite_speed_y_w,x
; CODE_018966:        95 AA         STA RAM_SpriteSpeedY,X    ; /  
org $018966
STA.b !sprite_speed_y_w,x
; ADDR_0189B1:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $0189B1
STA.w !sprite_speed_y_w,y
; CODE_018AAC:        B9 AA 00      LDA.W RAM_SpriteSpeedY,Y  
org $018AAC
LDA.w !sprite_speed_y_w,y
; ADDR_018B41:        74 AA         STZ RAM_SpriteSpeedY,X    ; / ...Sprite Y Speed = 0 
org $018B41
STZ.b !sprite_speed_y_w,x
; CODE_018C29:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $018C29
DEC.b !sprite_speed_y_w,x
; CODE_018C85:        94 AA         STY RAM_SpriteSpeedY,X    ;  |
org $018C85
STY.b !sprite_speed_y_w,x
; CODE_018C8F:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $018C8F
DEC.b !sprite_speed_y_w,x
; CODE_018C99:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $018C99
STZ.b !sprite_speed_y_w,x
; CODE_018CAC:        95 AA         STA RAM_SpriteSpeedY,X    
org $018CAC
STA.b !sprite_speed_y_w,x
; CODE_018CF5:        94 AA         STY RAM_SpriteSpeedY,X    
org $018CF5
STY.b !sprite_speed_y_w,x
; CODE_018D16:        95 AA         STA RAM_SpriteSpeedY,X    
org $018D16
STA.b !sprite_speed_y_w,x
; CODE_018D3F:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $018D3F
DEC.b !sprite_speed_y_w,x
; CODE_018D55:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $018D55
LDA.b !sprite_speed_y_w,x
; CODE_018D67:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $018D67
STZ.b !sprite_speed_y_w,x
; CODE_018DA3:        94 AA         STY RAM_SpriteSpeedY,X    
org $018DA3
STY.b !sprite_speed_y_w,x
; CODE_018EC2:        95 AA         STA RAM_SpriteSpeedY,X    ; Store Y Speed 
org $018EC2
STA.b !sprite_speed_y_w,x
; CODE_018F1A:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $018F1A
DEC.b !sprite_speed_y_w,x
; CODE_018F58:        95 AA         STA RAM_SpriteSpeedY,X    
org $018F58
STA.b !sprite_speed_y_w,x
; CODE_019006:        95 AA         STA RAM_SpriteSpeedY,X    ; /
org $019006
STA.b !sprite_speed_y_w,x
; CODE_01903D:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01903D
LDA.b !sprite_speed_y_w,x
; CODE_019047:        95 AA         STA RAM_SpriteSpeedY,X    
org $019047
STA.b !sprite_speed_y_w,x
; CODE_019049:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $019049
LDA.b !sprite_speed_y_w,x
; CODE_01904F:        95 AA         STA RAM_SpriteSpeedY,X    
org $01904F
STA.b !sprite_speed_y_w,x
; CODE_01905B:        95 AA         STA RAM_SpriteSpeedY,X    
org $01905B
STA.b !sprite_speed_y_w,x
; CODE_0192CB:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $0192CB
LDA.b !sprite_speed_y_w,x
; ADDR_019560:        74 AA         STZ RAM_SpriteSpeedY,X    ;  | Balloon Y Speed = 0 
org $019560
STZ.b !sprite_speed_y_w,x
; CODE_019592:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $019592
STA.b !sprite_speed_y_w,x
; CODE_01959F:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $01959F
STA.b !sprite_speed_y_w,x
; CODE_01972F:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  ; / 
org $01972F
STA.w !sprite_speed_y_w,y
; CODE_01979F:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  ; / 
org $01979F
STA.w !sprite_speed_y_w,y
; CODE_0197E6:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $0197E6
LDA.b !sprite_speed_y_w,x
; CODE_019803:        95 AA         STA RAM_SpriteSpeedY,X    
org $019803
STA.b !sprite_speed_y_w,x
; CODE_0198F4:        95 AA         STA RAM_SpriteSpeedY,X    
org $0198F4
STA.b !sprite_speed_y_w,x
; ADDR_0198FB:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $0198FB
STZ.b !sprite_speed_y_w,x
; CODE_019965:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $019965
STA.b !sprite_speed_y_w,x
; CODE_019973:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $019973
STA.b !sprite_speed_y_w,x
; CODE_019982:        95 AA         STA RAM_SpriteSpeedY,X    
org $019982
STA.b !sprite_speed_y_w,x
; CODE_019A12:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $019A12
STA.b !sprite_speed_y_w,x
; CODE_019A82:        95 AA         STA RAM_SpriteSpeedY,X    
org $019A82
STA.b !sprite_speed_y_w,x
; CODE_01A026:        94 AA         STY RAM_SpriteSpeedY,X    
org $01A026
STY.b !sprite_speed_y_w,x
; CODE_01A064:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01A064
STZ.b !sprite_speed_y_w,x
; CODE_01A06E:        95 AA         STA RAM_SpriteSpeedY,X    
org $01A06E
STA.b !sprite_speed_y_w,x
; ADDR_01A14B:        95 AA         STA RAM_SpriteSpeedY,X    
org $01A14B
STA.b !sprite_speed_y_w,x
; CODE_01A26B:        95 AA         STA RAM_SpriteSpeedY,X    
org $01A26B
STA.b !sprite_speed_y_w,x
; CODE_01A5D1:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01A5D1
STZ.b !sprite_speed_y_w,x
; CODE_01A5FD:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $01A5FD
STA.w !sprite_speed_y_w,y
; CODE_01A636:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $01A636
STA.w !sprite_speed_y_w,y
; CODE_01A682:        95 AA         STA RAM_SpriteSpeedY,X    
org $01A682
STA.b !sprite_speed_y_w,x
; CODE_01A696:        95 AA         STA RAM_SpriteSpeedY,X    
org $01A696
STA.b !sprite_speed_y_w,x
; CODE_01A6B3:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $01A6B3
STA.w !sprite_speed_y_w,y
; CODE_01A74D:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  ; / 
org $01A74D
STA.w !sprite_speed_y_w,y
; CODE_01A75F:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $01A75F
STA.b !sprite_speed_y_w,x
; CODE_01A872:        95 AA         STA RAM_SpriteSpeedY,X    
org $01A872
STA.b !sprite_speed_y_w,x
; CODE_01A9B2:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01A9B2
STZ.b !sprite_speed_y_w,x
; CODE_01A9DF:        74 AA         STZ RAM_SpriteSpeedY,X    ; / 
org $01A9DF
STZ.b !sprite_speed_y_w,x
; CODE_01A9F0:        74 AA         STZ RAM_SpriteSpeedY,X    ; / 
org $01A9F0
STZ.b !sprite_speed_y_w,x
; ADDR_01AA90:        95 AA         STA RAM_SpriteSpeedY,X    
org $01AA90
STA.b !sprite_speed_y_w,x
; CODE_01ABEB:        B5 AA         LDA RAM_SpriteSpeedY,X    ; Load current sprite's Y speed 
org $01ABEB
LDA.b !sprite_speed_y_w,x
; CODE_01ADA7:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01ADA7
LDA.b !sprite_speed_y_w,x
; CODE_01ADAD:        95 AA         STA RAM_SpriteSpeedY,X    
org $01ADAD
STA.b !sprite_speed_y_w,x
; CODE_01AEF7:        95 AA         STA RAM_SpriteSpeedY,X    
org $01AEF7
STA.b !sprite_speed_y_w,x
; CODE_01AEFD:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01AEFD
LDA.b !sprite_speed_y_w,x
; CODE_01AF05:        95 AA         STA RAM_SpriteSpeedY,X    
org $01AF05
STA.b !sprite_speed_y_w,x
; CODE_01AF3A:        95 AA         STA RAM_SpriteSpeedY,X    
org $01AF3A
STA.b !sprite_speed_y_w,x
; CODE_01AFB9:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01AFB9
LDA.b !sprite_speed_y_w,x
; CODE_01AFCA:        95 AA         STA RAM_SpriteSpeedY,X    
org $01AFCA
STA.b !sprite_speed_y_w,x
; CODE_01AFD3:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $01AFD3
STA.b !sprite_speed_y_w,x
; CODE_01AFDF:        74 AA         STZ RAM_SpriteSpeedY,X    ; / 
org $01AFDF
STZ.b !sprite_speed_y_w,x
; CODE_01AFEB:        95 AA         STA RAM_SpriteSpeedY,X    
org $01AFEB
STA.b !sprite_speed_y_w,x
; CODE_01B07D:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B07D
STA.b !sprite_speed_y_w,x
; CODE_01B0DE:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B0DE
STA.b !sprite_speed_y_w,x
; CODE_01B13E:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B13E
STA.b !sprite_speed_y_w,x
; CODE_01B1A5:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B1A5
LDA.b !sprite_speed_y_w,x
; CODE_01B1AE:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B1AE
STA.b !sprite_speed_y_w,x
; CODE_01B1D2:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B1D2
STA.b !sprite_speed_y_w,x
; CODE_01B1DE:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $01B1DE
DEC.b !sprite_speed_y_w,x
; CODE_01B1E6:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $01B1E6
DEC.b !sprite_speed_y_w,x
; CODE_01B204:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B204
STA.b !sprite_speed_y_w,x
; CODE_01B286:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B286
LDA.b !sprite_speed_y_w,x
; CODE_01B28C:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B28C
STA.b !sprite_speed_y_w,x
; CODE_01B580:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B580
LDA.b !sprite_speed_y_w,x
; CODE_01B586:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01B586
INC.b !sprite_speed_y_w,x
; CODE_01B599:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B599
LDA.b !sprite_speed_y_w,x
; CODE_01B5A4:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B5A4
STA.b !sprite_speed_y_w,x
; CODE_01B5CF:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B5CF
LDA.b !sprite_speed_y_w,x
; CODE_01B5D8:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B5D8
STA.b !sprite_speed_y_w,x
; CODE_01B5E5:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B5E5
STA.b !sprite_speed_y_w,x
; CODE_01B605:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B605
LDA.b !sprite_speed_y_w,x
; CODE_01B60E:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B60E
STA.b !sprite_speed_y_w,x
; CODE_01B616:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01B616
LDA.b !sprite_speed_y_w,x
; CODE_01B622:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B622
STA.b !sprite_speed_y_w,x
; CODE_01B94E:        95 AA         STA RAM_SpriteSpeedY,X    
org $01B94E
STA.b !sprite_speed_y_w,x
; CODE_01B966:        16 AA         ASL RAM_SpriteSpeedY,X    
org $01B966
ASL.b !sprite_speed_y_w,x
; CODE_01BA17:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $01BA17
LDY.b !sprite_speed_y_w,x
; CODE_01BA7F:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01BA7F
LDA.b !sprite_speed_y_w,x
; CODE_01BA84:        95 AA         STA RAM_SpriteSpeedY,X    
org $01BA84
STA.b !sprite_speed_y_w,x
; CODE_01BC48:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01BC48
LDA.b !sprite_speed_y_w,x
; CODE_01BC4D:        95 AA         STA RAM_SpriteSpeedY,X    
org $01BC4D
STA.b !sprite_speed_y_w,x
; CODE_01BC53:        95 AA         STA RAM_SpriteSpeedY,X    
org $01BC53
STA.b !sprite_speed_y_w,x
; CODE_01BE3C:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01BE3C
STZ.b !sprite_speed_y_w,x
; CODE_01BF61:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $01BF61
STA.w !sprite_speed_y_w,y
; CODE_01C0BD:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C0BD
STA.b !sprite_speed_y_w,x
; CODE_01C1AF:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C1AF
STA.b !sprite_speed_y_w,x
; ADDR_01C217:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C217
STA.b !sprite_speed_y_w,x
; CODE_01C229:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01C229
LDA.b !sprite_speed_y_w,x
; CODE_01C22F:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C22F
STA.b !sprite_speed_y_w,x
; CODE_01C240:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01C240
LDA.b !sprite_speed_y_w,x
; CODE_01C247:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C247
STA.b !sprite_speed_y_w,x
; CODE_01C24D:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C24D
STA.b !sprite_speed_y_w,x
; ADDR_01C2C0:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01C2C0
STZ.b !sprite_speed_y_w,x
; CODE_01C2F9:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C2F9
STA.b !sprite_speed_y_w,x
; CODE_01C382:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C382
STA.b !sprite_speed_y_w,x
; CODE_01C3A6:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C3A6
STA.b !sprite_speed_y_w,x
; ADDR_01C424:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01C424
INC.b !sprite_speed_y_w,x
; ADDR_01C426:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01C426
INC.b !sprite_speed_y_w,x
; ADDR_01C428:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01C428
INC.b !sprite_speed_y_w,x
; CODE_01C435:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $01C435
DEC.b !sprite_speed_y_w,x
; CODE_01C441:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C441
STA.b !sprite_speed_y_w,x
; CODE_01C453:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01C453
LDA.b !sprite_speed_y_w,x
; CODE_01C468:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C468
STA.b !sprite_speed_y_w,x
; CODE_01C47C:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C47C
STA.b !sprite_speed_y_w,x
; CODE_01C710:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01C710
INC.b !sprite_speed_y_w,x
; CODE_01C736:        95 AA         STA RAM_SpriteSpeedY,X    
org $01C736
STA.b !sprite_speed_y_w,x
; CODE_01CE43:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01CE43
LDA.b !sprite_speed_y_w,x
; CODE_01CE4C:        95 AA         STA RAM_SpriteSpeedY,X    
org $01CE4C
STA.b !sprite_speed_y_w,x
; CODE_01CED9:        95 AA         STA RAM_SpriteSpeedY,X    
org $01CED9
STA.b !sprite_speed_y_w,x
; CODE_01CF21:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01CF21
LDA.b !sprite_speed_y_w,x
; CODE_01CF27:        74 AA         STZ RAM_SpriteSpeedY,X    ; / 
org $01CF27
STZ.b !sprite_speed_y_w,x
; CODE_01CF3A:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01CF3A
LDA.b !sprite_speed_y_w,x
; CODE_01CF42:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01CF42
INC.b !sprite_speed_y_w,x
; CODE_01CF69:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $01CF69
LDY.b !sprite_speed_y_w,x
; CODE_01CF80:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01CF80
INC.b !sprite_speed_y_w,x
; CODE_01D0C0:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01D0C0
LDA.b !sprite_speed_y_w,x
; CODE_01D0D9:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01D0D9
STZ.b !sprite_speed_y_w,x
; CODE_01D1EF:        95 AA         STA RAM_SpriteSpeedY,X    
org $01D1EF
STA.b !sprite_speed_y_w,x
; CODE_01D266:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01D266
LDA.b !sprite_speed_y_w,x
; CODE_01D26F:        95 AA         STA RAM_SpriteSpeedY,X    
org $01D26F
STA.b !sprite_speed_y_w,x
; CODE_01D39F:        74 AA         STZ RAM_SpriteSpeedY,X    ; / 
org $01D39F
STZ.b !sprite_speed_y_w,x
; CODE_01D661:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01D661
STZ.b !sprite_speed_y_w,x
; CODE_01D68F:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01D68F
INC.b !sprite_speed_y_w,x
; CODE_01D886:        95 AA         STA RAM_SpriteSpeedY,X 	;SPEED SETTINGS!   
org $01D886
STA.b !sprite_speed_y_w,x
; CODE_01DB50:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01DB50
LDA.b !sprite_speed_y_w,x
; CODE_01DB8B:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01DB8B
STZ.b !sprite_speed_y_w,x
; CODE_01DEA7:        95 AA         STA RAM_SpriteSpeedY,X    
org $01DEA7
STA.b !sprite_speed_y_w,x
; CODE_01E0BC:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $01E0BC
LDY.b !sprite_speed_y_w,x
; CODE_01E0D3:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01E0D3
LDA.b !sprite_speed_y_w,x
; CODE_01E103:        95 AA         STA RAM_SpriteSpeedY,X    
org $01E103
STA.b !sprite_speed_y_w,x
; CODE_01E11A:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01E11A
LDA.b !sprite_speed_y_w,x
; CODE_01E128:        95 AA         STA RAM_SpriteSpeedY,X    
org $01E128
STA.b !sprite_speed_y_w,x
; CODE_01E13C:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01E13C
STZ.b !sprite_speed_y_w,x
; CODE_01E315:        95 AA         STA RAM_SpriteSpeedY,X    
org $01E315
STA.b !sprite_speed_y_w,x
; CODE_01E3E6:        95 AA         STA RAM_SpriteSpeedY,X    
org $01E3E6
STA.b !sprite_speed_y_w,x
; CODE_01E4BB:        74 AA         STZ RAM_SpriteSpeedY,X    ; \ Sprite Speed = 0 
org $01E4BB
STZ.b !sprite_speed_y_w,x
; ADDR_01E4F4:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01E4F4
STZ.b !sprite_speed_y_w,x
; ADDR_01E64E:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01E64E
STZ.b !sprite_speed_y_w,x
; CODE_01E834:        95 AA         STA RAM_SpriteSpeedY,X    
org $01E834
STA.b !sprite_speed_y_w,x
; CODE_01E84D:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01E84D
LDA.b !sprite_speed_y_w,x
; CODE_01E9D6:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01E9D6
LDA.b !sprite_speed_y_w,x
; CODE_01E9DC:        95 AA         STA RAM_SpriteSpeedY,X    
org $01E9DC
STA.b !sprite_speed_y_w,x
; CODE_01EA58:        95 AA         STA RAM_SpriteSpeedY,X    
org $01EA58
STA.b !sprite_speed_y_w,x
; CODE_01ECD2:        95 AA         STA RAM_SpriteSpeedY,X    
org $01ECD2
STA.b !sprite_speed_y_w,x
; CODE_01ECFF:        95 AA         STA RAM_SpriteSpeedY,X    
org $01ECFF
STA.b !sprite_speed_y_w,x
; CODE_01EDC6:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01EDC6
STZ.b !sprite_speed_y_w,x
; CODE_01F24B:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $01F24B
STA.w !sprite_speed_y_w,y
; CODE_01F519:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $01F519
STA.w !sprite_speed_y_w,y
; CODE_01F8A9:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01F8A9
LDA.b !sprite_speed_y_w,x
; CODE_01F8AF:        95 AA         STA RAM_SpriteSpeedY,X    
org $01F8AF
STA.b !sprite_speed_y_w,x
; CODE_01F964:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01F964
LDA.b !sprite_speed_y_w,x
; CODE_01F96D:        95 AA         STA RAM_SpriteSpeedY,X    
org $01F96D
STA.b !sprite_speed_y_w,x
; CODE_01F9BB:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01F9BB
LDA.b !sprite_speed_y_w,x
; CODE_01F9C6:        95 AA         STA RAM_SpriteSpeedY,X    
org $01F9C6
STA.b !sprite_speed_y_w,x
; CODE_01FA8F:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01FA8F
LDA.b !sprite_speed_y_w,x
; CODE_01FA98:        95 AA         STA RAM_SpriteSpeedY,X    
org $01FA98
STA.b !sprite_speed_y_w,x
; CODE_01FAA1:        95 AA         STA RAM_SpriteSpeedY,X    
org $01FAA1
STA.b !sprite_speed_y_w,x
; CODE_01FB4C:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $01FB4C
LDA.b !sprite_speed_y_w,x
; CODE_01FB52:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01FB52
INC.b !sprite_speed_y_w,x
; CODE_01FB54:        F6 AA         INC RAM_SpriteSpeedY,X    
org $01FB54
INC.b !sprite_speed_y_w,x
; CODE_01FB99:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $01FB99
STZ.b !sprite_speed_y_w,x
; CODE_02816F:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  ; / 
org $02816F
STA.w !sprite_speed_y_w,y
; CODE_0284D0:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $0284D0
LDA.b !sprite_speed_y_w,x
; CODE_028A18:        95 AA         STA RAM_SpriteSpeedY,X    
org $028A18
STA.b !sprite_speed_y_w,x
; CODE_029417:        95 AA         STA RAM_SpriteSpeedY,X    
org $029417
STA.b !sprite_speed_y_w,x
; CODE_0294B0:        95 AA         STA RAM_SpriteSpeedY,X    
org $0294B0
STA.b !sprite_speed_y_w,x
; CODE_02A112:        95 AA         STA RAM_SpriteSpeedY,X    ;  | 
org $02A112
STA.b !sprite_speed_y_w,x
; CODE_02A138:        95 AA         STA RAM_SpriteSpeedY,X    ;  | 
org $02A138
STA.b !sprite_speed_y_w,x
; CODE_02AFE1:        95 AA         STA RAM_SpriteSpeedY,X    
org $02AFE1
STA.b !sprite_speed_y_w,x
; CODE_02B1B5:        95 AA         STA RAM_SpriteSpeedY,X    
org $02B1B5
STA.b !sprite_speed_y_w,x
; CODE_02B1EC:        95 AA         STA RAM_SpriteSpeedY,X    
org $02B1EC
STA.b !sprite_speed_y_w,x
; CODE_02B2B2:        95 AA         STA RAM_SpriteSpeedY,X    
org $02B2B2
STA.b !sprite_speed_y_w,x
; CODE_02B69F:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02B69F
INC.b !sprite_speed_y_w,x
; CODE_02B6A1:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02B6A1
INC.b !sprite_speed_y_w,x
; CODE_02B6DD:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02B6DD
LDA.b !sprite_speed_y_w,x
; CODE_02B6E6:        95 AA         STA RAM_SpriteSpeedY,X    
org $02B6E6
STA.b !sprite_speed_y_w,x
; CODE_02B6F3:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02B6F3
STZ.b !sprite_speed_y_w,x
; CODE_02B86B:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $02B86B
STA.w !sprite_speed_y_w,y
; CODE_02B8AE:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $02B8AE
STA.b !sprite_speed_y_w,x
; CODE_02B8B5:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $02B8B5
STA.b !sprite_speed_y_w,x
; CODE_02B8D8:        B5 AA         LDA RAM_SpriteSpeedY,X    ; \ If sprite has Y speed... 
org $02B8D8
LDA.b !sprite_speed_y_w,x
; CODE_02B8E2:        D6 AA         DEC RAM_SpriteSpeedY,X    ; / 
org $02B8E2
DEC.b !sprite_speed_y_w,x
; CODE_02B9F5:        9D AA 00      STA.W RAM_SpriteSpeedY,X  
org $02B9F5
STA.w !sprite_speed_y_w,x
; CODE_02BBAD:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02BBAD
LDA.b !sprite_speed_y_w,x
; CODE_02BBB5:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02BBB5
INC.b !sprite_speed_y_w,x
; CODE_02BBC1:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02BBC1
LDA.b !sprite_speed_y_w,x
; CODE_02BBCA:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02BBCA
LDA.b !sprite_speed_y_w,x
; CODE_02BBD1:        95 AA         STA RAM_SpriteSpeedY,X    
org $02BBD1
STA.b !sprite_speed_y_w,x
; CODE_02BBD5:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02BBD5
STZ.b !sprite_speed_y_w,x
; CODE_02BBF9:        95 AA         STA RAM_SpriteSpeedY,X    
org $02BBF9
STA.b !sprite_speed_y_w,x
; CODE_02BD98:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02BD98
LDA.b !sprite_speed_y_w,x
; CODE_02BD9D:        95 AA         STA RAM_SpriteSpeedY,X    
org $02BD9D
STA.b !sprite_speed_y_w,x
; CODE_02BDBD:        95 AA         STA RAM_SpriteSpeedY,X    
org $02BDBD
STA.b !sprite_speed_y_w,x
; CODE_02BE34:        95 AA         STA RAM_SpriteSpeedY,X    
org $02BE34
STA.b !sprite_speed_y_w,x
; CODE_02BE43:        16 AA         ASL RAM_SpriteSpeedY,X    
org $02BE43
ASL.b !sprite_speed_y_w,x
; CODE_02BFDF:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02BFDF
LDA.b !sprite_speed_y_w,x
; CODE_02BFEA:        95 AA         STA RAM_SpriteSpeedY,X    
org $02BFEA
STA.b !sprite_speed_y_w,x
; CODE_02C001:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C001
STA.b !sprite_speed_y_w,x
; CODE_02C019:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02C019
STZ.b !sprite_speed_y_w,x
; ADDR_02C022:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C022
STA.b !sprite_speed_y_w,x
; CODE_02C030:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C030
STA.b !sprite_speed_y_w,x
; CODE_02C04B:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02C04B
STZ.b !sprite_speed_y_w,x
; CODE_02C0AE:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02C0AE
LDA.b !sprite_speed_y_w,x
; CODE_02C0B9:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C0B9
STA.b !sprite_speed_y_w,x
; CODE_02C1EA:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $02C1EA
STA.w !sprite_speed_y_w,y
; CODE_02C244:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02C244
LDA.b !sprite_speed_y_w,x
; CODE_02C272:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C272
STA.b !sprite_speed_y_w,x
; CODE_02C2ED:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C2ED
STA.b !sprite_speed_y_w,x
; CODE_02C30B:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02C30B
LDA.b !sprite_speed_y_w,x
; CODE_02C334:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C334
STA.b !sprite_speed_y_w,x
; CODE_02C3DD:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C3DD
STA.b !sprite_speed_y_w,x
; CODE_02C448:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02C448
STZ.b !sprite_speed_y_w,x
; CODE_02C4E8:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $02C4E8
LDY.b !sprite_speed_y_w,x
; CODE_02C522:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C522
STA.b !sprite_speed_y_w,x
; CODE_02C531:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C531
STA.b !sprite_speed_y_w,x
; CODE_02C57B:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02C57B
STZ.b !sprite_speed_y_w,x
; CODE_02C59E:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C59E
STA.b !sprite_speed_y_w,x
; CODE_02C5F4:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $02C5F4
STA.w !sprite_speed_y_w,y
; CODE_02C625:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C625
STA.b !sprite_speed_y_w,x
; CODE_02C7AF:        95 AA         STA RAM_SpriteSpeedY,X    
org $02C7AF
STA.b !sprite_speed_y_w,x
; CODE_02C7F2:        74 AA         STZ RAM_SpriteSpeedY,X    ;  | Sprite Y Speed = 0 
org $02C7F2
STZ.b !sprite_speed_y_w,x
; CODE_02D271:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02D271
LDA.b !sprite_speed_y_w,x
; CODE_02D279:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02D279
INC.b !sprite_speed_y_w,x
; CODE_02D27B:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02D27B
INC.b !sprite_speed_y_w,x
; CODE_02D27D:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $02D27D
DEC.b !sprite_speed_y_w,x
; CODE_02D283:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02D283
LDA.b !sprite_speed_y_w,x
; CODE_02D2A5:        B5 AA         LDA RAM_SpriteSpeedY,X    ; \ Amount to move sprite = speed / 16 
org $02D2A5
LDA.b !sprite_speed_y_w,x
; CODE_02D442:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02D442
STZ.b !sprite_speed_y_w,x
; CODE_02D44C:        95 AA         STA RAM_SpriteSpeedY,X    
org $02D44C
STA.b !sprite_speed_y_w,x
; CODE_02D458:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02D458
LDA.b !sprite_speed_y_w,x
; CODE_02D463:        95 AA         STA RAM_SpriteSpeedY,X    
org $02D463
STA.b !sprite_speed_y_w,x
; CODE_02D48B:        95 AA         STA RAM_SpriteSpeedY,X    
org $02D48B
STA.b !sprite_speed_y_w,x
; CODE_02D4DE:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02D4DE
LDA.b !sprite_speed_y_w,x
; CODE_02D948:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02D948
LDA.b !sprite_speed_y_w,x
; CODE_02D94E:        95 AA         STA RAM_SpriteSpeedY,X    
org $02D94E
STA.b !sprite_speed_y_w,x
; CODE_02DBC7:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02DBC7
LDA.b !sprite_speed_y_w,x
; CODE_02DBCD:        95 AA         STA RAM_SpriteSpeedY,X    
org $02DBCD
STA.b !sprite_speed_y_w,x
; CODE_02DC04:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $02DC04
STA.w !sprite_speed_y_w,y
; CODE_02DCD7:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02DCD7
STZ.b !sprite_speed_y_w,x
; CODE_02DEB7:        95 AA         STA RAM_SpriteSpeedY,X    
org $02DEB7
STA.b !sprite_speed_y_w,x
; CODE_02DFA7:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02DFA7
LDA.b !sprite_speed_y_w,x
; CODE_02DFAD:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02DFAD
INC.b !sprite_speed_y_w,x
; CODE_02DFBA:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02DFBA
STZ.b !sprite_speed_y_w,x
; CODE_02E13C:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02E13C
STZ.b !sprite_speed_y_w,x
; CODE_02E151:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E151
STA.b !sprite_speed_y_w,x
; CODE_02E159:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E159
LDA.b !sprite_speed_y_w,x
; CODE_02E164:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E164
STA.b !sprite_speed_y_w,x
; CODE_02E169:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E169
LDA.b !sprite_speed_y_w,x
; CODE_02E188:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E188
LDA.b !sprite_speed_y_w,x
; CODE_02E18F:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E18F
STA.b !sprite_speed_y_w,x
; CODE_02E292:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E292
STA.b !sprite_speed_y_w,x
; CODE_02E335:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E335
LDA.b !sprite_speed_y_w,x
; CODE_02E33B:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E33B
STA.b !sprite_speed_y_w,x
; CODE_02E46D:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E46D
STA.b !sprite_speed_y_w,x
; CODE_02E52A:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E52A
LDA.b !sprite_speed_y_w,x
; CODE_02E52E:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E52E
LDA.b !sprite_speed_y_w,x
; CODE_02E562:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E562
STA.b !sprite_speed_y_w,x
; CODE_02E785:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E785
STA.b !sprite_speed_y_w,x
; CODE_02E796:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E796
LDA.b !sprite_speed_y_w,x
; CODE_02E7A1:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E7A1
STA.b !sprite_speed_y_w,x
; CODE_02E806:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E806
STA.b !sprite_speed_y_w,x
; CODE_02E80F:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02E80F
LDA.b !sprite_speed_y_w,x
; CODE_02E819:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E819
STA.b !sprite_speed_y_w,x
; CODE_02E8A5:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E8A5
STA.b !sprite_speed_y_w,x
; CODE_02E99C:        95 AA         STA RAM_SpriteSpeedY,X    
org $02E99C
STA.b !sprite_speed_y_w,x
; CODE_02EB24:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EB24
STA.b !sprite_speed_y_w,x
; CODE_02EB71:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02EB71
LDA.b !sprite_speed_y_w,x
; CODE_02EB7A:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EB7A
STA.b !sprite_speed_y_w,x
; CODE_02EBCE:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EBCE
STA.b !sprite_speed_y_w,x
; CODE_02EBD1:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02EBD1
LDA.b !sprite_speed_y_w,x
; CODE_02EBD6:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EBD6
STA.b !sprite_speed_y_w,x
; CODE_02EBEF:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02EBEF
LDA.b !sprite_speed_y_w,x
; CODE_02EBF6:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EBF6
STA.b !sprite_speed_y_w,x
; CODE_02EE3E:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02EE3E
LDA.b !sprite_speed_y_w,x
; CODE_02EE46:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EE46
STA.b !sprite_speed_y_w,x
; CODE_02EE55:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EE55
STA.b !sprite_speed_y_w,x
; ADDR_02EF05:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02EF05
LDA.b !sprite_speed_y_w,x
; ADDR_02EF10:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EF10
STA.b !sprite_speed_y_w,x
; ADDR_02EFA3:        95 AA         STA RAM_SpriteSpeedY,X    
org $02EFA3
STA.b !sprite_speed_y_w,x
; CODE_02F095:        F6 AA         INC RAM_SpriteSpeedY,X    
org $02F095
INC.b !sprite_speed_y_w,x
; ADDR_02F2A4:        95 AA         STA RAM_SpriteSpeedY,X    
org $02F2A4
STA.b !sprite_speed_y_w,x
; CODE_02F32A:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02F32A
LDA.b !sprite_speed_y_w,x
; CODE_02F32F:        95 AA         STA RAM_SpriteSpeedY,X    
org $02F32F
STA.b !sprite_speed_y_w,x
; CODE_02F34D:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $02F34D
LDA.b !sprite_speed_y_w,x
; CODE_02F35D:        95 AA         STA RAM_SpriteSpeedY,X    
org $02F35D
STA.b !sprite_speed_y_w,x
; CODE_02F38F:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $02F38F
STZ.b !sprite_speed_y_w,x
; CODE_02F446:        95 AA         STA RAM_SpriteSpeedY,X    
org $02F446
STA.b !sprite_speed_y_w,x
; CODE_02FFDF:        95 AA         STA RAM_SpriteSpeedY,X    
org $02FFDF
STA.b !sprite_speed_y_w,x
; CODE_038046:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $038046
STZ.b !sprite_speed_y_w,x
; CODE_038066:        95 AA         STA RAM_SpriteSpeedY,X    
org $038066
STA.b !sprite_speed_y_w,x
; CODE_038172:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038172
LDA.b !sprite_speed_y_w,x
; CODE_038178:        95 AA         STA RAM_SpriteSpeedY,X    
org $038178
STA.b !sprite_speed_y_w,x
; CODE_0381DC:        95 AA         STA RAM_SpriteSpeedY,X    
org $0381DC
STA.b !sprite_speed_y_w,x
; CODE_03845E:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03845E
LDA.b !sprite_speed_y_w,x
; CODE_038467:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038467
LDA.b !sprite_speed_y_w,x
; CODE_038470:        95 AA         STA RAM_SpriteSpeedY,X    
org $038470
STA.b !sprite_speed_y_w,x
; CODE_03847C:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03847C
LDA.b !sprite_speed_y_w,x
; CODE_038482:        95 AA         STA RAM_SpriteSpeedY,X    
org $038482
STA.b !sprite_speed_y_w,x
; CODE_038507:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038507
LDA.b !sprite_speed_y_w,x
; CODE_03850D:        95 AA         STA RAM_SpriteSpeedY,X    
org $03850D
STA.b !sprite_speed_y_w,x
; CODE_038580:        94 AA         STY RAM_SpriteSpeedY,X    
org $038580
STY.b !sprite_speed_y_w,x
; CODE_038627:        95 AA         STA RAM_SpriteSpeedY,X    
org $038627
STA.b !sprite_speed_y_w,x
; CODE_038629:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038629
LDA.b !sprite_speed_y_w,x
; CODE_038634:        95 AA         STA RAM_SpriteSpeedY,X    
org $038634
STA.b !sprite_speed_y_w,x
; CODE_03863B:        95 AA         STA RAM_SpriteSpeedY,X    
org $03863B
STA.b !sprite_speed_y_w,x
; CODE_03872C:        95 AA         STA RAM_SpriteSpeedY,X    
org $03872C
STA.b !sprite_speed_y_w,x
; CODE_03879E:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03879E
STZ.b !sprite_speed_y_w,x
; CODE_0387B0:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $0387B0
STZ.b !sprite_speed_y_w,x
; CODE_0388FD:        95 AA         STA RAM_SpriteSpeedY,X    
org $0388FD
STA.b !sprite_speed_y_w,x
; CODE_03890B:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03890B
LDA.b !sprite_speed_y_w,x
; CODE_03890F:        D6 AA         DEC RAM_SpriteSpeedY,X    
org $03890F
DEC.b !sprite_speed_y_w,x
; CODE_038942:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038942
LDA.b !sprite_speed_y_w,x
; CODE_038948:        95 AA         STA RAM_SpriteSpeedY,X    
org $038948
STA.b !sprite_speed_y_w,x
; CODE_0389CC:        94 AA         STY RAM_SpriteSpeedY,X    
org $0389CC
STY.b !sprite_speed_y_w,x
; CODE_038A66:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $038A66
STZ.b !sprite_speed_y_w,x
; CODE_038A76:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038A76
LDA.b !sprite_speed_y_w,x
; CODE_038AA2:        95 AA         STA RAM_SpriteSpeedY,X    
org $038AA2
STA.b !sprite_speed_y_w,x
; CODE_038AB0:        95 AA         STA RAM_SpriteSpeedY,X    
org $038AB0
STA.b !sprite_speed_y_w,x
; CODE_038C5A:        95 AA         STA RAM_SpriteSpeedY,X    
org $038C5A
STA.b !sprite_speed_y_w,x
; CODE_038FE3:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $038FE3
LDA.b !sprite_speed_y_w,x
; CODE_038FE8:        95 AA         STA RAM_SpriteSpeedY,X    
org $038FE8
STA.b !sprite_speed_y_w,x
; CODE_039005:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $039005
LDY.b !sprite_speed_y_w,x
; CODE_0390BA:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $0390BA
LDA.b !sprite_speed_y_w,x
; CODE_0390C0:        95 AA         STA RAM_SpriteSpeedY,X    
org $0390C0
STA.b !sprite_speed_y_w,x
; CODE_03924C:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03924C
STZ.b !sprite_speed_y_w,x
; CODE_03926C:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03926C
STZ.b !sprite_speed_y_w,x
; CODE_0392CC:        95 AA         STA RAM_SpriteSpeedY,X    
org $0392CC
STA.b !sprite_speed_y_w,x
; CODE_039335:        95 AA         STA RAM_SpriteSpeedY,X    
org $039335
STA.b !sprite_speed_y_w,x
; CODE_039343:        95 AA         STA RAM_SpriteSpeedY,X    
org $039343
STA.b !sprite_speed_y_w,x
; CODE_03947D:        95 AA         STA RAM_SpriteSpeedY,X    
org $03947D
STA.b !sprite_speed_y_w,x
; CODE_039559:        95 AA         STA RAM_SpriteSpeedY,X    ; /						    
org $039559
STA.b !sprite_speed_y_w,x
; ADDR_0395F9:        95 AA         STA RAM_SpriteSpeedY,X    ; /								   
org $0395F9
STA.b !sprite_speed_y_w,x
; CODE_039AF4:        95 AA         STA RAM_SpriteSpeedY,X    ; /												   
org $039AF4
STA.b !sprite_speed_y_w,x
; CODE_039C74:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $039C74
LDA.b !sprite_speed_y_w,x
; CODE_039CDC:        95 AA         STA RAM_SpriteSpeedY,X    
org $039CDC
STA.b !sprite_speed_y_w,x
; CODE_039CFA:        95 AA         STA RAM_SpriteSpeedY,X    
org $039CFA
STA.b !sprite_speed_y_w,x
; CODE_039F6D:        95 AA         STA RAM_SpriteSpeedY,X    
org $039F6D
STA.b !sprite_speed_y_w,x
; CODE_039F8B:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $039F8B
LDA.b !sprite_speed_y_w,x
; CODE_039F98:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $039F98
STZ.b !sprite_speed_y_w,x
; CODE_039F9F:        F6 AA         INC RAM_SpriteSpeedY,X    
org $039F9F
INC.b !sprite_speed_y_w,x
; CODE_039FA1:        F6 AA         INC RAM_SpriteSpeedY,X    
org $039FA1
INC.b !sprite_speed_y_w,x
; CODE_039FCF:        95 AA         STA RAM_SpriteSpeedY,X    
org $039FCF
STA.b !sprite_speed_y_w,x
; CODE_039FE5:        95 AA         STA RAM_SpriteSpeedY,X    
org $039FE5
STA.b !sprite_speed_y_w,x
; CODE_03A010:        F6 AA         INC RAM_SpriteSpeedY,X    
org $03A010
INC.b !sprite_speed_y_w,x
; CODE_03A012:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03A012
LDA.b !sprite_speed_y_w,x
; CODE_03A038:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03A038
LDA.b !sprite_speed_y_w,x
; CODE_03A452:        95 AA         STA RAM_SpriteSpeedY,X    
org $03A452
STA.b !sprite_speed_y_w,x
; CODE_03A465:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03A465
STZ.b !sprite_speed_y_w,x
; CODE_03A4C1:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03A4C1
LDA.b !sprite_speed_y_w,x
; CODE_03A4C7:        95 AA         STA RAM_SpriteSpeedY,X    
org $03A4C7
STA.b !sprite_speed_y_w,x
; CODE_03A713:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03A713
STZ.b !sprite_speed_y_w,x
; CODE_03A75D:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03A75D
LDA.b !sprite_speed_y_w,x
; CODE_03A763:        95 AA         STA RAM_SpriteSpeedY,X    
org $03A763
STA.b !sprite_speed_y_w,x
; CODE_03A84B:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03A84B
STZ.b !sprite_speed_y_w,x
; CODE_03A879:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03A879
STZ.b !sprite_speed_y_w,x
; CODE_03A8A6:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03A8A6
STZ.b !sprite_speed_y_w,x
; CODE_03A91A:        95 AA         STA RAM_SpriteSpeedY,X    
org $03A91A
STA.b !sprite_speed_y_w,x
; CODE_03AB54:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03AB54
LDA.b !sprite_speed_y_w,x
; CODE_03AB5F:        95 AA         STA RAM_SpriteSpeedY,X    
org $03AB5F
STA.b !sprite_speed_y_w,x
; CODE_03AB72:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03AB72
LDA.b !sprite_speed_y_w,x
; CODE_03AB77:        95 AA         STA RAM_SpriteSpeedY,X    
org $03AB77
STA.b !sprite_speed_y_w,x
; CODE_03AB8A:        95 AA         STA RAM_SpriteSpeedY,X    
org $03AB8A
STA.b !sprite_speed_y_w,x
; CODE_03ABBB:        95 AA         STA RAM_SpriteSpeedY,X    
org $03ABBB
STA.b !sprite_speed_y_w,x
; CODE_03ABC3:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03ABC3
STZ.b !sprite_speed_y_w,x
; CODE_03AC2D:        95 AA         STA RAM_SpriteSpeedY,X    
org $03AC2D
STA.b !sprite_speed_y_w,x
; CODE_03AD40:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03AD40
LDA.b !sprite_speed_y_w,x
; CODE_03AD49:        95 AA         STA RAM_SpriteSpeedY,X    
org $03AD49
STA.b !sprite_speed_y_w,x
; CODE_03AD5A:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03AD5A
STZ.b !sprite_speed_y_w,x
; CODE_03B070:        95 AA         STA RAM_SpriteSpeedY,X    
org $03B070
STA.b !sprite_speed_y_w,x
; CODE_03B14A:        B9 AA 00      LDA.W RAM_SpriteSpeedY,Y  
org $03B14A
LDA.w !sprite_speed_y_w,y
; CODE_03B152:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $03B152
STA.w !sprite_speed_y_w,y
; CODE_03B179:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03B179
LDA.b !sprite_speed_y_w,x
; CODE_03B182:        95 AA         STA RAM_SpriteSpeedY,X    
org $03B182
STA.b !sprite_speed_y_w,x
; CODE_03B188:        95 AA         STA RAM_SpriteSpeedY,X    
org $03B188
STA.b !sprite_speed_y_w,x
; CODE_03B18A:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03B18A
LDA.b !sprite_speed_y_w,x
; CODE_03B19D:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03B19D
LDA.b !sprite_speed_y_w,x
; CODE_03B2CA:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03B2CA
STZ.b !sprite_speed_y_w,x
; CODE_03B7F8:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03B7F8
LDA.b !sprite_speed_y_w,x
; CODE_03B7FB:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03B7FB
STZ.b !sprite_speed_y_w,x
; CODE_03B814:        95 AA         STA RAM_SpriteSpeedY,X    
org $03B814
STA.b !sprite_speed_y_w,x
; CODE_03C1E8:        95 AA         STA RAM_SpriteSpeedY,X    
org $03C1E8
STA.b !sprite_speed_y_w,x
; CODE_03C340:        95 AA         STA RAM_SpriteSpeedY,X    ; / 
org $03C340
STA.b !sprite_speed_y_w,x
; CODE_03C36D:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03C36D
STZ.b !sprite_speed_y_w,x
; CODE_03C383:        95 AA         STA RAM_SpriteSpeedY,X    
org $03C383
STA.b !sprite_speed_y_w,x
; CODE_03C387:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $03C387
LDY.b !sprite_speed_y_w,x
; CODE_03C82E:        95 AA         STA RAM_SpriteSpeedY,X    
org $03C82E
STA.b !sprite_speed_y_w,x
; CODE_03C867:        F6 AA         INC RAM_SpriteSpeedY,X    
org $03C867
INC.b !sprite_speed_y_w,x
; CODE_03C869:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03C869
LDA.b !sprite_speed_y_w,x
; CODE_03C8E2:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03C8E2
STZ.b !sprite_speed_y_w,x
; CODE_03C947:        F6 AA         INC RAM_SpriteSpeedY,X    
org $03C947
INC.b !sprite_speed_y_w,x
; CODE_03C94F:        B4 AA         LDY RAM_SpriteSpeedY,X    
org $03C94F
LDY.b !sprite_speed_y_w,x
; CODE_03CBFF:        99 AA 00      STA.W RAM_SpriteSpeedY,Y  
org $03CBFF
STA.w !sprite_speed_y_w,y
; CODE_03CD30:        95 AA         STA RAM_SpriteSpeedY,X    
org $03CD30
STA.b !sprite_speed_y_w,x
; CODE_03CE07:        95 AA         STA RAM_SpriteSpeedY,X    
org $03CE07
STA.b !sprite_speed_y_w,x
; CODE_03CE22:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $03CE22
STZ.b !sprite_speed_y_w,x
; CODE_03CE5E:        B5 AA         LDA RAM_SpriteSpeedY,X    
org $03CE5E
LDA.b !sprite_speed_y_w,x
; CODE_03CE67:        95 AA         STA RAM_SpriteSpeedY,X    
org $03CE67
STA.b !sprite_speed_y_w,x
; CODE_03CEA0:        95 AA         STA RAM_SpriteSpeedY,X    
org $03CEA0
STA.b !sprite_speed_y_w,x
; CODE_07F759:        74 AA         STZ RAM_SpriteSpeedY,X    ; Sprite Y Speed = 0 
org $07F759
STZ.b !sprite_speed_y_w,x

; Sprite X speed remapping

; CODE_00FB75:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $00FB75
STA.w !sprite_speed_x_w,y
; ADDR_00FC6F:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $00FC6F
STA.w !sprite_speed_x_w,y
; CODE_018354:        95 B6         STA RAM_SpriteSpeedX,X    
org $018354
STA.b !sprite_speed_x_w,x
; CODE_01842A:        95 B6         STA RAM_SpriteSpeedX,X    
org $01842A
STA.b !sprite_speed_x_w,x
; CODE_018925:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $018925
STZ.b !sprite_speed_x_w,x
; CODE_018995:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $018995
STA.w !sprite_speed_x_w,y
; CODE_0189BE:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $0189BE
STZ.b !sprite_speed_x_w,x
; CODE_0189D0:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0189D0
LDA.b !sprite_speed_x_w,x
; CODE_0189E1:        95 B6         STA RAM_SpriteSpeedX,X    
org $0189E1
STA.b !sprite_speed_x_w,x
; CODE_018A33:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $018A33
STA.w !sprite_speed_x_w,y
; CODE_018A36:        95 B6         STA RAM_SpriteSpeedX,X    
org $018A36
STA.b !sprite_speed_x_w,x
; CODE_018A48:        B9 B6 00      LDA.W RAM_SpriteSpeedX,Y  
org $018A48
LDA.w !sprite_speed_x_w,y
; CODE_018A5A:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $018A5A
STA.w !sprite_speed_x_w,y
; CODE_018A5D:        95 B6         STA RAM_SpriteSpeedX,X    
org $018A5D
STA.b !sprite_speed_x_w,x
; CODE_018A6B:        95 B6         STA RAM_SpriteSpeedX,X    
org $018A6B
STA.b !sprite_speed_x_w,x
; CODE_018A6D:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $018A6D
STA.w !sprite_speed_x_w,y
; CODE_018B2C:        95 B6         STA RAM_SpriteSpeedX,X    ; / 
org $018B2C
STA.b !sprite_speed_x_w,x
; CODE_018B3A:        74 B6         STZ RAM_SpriteSpeedX,X    ; / ...Sprite X Speed = 0 
org $018B3A
STZ.b !sprite_speed_x_w,x
; CODE_018C64:        95 B6         STA RAM_SpriteSpeedX,X    
org $018C64
STA.b !sprite_speed_x_w,x
; ADDR_018C6F:        74 B6         STZ RAM_SpriteSpeedX,X    ; / Sprite X Speed = 0 
org $018C6F
STZ.b !sprite_speed_x_w,x
; CODE_018D10:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $018D10
LDA.b !sprite_speed_x_w,x
; CODE_018D18:        95 B6         STA RAM_SpriteSpeedX,X    
org $018D18
STA.b !sprite_speed_x_w,x
; CODE_018DC4:        95 B6         STA RAM_SpriteSpeedX,X    
org $018DC4
STA.b !sprite_speed_x_w,x
; CODE_018F1F:        16 B6         ASL RAM_SpriteSpeedX,X    
org $018F1F
ASL.b !sprite_speed_x_w,x
; CODE_018F26:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $018F26
STZ.b !sprite_speed_x_w,x
; CODE_019001:        95 B6         STA RAM_SpriteSpeedX,X    ; /
org $019001
STA.b !sprite_speed_x_w,x
; CODE_01905D:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01905D
LDA.b !sprite_speed_x_w,x
; CODE_019066:        76 B6         ROR RAM_SpriteSpeedX,X    
org $019066
ROR.b !sprite_speed_x_w,x
; CODE_019068:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $019068
LDA.b !sprite_speed_x_w,x
; CODE_019074:        95 B6         STA RAM_SpriteSpeedX,X    
org $019074
STA.b !sprite_speed_x_w,x
; CODE_01907A:        95 B6         STA RAM_SpriteSpeedX,X    
org $01907A
STA.b !sprite_speed_x_w,x
; CODE_0190A2:        B5 B6         LDA RAM_SpriteSpeedX,X    ; \ Invert speed 
org $0190A2
LDA.b !sprite_speed_x_w,x
; CODE_0190A7:        95 B6         STA RAM_SpriteSpeedX,X    ; / 
org $0190A7
STA.b !sprite_speed_x_w,x
; CODE_0191E1:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0191E1
LDA.b !sprite_speed_x_w,x
; CODE_019277:        B5 B6         LDA RAM_SpriteSpeedX,X    ; \ Branch if sprite has X speed... 
org $019277
LDA.b !sprite_speed_x_w,x
; CODE_019288:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $019288
LDA.b !sprite_speed_x_w,x
; CODE_019375:        55 B6         EOR RAM_SpriteSpeedX,X    
org $019375
EOR.b !sprite_speed_x_w,x
; CODE_019379:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $019379
LDA.b !sprite_speed_x_w,x
; CODE_0195E9:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0195E9
LDA.b !sprite_speed_x_w,x
; CODE_0195ED:        76 B6         ROR RAM_SpriteSpeedX,X    
org $0195ED
ROR.b !sprite_speed_x_w,x
; CODE_0195F0:        76 B6         ROR RAM_SpriteSpeedX,X    
org $0195F0
ROR.b !sprite_speed_x_w,x
; CODE_019742:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  ;  | 
org $019742
STA.w !sprite_speed_x_w,y
; CODE_019751:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $019751
STA.w !sprite_speed_x_w,y
; CODE_0197D5:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0197D5
LDA.b !sprite_speed_x_w,x
; CODE_0197E4:        95 B6         STA RAM_SpriteSpeedX,X    
org $0197E4
STA.b !sprite_speed_x_w,x
; CODE_0198BD:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0198BD
LDA.b !sprite_speed_x_w,x
; CODE_0198CA:        F6 B6         INC RAM_SpriteSpeedX,X    
org $0198CA
INC.b !sprite_speed_x_w,x
; CODE_0198CC:        F6 B6         INC RAM_SpriteSpeedX,X    
org $0198CC
INC.b !sprite_speed_x_w,x
; CODE_0198D4:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $0198D4
DEC.b !sprite_speed_x_w,x
; CODE_0198D6:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $0198D6
DEC.b !sprite_speed_x_w,x
; CODE_0198E8:        95 B6         STA RAM_SpriteSpeedX,X    
org $0198E8
STA.b !sprite_speed_x_w,x
; CODE_01992D:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01992D
LDA.b !sprite_speed_x_w,x
; CODE_01995F:        55 B6         EOR RAM_SpriteSpeedX,X    
org $01995F
EOR.b !sprite_speed_x_w,x
; CODE_019A17:        B4 B6         LDY RAM_SpriteSpeedX,X    ;  | 
org $019A17
LDY.b !sprite_speed_x_w,x
; CODE_019A8A:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $019A8A
LDA.b !sprite_speed_x_w,x
; CODE_019A90:        F6 B6         INC RAM_SpriteSpeedX,X    
org $019A90
INC.b !sprite_speed_x_w,x
; CODE_019A94:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $019A94
DEC.b !sprite_speed_x_w,x
; CODE_019A9B:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $019A9B
STZ.b !sprite_speed_x_w,x
; CODE_019AFC:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $019AFC
STZ.b !sprite_speed_x_w,x
; CODE_01A062:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A062
STA.b !sprite_speed_x_w,x
; CODE_01A072:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A072
STA.b !sprite_speed_x_w,x
; CODE_01A075:        76 B6         ROR RAM_SpriteSpeedX,X    
org $01A075
ROR.b !sprite_speed_x_w,x
; CODE_01A093:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A093
STA.b !sprite_speed_x_w,x
; CODE_01A0A4:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A0A4
STA.b !sprite_speed_x_w,x
; CODE_01A5EF:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01A5EF
LDA.b !sprite_speed_x_w,x
; CODE_01A5F8:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $01A5F8
STA.w !sprite_speed_x_w,y
; CODE_01A674:        B9 B6 00      LDA.W RAM_SpriteSpeedX,Y  
org $01A674
LDA.w !sprite_speed_x_w,y
; CODE_01A67E:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A67E
STA.b !sprite_speed_x_w,x
; CODE_01A6C5:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01A6C5
LDA.b !sprite_speed_x_w,x
; CODE_01A6CE:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A6CE
STA.b !sprite_speed_x_w,x
; CODE_01A6D3:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $01A6D3
STA.w !sprite_speed_x_w,y
; CODE_01A87A:        95 B6         STA RAM_SpriteSpeedX,X    
org $01A87A
STA.b !sprite_speed_x_w,x
; CODE_01A9DD:        74 B6         STZ RAM_SpriteSpeedX,X    ; \ Sprite Speed = 0 
org $01A9DD
STZ.b !sprite_speed_x_w,x
; CODE_01A9EE:        74 B6         STZ RAM_SpriteSpeedX,X    ; \ Sprite Speed = 0 
org $01A9EE
STZ.b !sprite_speed_x_w,x
; CODE_01AAAF:        95 B6         STA RAM_SpriteSpeedX,X    
org $01AAAF
STA.b !sprite_speed_x_w,x
; CODE_01ADD1:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01ADD1
LDA.b !sprite_speed_x_w,x
; CODE_01ADD7:        95 B6         STA RAM_SpriteSpeedX,X    
org $01ADD7
STA.b !sprite_speed_x_w,x
; CODE_01ADEA:        95 B6         STA RAM_SpriteSpeedX,X    
org $01ADEA
STA.b !sprite_speed_x_w,x
; CODE_01AFDD:        74 B6         STZ RAM_SpriteSpeedX,X    ; \ Sprite Speed = 0 
org $01AFDD
STZ.b !sprite_speed_x_w,x
; CODE_01AFF8:        95 B6         STA RAM_SpriteSpeedX,X    
org $01AFF8
STA.b !sprite_speed_x_w,x
; CODE_01B01A:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B01A
STA.b !sprite_speed_x_w,x
; CODE_01B06E:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B06E
STA.b !sprite_speed_x_w,x
; CODE_01B0D9:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B0D9
STA.b !sprite_speed_x_w,x
; CODE_01B13A:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B13A
STA.b !sprite_speed_x_w,x
; CODE_01B227:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B227
STA.b !sprite_speed_x_w,x
; CODE_01B28E:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B28E
STA.b !sprite_speed_x_w,x
; ADDR_01B556:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B556
STA.b !sprite_speed_x_w,x
; CODE_01B944:        95 B6         STA RAM_SpriteSpeedX,X    
org $01B944
STA.b !sprite_speed_x_w,x
; CODE_01B94A:        F6 B6         INC RAM_SpriteSpeedX,X    
org $01B94A
INC.b !sprite_speed_x_w,x
; CODE_01B964:        16 B6         ASL RAM_SpriteSpeedX,X    
org $01B964
ASL.b !sprite_speed_x_w,x
; CODE_01BE40:        95 B6         STA RAM_SpriteSpeedX,X    
org $01BE40
STA.b !sprite_speed_x_w,x
; CODE_01BF66:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $01BF66
STA.w !sprite_speed_x_w,y
; CODE_01C23B:        95 B6         STA RAM_SpriteSpeedX,X    
org $01C23B
STA.b !sprite_speed_x_w,x
; CODE_01C2FD:        95 B6         STA RAM_SpriteSpeedX,X    
org $01C2FD
STA.b !sprite_speed_x_w,x
; CODE_01C3D0:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $01C3D0
STZ.b !sprite_speed_x_w,x
; CODE_01C3DF:        16 B6         ASL RAM_SpriteSpeedX,X    
org $01C3DF
ASL.b !sprite_speed_x_w,x
; ADDR_01C402:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $01C402
STZ.b !sprite_speed_x_w,x
; CODE_01C71B:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01C71B
LDA.b !sprite_speed_x_w,x
; CODE_01C721:        95 B6         STA RAM_SpriteSpeedX,X    
org $01C721
STA.b !sprite_speed_x_w,x
; CODE_01C72B:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01C72B
LDA.b !sprite_speed_x_w,x
; CODE_01CEDF:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01CEDF
LDA.b !sprite_speed_x_w,x
; CODE_01CEEA:        95 B6         STA RAM_SpriteSpeedX,X    
org $01CEEA
STA.b !sprite_speed_x_w,x
; CODE_01CF08:        95 B6         STA RAM_SpriteSpeedX,X    
org $01CF08
STA.b !sprite_speed_x_w,x
; CODE_01CF0F:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01CF0F
LDA.b !sprite_speed_x_w,x
; CODE_01CF15:        F6 B6         INC RAM_SpriteSpeedX,X    
org $01CF15
INC.b !sprite_speed_x_w,x
; CODE_01CF17:        F6 B6         INC RAM_SpriteSpeedX,X    
org $01CF17
INC.b !sprite_speed_x_w,x
; CODE_01CF19:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $01CF19
DEC.b !sprite_speed_x_w,x
; CODE_01CF25:        74 B6         STZ RAM_SpriteSpeedX,X    ; \ Sprite Speed = 0 
org $01CF25
STZ.b !sprite_speed_x_w,x
; CODE_01CF4F:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01CF4F
LDA.b !sprite_speed_x_w,x
; CODE_01D0B4:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $01D0B4
STA.w !sprite_speed_x_w,y
; CODE_01D1EA:        95 B6         STA RAM_SpriteSpeedX,X    
org $01D1EA
STA.b !sprite_speed_x_w,x
; CODE_01D39D:        74 B6         STZ RAM_SpriteSpeedX,X    ; \ Sprite Speed = 0 
org $01D39D
STZ.b !sprite_speed_x_w,x
; CODE_01D53A:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01D53A
LDA.b !sprite_speed_x_w,x
; CODE_01D54C:        75 B6         ADC RAM_SpriteSpeedX,X    
org $01D54C
ADC.b !sprite_speed_x_w,x
; CODE_01D54E:        95 B6         STA RAM_SpriteSpeedX,X    
org $01D54E
STA.b !sprite_speed_x_w,x
; CODE_01D554:        95 B6         STA RAM_SpriteSpeedX,X    
org $01D554
STA.b !sprite_speed_x_w,x
; CODE_01D88D:        95 B6         STA RAM_SpriteSpeedX,X    
org $01D88D
STA.b !sprite_speed_x_w,x
; CODE_01DB81:        95 B6         STA RAM_SpriteSpeedX,X    
org $01DB81
STA.b !sprite_speed_x_w,x
; CODE_01DEA2:        95 B6         STA RAM_SpriteSpeedX,X    
org $01DEA2
STA.b !sprite_speed_x_w,x
; CODE_01E15F:        94 B6         STY RAM_SpriteSpeedX,X    
org $01E15F
STY.b !sprite_speed_x_w,x
; CODE_01E3AC:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01E3AC
LDA.b !sprite_speed_x_w,x
; CODE_01E3B7:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E3B7
STA.b !sprite_speed_x_w,x
; CODE_01E3BC:        55 B6         EOR RAM_SpriteSpeedX,X    
org $01E3BC
EOR.b !sprite_speed_x_w,x
; CODE_01E3D8:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E3D8
STA.b !sprite_speed_x_w,x
; CODE_01E4BD:        74 B6         STZ RAM_SpriteSpeedX,X    ; / 
org $01E4BD
STZ.b !sprite_speed_x_w,x
; CODE_01E4DD:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E4DD
STA.b !sprite_speed_x_w,x
; CODE_01E4ED:        74 B6         STZ RAM_SpriteSpeedX,X    
org $01E4ED
STZ.b !sprite_speed_x_w,x
; CODE_01E640:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01E640
LDA.b !sprite_speed_x_w,x
; CODE_01E644:        76 B6         ROR RAM_SpriteSpeedX,X    
org $01E644
ROR.b !sprite_speed_x_w,x
; CODE_01E647:        76 B6         ROR RAM_SpriteSpeedX,X    
org $01E647
ROR.b !sprite_speed_x_w,x
; CODE_01E83B:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E83B
STA.b !sprite_speed_x_w,x
; CODE_01E9C3:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01E9C3
LDA.b !sprite_speed_x_w,x
; CODE_01E9CE:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E9CE
STA.b !sprite_speed_x_w,x
; CODE_01E9E6:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01E9E6
LDA.b !sprite_speed_x_w,x
; CODE_01E9F5:        75 B6         ADC RAM_SpriteSpeedX,X    
org $01E9F5
ADC.b !sprite_speed_x_w,x
; CODE_01E9F7:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E9F7
STA.b !sprite_speed_x_w,x
; CODE_01E9FD:        95 B6         STA RAM_SpriteSpeedX,X    
org $01E9FD
STA.b !sprite_speed_x_w,x
; CODE_01EA60:        95 B6         STA RAM_SpriteSpeedX,X    
org $01EA60
STA.b !sprite_speed_x_w,x
; CODE_01ECCE:        95 B6         STA RAM_SpriteSpeedX,X    
org $01ECCE
STA.b !sprite_speed_x_w,x
; CODE_01ECFB:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $01ECFB
STZ.b !sprite_speed_x_w,x
; CODE_01EDAF:        95 B6         STA RAM_SpriteSpeedX,X    
org $01EDAF
STA.b !sprite_speed_x_w,x
; CODE_01F246:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $01F246
STA.w !sprite_speed_x_w,y
; CODE_01F51C:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $01F51C
STA.w !sprite_speed_x_w,y
; CODE_01F703:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01F703
LDA.b !sprite_speed_x_w,x
; CODE_01F735:        95 B6         STA RAM_SpriteSpeedX,X    
org $01F735
STA.b !sprite_speed_x_w,x
; CODE_01F882:        95 B6         STA RAM_SpriteSpeedX,X    
org $01F882
STA.b !sprite_speed_x_w,x
; CODE_01F959:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01F959
LDA.b !sprite_speed_x_w,x
; CODE_01F962:        95 B6         STA RAM_SpriteSpeedX,X    
org $01F962
STA.b !sprite_speed_x_w,x
; CODE_01F995:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01F995
LDA.b !sprite_speed_x_w,x
; CODE_01F9A0:        95 B6         STA RAM_SpriteSpeedX,X    
org $01F9A0
STA.b !sprite_speed_x_w,x
; CODE_01F9D4:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01F9D4
LDA.b !sprite_speed_x_w,x
; CODE_01FA87:        95 B6         STA RAM_SpriteSpeedX,X    
org $01FA87
STA.b !sprite_speed_x_w,x
; CODE_01FB9B:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $01FB9B
STZ.b !sprite_speed_x_w,x
; CODE_01FBEE:        95 B6         STA RAM_SpriteSpeedX,X    
org $01FBEE
STA.b !sprite_speed_x_w,x
; CODE_01FBF3:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $01FBF3
LDA.b !sprite_speed_x_w,x
; CODE_028174:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  ; / 
org $028174
STA.w !sprite_speed_x_w,y
; CODE_0294B8:        95 B6         STA RAM_SpriteSpeedX,X    
org $0294B8
STA.b !sprite_speed_x_w,x
; CODE_02A11A:        95 B6         STA RAM_SpriteSpeedX,X    ;  | 
org $02A11A
STA.b !sprite_speed_x_w,x
; CODE_02AFF7:        95 B6         STA RAM_SpriteSpeedX,X    
org $02AFF7
STA.b !sprite_speed_x_w,x
; CODE_02B1B1:        95 B6         STA RAM_SpriteSpeedX,X    
org $02B1B1
STA.b !sprite_speed_x_w,x
; CODE_02B2CA:        95 B6         STA RAM_SpriteSpeedX,X    
org $02B2CA
STA.b !sprite_speed_x_w,x
; CODE_02B379:        95 B6         STA RAM_SpriteSpeedX,X    
org $02B379
STA.b !sprite_speed_x_w,x
; CODE_02B6D5:        95 B6         STA RAM_SpriteSpeedX,X    
org $02B6D5
STA.b !sprite_speed_x_w,x
; CODE_02B85D:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02B85D
LDA.b !sprite_speed_x_w,x
; CODE_02B866:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $02B866
STA.w !sprite_speed_x_w,y
; CODE_02B8C5:        B5 B6         LDA RAM_SpriteSpeedX,X    ;  | 
org $02B8C5
LDA.b !sprite_speed_x_w,x
; CODE_02B8D0:        95 B6         STA RAM_SpriteSpeedX,X    ; / 
org $02B8D0
STA.b !sprite_speed_x_w,x
; CODE_02BBE8:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02BBE8
LDA.b !sprite_speed_x_w,x
; CODE_02BBEE:        95 B6         STA RAM_SpriteSpeedX,X    
org $02BBEE
STA.b !sprite_speed_x_w,x
; CODE_02BC20:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02BC20
LDA.b !sprite_speed_x_w,x
; CODE_02BD91:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02BD91
LDA.b !sprite_speed_x_w,x
; CODE_02BD96:        95 B6         STA RAM_SpriteSpeedX,X    
org $02BD96
STA.b !sprite_speed_x_w,x
; CODE_02BDC2:        95 B6         STA RAM_SpriteSpeedX,X    
org $02BDC2
STA.b !sprite_speed_x_w,x
; CODE_02BE39:        95 B6         STA RAM_SpriteSpeedX,X    
org $02BE39
STA.b !sprite_speed_x_w,x
; CODE_02BE41:        16 B6         ASL RAM_SpriteSpeedX,X    
org $02BE41
ASL.b !sprite_speed_x_w,x
; CODE_02BFDC:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02BFDC
LDA.b !sprite_speed_x_w,x
; CODE_02BFEC:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02BFEC
LDA.b !sprite_speed_x_w,x
; CODE_02BFF1:        95 B6         STA RAM_SpriteSpeedX,X    
org $02BFF1
STA.b !sprite_speed_x_w,x
; CODE_02C004:        95 B6         STA RAM_SpriteSpeedX,X    
org $02C004
STA.b !sprite_speed_x_w,x
; CODE_02C010:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $02C010
STZ.b !sprite_speed_x_w,x
; CODE_02C038:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02C038
LDA.b !sprite_speed_x_w,x
; CODE_02C03E:        F6 B6         INC RAM_SpriteSpeedX,X    
org $02C03E
INC.b !sprite_speed_x_w,x
; CODE_02C042:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $02C042
DEC.b !sprite_speed_x_w,x
; CODE_02C09E:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02C09E
LDA.b !sprite_speed_x_w,x
; CODE_02C0A9:        95 B6         STA RAM_SpriteSpeedX,X    
org $02C0A9
STA.b !sprite_speed_x_w,x
; CODE_02C128:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02C128
LDA.b !sprite_speed_x_w,x
; CODE_02C1D4:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $02C1D4
STA.w !sprite_speed_x_w,y
; CODE_02C579:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $02C579
STZ.b !sprite_speed_x_w,x
; CODE_02C59A:        95 B6         STA RAM_SpriteSpeedX,X    
org $02C59A
STA.b !sprite_speed_x_w,x
; CODE_02C5EE:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $02C5EE
STA.w !sprite_speed_x_w,y
; CODE_02C711:        95 B6         STA RAM_SpriteSpeedX,X    
org $02C711
STA.b !sprite_speed_x_w,x
; CODE_02C7B1:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $02C7B1
STZ.b !sprite_speed_x_w,x
; CODE_02D21A:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02D21A
LDA.b !sprite_speed_x_w,x
; CODE_02D220:        F6 B6         INC RAM_SpriteSpeedX,X    
org $02D220
INC.b !sprite_speed_x_w,x
; CODE_02D222:        F6 B6         INC RAM_SpriteSpeedX,X    
org $02D222
INC.b !sprite_speed_x_w,x
; CODE_02D224:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $02D224
DEC.b !sprite_speed_x_w,x
; CODE_02D22D:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02D22D
LDA.b !sprite_speed_x_w,x
; CODE_02D238:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02D238
LDA.b !sprite_speed_x_w,x
; CODE_02D245:        95 B6         STA RAM_SpriteSpeedX,X    
org $02D245
STA.b !sprite_speed_x_w,x
; CODE_02D27F:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02D27F
LDA.b !sprite_speed_x_w,x
; CODE_02D59A:        95 B6         STA RAM_SpriteSpeedX,X    
org $02D59A
STA.b !sprite_speed_x_w,x
; CODE_02D93A:        95 B6         STA RAM_SpriteSpeedX,X    
org $02D93A
STA.b !sprite_speed_x_w,x
; CODE_02DBB1:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02DBB1
LDA.b !sprite_speed_x_w,x
; CODE_02DBB7:        95 B6         STA RAM_SpriteSpeedX,X    
org $02DBB7
STA.b !sprite_speed_x_w,x
; CODE_02DCD9:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $02DCD9
STZ.b !sprite_speed_x_w,x
; CODE_02DD19:        95 B6         STA RAM_SpriteSpeedX,X    
org $02DD19
STA.b !sprite_speed_x_w,x
; CODE_02E28D:        95 B6         STA RAM_SpriteSpeedX,X    
org $02E28D
STA.b !sprite_speed_x_w,x
; CODE_02E2E2:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02E2E2
LDA.b !sprite_speed_x_w,x
; CODE_02E325:        95 B6         STA RAM_SpriteSpeedX,X    
org $02E325
STA.b !sprite_speed_x_w,x
; CODE_02E444:        94 B6         STY RAM_SpriteSpeedX,X    
org $02E444
STY.b !sprite_speed_x_w,x
; CODE_02E5D2:        95 B6         STA RAM_SpriteSpeedX,X    
org $02E5D2
STA.b !sprite_speed_x_w,x
; CODE_02E754:        95 B6         STA RAM_SpriteSpeedX,X    
org $02E754
STA.b !sprite_speed_x_w,x
; CODE_02E791:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $02E791
STZ.b !sprite_speed_x_w,x
; ADDR_02E7F6:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02E7F6
LDA.b !sprite_speed_x_w,x
; ADDR_02E7FB:        95 B6         STA RAM_SpriteSpeedX,X    
org $02E7FB
STA.b !sprite_speed_x_w,x
; CODE_02E826:        95 B6         STA RAM_SpriteSpeedX,X    
org $02E826
STA.b !sprite_speed_x_w,x
; CODE_02EB66:        95 B6         STA RAM_SpriteSpeedX,X    
org $02EB66
STA.b !sprite_speed_x_w,x
; CODE_02EB98:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02EB98
LDA.b !sprite_speed_x_w,x
; CODE_02EBA7:        95 B6         STA RAM_SpriteSpeedX,X    
org $02EBA7
STA.b !sprite_speed_x_w,x
; CODE_02EBED:        95 B6         STA RAM_SpriteSpeedX,X    
org $02EBED
STA.b !sprite_speed_x_w,x
; CODE_02EE3C:        95 B6         STA RAM_SpriteSpeedX,X    
org $02EE3C
STA.b !sprite_speed_x_w,x
; ADDR_02EF17:        95 B6         STA RAM_SpriteSpeedX,X    
org $02EF17
STA.b !sprite_speed_x_w,x
; CODE_02F093:        95 B6         STA RAM_SpriteSpeedX,X    
org $02F093
STA.b !sprite_speed_x_w,x
; CODE_02F306:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $02F306
LDA.b !sprite_speed_x_w,x
; CODE_02F348:        95 B6         STA RAM_SpriteSpeedX,X    
org $02F348
STA.b !sprite_speed_x_w,x
; CODE_02F391:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $02F391
STZ.b !sprite_speed_x_w,x
; CODE_02F442:        94 B6         STY RAM_SpriteSpeedX,X    
org $02F442
STY.b !sprite_speed_x_w,x
; CODE_038038:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $038038
LDA.b !sprite_speed_x_w,x
; CODE_03803D:        95 B6         STA RAM_SpriteSpeedX,X    
org $03803D
STA.b !sprite_speed_x_w,x
; CODE_038072:        75 B6         ADC RAM_SpriteSpeedX,X    
org $038072
ADC.b !sprite_speed_x_w,x
; CODE_038084:        95 B6         STA RAM_SpriteSpeedX,X    
org $038084
STA.b !sprite_speed_x_w,x
; CODE_038156:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $038156
LDA.b !sprite_speed_x_w,x
; CODE_03815C:        95 B6         STA RAM_SpriteSpeedX,X    
org $03815C
STA.b !sprite_speed_x_w,x
; CODE_0381D8:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $0381D8
STZ.b !sprite_speed_x_w,x
; CODE_03851C:        95 B6         STA RAM_SpriteSpeedX,X    
org $03851C
STA.b !sprite_speed_x_w,x
; CODE_038551:        B5 B6         LDA RAM_SpriteSpeedX,X    ; \ Branch if at max speed 
org $038551
LDA.b !sprite_speed_x_w,x
; CODE_03855C:        95 B6         STA RAM_SpriteSpeedX,X    ; / 
org $03855C
STA.b !sprite_speed_x_w,x
; CODE_03855E:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03855E
LDA.b !sprite_speed_x_w,x
; CODE_038568:        75 B6         ADC RAM_SpriteSpeedX,X    
org $038568
ADC.b !sprite_speed_x_w,x
; CODE_03856A:        95 B6         STA RAM_SpriteSpeedX,X    
org $03856A
STA.b !sprite_speed_x_w,x
; CODE_038571:        95 B6         STA RAM_SpriteSpeedX,X    
org $038571
STA.b !sprite_speed_x_w,x
; CODE_038640:        95 B6         STA RAM_SpriteSpeedX,X    
org $038640
STA.b !sprite_speed_x_w,x
; CODE_038783:        95 B6         STA RAM_SpriteSpeedX,X    ; /				       
org $038783
STA.b !sprite_speed_x_w,x
; CODE_03891E:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03891E
LDA.b !sprite_speed_x_w,x
; CODE_038929:        95 B6         STA RAM_SpriteSpeedX,X    
org $038929
STA.b !sprite_speed_x_w,x
; CODE_03895A:        B4 B6         LDY RAM_SpriteSpeedX,X    
org $03895A
LDY.b !sprite_speed_x_w,x
; CODE_0389B4:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0389B4
LDA.b !sprite_speed_x_w,x
; CODE_0389C6:        55 B6         EOR RAM_SpriteSpeedX,X    
org $0389C6
EOR.b !sprite_speed_x_w,x
; CODE_0389D9:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0389D9
LDA.b !sprite_speed_x_w,x
; CODE_0389E5:        F6 B6         INC RAM_SpriteSpeedX,X    
org $0389E5
INC.b !sprite_speed_x_w,x
; CODE_0389E7:        F6 B6         INC RAM_SpriteSpeedX,X    
org $0389E7
INC.b !sprite_speed_x_w,x
; CODE_0389E9:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $0389E9
DEC.b !sprite_speed_x_w,x
; CODE_0389F1:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0389F1
LDA.b !sprite_speed_x_w,x
; CODE_0389FC:        95 B6         STA RAM_SpriteSpeedX,X    
org $0389FC
STA.b !sprite_speed_x_w,x
; CODE_0389FF:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0389FF
LDA.b !sprite_speed_x_w,x
; ADDR_038A8A:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $038A8A
LDA.b !sprite_speed_x_w,x
; ADDR_038A8F:        95 B6         STA RAM_SpriteSpeedX,X    
org $038A8F
STA.b !sprite_speed_x_w,x
; CODE_038AA4:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $038AA4
STZ.b !sprite_speed_x_w,x
; CODE_038ABC:        95 B6         STA RAM_SpriteSpeedX,X    
org $038ABC
STA.b !sprite_speed_x_w,x
; CODE_038C4D:        95 B6         STA RAM_SpriteSpeedX,X    
org $038C4D
STA.b !sprite_speed_x_w,x
; CODE_038C4F:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $038C4F
LDA.b !sprite_speed_x_w,x
; CODE_038DEB:        95 B6         STA RAM_SpriteSpeedX,X    
org $038DEB
STA.b !sprite_speed_x_w,x
; CODE_038E9A:        95 B6         STA RAM_SpriteSpeedX,X    
org $038E9A
STA.b !sprite_speed_x_w,x
; CODE_038F00:        95 B6         STA RAM_SpriteSpeedX,X    
org $038F00
STA.b !sprite_speed_x_w,x
; CODE_038F7C:        B4 B6         LDY RAM_SpriteSpeedX,X    
org $038F7C
LDY.b !sprite_speed_x_w,x
; CODE_038FD5:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $038FD5
LDA.b !sprite_speed_x_w,x
; CODE_038FDA:        95 B6         STA RAM_SpriteSpeedX,X    
org $038FDA
STA.b !sprite_speed_x_w,x
; CODE_038FFF:        B4 B6         LDY RAM_SpriteSpeedX,X    
org $038FFF
LDY.b !sprite_speed_x_w,x
; CODE_039057:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $039057
LDA.b !sprite_speed_x_w,x
; CODE_0390A2:        B5 B6         LDA RAM_SpriteSpeedX,X    ; \ If not at max X speed, accelerate 
org $0390A2
LDA.b !sprite_speed_x_w,x
; CODE_0390AD:        95 B6         STA RAM_SpriteSpeedX,X    ; / 
org $0390AD
STA.b !sprite_speed_x_w,x
; CODE_0390C9:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $0390C9
LDA.b !sprite_speed_x_w,x
; CODE_0390D8:        75 B6         ADC RAM_SpriteSpeedX,X    
org $0390D8
ADC.b !sprite_speed_x_w,x
; CODE_0390DA:        95 B6         STA RAM_SpriteSpeedX,X    
org $0390DA
STA.b !sprite_speed_x_w,x
; CODE_0390E1:        95 B6         STA RAM_SpriteSpeedX,X    
org $0390E1
STA.b !sprite_speed_x_w,x
; CODE_0392C7:        95 B6         STA RAM_SpriteSpeedX,X    
org $0392C7
STA.b !sprite_speed_x_w,x
; CODE_039333:        95 B6         STA RAM_SpriteSpeedX,X    
org $039333
STA.b !sprite_speed_x_w,x
; CODE_039341:        95 B6         STA RAM_SpriteSpeedX,X    
org $039341
STA.b !sprite_speed_x_w,x
; CODE_039567:        95 B6         STA RAM_SpriteSpeedX,X    ; /    ...and store it			    
org $039567
STA.b !sprite_speed_x_w,x
; ADDR_039601:        95 B6         STA RAM_SpriteSpeedX,X    ; /								   
org $039601
STA.b !sprite_speed_x_w,x
; CODE_039748:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $039748
LDA.b !sprite_speed_x_w,x
; CODE_039753:        95 B6         STA RAM_SpriteSpeedX,X    
org $039753
STA.b !sprite_speed_x_w,x
; CODE_03976A:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03976A
LDA.b !sprite_speed_x_w,x
; CODE_039770:        F6 B6         INC RAM_SpriteSpeedX,X    
org $039770
INC.b !sprite_speed_x_w,x
; CODE_039773:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $039773
DEC.b !sprite_speed_x_w,x
; CODE_039CEC:        95 B6         STA RAM_SpriteSpeedX,X    ; / 
org $039CEC
STA.b !sprite_speed_x_w,x
; CODE_039D41:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $039D41
STZ.b !sprite_speed_x_w,x
; CODE_039FE1:        95 B6         STA RAM_SpriteSpeedX,X    
org $039FE1
STA.b !sprite_speed_x_w,x
; CODE_03A454:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03A454
STZ.b !sprite_speed_x_w,x
; CODE_03A467:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03A467
STZ.b !sprite_speed_x_w,x
; CODE_03A4AB:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03A4AB
LDA.b !sprite_speed_x_w,x
; CODE_03A4B1:        95 B6         STA RAM_SpriteSpeedX,X    
org $03A4B1
STA.b !sprite_speed_x_w,x
; CODE_03A6C5:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03A6C5
STZ.b !sprite_speed_x_w,x
; CODE_03A711:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03A711
STZ.b !sprite_speed_x_w,x
; CODE_03A73F:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03A73F
LDA.b !sprite_speed_x_w,x
; CODE_03A745:        95 B6         STA RAM_SpriteSpeedX,X    
org $03A745
STA.b !sprite_speed_x_w,x
; CODE_03A7DC:        95 B6         STA RAM_SpriteSpeedX,X    
org $03A7DC
STA.b !sprite_speed_x_w,x
; CODE_03A852:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03A852
LDA.b !sprite_speed_x_w,x
; CODE_03A856:        D6 B6         DEC RAM_SpriteSpeedX,X    
org $03A856
DEC.b !sprite_speed_x_w,x
; CODE_03A877:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03A877
STZ.b !sprite_speed_x_w,x
; CODE_03A8A4:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03A8A4
STZ.b !sprite_speed_x_w,x
; CODE_03A92A:        94 B6         STY RAM_SpriteSpeedX,X    
org $03A92A
STY.b !sprite_speed_x_w,x
; CODE_03AB3E:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03AB3E
LDA.b !sprite_speed_x_w,x
; CODE_03AB49:        95 B6         STA RAM_SpriteSpeedX,X    
org $03AB49
STA.b !sprite_speed_x_w,x
; CODE_03AB97:        95 B6         STA RAM_SpriteSpeedX,X    
org $03AB97
STA.b !sprite_speed_x_w,x
; CODE_03ABC1:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03ABC1
STZ.b !sprite_speed_x_w,x
; CODE_03AC29:        95 B6         STA RAM_SpriteSpeedX,X    
org $03AC29
STA.b !sprite_speed_x_w,x
; CODE_03AD18:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $03AD18
STZ.b !sprite_speed_x_w,x
; CODE_03AE02:        95 B6         STA RAM_SpriteSpeedX,X    
org $03AE02
STA.b !sprite_speed_x_w,x
; CODE_03B06C:        95 B6         STA RAM_SpriteSpeedX,X    
org $03B06C
STA.b !sprite_speed_x_w,x
; CODE_03B144:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $03B144
STA.w !sprite_speed_x_w,y
; CODE_03B1B9:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03B1B9
LDA.b !sprite_speed_x_w,x
; CODE_03B1C3:        95 B6         STA RAM_SpriteSpeedX,X    
org $03B1C3
STA.b !sprite_speed_x_w,x
; CODE_03B1C5:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03B1C5
LDA.b !sprite_speed_x_w,x
; CODE_03B2D2:        95 B6         STA RAM_SpriteSpeedX,X    
org $03B2D2
STA.b !sprite_speed_x_w,x
; ADDR_03B2EA:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03B2EA
LDA.b !sprite_speed_x_w,x
; ADDR_03B2EF:        95 B6         STA RAM_SpriteSpeedX,X    
org $03B2EF
STA.b !sprite_speed_x_w,x
; CODE_03C85F:        F6 B6         INC RAM_SpriteSpeedX,X    
org $03C85F
INC.b !sprite_speed_x_w,x
; CODE_03C861:        B5 B6         LDA RAM_SpriteSpeedX,X    
org $03C861
LDA.b !sprite_speed_x_w,x
; CODE_03CBFA:        99 B6 00      STA.W RAM_SpriteSpeedX,Y  
org $03CBFA
STA.w !sprite_speed_x_w,y
; CODE_07F754:        74 B6         STZ RAM_SpriteSpeedX,X    ; Sprite X Speed = 0 
org $07F754
STZ.b !sprite_speed_x_w,x

; Miscellaneous sprite table $C2 remapping

; ADDR_00FC65:        99 C2 00      STA.W RAM_SpriteState,Y   
org $00FC65
STA.w !sprite_misc_c2_w,y
; CODE_00FCD8:        F6 C2         INC RAM_SpriteState,X     
org $00FCD8
INC.b !sprite_misc_c2_w,x
; CODE_01831A:        94 C2         STY RAM_SpriteState,X     
org $01831A
STY.b !sprite_misc_c2_w,x
; CODE_018375:        95 C2         STA RAM_SpriteState,X     
org $018375
STA.b !sprite_misc_c2_w,x
; CODE_0183B0:        95 C2         STA RAM_SpriteState,X     
org $0183B0
STA.b !sprite_misc_c2_w,x
; CODE_0183CF:        95 C2         STA RAM_SpriteState,X     
org $0183CF
STA.b !sprite_misc_c2_w,x
; CODE_018418:        95 C2         STA RAM_SpriteState,X     
org $018418
STA.b !sprite_misc_c2_w,x
; CODE_0184E1:        95 C2         STA RAM_SpriteState,X     
org $0184E1
STA.b !sprite_misc_c2_w,x
; CODE_01851A:        95 C2         STA RAM_SpriteState,X     
org $01851A
STA.b !sprite_misc_c2_w,x
; CODE_018554:        95 C2         STA RAM_SpriteState,X     ; /   (3 segments, 1 bit each) 
org $018554
STA.b !sprite_misc_c2_w,x
; CODE_018567:        94 C2         STY RAM_SpriteState,X     
org $018567
STY.b !sprite_misc_c2_w,x
; CODE_0189A0:        99 C2 00      STA.W RAM_SpriteState,Y   
org $0189A0
STA.w !sprite_misc_c2_w,y
; CODE_018A88:        B5 C2         LDA RAM_SpriteState,X     
org $018A88
LDA.b !sprite_misc_c2_w,x
; CODE_018A8C:        D6 C2         DEC RAM_SpriteState,X     
org $018A8C
DEC.b !sprite_misc_c2_w,x
; CODE_018D02:        F6 C2         INC RAM_SpriteState,X     
org $018D02
INC.b !sprite_misc_c2_w,x
; CODE_018D04:        B5 C2         LDA RAM_SpriteState,X     
org $018D04
LDA.b !sprite_misc_c2_w,x
; CODE_018D41:        B5 C2         LDA RAM_SpriteState,X     
org $018D41
LDA.b !sprite_misc_c2_w,x
; CODE_018D4E:        F6 C2         INC RAM_SpriteState,X     
org $018D4E
INC.b !sprite_misc_c2_w,x
; CODE_018D6E:        B5 C2         LDA RAM_SpriteState,X     
org $018D6E
LDA.b !sprite_misc_c2_w,x
; CODE_018EAC:        B5 C2         LDA RAM_SpriteState,X     ; \ Y = Piranha state 
org $018EAC
LDA.b !sprite_misc_c2_w,x
; CODE_018EEC:        F6 C2         INC RAM_SpriteState,X     ; Go to next state 
org $018EEC
INC.b !sprite_misc_c2_w,x
; CODE_018FF0:        B4 C2         LDY RAM_SpriteState,X     
org $018FF0
LDY.b !sprite_misc_c2_w,x
; CODE_019542:        B5 C2         LDA RAM_SpriteState,X     
org $019542
LDA.b !sprite_misc_c2_w,x
; CODE_019662:        95 C2         STA RAM_SpriteState,X     
org $019662
STA.b !sprite_misc_c2_w,x
; CODE_019A2A:        B5 C2         LDA RAM_SpriteState,X     
org $019A2A
LDA.b !sprite_misc_c2_w,x
; CODE_01A080:        95 C2         STA RAM_SpriteState,X     
org $01A080
STA.b !sprite_misc_c2_w,x
; CODE_01A757:        95 C2         STA RAM_SpriteState,X     ;  | (These are for the shell sprite) 
org $01A757
STA.b !sprite_misc_c2_w,x
; CODE_01A97F:        95 C2         STA RAM_SpriteState,X     
org $01A97F
STA.b !sprite_misc_c2_w,x
; CODE_01AA0B:        B5 C2         LDA RAM_SpriteState,X     
org $01AA0B
LDA.b !sprite_misc_c2_w,x
; CODE_01AA9D:        95 C2         STA RAM_SpriteState,X     
org $01AA9D
STA.b !sprite_misc_c2_w,x
; CODE_01AD90:        B5 C2         LDA RAM_SpriteState,X     
org $01AD90
LDA.b !sprite_misc_c2_w,x
; CODE_01AE08:        B4 C2         LDY RAM_SpriteState,X     
org $01AE08
LDY.b !sprite_misc_c2_w,x
; CODE_01AE0F:        F6 C2         INC RAM_SpriteState,X     
org $01AE0F
INC.b !sprite_misc_c2_w,x
; CODE_01AE59:        99 C2 00      STA.W RAM_SpriteState,Y   
org $01AE59
STA.w !sprite_misc_c2_w,y
; CODE_01AE71:        B5 C2         LDA RAM_SpriteState,X     
org $01AE71
LDA.b !sprite_misc_c2_w,x
; CODE_01AEB7:        B5 C2         LDA RAM_SpriteState,X     
org $01AEB7
LDA.b !sprite_misc_c2_w,x
; CODE_01AEF3:        F6 C2         INC RAM_SpriteState,X     
org $01AEF3
INC.b !sprite_misc_c2_w,x
; CODE_01AF21:        F6 C2         INC RAM_SpriteState,X     
org $01AF21
INC.b !sprite_misc_c2_w,x
; CODE_01AF35:        95 C2         STA RAM_SpriteState,X     
org $01AF35
STA.b !sprite_misc_c2_w,x
; CODE_01AFED:        F6 C2         INC RAM_SpriteState,X     
org $01AFED
INC.b !sprite_misc_c2_w,x
; CODE_01AFEF:        B5 C2         LDA RAM_SpriteState,X     
org $01AFEF
LDA.b !sprite_misc_c2_w,x
; CODE_01B0C8:        F6 C2         INC RAM_SpriteState,X     
org $01B0C8
INC.b !sprite_misc_c2_w,x
; CODE_01B0CA:        B5 C2         LDA RAM_SpriteState,X     
org $01B0CA
LDA.b !sprite_misc_c2_w,x
; CODE_01B1C6:        B5 C2         LDA RAM_SpriteState,X     
org $01B1C6
LDA.b !sprite_misc_c2_w,x
; CODE_01B1CC:        F6 C2         INC RAM_SpriteState,X     
org $01B1CC
INC.b !sprite_misc_c2_w,x
; CODE_01B1FA:        B5 C2         LDA RAM_SpriteState,X     
org $01B1FA
LDA.b !sprite_misc_c2_w,x
; CODE_01B200:        74 C2         STZ RAM_SpriteState,X     
org $01B200
STZ.b !sprite_misc_c2_w,x
; ADDR_01B233:        F6 C2         INC RAM_SpriteState,X     
org $01B233
INC.b !sprite_misc_c2_w,x
; CODE_01B278:        F6 C2         INC RAM_SpriteState,X     
org $01B278
INC.b !sprite_misc_c2_w,x
; CODE_01B27A:        B5 C2         LDA RAM_SpriteState,X     
org $01B27A
LDA.b !sprite_misc_c2_w,x
; CODE_01B4E7:        B5 C2         LDA RAM_SpriteState,X     
org $01B4E7
LDA.b !sprite_misc_c2_w,x
; CODE_01B4EB:        F6 C2         INC RAM_SpriteState,X     
org $01B4EB
INC.b !sprite_misc_c2_w,x
; CODE_01B6B2:        B5 C2         LDA RAM_SpriteState,X     
org $01B6B2
LDA.b !sprite_misc_c2_w,x
; CODE_01B6D7:        F6 C2         INC RAM_SpriteState,X     
org $01B6D7
INC.b !sprite_misc_c2_w,x
; CODE_01B6E7:        B4 C2         LDY RAM_SpriteState,X     
org $01B6E7
LDY.b !sprite_misc_c2_w,x
; CODE_01B709:        B5 C2         LDA RAM_SpriteState,X     
org $01B709
LDA.b !sprite_misc_c2_w,x
; CODE_01B70D:        95 C2         STA RAM_SpriteState,X     
org $01B70D
STA.b !sprite_misc_c2_w,x
; CODE_01B71B:        B5 C2         LDA RAM_SpriteState,X     
org $01B71B
LDA.b !sprite_misc_c2_w,x
; CODE_01B779:        B5 C2         LDA RAM_SpriteState,X     
org $01B779
LDA.b !sprite_misc_c2_w,x
; CODE_01B9B1:        B5 C2         LDA RAM_SpriteState,X     
org $01B9B1
LDA.b !sprite_misc_c2_w,x
; CODE_01BA02:        B4 C2         LDY RAM_SpriteState,X     
org $01BA02
LDY.b !sprite_misc_c2_w,x
; CODE_01BA41:        B5 C2         LDA RAM_SpriteState,X     
org $01BA41
LDA.b !sprite_misc_c2_w,x
; CODE_01BDE0:        74 C2         STZ RAM_SpriteState,X     
org $01BDE0
STZ.b !sprite_misc_c2_w,x
; CODE_01BDE2:        B5 C2         LDA RAM_SpriteState,X     
org $01BDE2
LDA.b !sprite_misc_c2_w,x
; CODE_01BE4F:        F6 C2         INC RAM_SpriteState,X     
org $01BE4F
INC.b !sprite_misc_c2_w,x
; CODE_01BE80:        F6 C2         INC RAM_SpriteState,X     
org $01BE80
INC.b !sprite_misc_c2_w,x
; CODE_01BFF7:        F6 C2         INC RAM_SpriteState,X     
org $01BFF7
INC.b !sprite_misc_c2_w,x
; CODE_01C020:        F6 C2         INC RAM_SpriteState,X     
org $01C020
INC.b !sprite_misc_c2_w,x
; CODE_01C07A:        95 C2         STA RAM_SpriteState,X     
org $01C07A
STA.b !sprite_misc_c2_w,x
; CODE_01C0C2:        B5 C2         LDA RAM_SpriteState,X     
org $01C0C2
LDA.b !sprite_misc_c2_w,x
; CODE_01C262:        B5 C2         LDA RAM_SpriteState,X     
org $01C262
LDA.b !sprite_misc_c2_w,x
; CODE_01C27F:        B5 C2         LDA RAM_SpriteState,X     
org $01C27F
LDA.b !sprite_misc_c2_w,x
; CODE_01C3E1:        B5 C2         LDA RAM_SpriteState,X     
org $01C3E1
LDA.b !sprite_misc_c2_w,x
; CODE_01C3EF:        74 C2         STZ RAM_SpriteState,X     
org $01C3EF
STZ.b !sprite_misc_c2_w,x
; CODE_01C481:        15 C2         ORA RAM_SpriteState,X     
org $01C481
ORA.b !sprite_misc_c2_w,x
; CODE_01C494:        B5 C2         LDA RAM_SpriteState,X     
org $01C494
LDA.b !sprite_misc_c2_w,x
; CODE_01C4B6:        B5 C2         LDA RAM_SpriteState,X     
org $01C4B6
LDA.b !sprite_misc_c2_w,x
; CODE_01C6F1:        B5 C2         LDA RAM_SpriteState,X     
org $01C6F1
LDA.b !sprite_misc_c2_w,x
; ADDR_01C6FD:        74 C2         STZ RAM_SpriteState,X     
org $01C6FD
STZ.b !sprite_misc_c2_w,x
; CODE_01C7C6:        F5 C2         SBC RAM_SpriteState,X     
org $01C7C6
SBC.b !sprite_misc_c2_w,x
; CODE_01C7CC:        95 C2         STA RAM_SpriteState,X     
org $01C7CC
STA.b !sprite_misc_c2_w,x
; CODE_01CD35:        95 C2         STA RAM_SpriteState,X     
org $01CD35
STA.b !sprite_misc_c2_w,x
; CODE_01CD6D:        B4 C2         LDY RAM_SpriteState,X     
org $01CD6D
LDY.b !sprite_misc_c2_w,x
; CODE_01CDC6:        B4 C2         LDY RAM_SpriteState,X     
org $01CDC6
LDY.b !sprite_misc_c2_w,x
; CODE_01CE56:        B5 C2         LDA RAM_SpriteState,X     
org $01CE56
LDA.b !sprite_misc_c2_w,x
; CODE_01CE5F:        B5 C2         LDA RAM_SpriteState,X     
org $01CE5F
LDA.b !sprite_misc_c2_w,x
; CODE_01CFBC:        B5 C2         LDA RAM_SpriteState,X     
org $01CFBC
LDA.b !sprite_misc_c2_w,x
; CODE_01D524:        B5 C2         LDA RAM_SpriteState,X     
org $01D524
LDA.b !sprite_misc_c2_w,x
; CODE_01D538:        F6 C2         INC RAM_SpriteState,X     
org $01D538
INC.b !sprite_misc_c2_w,x
; CODE_01D540:        B5 C2         LDA RAM_SpriteState,X     
org $01D540
LDA.b !sprite_misc_c2_w,x
; CODE_01D75C:        B5 C2         LDA RAM_SpriteState,X     
org $01D75C
LDA.b !sprite_misc_c2_w,x
; CODE_01D78F:        74 C2         STZ RAM_SpriteState,X     
org $01D78F
STZ.b !sprite_misc_c2_w,x
; CODE_01D7AD:        74 C2         STZ RAM_SpriteState,X     
org $01D7AD
STZ.b !sprite_misc_c2_w,x
; CODE_01D867:        B5 C2         LDA RAM_SpriteState,X     
org $01D867
LDA.b !sprite_misc_c2_w,x
; CODE_01D86F:        95 C2         STA RAM_SpriteState,X     
org $01D86F
STA.b !sprite_misc_c2_w,x
; CODE_01D907:        B5 C2         LDA RAM_SpriteState,X     
org $01D907
LDA.b !sprite_misc_c2_w,x
; CODE_01D935:        95 C2         STA RAM_SpriteState,X     
org $01D935
STA.b !sprite_misc_c2_w,x
; CODE_01DE41:        B5 C2         LDA RAM_SpriteState,X     
org $01DE41
LDA.b !sprite_misc_c2_w,x
; CODE_01DE7C:        F6 C2         INC RAM_SpriteState,X     
org $01DE7C
INC.b !sprite_misc_c2_w,x
; CODE_01DEB2:        B9 C2 00      LDA.W RAM_SpriteState,Y   
org $01DEB2
LDA.w !sprite_misc_c2_w,y
; CODE_01E10D:        15 C2         ORA RAM_SpriteState,X     
org $01E10D
ORA.b !sprite_misc_c2_w,x
; CODE_01E11E:        B4 C2         LDY RAM_SpriteState,X     
org $01E11E
LDY.b !sprite_misc_c2_w,x
; CODE_01E12D:        B5 C2         LDA RAM_SpriteState,X     
org $01E12D
LDA.b !sprite_misc_c2_w,x
; CODE_01E2D2:        B5 C2         LDA RAM_SpriteState,X     
org $01E2D2
LDA.b !sprite_misc_c2_w,x
; CODE_01E2F1:        F6 C2         INC RAM_SpriteState,X     
org $01E2F1
INC.b !sprite_misc_c2_w,x
; CODE_01E311:        F6 C2         INC RAM_SpriteState,X     
org $01E311
INC.b !sprite_misc_c2_w,x
; CODE_01E38C:        F6 C2         INC RAM_SpriteState,X     
org $01E38C
INC.b !sprite_misc_c2_w,x
; CODE_01E553:        74 C2         STZ RAM_SpriteState,X     
org $01E553
STZ.b !sprite_misc_c2_w,x
; CODE_01E56C:        B5 C2         LDA RAM_SpriteState,X     
org $01E56C
LDA.b !sprite_misc_c2_w,x
; CODE_01E570:        F6 C2         INC RAM_SpriteState,X     
org $01E570
INC.b !sprite_misc_c2_w,x
; CODE_01E7F5:        B5 C2         LDA RAM_SpriteState,X     
org $01E7F5
LDA.b !sprite_misc_c2_w,x
; CODE_01E812:        F6 C2         INC RAM_SpriteState,X     
org $01E812
INC.b !sprite_misc_c2_w,x
; CODE_01E895:        74 C2         STZ RAM_SpriteState,X     
org $01E895
STZ.b !sprite_misc_c2_w,x
; CODE_01E8DC:        B4 C2         LDY RAM_SpriteState,X     
org $01E8DC
LDY.b !sprite_misc_c2_w,x
; CODE_01EA9D:        B5 C2         LDA RAM_SpriteState,X     
org $01EA9D
LDA.b !sprite_misc_c2_w,x
; CODE_01EAD7:        B5 C2         LDA RAM_SpriteState,X     
org $01EAD7
LDA.b !sprite_misc_c2_w,x
; CODE_01EB21:        B5 C2         LDA RAM_SpriteState,X     
org $01EB21
LDA.b !sprite_misc_c2_w,x
; CODE_01EB48:        B5 C2         LDA RAM_SpriteState,X     
org $01EB48
LDA.b !sprite_misc_c2_w,x
; CODE_01ECE1:        B5 C2         LDA RAM_SpriteState,X     
org $01ECE1
LDA.b !sprite_misc_c2_w,x
; CODE_01ECF5:        B5 C2         LDA RAM_SpriteState,X     
org $01ECF5
LDA.b !sprite_misc_c2_w,x
; CODE_01ED58:        95 C2         STA RAM_SpriteState,X     
org $01ED58
STA.b !sprite_misc_c2_w,x
; CODE_01ED70:        B5 C2         LDA RAM_SpriteState,X     
org $01ED70
LDA.b !sprite_misc_c2_w,x
; CODE_01EDA3:        74 C2         STZ RAM_SpriteState,X     
org $01EDA3
STZ.b !sprite_misc_c2_w,x
; CODE_01EFB8:        B5 C2         LDA RAM_SpriteState,X     
org $01EFB8
LDA.b !sprite_misc_c2_w,x
; CODE_01F0A2:        B5 C2         LDA RAM_SpriteState,X     
org $01F0A2
LDA.b !sprite_misc_c2_w,x
; CODE_01F1DF:        B5 C2         LDA RAM_SpriteState,X     
org $01F1DF
LDA.b !sprite_misc_c2_w,x
; CODE_01F220:        99 C2 00      STA.W RAM_SpriteState,Y   
org $01F220
STA.w !sprite_misc_c2_w,y
; ADDR_01F38B:        B9 C2 00      LDA.W RAM_SpriteState,Y   
org $01F38B
LDA.w !sprite_misc_c2_w,y
; CODE_01F3C7:        74 C2         STZ RAM_SpriteState,X     
org $01F3C7
STZ.b !sprite_misc_c2_w,x
; ADDR_01F3DF:        B9 C2 00      LDA.W RAM_SpriteState,Y   
org $01F3DF
LDA.w !sprite_misc_c2_w,y
; CODE_01F5EE:        B5 C2         LDA RAM_SpriteState,X     
org $01F5EE
LDA.b !sprite_misc_c2_w,x
; CODE_01F5F2:        99 C2 00      STA.W RAM_SpriteState,Y   ; y = index of new sptr here?? 
org $01F5F2
STA.w !sprite_misc_c2_w,y
; CODE_01F6BB:        B9 C2 00      LDA.W RAM_SpriteState,Y   
org $01F6BB
LDA.w !sprite_misc_c2_w,y
; CODE_01F6E5:        B9 C2 00      LDA.W RAM_SpriteState,Y   
org $01F6E5
LDA.w !sprite_misc_c2_w,y
; CODE_01F724:        95 C2         STA RAM_SpriteState,X     
org $01F724
STA.b !sprite_misc_c2_w,x
; CODE_01F8A4:        B5 C2         LDA RAM_SpriteState,X     
org $01F8A4
LDA.b !sprite_misc_c2_w,x
; CODE_01F8B6:        F6 C2         INC RAM_SpriteState,X     
org $01F8B6
INC.b !sprite_misc_c2_w,x
; CODE_01F8FF:        B5 C2         LDA RAM_SpriteState,X     
org $01F8FF
LDA.b !sprite_misc_c2_w,x
; CODE_01F90C:        74 C2         STZ RAM_SpriteState,X     
org $01F90C
STZ.b !sprite_misc_c2_w,x
; CODE_01F912:        F6 C2         INC RAM_SpriteState,X     
org $01F912
INC.b !sprite_misc_c2_w,x
; CODE_01F932:        B5 C2         LDA RAM_SpriteState,X     
org $01F932
LDA.b !sprite_misc_c2_w,x
; CODE_01FEBC:        B4 C2         LDY RAM_SpriteState,X     
org $01FEBC
LDY.b !sprite_misc_c2_w,x
; CODE_01FF5C:        B4 C2         LDY RAM_SpriteState,X     
org $01FF5C
LDY.b !sprite_misc_c2_w,x
; CODE_028A03:        F6 C2         INC RAM_SpriteState,X     ; \ Normally sprite #$7E is a flying red coin, maybe this sets it to have no red coin
org $028A03
INC.b !sprite_misc_c2_w,x
; CODE_028A05:        F6 C2         INC RAM_SpriteState,X     ; / so that the wings can be used by yoshi?
org $028A05
INC.b !sprite_misc_c2_w,x
; CODE_02940F:        B5 C2         LDA RAM_SpriteState,X     
org $02940F
LDA.b !sprite_misc_c2_w,x
; CODE_029413:        74 C2         STZ RAM_SpriteState,X     
org $029413
STZ.b !sprite_misc_c2_w,x
; CODE_02943F:        B5 C2         LDA RAM_SpriteState,X     
org $02943F
LDA.b !sprite_misc_c2_w,x
; CODE_02AFE6:        95 C2         STA RAM_SpriteState,X     
org $02AFE6
STA.b !sprite_misc_c2_w,x
; CODE_02B0C6:        95 C2         STA RAM_SpriteState,X     
org $02B0C6
STA.b !sprite_misc_c2_w,x
; CODE_02B14F:        99 C2 00      STA.W RAM_SpriteState,Y   
org $02B14F
STA.w !sprite_misc_c2_w,y
; CODE_02B257:        95 C2         STA RAM_SpriteState,X     
org $02B257
STA.b !sprite_misc_c2_w,x
; CODE_02B63C:        B5 C2         LDA RAM_SpriteState,X     ; \ After: Y = number of segments 
org $02B63C
LDA.b !sprite_misc_c2_w,x
; CODE_02B688:        B5 C2         LDA RAM_SpriteState,X     
org $02B688
LDA.b !sprite_misc_c2_w,x
; CODE_02B6A7:        B5 C2         LDA RAM_SpriteState,X     ; \ Erase sprite if no segments remain 
org $02B6A7
LDA.b !sprite_misc_c2_w,x
; CODE_02B709:        B5 C2         LDA RAM_SpriteState,X     
org $02B709
LDA.b !sprite_misc_c2_w,x
; CODE_02B710:        B5 C2         LDA RAM_SpriteState,X     
org $02B710
LDA.b !sprite_misc_c2_w,x
; CODE_02B71F:        95 C2         STA RAM_SpriteState,X     
org $02B71F
STA.b !sprite_misc_c2_w,x
; CODE_02B730:        B5 C2         LDA RAM_SpriteState,X     
org $02B730
LDA.b !sprite_misc_c2_w,x
; CODE_02B803:        B5 C2         LDA RAM_SpriteState,X     ; \ Take away a segment by unsetting a bit 
org $02B803
LDA.b !sprite_misc_c2_w,x
; CODE_02B808:        95 C2         STA RAM_SpriteState,X     ; / 
org $02B808
STA.b !sprite_misc_c2_w,x
; CODE_02B86F:        B5 C2         LDA RAM_SpriteState,X     
org $02B86F
LDA.b !sprite_misc_c2_w,x
; CODE_02B873:        99 C2 00      STA.W RAM_SpriteState,Y   
org $02B873
STA.w !sprite_misc_c2_w,y
; CODE_02BBDC:        B5 C2         LDA RAM_SpriteState,X     
org $02BBDC
LDA.b !sprite_misc_c2_w,x
; CODE_02BBF5:        F6 C2         INC RAM_SpriteState,X     
org $02BBF5
INC.b !sprite_misc_c2_w,x
; CODE_02BCF4:        B4 C2         LDY RAM_SpriteState,X     
org $02BCF4
LDY.b !sprite_misc_c2_w,x
; CODE_02BD5C:        B5 C2         LDA RAM_SpriteState,X     
org $02BD5C
LDA.b !sprite_misc_c2_w,x
; CODE_02BD72:        F6 C2         INC RAM_SpriteState,X     
org $02BD72
INC.b !sprite_misc_c2_w,x
; CODE_02BDA4:        F6 C2         INC RAM_SpriteState,X     
org $02BDA4
INC.b !sprite_misc_c2_w,x
; CODE_02BDB8:        B4 C2         LDY RAM_SpriteState,X     
org $02BDB8
LDY.b !sprite_misc_c2_w,x
; CODE_02BDFC:        F6 C2         INC RAM_SpriteState,X     
org $02BDFC
INC.b !sprite_misc_c2_w,x
; CODE_02BDFE:        B5 C2         LDA RAM_SpriteState,X     
org $02BDFE
LDA.b !sprite_misc_c2_w,x
; CODE_02BE04:        74 C2         STZ RAM_SpriteState,X     
org $02BE04
STZ.b !sprite_misc_c2_w,x
; CODE_02BE0C:        95 C2         STA RAM_SpriteState,X     
org $02BE0C
STA.b !sprite_misc_c2_w,x
; CODE_02BE0E:        B4 C2         LDY RAM_SpriteState,X     
org $02BE0E
LDY.b !sprite_misc_c2_w,x
; CODE_02BE1D:        D6 C2         DEC RAM_SpriteState,X     
org $02BE1D
DEC.b !sprite_misc_c2_w,x
; CODE_02BE1F:        B5 C2         LDA RAM_SpriteState,X     
org $02BE1F
LDA.b !sprite_misc_c2_w,x
; CODE_02BE2D:        95 C2         STA RAM_SpriteState,X     
org $02BE2D
STA.b !sprite_misc_c2_w,x
; CODE_02BE2F:        B4 C2         LDY RAM_SpriteState,X     
org $02BE2F
LDY.b !sprite_misc_c2_w,x
; CODE_02BF20:        B5 C2         LDA RAM_SpriteState,X     
org $02BF20
LDA.b !sprite_misc_c2_w,x
; CODE_02C024:        B5 C2         LDA RAM_SpriteState,X     
org $02C024
LDA.b !sprite_misc_c2_w,x
; CODE_02C072:        F6 C2         INC RAM_SpriteState,X     
org $02C072
INC.b !sprite_misc_c2_w,x
; CODE_02C0CA:        74 C2         STZ RAM_SpriteState,X     
org $02C0CA
STZ.b !sprite_misc_c2_w,x
; CODE_02C248:        B5 C2         LDA RAM_SpriteState,X     
org $02C248
LDA.b !sprite_misc_c2_w,x
; CODE_02C32B:        B4 C2         LDY RAM_SpriteState,X     
org $02C32B
LDY.b !sprite_misc_c2_w,x
; CODE_02C336:        B5 C2         LDA RAM_SpriteState,X     
org $02C336
LDA.b !sprite_misc_c2_w,x
; CODE_02C36E:        95 C2         STA RAM_SpriteState,X     
org $02C36E
STA.b !sprite_misc_c2_w,x
; CODE_02C553:        F6 C2         INC RAM_SpriteState,X     
org $02C553
INC.b !sprite_misc_c2_w,x
; CODE_02C577:        95 C2         STA RAM_SpriteState,X     
org $02C577
STA.b !sprite_misc_c2_w,x
; CODE_02C5A2:        95 C2         STA RAM_SpriteState,X     
org $02C5A2
STA.b !sprite_misc_c2_w,x
; CODE_02C5A7:        74 C2         STZ RAM_SpriteState,X     
org $02C5A7
STZ.b !sprite_misc_c2_w,x
; CODE_02C65E:        95 C2         STA RAM_SpriteState,X     
org $02C65E
STA.b !sprite_misc_c2_w,x
; CODE_02C6DC:        74 C2         STZ RAM_SpriteState,X     
org $02C6DC
STZ.b !sprite_misc_c2_w,x
; CODE_02C735:        95 C2         STA RAM_SpriteState,X     
org $02C735
STA.b !sprite_misc_c2_w,x
; CODE_02C78C:        95 C2         STA RAM_SpriteState,X     
org $02C78C
STA.b !sprite_misc_c2_w,x
; CODE_02C796:        95 C2         STA RAM_SpriteState,X     
org $02C796
STA.b !sprite_misc_c2_w,x
; CODE_02C7E2:        B5 C2         LDA RAM_SpriteState,X     
org $02C7E2
LDA.b !sprite_misc_c2_w,x
; CODE_02C7FD:        95 C2         STA RAM_SpriteState,X     
org $02C7FD
STA.b !sprite_misc_c2_w,x
; CODE_02CE20:        B5 C2         LDA RAM_SpriteState,X     
org $02CE20
LDA.b !sprite_misc_c2_w,x
; CODE_02CE2C:        95 C2         STA RAM_SpriteState,X     
org $02CE2C
STA.b !sprite_misc_c2_w,x
; CODE_02CE32:        95 C2         STA RAM_SpriteState,X     
org $02CE32
STA.b !sprite_misc_c2_w,x
; CODE_02CE58:        B5 C2         LDA RAM_SpriteState,X     
org $02CE58
LDA.b !sprite_misc_c2_w,x
; CODE_02CE5D:        95 C2         STA RAM_SpriteState,X     
org $02CE5D
STA.b !sprite_misc_c2_w,x
; CODE_02CE6A:        95 C2         STA RAM_SpriteState,X     
org $02CE6A
STA.b !sprite_misc_c2_w,x
; CODE_02CE70:        B5 C2         LDA RAM_SpriteState,X     
org $02CE70
LDA.b !sprite_misc_c2_w,x
; CODE_02CE75:        95 C2         STA RAM_SpriteState,X     
org $02CE75
STA.b !sprite_misc_c2_w,x
; CODE_02CE80:        95 C2         STA RAM_SpriteState,X     
org $02CE80
STA.b !sprite_misc_c2_w,x
; CODE_02CE86:        74 C2         STZ RAM_SpriteState,X     
org $02CE86
STZ.b !sprite_misc_c2_w,x
; CODE_02CEEE:        B5 C2         LDA RAM_SpriteState,X     
org $02CEEE
LDA.b !sprite_misc_c2_w,x
; CODE_02CFE3:        B4 C2         LDY RAM_SpriteState,X     
org $02CFE3
LDY.b !sprite_misc_c2_w,x
; CODE_02D409:        B5 C2         LDA RAM_SpriteState,X     
org $02D409
LDA.b !sprite_misc_c2_w,x
; CODE_02D427:        F6 C2         INC RAM_SpriteState,X     
org $02D427
INC.b !sprite_misc_c2_w,x
; CODE_02D452:        F6 C2         INC RAM_SpriteState,X     
org $02D452
INC.b !sprite_misc_c2_w,x
; CODE_02D47E:        F6 C2         INC RAM_SpriteState,X     
org $02D47E
INC.b !sprite_misc_c2_w,x
; CODE_02D486:        F6 C2         INC RAM_SpriteState,X     
org $02D486
INC.b !sprite_misc_c2_w,x
; CODE_02D494:        74 C2         STZ RAM_SpriteState,X     
org $02D494
STZ.b !sprite_misc_c2_w,x
; CODE_02D8C9:        B5 C2         LDA RAM_SpriteState,X     
org $02D8C9
LDA.b !sprite_misc_c2_w,x
; CODE_02D978:        B4 C2         LDY RAM_SpriteState,X     
org $02D978
LDY.b !sprite_misc_c2_w,x
; CODE_02DBEB:        95 C2         STA RAM_SpriteState,X     
org $02DBEB
STA.b !sprite_misc_c2_w,x
; CODE_02DBF6:        F6 C2         INC RAM_SpriteState,X     
org $02DBF6
INC.b !sprite_misc_c2_w,x
; CODE_02DC42:        B5 C2         LDA RAM_SpriteState,X     
org $02DC42
LDA.b !sprite_misc_c2_w,x
; CODE_02DCDB:        B5 C2         LDA RAM_SpriteState,X     
org $02DCDB
LDA.b !sprite_misc_c2_w,x
; CODE_02DCFC:        F6 C2         INC RAM_SpriteState,X     
org $02DCFC
INC.b !sprite_misc_c2_w,x
; CODE_02DD42:        74 C2         STZ RAM_SpriteState,X     
org $02DD42
STZ.b !sprite_misc_c2_w,x
; CODE_02DFBC:        B5 C2         LDA RAM_SpriteState,X     
org $02DFBC
LDA.b !sprite_misc_c2_w,x
; CODE_02DFD3:        F6 C2         INC RAM_SpriteState,X     
org $02DFD3
INC.b !sprite_misc_c2_w,x
; CODE_02DFF9:        74 C2         STZ RAM_SpriteState,X     
org $02DFF9
STZ.b !sprite_misc_c2_w,x
; CODE_02E130:        B5 C2         LDA RAM_SpriteState,X     
org $02E130
LDA.b !sprite_misc_c2_w,x
; CODE_02E153:        F6 C2         INC RAM_SpriteState,X     
org $02E153
INC.b !sprite_misc_c2_w,x
; CODE_02E174:        F6 C2         INC RAM_SpriteState,X     
org $02E174
INC.b !sprite_misc_c2_w,x
; CODE_02E19C:        74 C2         STZ RAM_SpriteState,X     
org $02E19C
STZ.b !sprite_misc_c2_w,x
; CODE_02E288:        B4 C2         LDY RAM_SpriteState,X     
org $02E288
LDY.b !sprite_misc_c2_w,x
; CODE_02E2A8:        D5 C2         CMP RAM_SpriteState,X     
org $02E2A8
CMP.b !sprite_misc_c2_w,x
; CODE_02E2C1:        95 C2         STA RAM_SpriteState,X     
org $02E2C1
STA.b !sprite_misc_c2_w,x
; CODE_02E330:        B5 C2         LDA RAM_SpriteState,X     
org $02E330
LDA.b !sprite_misc_c2_w,x
; CODE_02E342:        F6 C2         INC RAM_SpriteState,X     
org $02E342
INC.b !sprite_misc_c2_w,x
; CODE_02E463:        B5 C2         LDA RAM_SpriteState,X     
org $02E463
LDA.b !sprite_misc_c2_w,x
; CODE_02E4C4:        B5 C2         LDA RAM_SpriteState,X     
org $02E4C4
LDA.b !sprite_misc_c2_w,x
; CODE_02E73F:        B5 C2         LDA RAM_SpriteState,X     
org $02E73F
LDA.b !sprite_misc_c2_w,x
; CODE_02E77C:        F6 C2         INC RAM_SpriteState,X     
org $02E77C
INC.b !sprite_misc_c2_w,x
; CODE_02E7AA:        F6 C2         INC RAM_SpriteState,X     
org $02E7AA
INC.b !sprite_misc_c2_w,x
; CODE_02E88B:        B5 C2         LDA RAM_SpriteState,X     
org $02E88B
LDA.b !sprite_misc_c2_w,x
; CODE_02E89E:        F6 C2         INC RAM_SpriteState,X     
org $02E89E
INC.b !sprite_misc_c2_w,x
; CODE_02E95D:        B5 C2         LDA RAM_SpriteState,X     
org $02E95D
LDA.b !sprite_misc_c2_w,x
; CODE_02E983:        F6 C2         INC RAM_SpriteState,X     
org $02E983
INC.b !sprite_misc_c2_w,x
; CODE_02E9DF:        74 C2         STZ RAM_SpriteState,X     
org $02E9DF
STZ.b !sprite_misc_c2_w,x
; CODE_02EB7D:        B5 C2         LDA RAM_SpriteState,X     
org $02EB7D
LDA.b !sprite_misc_c2_w,x
; CODE_02EBCA:        F6 C2         INC RAM_SpriteState,X     
org $02EBCA
INC.b !sprite_misc_c2_w,x
; CODE_02EBDC:        F6 C2         INC RAM_SpriteState,X     
org $02EBDC
INC.b !sprite_misc_c2_w,x
; CODE_02ED8D:        F6 C2         INC RAM_SpriteState,X     
org $02ED8D
INC.b !sprite_misc_c2_w,x
; CODE_02EDD8:        B5 C2         LDA RAM_SpriteState,X     
org $02EDD8
LDA.b !sprite_misc_c2_w,x
; ADDR_02EEB5:        B5 C2         LDA RAM_SpriteState,X     
org $02EEB5
LDA.b !sprite_misc_c2_w,x
; ADDR_02EEB9:        F6 C2         INC RAM_SpriteState,X     
org $02EEB9
INC.b !sprite_misc_c2_w,x
; CODE_02F0D0:        B5 C2         LDA RAM_SpriteState,X     
org $02F0D0
LDA.b !sprite_misc_c2_w,x
; CODE_02F0D6:        95 C2         STA RAM_SpriteState,X     
org $02F0D6
STA.b !sprite_misc_c2_w,x
; CODE_02F122:        B5 C2         LDA RAM_SpriteState,X     
org $02F122
LDA.b !sprite_misc_c2_w,x
; CODE_02F331:        B5 C2         LDA RAM_SpriteState,X     
org $02F331
LDA.b !sprite_misc_c2_w,x
; CODE_02F371:        F6 C2         INC RAM_SpriteState,X     
org $02F371
INC.b !sprite_misc_c2_w,x
; CODE_02F3B7:        74 C2         STZ RAM_SpriteState,X     
org $02F3B7
STZ.b !sprite_misc_c2_w,x
; CODE_02F514:        F6 C2         INC RAM_SpriteState,X     
org $02F514
INC.b !sprite_misc_c2_w,x
; CODE_02F517:        B5 C2         LDA RAM_SpriteState,X     
org $02F517
LDA.b !sprite_misc_c2_w,x
; CODE_0380AA:        B5 C2         LDA RAM_SpriteState,X     
org $0380AA
LDA.b !sprite_misc_c2_w,x
; CODE_0380D2:        F6 C2         INC RAM_SpriteState,X     
org $0380D2
INC.b !sprite_misc_c2_w,x
; CODE_0380F2:        F6 C2         INC RAM_SpriteState,X     
org $0380F2
INC.b !sprite_misc_c2_w,x
; CODE_03810B:        74 C2         STZ RAM_SpriteState,X     
org $03810B
STZ.b !sprite_misc_c2_w,x
; CODE_038190:        F6 C2         INC RAM_SpriteState,X     
org $038190
INC.b !sprite_misc_c2_w,x
; CODE_0381A7:        95 C2         STA RAM_SpriteState,X     
org $0381A7
STA.b !sprite_misc_c2_w,x
; CODE_0381CB:        F6 C2         INC RAM_SpriteState,X     
org $0381CB
INC.b !sprite_misc_c2_w,x
; CODE_038208:        95 C2         STA RAM_SpriteState,X     
org $038208
STA.b !sprite_misc_c2_w,x
; CODE_0383A8:        B4 C2         LDY RAM_SpriteState,X     
org $0383A8
LDY.b !sprite_misc_c2_w,x
; CODE_038502:        B5 C2         LDA RAM_SpriteState,X     
org $038502
LDA.b !sprite_misc_c2_w,x
; CODE_038514:        F6 C2         INC RAM_SpriteState,X     
org $038514
INC.b !sprite_misc_c2_w,x
; CODE_0388D3:        B5 C2         LDA RAM_SpriteState,X     
org $0388D3
LDA.b !sprite_misc_c2_w,x
; CODE_0388F5:        F6 C2         INC RAM_SpriteState,X     
org $0388F5
INC.b !sprite_misc_c2_w,x
; CODE_038913:        F6 C2         INC RAM_SpriteState,X     
org $038913
INC.b !sprite_misc_c2_w,x
; CODE_038A46:        B5 C2         LDA RAM_SpriteState,X     
org $038A46
LDA.b !sprite_misc_c2_w,x
; CODE_038C3E:        F6 C2         INC RAM_SpriteState,X     
org $038C3E
INC.b !sprite_misc_c2_w,x
; CODE_038C45:        B5 C2         LDA RAM_SpriteState,X     
org $038C45
LDA.b !sprite_misc_c2_w,x
; CODE_038D85:        74 C2         STZ RAM_SpriteState,X     
org $038D85
STZ.b !sprite_misc_c2_w,x
; CODE_038DCB:        B5 C2         LDA RAM_SpriteState,X     
org $038DCB
LDA.b !sprite_misc_c2_w,x
; CODE_038DED:        95 C2         STA RAM_SpriteState,X     
org $038DED
STA.b !sprite_misc_c2_w,x
; CODE_038E85:        F6 C2         INC RAM_SpriteState,X     
org $038E85
INC.b !sprite_misc_c2_w,x
; CODE_038E87:        B5 C2         LDA RAM_SpriteState,X     
org $038E87
LDA.b !sprite_misc_c2_w,x
; CODE_038E92:        B5 C2         LDA RAM_SpriteState,X     
org $038E92
LDA.b !sprite_misc_c2_w,x
; CODE_0390B5:        B5 C2         LDA RAM_SpriteState,X     
org $0390B5
LDA.b !sprite_misc_c2_w,x
; CODE_0390C7:        F6 C2         INC RAM_SpriteState,X     
org $0390C7
INC.b !sprite_misc_c2_w,x
; CODE_039242:        B5 C2         LDA RAM_SpriteState,X     
org $039242
LDA.b !sprite_misc_c2_w,x
; CODE_03925A:        F6 C2         INC RAM_SpriteState,X     
org $03925A
INC.b !sprite_misc_c2_w,x
; CODE_039430:        B5 C2         LDA RAM_SpriteState,X     
org $039430
LDA.b !sprite_misc_c2_w,x
; CODE_039468:        F6 C2         INC RAM_SpriteState,X     ; Goto next state 
org $039468
INC.b !sprite_misc_c2_w,x
; CODE_03953F:        B4 C2         LDY RAM_SpriteState,X     ;  | Number of hits determines if smushed	    
org $03953F
LDY.b !sprite_misc_c2_w,x
; CODE_03955E:        B5 C2         LDA RAM_SpriteState,X     ; \ If hits on Rex == 0...			    
org $03955E
LDA.b !sprite_misc_c2_w,x
; CODE_0395B3:        F6 C2         INC RAM_SpriteState,X     ; Increment Rex hit counter		        
org $0395B3
INC.b !sprite_misc_c2_w,x
; CODE_0395B5:        B5 C2         LDA RAM_SpriteState,X     ; \  If Rex hit counter == 2	        
org $0395B5
LDA.b !sprite_misc_c2_w,x
; CODE_039720:        B5 C2         LDA RAM_SpriteState,X     
org $039720
LDA.b !sprite_misc_c2_w,x
; CODE_039756:        F6 C2         INC RAM_SpriteState,X     
org $039756
INC.b !sprite_misc_c2_w,x
; CODE_039776:        74 C2         STZ RAM_SpriteState,X     
org $039776
STZ.b !sprite_misc_c2_w,x
; CODE_039878:        95 C2         STA RAM_SpriteState,X     
org $039878
STA.b !sprite_misc_c2_w,x
; CODE_039C60:        B5 C2         LDA RAM_SpriteState,X     
org $039C60
LDA.b !sprite_misc_c2_w,x
; CODE_039C78:        74 C2         STZ RAM_SpriteState,X     
org $039C78
STZ.b !sprite_misc_c2_w,x
; CODE_039CC6:        95 C2         STA RAM_SpriteState,X     
org $039CC6
STA.b !sprite_misc_c2_w,x
; CODE_039CFE:        95 C2         STA RAM_SpriteState,X     
org $039CFE
STA.b !sprite_misc_c2_w,x
; CODE_039D48:        74 C2         STZ RAM_SpriteState,X     
org $039D48
STZ.b !sprite_misc_c2_w,x
; CODE_039D5D:        B4 C2         LDY RAM_SpriteState,X     
org $039D5D
LDY.b !sprite_misc_c2_w,x
; CODE_039F46:        B5 C2         LDA RAM_SpriteState,X     
org $039F46
LDA.b !sprite_misc_c2_w,x
; CODE_039F88:        F6 C2         INC RAM_SpriteState,X     
org $039F88
INC.b !sprite_misc_c2_w,x
; CODE_039F96:        F6 C2         INC RAM_SpriteState,X     
org $039F96
INC.b !sprite_misc_c2_w,x
; CODE_039FA9:        F6 C2         INC RAM_SpriteState,X     
org $039FA9
INC.b !sprite_misc_c2_w,x
; CODE_039FEA:        F6 C2         INC RAM_SpriteState,X     
org $039FEA
INC.b !sprite_misc_c2_w,x
; CODE_03A01B:        74 C2         STZ RAM_SpriteState,X     
org $03A01B
STZ.b !sprite_misc_c2_w,x
; CODE_03A065:        B5 C2         LDA RAM_SpriteState,X     
org $03A065
LDA.b !sprite_misc_c2_w,x
; CODE_03A111:        95 C2         STA RAM_SpriteState,X     
org $03A111
STA.b !sprite_misc_c2_w,x
; CODE_03A825:        F6 C2         INC RAM_SpriteState,X     
org $03A825
INC.b !sprite_misc_c2_w,x
; CODE_03AD21:        B5 C2         LDA RAM_SpriteState,X     
org $03AD21
LDA.b !sprite_misc_c2_w,x
; CODE_03AD61:        F6 C2         INC RAM_SpriteState,X     
org $03AD61
INC.b !sprite_misc_c2_w,x
; CODE_03ADB8:        F6 C2         INC RAM_SpriteState,X     
org $03ADB8
INC.b !sprite_misc_c2_w,x
; CODE_03AE1D:        F6 C2         INC RAM_SpriteState,X     
org $03AE1D
INC.b !sprite_misc_c2_w,x
; CODE_03AE2A:        F6 C2         INC RAM_SpriteState,X     
org $03AE2A
INC.b !sprite_misc_c2_w,x
; CODE_03AE37:        F6 C2         INC RAM_SpriteState,X     
org $03AE37
INC.b !sprite_misc_c2_w,x
; CODE_03AEC8:        F6 C2         INC RAM_SpriteState,X     
org $03AEC8
INC.b !sprite_misc_c2_w,x
; CODE_03AED0:        F6 C2         INC RAM_SpriteState,X     
org $03AED0
INC.b !sprite_misc_c2_w,x
; CODE_03B2D4:        B5 C2         LDA RAM_SpriteState,X     
org $03B2D4
LDA.b !sprite_misc_c2_w,x
; CODE_03B2D6:        F6 C2         INC RAM_SpriteState,X     
org $03B2D6
INC.b !sprite_misc_c2_w,x
; CODE_03C207:        74 C2         STZ RAM_SpriteState,X     
org $03C207
STZ.b !sprite_misc_c2_w,x
; CODE_03C21F:        B9 C2 00      LDA.W RAM_SpriteState,Y   
org $03C21F
LDA.w !sprite_misc_c2_w,y
; CODE_03C224:        99 C2 00      STA.W RAM_SpriteState,Y   
org $03C224
STA.w !sprite_misc_c2_w,y
; CODE_03C379:        F6 C2         INC RAM_SpriteState,X     
org $03C379
INC.b !sprite_misc_c2_w,x
; CODE_03C37B:        B5 C2         LDA RAM_SpriteState,X     
org $03C37B
LDA.b !sprite_misc_c2_w,x
; CODE_03C4B3:        B5 C2         LDA RAM_SpriteState,X     
org $03C4B3
LDA.b !sprite_misc_c2_w,x
; CODE_03C514:        B5 C2         LDA RAM_SpriteState,X     
org $03C514
LDA.b !sprite_misc_c2_w,x
; CODE_03C5AE:        B5 C2         LDA RAM_SpriteState,X     
org $03C5AE
LDA.b !sprite_misc_c2_w,x
; CODE_03C83A:        F6 C2         INC RAM_SpriteState,X     
org $03C83A
INC.b !sprite_misc_c2_w,x
; CODE_03C86F:        F6 C2         INC RAM_SpriteState,X     
org $03C86F
INC.b !sprite_misc_c2_w,x
; CODE_03C8A5:        B5 C2         LDA RAM_SpriteState,X     
org $03C8A5
LDA.b !sprite_misc_c2_w,x
; CODE_03C8E0:        F6 C2         INC RAM_SpriteState,X     
org $03C8E0
INC.b !sprite_misc_c2_w,x
; CODE_03CCAD:        B5 C2         LDA RAM_SpriteState,X     
org $03CCAD
LDA.b !sprite_misc_c2_w,x
; CODE_03CCFF:        B5 C2         LDA RAM_SpriteState,X     
org $03CCFF
LDA.b !sprite_misc_c2_w,x
; CODE_03CD01:        99 C2 00      STA.W RAM_SpriteState,Y   
org $03CD01
STA.w !sprite_misc_c2_w,y
; CODE_03D494:        B5 C2         LDA RAM_SpriteState,X     
org $03D494
LDA.b !sprite_misc_c2_w,x
; CODE_03DD81:        B4 C2         LDY RAM_SpriteState,X     
org $03DD81
LDY.b !sprite_misc_c2_w,x
; ADDR_05C6A3:        56 C2         LSR RAM_SpriteState,X     
org $05C6A3
LSR.b !sprite_misc_c2_w,x
; CODE_07F728:        74 C2         STZ RAM_SpriteState,X     
org $07F728
STZ.b !sprite_misc_c2_w,x
; CODE_0CA78F:        85 C2         STA RAM_SpriteState       
org $0CA78F
STA.b !sprite_misc_c2_w