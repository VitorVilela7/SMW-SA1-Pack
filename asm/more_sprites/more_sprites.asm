@includefrom sa1.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sprite Cap Increaser, by Arujus
;;
;; This increases the maximum number of sprites that can be on screen from 12 to 22.
;; In order for it to be enabled the sprite header setting must be set to 08.
;; An enhanced no more sprite tile limits patch is applied automatically with this
;; one and is enabled at all times.
;;
;; This is not compatible with any of the koopa kid bosses or Bowser (when using
;; sprite header setting of 08).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sa1rom

; This may be changed to any empty byte on the direct page
!sprite_num_cache = $87

; Do not change these
!num_sprites = $16
!sprite_num_pointer = $B4
!sprite_y_low_pointer = $CC
!sprite_x_low_pointer = $EE

; Define word addresses for these tables so we can use them in instructions like LDA.w
!sprite_speed_y_w = $3000+!sprite_speed_y
!sprite_speed_x_w = $3000+!sprite_speed_x
!sprite_misc_c2_w = $3000+!sprite_misc_c2

macro update_pointers(addr)
    REP #$20
    LDA <addr>
    AND #$00FF
    CLC
    ADC #!sprite_num
    STA !sprite_num_pointer
    ADC.w #!num_sprites
    STA !sprite_y_low_pointer
    ADC.w #!num_sprites
    STA !sprite_x_low_pointer
    SEP #$20
    
    LDA (!sprite_num_pointer)
    STA !sprite_num_cache
endmacro

; Asar doesn't let you pass commas as part of macro arguments so I have to make a separate macro for stack-relative addresses
macro update_pointers_stack_relative(offset)
    REP #$20
    LDA <offset>,s
    AND #$00FF
    CLC
    ADC #!sprite_num
    STA !sprite_num_pointer
    ADC.w #!num_sprites
    STA !sprite_y_low_pointer
    ADC.w #!num_sprites
    STA !sprite_x_low_pointer
    SEP #$20
    
    LDA (!sprite_num_pointer)
    STA !sprite_num_cache
endmacro

macro update_pointers_immediate(index)
    REP #$20
    LDA #!sprite_x_low+<index>
    STA !sprite_x_low_pointer
    LDA #!sprite_y_low+<index>
    STA !sprite_y_low_pointer
    LDA #!sprite_num+<index>
    STA !sprite_num_pointer
    SEP #$20
    
    LDA (!sprite_num_pointer)
    STA !sprite_num_cache
endmacro

if read1($0180A9) != $22
incsrc non_dp_remap.asm
incsrc dp_trivial_remap.asm
incsrc dp_nontrivial_remap.asm
endif
incsrc inc_max_sprites.asm

; The main task of this patch is to remap three sprite tables that were previously on the direct page off of the direct page, namely the sprite number table, the
; X position low byte table and the Y position low byte table. The main idea for doing this is to store three pointers on the direct page that point to the appropriate
; indices into these tables and then replace accesses to the old sprite tables indexed by x with indirect accesses to one of the pointers on the direct page, which will
; point to the correct address into the new sprite table. The SPRITE_MAIN_HACK hijack is for setting the pointers to point to the correct indices before we process each
; sprite. Most of the remaining hijacks are for dealing with cases where the value of x changes and is used to index sprite tables, which requires updating the pointers
; to point to new indices so that the correct data will be accessed. These hijacks have the suffix _SET. Also, after doing this the value of x often returns what it
; previously was (the index of the current sprite), so there is frequently also a need ot have a hijack to restore the pointers to their previous values.
; These hijacks have the suffix _RESTORE.

; This is a special hijack used to reset the values in all IRAM sprite tables to 0. It gets called on level load.
org $00A1A8
autoclean JSL SPRITE_IRAM_RESET
NOP

; Hack main sprite routine.
org $0180A9
autoclean JSL SPRITE_MAIN_HACK
NOP
NOP

