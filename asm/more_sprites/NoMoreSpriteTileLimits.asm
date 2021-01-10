@includefrom sa1.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; No More Sprite Tile Limits v2.0.0
;; coded by edit1754, macro'd by MathOnNapkins,
;; improved by Arujus and optimized by VitorVilela.
;;
;; This is a mockup edition that uses the MaxTile API to clean up the slots,
;; with the consequence of slots no longer being searched but instead hardcoded.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

header
sa1rom

org $0180D2

sprite_oam_hook:
    BRA .skip                       ; skip the NOP's
    NOP                             ; \
    NOP                             ;  | use NOP
    NOP                             ;  | to take
    NOP                             ;  | up space
    NOP                             ;  | to overwrite
    NOP                             ;  | old code
    NOP                             ;  |
    NOP                             ;  |
    NOP                             ;  |
    NOP                             ;  |
    NOP                             ;  |
    NOP                             ;  |
    NOP                             ; /
.skip
    autoclean JSL pick_oam_slot

; Don't want climbing net door setting it's own OAM index
org $01BB33
    JSL net_door_fix
    NOP

org $01BBFD
    LDY $0F

; This table contains OAM indices for cluster sprites. Set them to use the highest
; indices so as not to conflict with ordinary sprites.
org $02FF50
    db $E0,$E4,$E8,$EC,$F0,$F4,$F8,$FC
    db $B0,$B4,$B8,$BC,$D0,$D4,$D8,$DC
    db $C0,$C4,$C8,$CC

; Lakitu should not use a hard-coded OAM index for the fishing line
org $02E6EC
    JSL fishing_line_fix
    NOP

; I'm pretty sure that $140F was meant to be used a flag indicating that Reznor is
; on screen but SMW has a bug where it increments every frame in which Reznor is
; present instead of just once, which means it can wrap around to zero for one
; frame. This can cause tiles to disappear among other problems for this patch so it
; is best to fix the bug and set $140F to a fixed value so that it's always non-zero
; during a Reznor fight.
org $039890
    STA $740F

; Powerups sometimes use their own hard-coded OAM index, we don't want this so fix it.
;org $01C61F
;BRA SkipStuff
;rep 21 : NOP
;SkipStuff:

;Vitor Vilela: this screws up Roy/Morton/Ludwig, undo that. The hard-coded OAM index
; is only for their case anyways.
org $01C61F
    LDA.w $740F
    BNE +
    LDA.w $6D9B
    CMP.b #$C1
    BEQ +
    BIT.w $6D9B
    BVC +
    LDA.b #$D8
    STA.w $33A2,X
    TAY
+

; The hammer brother graphics routine is called by the hammer brother's platform.
; The OAM index for the hammer brother might not be set correctly so hijack here
; to set it.
org $02DB82
    JSL hammer_bro_fix
    NOP
    NOP

freecode

hammer_bro_fix:
    LDA !sprite_x_high,x
    STA !sprite_x_high,y

    ; Add #$10 because the platform wrote 4 tiles (#$10 bytes) to OAM.
    LDA !sprite_oam_index,x
    CLC
    ADC #$10
    STA !sprite_oam_index,y
    RTL

fishing_line_fix:
    LDA !sprite_oam_index,x
    CLC
    ADC #$08
    STA !sprite_oam_index,x
    RTL

net_door_fix:
    LDA !sprite_oam_index,x
    LSR
    LSR
    STA $0F

    LDA !sprite_oam_index,x
    RTL

pick_oam_slot:
    ; It's not necessary to get an index if the sprite doesn't exist.
    LDA !sprite_status,x
    BEQ .return

    LDA !sprite_num,x
    CMP #$35
    BEQ .yoshi

    LDA #$38
    STA !sprite_oam_index,x
    JML call_nmstl_mockup_flush

.yoshi
    ; Yoshi will get a hardcoded slot because the game likes
    ; redrawing him multiple times.
    LDA #$28
    STA !sprite_oam_index,x
    JML call_nmstl_mockup_flush

.return
    RTL

