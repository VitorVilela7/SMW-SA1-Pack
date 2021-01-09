
; Allocate and get OAM pointer from MaxTile.
; Difference between get_oam_slot_general is:
; > Amount of slots is passed via "A"
; > No 16-bit AXY required.
; > Slot is also copied to $0C ($3100) and $0E ($3102).

call_oam_get_slot_sprite:
    PHP
    REP #$30
    AND #$00FF
    TAY
    LDA #$0003
    JSL call_oam_get_slot_general
    BCS .ok
    PLP
    CLC
    RTL
    
.ok
    LDA $3100
    STA $0C
    LDA $3102
    STA $0E
    PLP
    SEC
    RTL

; Allocate and get OAM pointer from MaxTile
; The routine automatically adjusts internal MaxTile pointers for you.
;
; Input params:
; > AXY 16-bit
; > Y = how many slots to be allocated (min: #$0001 - 1 slot, max: #$0080 - 128 slots)
; > A = priority (0: highest, 3: lowest)
;
; Output params:
; > Carry set if the OAM allocation was success, carry clear otherwise.
; > $3100-$3101 will contain the pointer to the OAM general buffer.
; > $3102-$3103 will contain the pointer to the OAM attribute buffer.
; > The pointer returned is intended to be incremented, just like normal OAM drawing routines.
; > $3100-$3103 will be used by FinishOAMWrite routine version MaxTile.

call_oam_get_slot_general:
    STY $3102
    
    ASL #4
    TAY
    
    LDA $3102
    ASL #2
    STA $3100
    
    LDA !maxtile_mirror_max+0,y
    SEC
    SBC $3100
    
    CMP !maxtile_mirror_max+8,y
    BCC .no_slot
    
    STA !maxtile_mirror_max+0,y
    
    ;add 4
    ADC #$0003
    STA $3100
    
    LDA !maxtile_mirror_max+2,y
    SEC
    SBC $3102
    STA !maxtile_mirror_max+2,y
    INC
    STA $3102
    
    SEC
.no_slot
    RTL