; Sprite loading routine.
org $02A93C
;autoclean JSL SPRITE_LOAD_HACK
JML SPRITE_LOAD_HACK

org $01ABCC
autoclean JSL SubSprXPosNoGrvty
RTS

org $02D288
autoclean JSL SubSprXPosNoGrvty
RTS

; Blocks that spawn sprites need to update the pointer when spawning a new sprite
org $028922
autoclean JSL BLOCK_SPRITE_SPAWN_HACK
NOP

org $02887D
autoclean JML BLOCK_SPRITE_SPAWN_WRAPPER

; Sprite/sprite interaction needs fixing
;useless with blue koopa fix
;org $01A43D
;autoclean JSL SPR_SPR_INTERACT_SET

;included in blue koopa fix
;org $01A4B6
;autoclean JML SPR_SPR_INTERACT_RESTORE

;restore previous hijacks.
org $01A43D
	LDA (!sprite_x_low_pointer)
	STA $00
	
org $01A4B6
	LDX $75E9
	RTS

; Dropping an item from an item box needs fixing
org $028049
autoclean JSL DROP_ITEM_SET

org $028068
autoclean JSL DROP_ITEM_RESTORE
NOP

; Yoshi has some code that needs fixing.
org $01EA7F
autoclean JSL YOSHI_SET

org $01EA8A
autoclean JML YOSHI_RESTORE

; Fireballs turn sprites into coins and need access to certain sprite tables. Fireballs are extended sprites so there is no need to restore.
org $02A0F5
autoclean JSL FIREBALL_SET
NOP

; Bonus game needs fixing
org $01DDB7
autoclean JSL BONUS_GAME_SET
NOP

; When picking up a block we generate a sprite, needs fixing.
org $028636
autoclean JSL PICKUP_BLOCK_SET
NOP

; When Mario smashes an enemy, either by hitting it with a yoshi ground pound or hitting it on the other side of a net, the code accesses some sprite tables.
org $029409
autoclean JSL MARIO_SMASH_SPRITE_SET

; Big boo boss needs to access sprite tables for objects that are colliding with it, the tables are indexed by x only in one place so don't bother
; updating the pointers, instead simply hijack and replace with our own version.
org $038214
autoclean JML BIG_BOO_BOSS_FIX

; The tripple gray platform on initialization access sprite tables of each individual gray platform
org $02AF51
autoclean JSL GRAY_PLATFORM_SET

; FindFreeSlotLowPri is used by generators in SMW and they all immediately copy the returned index in y to x and start using it to index sprite
; tables, so hijack it to change the pointer as well.
org $02A9E0
autoclean JML FIND_SPRITE_SLOT_SET

; The dolphin generator is weird and doesn't use FindFreeSlotLowPri so it requires individual attention.
org $02B28D
autoclean JSL DOLPHIN_GENERATOR_SET

; Sprite respawning
org $028B44
autoclean JSL SPRITE_RESPAWN_SET

; Loading 5 Eeries
org $02AFBB
autoclean JSL EIRIE_SET

; Bowser's bowling balls are hard-coded to use sprite slot 8, just hijack their generation for simplicity
org $03A624
autoclean JML BOWSER_BOWLING_BALL

; Princess peach is also hard-coded for slot 8, do the same thing
org $03AC6A
autoclean JML PRINCESS_PEACH

; In the sprite/sprite interaction this lookup can happen with a different value of x, easiest to just hijack
org $01A6F6
autoclean JSL X_LOW_REMAP0

org $01A710
autoclean JSL SPRITE_NUM_REMAP3

; Hijacked because there are no indirect addressing modes for LDY
org $01D166
autoclean JSL X_LOW_REMAP1

; SubHorizPoz can sometimes be called with the pointers not set correctly
org $01AD35
autoclean JSL X_LOW_REMAP2

; Same with SubVertPoz
org $01AD47
autoclean JSL Y_LOW_REMAP8

