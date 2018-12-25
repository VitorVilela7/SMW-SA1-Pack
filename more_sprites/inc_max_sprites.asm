@includefrom sa1.asm
org $00FA90
    db !num_sprites-1
org $00FCED
    db !num_sprites-1
org $0180A8
    db !num_sprites-1
org $01846C
    db !num_sprites-3
org $0188A0
    db !num_sprites-3
org $01BDB9
    db !num_sprites-3
org $01BF1E
    db !num_sprites-3
org $01C2D4
    db !num_sprites-1
org $01E1C9
    db !num_sprites-1
org $01E7DC
    db !num_sprites-3
org $01F567
    db !num_sprites-1
org $01F62A                 ; Maybe the pointers need to be updated somewhere in the loop here in order for a score sprite to appear in the right
    db !num_sprites-1       ; place? Not that big of a deal if the location is slightly off though, so I'm not looking any further into this for now.
org $028018
    db !num_sprites-1
org $028030
    db !num_sprites-2
org $02813A
    db !num_sprites-3
org $028906
    db !num_sprites-1
org $028920
    db !num_sprites-2
org $0289E0
    db !num_sprites-1
org $0293AF
    db !num_sprites-1
org $0294CD
    db !num_sprites-3
org $02A0B9
    db !num_sprites-3
org $02ABFF
    db !num_sprites-1
org $02B7AD
    db !num_sprites-3
org $02B9C3
    db !num_sprites-3
org $02BAB6
    db !num_sprites-1
org $02DB65
    db !num_sprites-3
org $02E5F8
    db !num_sprites-1
org $02EA4F
    db !num_sprites-1
org $02EDE5
    db !num_sprites-3
org $02EE20
    db !num_sprites-3
org $02EF6F
    db !num_sprites-1
org $02EF77
    db !num_sprites-3
org $02F549
    db !num_sprites-3
org $0381E5
    db !num_sprites-1
org $03865F
    db !num_sprites-3
org $03A6C9
    db !num_sprites-3
org $03C210
    db !num_sprites-3
org $03C2DB
    db !num_sprites-1
org $03C4E2
    db !num_sprites-3

; Adjust settings for each sprite header index to allow for the added sprite space.
org $02A773
; At first I tried just scaling everything by a factor of 2 here like this, but having sprite indices above the original values here causes problems for the subroutine
; that generates OAM indices (without no more sprite tile limits patch). For now I am just requiring that the no more sprite tile limits patch be used with this one,
; so I instead only need to scale index #$10 in these tables, which is the sprite header setting required for no more sprite tile limits to be enabled.
;SpriteSlotMax:                    db $13,$0B,$0F,$0F,$0F,$0D,$0F,$0D
;                                  db $0D,$13,$11,$09,$0F,$0F,$0F,$11
;                                  db $13,$0B,$0B
;
;SpriteSlotMax1:                   db $13,$0F,$0F,$03,$01,$03,$0F,$0D
;                                  db $0D,$01,$05,$01,$0F,$03,$0F,$11
;                                  db $13,$0F,$0B
;
;SpriteSlotMax2:                   db $13,$0F,$0F,$03,$01,$0D,$0F,$0D
;                                  db $0D,$01,$05,$01,$0F,$03,$0F,$11
;                                  db $13,$0F,$0B
;
;SpriteSlotStart:                  db $FF,$FF,$01,$03,$01,$03,$FF,$03
;                                  db $FF,$01,$FF,$01,$FF,$03,$FF,$FF
;                                  db $FF,$FF,$FF
;
;SpriteSlotStart1:                 db $FF,$0B,$FF,$FF,$FF,$FF,$FF,$03
;                                  db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;                                  db $FF,$0B,$FF
;
;ReservedSprite1:                  db $FF,$5F,$54,$5E,$60,$28,$88,$FF
;                                  db $FF,$C5,$86,$28,$FF,$90,$FF,$FF
;                                  db $FF,$AE
;
;ReservedSprite2:                  db $FF,$64,$FF,$FF,$9F,$FF,$FF,$FF
;                                  db $FF,$FF,$FF,$FF,$FF,$9F,$FF,$FF
;                                  db $FF,$FF

; Scale only index #$10
; Vitor: Make it scale #$08 instead of #$10 . . .

SpriteSlotMax:                    db $09,$05,$07,$07,$07,$06,$07,$06
                                  db $13,$09,$08,$04,$07,$07,$07,$08
                                  db $09,$05,$05

SpriteSlotMax1:                   db $09,$07,$07,$01,$00,$01,$07,$06
                                  db $13,$00,$02,$00,$07,$01,$07,$08
                                  db $09,$07,$05

SpriteSlotMax2:                   db $09,$07,$07,$01,$00,$06,$07,$06
                                  db $13,$00,$02,$00,$07,$01,$07,$08
                                  db $09,$07,$05

SpriteSlotStart:                  db $FF,$FF,$00,$01,$00,$01,$FF,$01
                                  db $FF,$00,$FF,$00,$FF,$01,$FF,$FF
                                  db $FF,$FF,$FF

SpriteSlotStart1:                 db $FF,$05,$FF,$FF,$FF,$FF,$FF,$01
                                  db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                                  db $FF,$05,$FF

ReservedSprite1:                  db $FF,$5F,$54,$5E,$60,$28,$88,$FF
                                  db $FF,$C5,$86,$28,$FF,$90,$FF,$FF
                                  db $FF,$AE

ReservedSprite2:                  db $FF,$64,$FF,$FF,$9F,$FF,$FF,$FF
                                  db $FF,$FF,$FF,$FF,$FF,$9F,$FF,$FF
                                  db $FF,$FF