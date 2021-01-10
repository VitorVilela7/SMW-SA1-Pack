!a1                     = $00
!a2                     = $01
!a3                     = $02
!a4                     = $03
!a5                     = $04
!a6                     = $05
!a7                     = $06
!a8                     = $07
!a9                     = $08
!a10                    = $09
!a11                    = $0A
!a12                    = $0B

!a15                    = $0E

!RAM_SpriteYHi          = $3258
!RAM_SpriteXHi          = $326E
!RAM_ScreenBndryXLo     = $1A
!RAM_ScreenBndryYLo     = $1C
!RAM_SpriteYLo          = $3216 
!RAM_SpriteXLo          = $322C 
!RAM_SprProcessIndex    = $75E9

call_finish_oam_write:

; Finish OAM Write that uses MaxTile API
; Requires pointers to be at $3100 and $3102.

FinishOAMWrite:
    PHB
    PHK
    PLB
    JSR FinishOAMWriteRt
    PLB
    RTL

FinishOAMWriteRt:
    STY !a12
    STA !a9
    LDA !RAM_SpriteYLo,X
    STA !a1
    SEC
    SBC !RAM_ScreenBndryYLo
    STA !a7
    LDA !RAM_SpriteYHi,X
    STA !a2
    LDA !RAM_SpriteXLo,X
    STA !a3
    SEC
    SBC !RAM_ScreenBndryXLo
    STA !a8
    LDA !RAM_SpriteXHi,X
    STA !a4
    
    REP #$10
    LDY $3102
    STY !a15
    LDY $3100
    
    LDA #$40
    PHA
    PLB
    
CODE_01B7DE:
    ; Slot given by MaxTile
    LDX !a15
    LDA !a12
    BPL CODE_01B7F0
    LDA $0000,x
    AND #$02
    STA $0000,x
    BRA CODE_01B7F3

CODE_01B7F0:
    STA $0000,x

CODE_01B7F3:
    LDX #$0000
    LDA $0000,y
    SEC
    SBC !a8
    BPL CODE_01B7FE
    DEX
CODE_01B7FE:
    CLC
    ADC !a3
    STA !a5
    TXA
    ADC !a4
    STA !a6
    JSR CODE_01B844
    BCC CODE_01B819
    LDX !a15
    LDA $0000,x
    ORA #$01
    STA $0000,x
CODE_01B819:
    LDX #$0000
    LDA $0001,y
    SEC
    SBC !a7
    BPL CODE_01B824
    DEX
CODE_01B824:
    CLC
    ADC !a1
    STA !a10
    TXA
    ADC !a2
    STA !a11
    JSR CODE_01C9BF
    BCC CODE_01B838
    LDA #$F0
    STA $0001,y
CODE_01B838:
    INY
    INY
    INY
    INY
    ; It's safe to increment in 8-bit.
    INC !a15
    DEC !a9
    BPL CODE_01B7DE
    
    SEP #$10
    PHK
    PLB
    
    LDX !RAM_SprProcessIndex
    RTS

CODE_01B844:
    REP #$20
    LDA !a5
    SEC
    SBC !RAM_ScreenBndryXLo
    CMP #$0100
    SEP #$20
    RTS
    
CODE_01C9BF:
    REP #$20
    LDA !a10
    PHA
    CLC
    ADC #$0010
    STA !a10
    SEC
    SBC !RAM_ScreenBndryYLo
    CMP #$0100
    PLA
    STA !a10
    SEP #$20
Return01C9D5:
    RTS
    