; In this case we are moving the current item being carried to slot 0 while going through a pipe. Overwrite this code with out own and
; set a the address of index 0 in the old table location because the code will be using it for a few other things shortly.
org $02AC22
autoclean JML ITEM_SLOT_CHANGE

; A few cluster sprites "steal" slot 0 of the ordinary sprite tables in order to call subroutines that are normally called by ordinary sprites.
; For this reason, set our pointer to point to index 0 before processing cluster sprites.
org $0180BA
autoclean JSL CLUSTER_SPRITE_SET

; It seems reznor's sign is hard-coded to be in sprite slot 0.
org $0398A9
autoclean JSL REZNOR_SET

org $0398C3
autoclean JSL REZNOR_RESTORE

; InitGreyLavaPlat:   F6 D8         INC RAM_SpriteYLo,X       
; CODE_018311:        F6 D8         INC RAM_SpriteYLo,X       
org $01830F
autoclean JSL Y_LOW_REMAP0

; InitUrchinWallFllw: F6 D8         INC RAM_SpriteYLo,X       
org $018404
autoclean JML Y_LOW_REMAP1

; InitMovingLedge:    D6 D8         DEC RAM_SpriteYLo,X       
org $018890
LDA #$00
NOP
autoclean JSL Y_LOW_REMAP2

; CODE_0185B7:        D6 D8         DEC RAM_SpriteYLo,X       
org $0185B7
autoclean JSL Y_LOW_REMAP3

; CODE_01B9A3:        B4 D8         LDY RAM_SpriteYLo,X       
org $01B9A3
autoclean JML Y_LOW_REMAP4
NOP
NOP

; CODE_01CD50:        94 D8         STY RAM_SpriteYLo,X       
org $01CD50
autoclean JSL Y_LOW_REMAP5

; CODE_01D513:        F6 D8         INC RAM_SpriteYLo,X       
org $01D513
autoclean JML Y_LOW_REMAP6

; CODE_02D43D:        74 D8         STZ RAM_SpriteYLo,X       
org $02D43D
autoclean JML Y_LOW_REMAP7
NOP

; InitSpriteTables is called from everywhere, I can't possibly hope that the pointer is set correctly in all cases, so just hijack accesses to the sprite number that
; happen in this routine.
org $07F78B
autoclean JML SPRITE_NUM_REMAP0

org $07F7A1
autoclean JML SPRITE_NUM_REMAP1

; StoreSpriteNum:     94 9E         STY RAM_SpriteNum,X       
org $01BC90
autoclean JSL SPRITE_NUM_REMAP2

; Spiney throwing an object. I'd rather just hijack to use the new address than doing a set and restore
org $01EA62
autoclean JSL SPRITE_NUM_REMAP4

; Regenerating Yoshi when transitioning screens
org $00FC9D
autoclean JSL YOSHI_SET2

; Generator for smoke that comes out of the chimney in Yoshi's house
org $02F565
autoclean JML YOSHI_CHIMNEY_SMOKE_FIX

; Yoshi eating a sprite.
org $01F3C5
autoclean JML YOSHI_EAT_SET

org $01F3CC
autoclean JML YOSHI_EAT_RESTORE

; Flying hammer brother.
org $02DB95
autoclean JML HAMMER_BRO_SET

org $02DB9E
autoclean JML HAMMER_BRO_RESTORE

; When hitting a flying platform with a hammer bro on top, need to hijack this so that the smash graphic appears in the right spot
org $01AB88
JML FLYING_BLOCK_FIX

; Pokey iterates overall sprites looking for shells that collide with it. When one does collide it indexes the shell's sprite tables by x.
org $02B84B
JSL POKEY_SET

org $02B87D
JSL POKEY_RESTORE

; Invisible 1up stuff.
org $03C2EB
JSL INVIS_1UP_SET

;sprite <-> sprite interaction routine
;now properly fixed (~Vitor Vilela)
org $01A413
	autoclean JML SPR_SPR_INTERACT_INIT
	
org $01A4B0
	autoclean JML SPR_SPR_INTERACT_LOOP
	
org $01A7C2
	autoclean JML SPR_SPR_INTERACT_3
	
org $01A5D3
	autoclean JML SPR_SPR_INTERACT_4
	
org $01A5DA
	autoclean JML SPR_SPR_INTERACT_5

;yoshi spit fire (~Vitor Vilela)
org $01F27D
	autoclean JML YOSHI_SPIT
	
freecode

SPRITE_IRAM_RESET:
    SEP #$20
    LDX #$0225
-   STZ $3200,x
    DEX
    BPL -
    LDX #$00BD
    RTL

INVIS_1UP_SET:
    LDA #$78
    STA !sprite_num,x
    STX $00
    %update_pointers($00)
    RTL

POKEY_SET:
    %update_pointers($7695)
    JSL $07F7D2
    RTL
    
POKEY_RESTORE:
    JSL $02ACE1
    %update_pointers($75E9)
    RTL

FLYING_BLOCK_FIX:
    LDA !sprite_x_low,x
    STA $77C8,y
    LDA !sprite_y_low,x
    STA $77C4,y
    JML $01AB92

HAMMER_BRO_SET:
    STA !sprite_y_high,y
    PHX
    STY $00
    %update_pointers($00)
    JML $02DB99

HAMMER_BRO_RESTORE:
    %update_pointers($75E9)
    LDA $9D
    BNE +
    JML $02DBA2
+   JML $02DC0E

YOSHI_EAT_SET:
    PHX
    TYX
    STZ !sprite_misc_c2,x
    STY $0F
    %update_pointers($0F)
    JML $01F3C9

YOSHI_EAT_RESTORE:
    PLX
    LDY $78DC
    STX $0F
    %update_pointers($0F)
    JML $01F3D0

YOSHI_CHIMNEY_SMOKE_FIX:
    STA !sprite_x_low,x
    LDA #$00
    STA !sprite_x_high,x
    LDA #$00
    STA !sprite_y_high,x
    LDA #$E0
    STA !sprite_y_low,x
    JML $02F575

YOSHI_SET2:
    LDA #$35
    STA !sprite_num,x
    STX $00
    %update_pointers($00)
    RTL

SPRITE_NUM_REMAP0:
    PHY
    PHX
    LDA !sprite_num,x
    JML $07F78F

SPRITE_NUM_REMAP1:
    PHX
    TXY
    LDX !sprite_num,y
    JML $07F7A5

SPRITE_NUM_REMAP2:
    TYA
    STA !sprite_num,x
    LDA #$08
    RTL

SPRITE_NUM_REMAP3:
    LDA !sprite_num,x
    CMP #$02
    RTL

SPRITE_NUM_REMAP4:
    LDA !sprite_num,x
    CMP #$21
    RTL

Y_LOW_REMAP0:
    INC !sprite_y_low,x
    INC !sprite_y_low,x
    RTL

Y_LOW_REMAP1:
    INC !sprite_y_low,x
    BNE +
    JML $018408
+   JML $01840B

Y_LOW_REMAP2:
    CMP #$00
    BEQ .init
    JML $02E5B4
.init
    DEC !sprite_y_low,x
    RTL

Y_LOW_REMAP3:
    DEC !sprite_y_low,x
    LDA !sprite_y_low,x
    RTL

Y_LOW_REMAP4:
    LDY !sprite_y_low,x
    PHY
    LDY !sprite_y_high,x
    JML $01B9A9

Y_LOW_REMAP5:
    PHA
    TYA
    STA !sprite_y_low,x
    PLA
    CMP #$03
    RTL

Y_LOW_REMAP6:
    INC !sprite_y_low,x
    BNE +
    JML $01D517
+   JML $01D51A

Y_LOW_REMAP7:
    STZ !sprite_y_low,x
    STZ !sprite_y_high,x
    RTL

Y_LOW_REMAP8:
    SBC !sprite_y_low,x
    STA $0E
    RTL
    
REZNOR_SET:
    %update_pointers_immediate(0)
    LDX #$00
    LDA #$C0
    RTL
    
REZNOR_RESTORE:
    %update_pointers($75E9)
    REP #$20
    LDA $36
    RTL

CLUSTER_SPRITE_SET:
    %update_pointers_immediate(0)
    JML $02F808

ITEM_SLOT_CHANGE:
    LDA !sprite_num,x
    STA !sprite_num
    LDA !sprite_x_low,x
    STA !sprite_x_low
    LDA !sprite_x_high,x
    STA !sprite_x_high
    LDA !sprite_y_low,x
    STA !sprite_y_low
    %update_pointers_immediate(0)
    JML $02AC34

X_LOW_REMAP0:
    STZ $02
    LDA !sprite_x_low,x
    RTL

X_LOW_REMAP1:
    LDY !sprite_x_low,x
    CPY.B #$50
    RTL

X_LOW_REMAP2:
    SBC !sprite_x_low,x
    STA $0F
    RTL

PRINCESS_PEACH:
    STA !sprite_num+8
    LDA !sprite_x_low,x
    CLC
    ADC #$08
    STA !sprite_x_low+8
    LDA !sprite_x_high,x
    ADC #$00
    STA !sprite_x_high+8
    LDA !sprite_y_low,x
    CLC
    ADC #$47
    STA !sprite_y_low+8
    LDA !sprite_y_high,x
    ADC #$00
    STA !sprite_y_high+8
    JML $03AC8A

BOWSER_BOWLING_BALL:
    STA !sprite_num+8
    LDA !sprite_x_low,x
    CLC
    ADC #$08
    STA !sprite_x_low+8
    LDA !sprite_x_high,x
    ADC #$00
    STA !sprite_x_high+8
    LDA !sprite_y_low,x
    CLC
    ADC #$40
    STA !sprite_y_low+8
    LDA !sprite_y_high,x
    ADC #$00
    STA !sprite_y_high+8
    JML $03A644

EIRIE_SET:
    LDA #$39
    STA !sprite_num,x
    STX $0F
    %update_pointers($0F)
    RTL

SPRITE_RESPAWN_SET:
    STA !sprite_num,x
    STX $00
    %update_pointers($00)
    LDA $1A
    RTL

DOLPHIN_GENERATOR_SET:
    LDA #$41
    STA !sprite_num,x
    STX $02
    %update_pointers($02)
    RTL

FIND_SPRITE_SLOT_SET:
    STA $0E
    JSL $02A9E4
    BMI .Return
    PHY
    %update_pointers_stack_relative($1)
    PLY
.Return
    RTL

GRAY_PLATFORM_SET:
    STX $0F         ; Hopefully safe to store here
    %update_pointers($0F)

    LDA #$A3
    STA !sprite_num,x
    RTL

BIG_BOO_BOSS_FIX:
    LDA !sprite_x_low,x
    STA $9A
    LDA !sprite_x_high,x
    STA $9B
    LDA !sprite_y_low,x
    STA $98
    LDA !sprite_y_high,x
    STA $99
    JML $038226

MARIO_SMASH_SPRITE_SET:
    STX $00
    %update_pointers($00)

    LDA !sprite_num,x
    CMP #$81
    RTL

PICKUP_BLOCK_SET:
    LDA #$0B
    STA !sprite_status,X
    
    STX $00
    %update_pointers($00)
    RTL

BONUS_GAME_SET:
    LDA #$08
    STA !sprite_status,X
    
    STX $00
    %update_pointers($00)
    RTL

FIREBALL_SET:
    %update_pointers($75E9)
    LDA !sprite_tweaker_190f,X
    AND #$08
    RTL

YOSHI_SET:
    DEX
    STX $75E9
    %update_pointers($75E9)
    RTL

YOSHI_RESTORE:
    PLA
    STA $75E9
    %update_pointers($75E9)
    JML $01EA8E
    
DROP_ITEM_SET:
    ADC #$73
    STA !sprite_num,X
    
; I'm too scared to use scratch RAM to store X here. Don't know if someone might already be using that RAM when this get's called.
    PHX
    %update_pointers_stack_relative($1)
    PLX
    RTL

DROP_ITEM_RESTORE:
    ADC #$00
    STA.W !sprite_y_high,X
    
    %update_pointers($75E9)
    RTL

;SPR_SPR_INTERACT_SET:
;    %update_pointers($7695)
;    
;    LDA !sprite_x_low,x
;    STA $00
;    RTL

;included in blue koopa fix.
;SPR_SPR_INTERACT_RESTORE:
;    LDX $75E9
;    %update_pointers($75E9)
;
;; JML to an RTS in bank 1
;    JML $01A40A

BLOCK_SPRITE_SPAWN_HACK:
    STX $785E
    %update_pointers($785E)
    
    LDY $05
    RTL

BLOCK_SPRITE_SPAWN_WRAPPER:
    JSL MY_BLOCK_SPRITE_SPAWN
    %update_pointers($75E9)
    RTL

MY_BLOCK_SPRITE_SPAWN:
    LDA $05
    BEQ .Return
    JML $028881
.Return
    RTL
    
SPRITE_MAIN_HACK:
    STX $75E9
    %update_pointers($75E9)

    LDA $2,s
    STA $3,s
    PLA
    STA $1,s
    JML $0180D2
    
SPRITE_LOAD_HACK:
    PHX
    %update_pointers_stack_relative($1)
    PLX

;    LDY $03
;    LDA $5B
;    RTL

    REP #$10
    PLY
    PHY
    LDA $5B
    JML $02A940
    
SubSprXPosNoGrvty:
    LDA !sprite_speed_x,x
    BEQ .Return
    ASL
    ASL
    ASL
    ASL
    CLC
    ADC !sprite_speed_x_frac,x
    STA !sprite_speed_x_frac,x
    PHP
    PHP
    LDY #$00
    LDA !sprite_speed_x,x
    LSR
    LSR
    LSR
    LSR
    CMP #$08
    BCC .label
    ORA #$F0
    DEY

.label
    PLP
    PHA
    ADC !sprite_x_low,x
    STA !sprite_x_low,x
    TYA
    ADC !sprite_x_high,x
    STA !sprite_x_high,x
    PLA
    PLP
    ADC #$00

.Return
    STA $7491
    RTL
    
SPR_SPR_INTERACT_5:
	%update_pointers($75E9)
	LDX $75E9
	LDY $7695
	JML $01A5E0

SPR_SPR_INTERACT_4:
	PHX
	TYX
	STX $00
	%update_pointers($00)
	PHK
	PEA.w .jslrtsreturn-1
	PEA.w $0180CA-1
	JML $01B4E2
.jslrtsreturn
	PLX
	STX $00
	%update_pointers($00)
	JML $01A5D9

SPR_SPR_INTERACT_3:
    %update_pointers($7695)
	LDX $7695
	LDY $75E9
	JML $01A7C8

SPR_SPR_INTERACT_LOOP:
	DEX
	BMI .end
	STX $00
    %update_pointers($00)
	JML $01A417
.end
    %update_pointers($75e9)
	JML $01A4B6

SPR_SPR_INTERACT_INIT:
	LSR
	BCC .return
	DEX
	STX $00
    %update_pointers($00)
	JML $01A417
.return
	JML $01A40A
	
;note that this doesn't restore -- this might be an problem
;however, the only good place for restoring it is a sfx
;99% likely to be hijacked by AMK. so the only thing for now is hope
;that the current fix won't cause any other bug.
YOSHI_SPIT:
	TYX
	STX $00
	%update_pointers($00)
	STZ !sprite_status,x
	JML $01F281
	
; Apply no more sprite tile limits patch at the end
incsrc NoMoreSpriteTileLimits.asm