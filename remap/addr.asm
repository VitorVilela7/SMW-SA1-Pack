@includefrom sa1.asm

; SA-1 Pack v1.20 fixes
org $00C5D8
	STA $7928
org $01A799
	STZ $33FA,x

;Fixes more bugs.
;For some reason some opcodes is still bytes.
;So all that I can do is fixing manually...
if read1($01A799+2) == $16
	ORG $01A799+2
		db $76
endif

if read1($02A4E5+2) == $17
	ORG $02A4E5+2
		db $77
endif

if read1($0CD5D5+2) == $1D
	ORG $0CD5D5+2
		db $7D
endif

;Fix overworld sprites
; danmit p4 all.log, my tool read
;CODE_04F67C:
;	LDA.w $04F616,Y
;As:
;	LDA.w $04F6
; killing all overworld sprites with that...

if read1($04F67E) == $64
	print "Overworld sprites fixed!"
	org $04F67D
		dw $F616
endif

if read1($0DA691+2) != $7E

;================ EXTRA REMAP
org $008031
	LDY #$63FD
org $008457
	LDA #$0062
org $01A799
	STZ $763E,X
org $04825E
	STA $6DBA,X
org $009520
	STA $73C6
org $00A27B
	STA $73CE
org $01B22B
	INC $7602,X
org $02A4E5
	STA $770B,X
org $039034
	LDY $785D
org $028A7A
	LDX $7865	
org $028804
	LDY $78CD
org $0DA691
	LDA $007EA2,X
org $0DEC96
	LDA $007F27,X
org $0DA600
	LDA #$79
org $0DA8EC
	LDA #$79
org $0DB2EC
	LDA #$79
org $0DB35A
	LDA #$79
org $A5DB
	LDX.w #$6703
	LDY.w #$6905
org $A451
	LDA.w #$6BF6
org $A46D
	LDA.w #$6CB6
org $A4F6
	LDY.w #$6AF6
org $8DE7
	db $00,$18,$F9,$6E,$00,$1C,$00
	db $00,$18,$15,$6F,$00,$1B,$00	
org $9249
	db $00,$22,$03,$67,$00,$00,$02
org $A47F
	db $82,$66,$00,$05,$69,$00,$03,$67,$00
org $8A16
	db $01,$18,$E6,$7B,$00,$40,$00
	db $01,$18,$26,$7C,$00,$2C,$00
	db $01,$18,$66,$7C,$00,$40,$00
	db $01,$18,$A6,$7C,$00,$2C,$00
	db $01,$18,$E8,$7C,$00,$40,$00
	db $01,$18,$28,$7D,$00,$2C,$00
	db $01,$18,$68,$7D,$00,$40,$00
	db $01,$18,$A8,$7D,$00,$2C,$00
org $9313
	db $02,$0D,$A0,$64,$00
	db $02,$0F,$AA,$64,$00
	db $02,$11,$B4,$64,$00
org $9277
	db $41,$26,$7C,$92,$00
	db $F0 : dw $64A0
	db $F0 : dw $6580
	db $00

;============== REMAPPER FOR $0100
org $008056
	dw $6100
org $009323
	dw $6100
org $0093F5
	dw $6100
org $009418
	dw $6100
org $009429
	dw $6100
org $009526
	dw $6100
org $00958E
	dw $6100
org $009599
	dw $6100
org $009747
	dw $6100
org $009B2D
	dw $6100
org $009B30
	dw $6100
org $009C8C
	dw $6100
org $009CE1
	dw $6100
org $009D27
	dw $6100
org $009E03
	dw $6100
org $009F5C
	dw $6100
org $00A0AB
	dw $6100
org $00A287
	dw $6100
org $00C531
	dw $6100
org $00C5C5
	dw $6100
org $00C901
	dw $6100
org $00CA26
	dw $6100
org $00D105
	dw $6100
org $00D279
	dw $6100
org $049196
	dw $6100
org $0491E6
	dw $6100
org $058092
	dw $6100
org $05B16B
	dw $6100
org $0C93B8
	dw $6100
org $0CA719
	dw $6100
org $0CAB53
	dw $6100
org $0CAEFE
	dw $6100
org $0CAF0A
	dw $6100
org $0CCFF4
	dw $6100
;============== REMAPPER FOR $0101
org $0096B9
	dw $6101
org $00AA02
	dw $6101
org $00AA14
	dw $6101
;============== REMAPPER FOR $0102
;============== REMAPPER FOR $0103
;============== REMAPPER FOR $0104
;============== REMAPPER FOR $0105
org $00AA43
	dw $6105
org $00AA55
	dw $6105
org $00AA65
	dw $6105
;============== REMAPPER FOR $0106
;============== REMAPPER FOR $0107
;============== REMAPPER FOR $0108
;============== REMAPPER FOR $0109
org $008059
	dw $6109
org $00813A
	dw $6109
org $00969D
	dw $6109
org $0096BF
	dw $6109
org $0096D0
	dw $6109
org $00971B
	dw $6109
org $009CB3
	dw $6109
org $009CF9
	dw $6109
org $00A097
	dw $6109
org $01EC34
	dw $6109
org $05B133
	dw $6109
org $05B161
	dw $6109
org $05B187
	dw $6109
org $05D843
	dw $6109
;============== REMAPPER FOR $010A
org $009BCD
	dw $610A
org $009CF0
	dw $610A
;============== REMAPPER FOR $010B
;============== REMAPPER FOR $010C
;============== REMAPPER FOR $010D
;============== REMAPPER FOR $010E
;============== REMAPPER FOR $010F
;============== REMAPPER FOR $0110
;============== REMAPPER FOR $0111
;============== REMAPPER FOR $0112
;============== REMAPPER FOR $0113
;============== REMAPPER FOR $0114
;============== REMAPPER FOR $0115
;============== REMAPPER FOR $0116
;============== REMAPPER FOR $0117
;============== REMAPPER FOR $0118
;============== REMAPPER FOR $0119
;============== REMAPPER FOR $011A
;============== REMAPPER FOR $011B
;============== REMAPPER FOR $011C
;============== REMAPPER FOR $011D
;============== REMAPPER FOR $011E
;============== REMAPPER FOR $011F
;============== REMAPPER FOR $0120
;============== REMAPPER FOR $0121
;============== REMAPPER FOR $0122
;============== REMAPPER FOR $0123
;============== REMAPPER FOR $0124
;============== REMAPPER FOR $0125
;============== REMAPPER FOR $0126
;============== REMAPPER FOR $0127
;============== REMAPPER FOR $0128
;============== REMAPPER FOR $0129
;============== REMAPPER FOR $012A
;============== REMAPPER FOR $012B
;============== REMAPPER FOR $012C
;============== REMAPPER FOR $012D
;============== REMAPPER FOR $012E
;============== REMAPPER FOR $012F
;============== REMAPPER FOR $0130
;============== REMAPPER FOR $0131
;============== REMAPPER FOR $0132
;============== REMAPPER FOR $0133
;============== REMAPPER FOR $0134
;============== REMAPPER FOR $0135
;============== REMAPPER FOR $0136
;============== REMAPPER FOR $0137
;============== REMAPPER FOR $0138
;============== REMAPPER FOR $0139
;============== REMAPPER FOR $013A
;============== REMAPPER FOR $013B
;============== REMAPPER FOR $013C
;============== REMAPPER FOR $013D
;============== REMAPPER FOR $013E
;============== REMAPPER FOR $013F
;============== REMAPPER FOR $0140
;============== REMAPPER FOR $0141
;============== REMAPPER FOR $0142
;============== REMAPPER FOR $0143
;============== REMAPPER FOR $0144
;============== REMAPPER FOR $0145
;============== REMAPPER FOR $0146
;============== REMAPPER FOR $0147
;============== REMAPPER FOR $0148
;============== REMAPPER FOR $0149
;============== REMAPPER FOR $014A
;============== REMAPPER FOR $014B
;============== REMAPPER FOR $014C
;============== REMAPPER FOR $014D
;============== REMAPPER FOR $014E
;============== REMAPPER FOR $014F
;============== REMAPPER FOR $0150
;============== REMAPPER FOR $0151
;============== REMAPPER FOR $0152
;============== REMAPPER FOR $0153
;============== REMAPPER FOR $0154
;============== REMAPPER FOR $0155
;============== REMAPPER FOR $0156
;============== REMAPPER FOR $0157
;============== REMAPPER FOR $0158
;============== REMAPPER FOR $0159
;============== REMAPPER FOR $015A
;============== REMAPPER FOR $015B
;============== REMAPPER FOR $015C
;============== REMAPPER FOR $015D
;============== REMAPPER FOR $015E
;============== REMAPPER FOR $015F
;============== REMAPPER FOR $0160
;============== REMAPPER FOR $0161
;============== REMAPPER FOR $0162
;============== REMAPPER FOR $0163
;============== REMAPPER FOR $0164
;============== REMAPPER FOR $0165
;============== REMAPPER FOR $0166
;============== REMAPPER FOR $0167
;============== REMAPPER FOR $0168
;============== REMAPPER FOR $0169
;============== REMAPPER FOR $016A
;============== REMAPPER FOR $016B
;============== REMAPPER FOR $016C
;============== REMAPPER FOR $016D
;============== REMAPPER FOR $016E
;============== REMAPPER FOR $016F
;============== REMAPPER FOR $0170
;============== REMAPPER FOR $0171
;============== REMAPPER FOR $0172
;============== REMAPPER FOR $0173
;============== REMAPPER FOR $0174
;============== REMAPPER FOR $0175
;============== REMAPPER FOR $0176
;============== REMAPPER FOR $0177
;============== REMAPPER FOR $0178
;============== REMAPPER FOR $0179
;============== REMAPPER FOR $017A
;============== REMAPPER FOR $017B
;============== REMAPPER FOR $017C
;============== REMAPPER FOR $017D
;============== REMAPPER FOR $017E
;============== REMAPPER FOR $017F
;============== REMAPPER FOR $0180
;============== REMAPPER FOR $0181
;============== REMAPPER FOR $0182
;============== REMAPPER FOR $0183
;============== REMAPPER FOR $0184
;============== REMAPPER FOR $0185
;============== REMAPPER FOR $0186
;============== REMAPPER FOR $0187
;============== REMAPPER FOR $0188
;============== REMAPPER FOR $0189
;============== REMAPPER FOR $018A
;============== REMAPPER FOR $018B
;============== REMAPPER FOR $018C
;============== REMAPPER FOR $018D
;============== REMAPPER FOR $018E
;============== REMAPPER FOR $018F
;============== REMAPPER FOR $0190
;============== REMAPPER FOR $0191
;============== REMAPPER FOR $0192
;============== REMAPPER FOR $0193
;============== REMAPPER FOR $0194
;============== REMAPPER FOR $0195
;============== REMAPPER FOR $0196
;============== REMAPPER FOR $0197
;============== REMAPPER FOR $0198
;============== REMAPPER FOR $0199
;============== REMAPPER FOR $019A
;============== REMAPPER FOR $019B
;============== REMAPPER FOR $019C
;============== REMAPPER FOR $019D
;============== REMAPPER FOR $019E
;============== REMAPPER FOR $019F
;============== REMAPPER FOR $01A0
;============== REMAPPER FOR $01A1
;============== REMAPPER FOR $01A2
;============== REMAPPER FOR $01A3
;============== REMAPPER FOR $01A4
;============== REMAPPER FOR $01A5
;============== REMAPPER FOR $01A6
;============== REMAPPER FOR $01A7
;============== REMAPPER FOR $01A8
;============== REMAPPER FOR $01A9
;============== REMAPPER FOR $01AA
;============== REMAPPER FOR $01AB
;============== REMAPPER FOR $01AC
;============== REMAPPER FOR $01AD
;============== REMAPPER FOR $01AE
;============== REMAPPER FOR $01AF
;============== REMAPPER FOR $01B0
;============== REMAPPER FOR $01B1
;============== REMAPPER FOR $01B2
;============== REMAPPER FOR $01B3
;============== REMAPPER FOR $01B4
;============== REMAPPER FOR $01B5
;============== REMAPPER FOR $01B6
;============== REMAPPER FOR $01B7
;============== REMAPPER FOR $01B8
;============== REMAPPER FOR $01B9
;============== REMAPPER FOR $01BA
;============== REMAPPER FOR $01BB
;============== REMAPPER FOR $01BC
;============== REMAPPER FOR $01BD
;============== REMAPPER FOR $01BE
;============== REMAPPER FOR $01BF
;============== REMAPPER FOR $01C0
;============== REMAPPER FOR $01C1
;============== REMAPPER FOR $01C2
;============== REMAPPER FOR $01C3
;============== REMAPPER FOR $01C4
;============== REMAPPER FOR $01C5
;============== REMAPPER FOR $01C6
;============== REMAPPER FOR $01C7
;============== REMAPPER FOR $01C8
;============== REMAPPER FOR $01C9
;============== REMAPPER FOR $01CA
;============== REMAPPER FOR $01CB
;============== REMAPPER FOR $01CC
;============== REMAPPER FOR $01CD
;============== REMAPPER FOR $01CE
;============== REMAPPER FOR $01CF
;============== REMAPPER FOR $01D0
;============== REMAPPER FOR $01D1
;============== REMAPPER FOR $01D2
;============== REMAPPER FOR $01D3
;============== REMAPPER FOR $01D4
;============== REMAPPER FOR $01D5
;============== REMAPPER FOR $01D6
;============== REMAPPER FOR $01D7
;============== REMAPPER FOR $01D8
;============== REMAPPER FOR $01D9
;============== REMAPPER FOR $01DA
;============== REMAPPER FOR $01DB
;============== REMAPPER FOR $01DC
;============== REMAPPER FOR $01DD
;============== REMAPPER FOR $01DE
;============== REMAPPER FOR $01DF
;============== REMAPPER FOR $01E0
;============== REMAPPER FOR $01E1
;============== REMAPPER FOR $01E2
;============== REMAPPER FOR $01E3
;============== REMAPPER FOR $01E4
;============== REMAPPER FOR $01E5
;============== REMAPPER FOR $01E6
;============== REMAPPER FOR $01E7
;============== REMAPPER FOR $01E8
;============== REMAPPER FOR $01E9
;============== REMAPPER FOR $01EA
;============== REMAPPER FOR $01EB
;============== REMAPPER FOR $01EC
;============== REMAPPER FOR $01ED
;============== REMAPPER FOR $01EE
;============== REMAPPER FOR $01EF
;============== REMAPPER FOR $01F0
;============== REMAPPER FOR $01F1
;============== REMAPPER FOR $01F2
;============== REMAPPER FOR $01F3
;============== REMAPPER FOR $01F4
;============== REMAPPER FOR $01F5
;============== REMAPPER FOR $01F6
;============== REMAPPER FOR $01F7
;============== REMAPPER FOR $01F8
;============== REMAPPER FOR $01F9
;============== REMAPPER FOR $01FA
;============== REMAPPER FOR $01FB
;============== REMAPPER FOR $01FC
;============== REMAPPER FOR $01FD
;============== REMAPPER FOR $01FE
;============== REMAPPER FOR $01FF
;============== REMAPPER FOR $0200
org $0090B0
	dw $6200
org $0093A2
	dw $6200
org $01F46D
	dw $6200
org $028460
	dw $6200
org $028C92
	dw $6200
org $028D14
	dw $6200
org $028D9C
	dw $6200
org $028E32
	dw $6200
org $028EAF
	dw $6200
org $028EEF
	dw $6200
org $028F57
	dw $6200
org $028FF2
	dw $6200
org $029244
	dw $6200
org $029758
	dw $6200
org $0297BF
	dw $6200
org $029976
	dw $6200
org $029A47
	dw $6200
org $029A7B
	dw $6200
org $029B79
	dw $6200
org $029D1E
	dw $6200
org $029DF4
	dw $6200
org $029EB2
	dw $6200
org $029F4A
	dw $6200
org $029F50
	dw $6200
org $02A1DB
	dw $6200
org $02A28D
	dw $6200
org $02A377
	dw $6200
org $02AEB8
	dw $6200
org $02AF08
	dw $6200
org $02BB57
	dw $6200
org $02F407
	dw $6200
org $02F6C3
	dw $6200
org $02F7D7
	dw $6200
org $02FE52
	dw $6200
org $03AFEA
	dw $6200
org $03B465
	dw $6200
org $03B501
	dw $6200
org $03CA8D
	dw $6200
org $03D689
	dw $6200
org $0485F6
	dw $6200
org $05B305
	dw $6200
org $07F20D
	dw $6200
org $0CA62D
	dw $6200
org $0CA84D
	dw $6200
org $0CA8FA
	dw $6200
org $0CA9B1
	dw $6200
org $0CAA2A
	dw $6200
org $0CAAE9
	dw $6200
org $0CB5F6
	dw $6200
org $0CCB6F
	dw $6200
org $0CCEB0
	dw $6200
org $0CCF56
	dw $6200
org $0CCFB4
	dw $6200
org $0CD080
	dw $6200
org $0CD436
	dw $6200
org $0CD4C8
	dw $6200
org $0CD52D
	dw $6200
org $0CD59F
	dw $6200
;============== REMAPPER FOR $0201
org $00908C
	dw $6201
org $0090B5
	dw $6201
org $0093A7
	dw $6201
org $01F481
	dw $6201
org $028443
	dw $6201
org $02845B
	dw $6201
org $028C97
	dw $6201
org $028D21
	dw $6201
org $028DA9
	dw $6201
org $028E3F
	dw $6201
org $028EA2
	dw $6201
org $028EFC
	dw $6201
org $028F64
	dw $6201
org $028FFB
	dw $6201
org $029239
	dw $6201
org $029765
	dw $6201
org $0297D4
	dw $6201
org $02997F
	dw $6201
org $029A4C
	dw $6201
org $029B82
	dw $6201
org $029D2D
	dw $6201
org $029D48
	dw $6201
org $029DE7
	dw $6201
org $029EBF
	dw $6201
org $029F53
	dw $6201
org $029F59
	dw $6201
org $02A1D6
	dw $6201
org $02A2A1
	dw $6201
org $02A384
	dw $6201
org $02AEAC
	dw $6201
org $02AF11
	dw $6201
org $02BB69
	dw $6201
org $02F40F
	dw $6201
org $02F6D2
	dw $6201
org $02F7E8
	dw $6201
org $02FE5B
	dw $6201
org $03AFF0
	dw $6201
org $03B46B
	dw $6201
org $03B50A
	dw $6201
org $03CA95
	dw $6201
org $048600
	dw $6201
org $05B320
	dw $6201
org $07F217
	dw $6201
org $0CA633
	dw $6201
org $0CA858
	dw $6201
org $0CA8FF
	dw $6201
org $0CA9C3
	dw $6201
org $0CAA32
	dw $6201
org $0CAAEF
	dw $6201
org $0CB615
	dw $6201
org $0CCB74
	dw $6201
org $0CCEB6
	dw $6201
org $0CCF5C
	dw $6201
org $0CCFB9
	dw $6201
org $0CD085
	dw $6201
org $0CD43C
	dw $6201
org $0CD4D4
	dw $6201
org $0CD539
	dw $6201
org $0CD5AB
	dw $6201
;============== REMAPPER FOR $0202
org $0090C5
	dw $6202
org $0093AD
	dw $6202
org $01F48E
	dw $6202
org $02846B
	dw $6202
org $028CA4
	dw $6202
org $028D27
	dw $6202
org $028DBD
	dw $6202
org $028E67
	dw $6202
org $028EB4
	dw $6202
org $028F15
	dw $6202
org $028F71
	dw $6202
org $02900F
	dw $6202
org $029256
	dw $6202
org $029787
	dw $6202
org $029806
	dw $6202
org $029818
	dw $6202
org $029993
	dw $6202
org $029A51
	dw $6202
org $029A8D
	dw $6202
org $029B9A
	dw $6202
org $029C5B
	dw $6202
org $029C96
	dw $6202
org $029D32
	dw $6202
org $029D4D
	dw $6202
org $029E06
	dw $6202
org $029E6C
	dw $6202
org $029ED0
	dw $6202
org $029F5E
	dw $6202
org $029F80
	dw $6202
org $02A18F
	dw $6202
org $02A1ED
	dw $6202
org $02A244
	dw $6202
org $02A2A6
	dw $6202
org $02A2C7
	dw $6202
org $02A2D2
	dw $6202
org $02A32B
	dw $6202
org $02A390
	dw $6202
org $02AEC9
	dw $6202
org $02AF16
	dw $6202
org $02BB70
	dw $6202
org $02F41A
	dw $6202
org $02F6D7
	dw $6202
org $02F7DD
	dw $6202
org $02FE60
	dw $6202
org $03AFF6
	dw $6202
org $03B470
	dw $6202
org $03B515
	dw $6202
org $03CAAC
	dw $6202
org $03D68F
	dw $6202
org $048605
	dw $6202
org $05B2FC
	dw $6202
org $07F22B
	dw $6202
org $0CA63F
	dw $6202
org $0CA867
	dw $6202
org $0CA908
	dw $6202
org $0CA91A
	dw $6202
org $0CA9D2
	dw $6202
org $0CAA3E
	dw $6202
org $0CAAF5
	dw $6202
org $0CB61B
	dw $6202
org $0CCB65
	dw $6202
org $0CCEC2
	dw $6202
org $0CCF62
	dw $6202
org $0CCFAA
	dw $6202
org $0CD08B
	dw $6202
org $0CD449
	dw $6202
org $0CD4D9
	dw $6202
org $0CD548
	dw $6202
org $0CD5B7
	dw $6202
;============== REMAPPER FOR $0203
org $0090BC
	dw $6203
org $0093B2
	dw $6203
org $01F49C
	dw $6203
org $028470
	dw $6203
org $028CAC
	dw $6203
org $028D36
	dw $6203
org $028DC4
	dw $6203
org $028E46
	dw $6203
org $028EC0
	dw $6203
org $028F1C
	dw $6203
org $028F78
	dw $6203
org $02901E
	dw $6203
org $02924C
	dw $6203
org $029779
	dw $6203
org $0297EF
	dw $6203
org $029984
	dw $6203
org $029A58
	dw $6203
org $029A93
	dw $6203
org $029B89
	dw $6203
org $029C55
	dw $6203
org $029C91
	dw $6203
org $029D39
	dw $6203
org $029DFE
	dw $6203
org $029E6F
	dw $6203
org $029E76
	dw $6203
org $029ED7
	dw $6203
org $029F8D
	dw $6203
org $02A197
	dw $6203
org $02A1F7
	dw $6203
org $02A202
	dw $6203
org $02A247
	dw $6203
org $02A24E
	dw $6203
org $02A2B3
	dw $6203
org $02A2D5
	dw $6203
org $02A2DC
	dw $6203
org $02A337
	dw $6203
org $02A39F
	dw $6203
org $02AEE3
	dw $6203
org $02AF1D
	dw $6203
org $02BB79
	dw $6203
org $02F420
	dw $6203
org $02F6DC
	dw $6203
org $02F7F6
	dw $6203
org $02FE65
	dw $6203
org $03AFFC
	dw $6203
org $03B476
	dw $6203
org $03B51C
	dw $6203
org $03CAC2
	dw $6203
org $04860A
	dw $6203
org $07F236
	dw $6203
org $0CA645
	dw $6203
org $0CA873
	dw $6203
org $0CA90D
	dw $6203
org $0CA920
	dw $6203
org $0CA9DE
	dw $6203
org $0CAA1E
	dw $6203
org $0CAAFB
	dw $6203
org $0CB625
	dw $6203
org $0CCB6A
	dw $6203
org $0CCEC8
	dw $6203
org $0CCF68
	dw $6203
org $0CCFAF
	dw $6203
org $0CD091
	dw $6203
org $0CD44F
	dw $6203
org $0CD4DE
	dw $6203
org $0CD54D
	dw $6203
org $0CD5BC
	dw $6203
;============== REMAPPER FOR $0204
org $0297C8
	dw $6204
org $029A7E
	dw $6204
org $02AEBE
	dw $6204
org $0CA847
	dw $6204
org $0CA9BA
	dw $6204
org $0CAA2D
	dw $6204
org $0CCCF0
	dw $6204
org $0CCE74
	dw $6204
;============== REMAPPER FOR $0205
org $0297D7
	dw $6205
org $029A86
	dw $6205
org $02ADB3
	dw $6205
org $02AEAF
	dw $6205
org $0CA85B
	dw $6205
org $0CA9CC
	dw $6205
org $0CAA38
	dw $6205
org $0CCCF5
	dw $6205
org $0CCE7A
	dw $6205
;============== REMAPPER FOR $0206
org $02980E
	dw $6206
org $029820
	dw $6206
org $029A90
	dw $6206
org $02AECF
	dw $6206
org $0CA861
	dw $6206
org $0CA9D8
	dw $6206
org $0CAA44
	dw $6206
org $0CCCDA
	dw $6206
org $0CCE80
	dw $6206
;============== REMAPPER FOR $0207
org $0297F2
	dw $6207
org $029A98
	dw $6207
org $02AEE6
	dw $6207
org $0CA86D
	dw $6207
org $0CA9E4
	dw $6207
org $0CAA24
	dw $6207
org $0CCCEB
	dw $6207
org $0CCE85
	dw $6207
;============== REMAPPER FOR $0208
org $01E96A
	dw $6208
org $0297C2
	dw $6208
;============== REMAPPER FOR $0209
org $01E973
	dw $6209
org $0297DD
	dw $6209
org $02ADB6
	dw $6209
;============== REMAPPER FOR $020A
org $01E978
	dw $620A
org $029811
	dw $620A
org $029823
	dw $620A
;============== REMAPPER FOR $020B
org $01E97D
	dw $620B
org $0297F7
	dw $620B
;============== REMAPPER FOR $020C
org $0282EE
	dw $620C
org $028338
	dw $620C
org $02833B
	dw $620C
org $0297CB
	dw $620C
;============== REMAPPER FOR $020D
org $0282B0
	dw $620D
org $028303
	dw $620D
org $02833E
	dw $620D
org $028341
	dw $620D
org $0297E0
	dw $620D
;============== REMAPPER FOR $020E
org $028311
	dw $620E
org $028344
	dw $620E
org $028347
	dw $620E
org $0283B0
	dw $620E
org $0283B5
	dw $620E
org $029809
	dw $620E
org $02981B
	dw $620E
;============== REMAPPER FOR $020F
org $028316
	dw $620F
org $02834A
	dw $620F
org $02834D
	dw $620F
org $0283BA
	dw $620F
org $0297FA
	dw $620F
;============== REMAPPER FOR $0210
;============== REMAPPER FOR $0211
;============== REMAPPER FOR $0212
;============== REMAPPER FOR $0213
;============== REMAPPER FOR $0214
;============== REMAPPER FOR $0215
;============== REMAPPER FOR $0216
;============== REMAPPER FOR $0217
;============== REMAPPER FOR $0218
;============== REMAPPER FOR $0219
;============== REMAPPER FOR $021A
;============== REMAPPER FOR $021B
;============== REMAPPER FOR $021C
;============== REMAPPER FOR $021D
;============== REMAPPER FOR $021E
;============== REMAPPER FOR $021F
;============== REMAPPER FOR $0220
;============== REMAPPER FOR $0221
;============== REMAPPER FOR $0222
;============== REMAPPER FOR $0223
;============== REMAPPER FOR $0224
;============== REMAPPER FOR $0225
;============== REMAPPER FOR $0226
;============== REMAPPER FOR $0227
;============== REMAPPER FOR $0228
;============== REMAPPER FOR $0229
;============== REMAPPER FOR $022A
;============== REMAPPER FOR $022B
;============== REMAPPER FOR $022C
;============== REMAPPER FOR $022D
;============== REMAPPER FOR $022E
;============== REMAPPER FOR $022F
;============== REMAPPER FOR $0230
;============== REMAPPER FOR $0231
;============== REMAPPER FOR $0232
;============== REMAPPER FOR $0233
;============== REMAPPER FOR $0234
;============== REMAPPER FOR $0235
;============== REMAPPER FOR $0236
;============== REMAPPER FOR $0237
;============== REMAPPER FOR $0238
;============== REMAPPER FOR $0239
;============== REMAPPER FOR $023A
;============== REMAPPER FOR $023B
;============== REMAPPER FOR $023C
;============== REMAPPER FOR $023D
;============== REMAPPER FOR $023E
;============== REMAPPER FOR $023F
;============== REMAPPER FOR $0240
org $04FB18
	dw $6240
;============== REMAPPER FOR $0241
org $04FB22
	dw $6241
;============== REMAPPER FOR $0242
org $04FB0B
	dw $6242
;============== REMAPPER FOR $0243
org $04FB0F
	dw $6243
;============== REMAPPER FOR $0244
;============== REMAPPER FOR $0245
;============== REMAPPER FOR $0246
;============== REMAPPER FOR $0247
;============== REMAPPER FOR $0248
;============== REMAPPER FOR $0249
;============== REMAPPER FOR $024A
;============== REMAPPER FOR $024B
;============== REMAPPER FOR $024C
;============== REMAPPER FOR $024D
;============== REMAPPER FOR $024E
;============== REMAPPER FOR $024F
;============== REMAPPER FOR $0250
;============== REMAPPER FOR $0251
;============== REMAPPER FOR $0252
;============== REMAPPER FOR $0253
;============== REMAPPER FOR $0254
;============== REMAPPER FOR $0255
;============== REMAPPER FOR $0256
;============== REMAPPER FOR $0257
;============== REMAPPER FOR $0258
;============== REMAPPER FOR $0259
;============== REMAPPER FOR $025A
;============== REMAPPER FOR $025B
;============== REMAPPER FOR $025C
;============== REMAPPER FOR $025D
;============== REMAPPER FOR $025E
;============== REMAPPER FOR $025F
;============== REMAPPER FOR $0260
;============== REMAPPER FOR $0261
;============== REMAPPER FOR $0262
;============== REMAPPER FOR $0263
;============== REMAPPER FOR $0264
;============== REMAPPER FOR $0265
;============== REMAPPER FOR $0266
;============== REMAPPER FOR $0267
;============== REMAPPER FOR $0268
;============== REMAPPER FOR $0269
;============== REMAPPER FOR $026A
;============== REMAPPER FOR $026B
;============== REMAPPER FOR $026C
;============== REMAPPER FOR $026D
;============== REMAPPER FOR $026E
;============== REMAPPER FOR $026F
;============== REMAPPER FOR $0270
;============== REMAPPER FOR $0271
;============== REMAPPER FOR $0272
;============== REMAPPER FOR $0273
;============== REMAPPER FOR $0274
;============== REMAPPER FOR $0275
;============== REMAPPER FOR $0276
;============== REMAPPER FOR $0277
;============== REMAPPER FOR $0278
;============== REMAPPER FOR $0279
;============== REMAPPER FOR $027A
;============== REMAPPER FOR $027B
;============== REMAPPER FOR $027C
;============== REMAPPER FOR $027D
;============== REMAPPER FOR $027E
;============== REMAPPER FOR $027F
;============== REMAPPER FOR $0280
org $04EC3B
	dw $6280
;============== REMAPPER FOR $0281
org $04EC44
	dw $6281
;============== REMAPPER FOR $0282
org $04EC49
	dw $6282
;============== REMAPPER FOR $0283
org $04EC4F
	dw $6283
;============== REMAPPER FOR $0284
;============== REMAPPER FOR $0285
;============== REMAPPER FOR $0286
;============== REMAPPER FOR $0287
;============== REMAPPER FOR $0288
;============== REMAPPER FOR $0289
;============== REMAPPER FOR $028A
;============== REMAPPER FOR $028B
;============== REMAPPER FOR $028C
;============== REMAPPER FOR $028D
;============== REMAPPER FOR $028E
;============== REMAPPER FOR $028F
;============== REMAPPER FOR $0290
;============== REMAPPER FOR $0291
;============== REMAPPER FOR $0292
;============== REMAPPER FOR $0293
;============== REMAPPER FOR $0294
;============== REMAPPER FOR $0295
;============== REMAPPER FOR $0296
;============== REMAPPER FOR $0297
;============== REMAPPER FOR $0298
;============== REMAPPER FOR $0299
;============== REMAPPER FOR $029A
;============== REMAPPER FOR $029B
;============== REMAPPER FOR $029C
org $0489AC
	dw $629C
org $048D2A
	dw $629C
org $04F572
	dw $629C
;============== REMAPPER FOR $029D
org $048D33
	dw $629D
;============== REMAPPER FOR $029E
org $0489B5
	dw $629E
org $048D65
	dw $629E
org $04F57E
	dw $629E
;============== REMAPPER FOR $029F
;============== REMAPPER FOR $02A0
org $03AA93
	dw $62A0
org $04F578
	dw $62A0
;============== REMAPPER FOR $02A1
org $03AAA1
	dw $62A1
;============== REMAPPER FOR $02A2
org $03AAA9
	dw $62A2
org $04F584
	dw $62A2
;============== REMAPPER FOR $02A3
org $03AAB9
	dw $62A3
;============== REMAPPER FOR $02A4
org $03AA99
	dw $62A4
;============== REMAPPER FOR $02A5
org $03AAA4
	dw $62A5
;============== REMAPPER FOR $02A6
org $03AAAE
	dw $62A6
;============== REMAPPER FOR $02A7
org $03AABC
	dw $62A7
;============== REMAPPER FOR $02A8
;============== REMAPPER FOR $02A9
;============== REMAPPER FOR $02AA
;============== REMAPPER FOR $02AB
;============== REMAPPER FOR $02AC
;============== REMAPPER FOR $02AD
;============== REMAPPER FOR $02AE
;============== REMAPPER FOR $02AF
;============== REMAPPER FOR $02B0
;============== REMAPPER FOR $02B1
;============== REMAPPER FOR $02B2
;============== REMAPPER FOR $02B3
;============== REMAPPER FOR $02B4
org $0487A0
	dw $62B4
;============== REMAPPER FOR $02B5
org $0487AE
	dw $62B5
;============== REMAPPER FOR $02B6
org $0487B6
	dw $62B6
;============== REMAPPER FOR $02B7
org $0487BE
	dw $62B7
;============== REMAPPER FOR $02B8
org $0487A6
	dw $62B8
;============== REMAPPER FOR $02B9
org $0487B1
	dw $62B9
;============== REMAPPER FOR $02BA
org $0487B9
	dw $62BA
;============== REMAPPER FOR $02BB
org $0487C3
	dw $62BB
;============== REMAPPER FOR $02BC
;============== REMAPPER FOR $02BD
;============== REMAPPER FOR $02BE
;============== REMAPPER FOR $02BF
org $028385
	dw $62BF
;============== REMAPPER FOR $02C0
;============== REMAPPER FOR $02C1
;============== REMAPPER FOR $02C2
;============== REMAPPER FOR $02C3
org $028388
	dw $62C3
;============== REMAPPER FOR $02C4
;============== REMAPPER FOR $02C5
;============== REMAPPER FOR $02C6
;============== REMAPPER FOR $02C7
org $02838B
	dw $62C7
;============== REMAPPER FOR $02C8
;============== REMAPPER FOR $02C9
;============== REMAPPER FOR $02CA
;============== REMAPPER FOR $02CB
org $02838E
	dw $62CB
;============== REMAPPER FOR $02CC
;============== REMAPPER FOR $02CD
;============== REMAPPER FOR $02CE
;============== REMAPPER FOR $02CF
org $028391
	dw $62CF
;============== REMAPPER FOR $02D0
;============== REMAPPER FOR $02D1
;============== REMAPPER FOR $02D2
;============== REMAPPER FOR $02D3
org $028394
	dw $62D3
;============== REMAPPER FOR $02D4
;============== REMAPPER FOR $02D5
;============== REMAPPER FOR $02D6
;============== REMAPPER FOR $02D7
;============== REMAPPER FOR $02D8
;============== REMAPPER FOR $02D9
;============== REMAPPER FOR $02DA
;============== REMAPPER FOR $02DB
;============== REMAPPER FOR $02DC
;============== REMAPPER FOR $02DD
;============== REMAPPER FOR $02DE
;============== REMAPPER FOR $02DF
;============== REMAPPER FOR $02E0
;============== REMAPPER FOR $02E1
;============== REMAPPER FOR $02E2
;============== REMAPPER FOR $02E3
;============== REMAPPER FOR $02E4
;============== REMAPPER FOR $02E5
;============== REMAPPER FOR $02E6
;============== REMAPPER FOR $02E7
;============== REMAPPER FOR $02E8
;============== REMAPPER FOR $02E9
;============== REMAPPER FOR $02EA
;============== REMAPPER FOR $02EB
;============== REMAPPER FOR $02EC
;============== REMAPPER FOR $02ED
;============== REMAPPER FOR $02EE
;============== REMAPPER FOR $02EF
;============== REMAPPER FOR $02F0
;============== REMAPPER FOR $02F1
;============== REMAPPER FOR $02F2
;============== REMAPPER FOR $02F3
;============== REMAPPER FOR $02F4
;============== REMAPPER FOR $02F5
;============== REMAPPER FOR $02F6
;============== REMAPPER FOR $02F7
;============== REMAPPER FOR $02F8
;============== REMAPPER FOR $02F9
;============== REMAPPER FOR $02FA
;============== REMAPPER FOR $02FB
org $00E3DF
	dw $62FB
;============== REMAPPER FOR $02FC
org $0CD6B8
	dw $62FC
;============== REMAPPER FOR $02FD
org $0CD6A8
	dw $62FD
;============== REMAPPER FOR $02FE
org $01DCBC
	dw $62FE
org $0CD68C
	dw $62FE
;============== REMAPPER FOR $02FF
org $00E3E2
	dw $62FF
org $0CD697
	dw $62FF
;============== REMAPPER FOR $0300
org $00E49B
	dw $6300
org $018E1D
	dw $6300
org $01986B
	dw $6300
org $019D28
	dw $6300
org $019DAC
	dw $6300
org $019E68
	dw $6300
org $019F30
	dw $6300
org $01A3F5
	dw $6300
org $01AF6B
	dw $6300
org $01B308
	dw $6300
org $01B3F7
	dw $6300
org $01B673
	dw $6300
org $01B770
	dw $6300
org $01B7F6
	dw $6300
org $01BB5C
	dw $6300
org $01BD23
	dw $6300
org $01C13B
	dw $6300
org $01C64B
	dw $6300
org $01C678
	dw $6300
org $01C6B5
	dw $6300
org $01C7E7
	dw $6300
org $01C86E
	dw $6300
org $01C8AD
	dw $6300
org $01C8B7
	dw $6300
org $01C8F2
	dw $6300
org $01C940
	dw $6300
org $01D4B6
	dw $6300
org $01DBAF
	dw $6300
org $01DBDB
	dw $6300
org $01DBE1
	dw $6300
org $01DC18
	dw $6300
org $01DC88
	dw $6300
org $01DF2F
	dw $6300
org $01E240
	dw $6300
org $01E472
	dw $6300
org $01E49C
	dw $6300
org $01E4A1
	dw $6300
org $01E70B
	dw $6300
org $01E912
	dw $6300
org $01F07E
	dw $6300
org $01FEF9
	dw $6300
org $01FF6C
	dw $6300
org $02810C
	dw $6300
org $02970F
	dw $6300
org $029845
	dw $6300
org $0299A9
	dw $6300
org $02A065
	dw $6300
org $02A3BF
	dw $6300
org $02B767
	dw $6300
org $02B915
	dw $6300
org $02BC2C
	dw $6300
org $02BC40
	dw $6300
org $02BED0
	dw $6300
org $02BF2A
	dw $6300
org $02BF8D
	dw $6300
org $02C8DC
	dw $6300
org $02CA47
	dw $6300
org $02CABF
	dw $6300
org $02CB0D
	dw $6300
org $02CB6C
	dw $6300
org $02CBD1
	dw $6300
org $02CCDB
	dw $6300
org $02CD98
	dw $6300
org $02CF16
	dw $6300
org $02CF7C
	dw $6300
org $02D5F1
	dw $6300
org $02D7B2
	dw $6300
org $02D820
	dw $6300
org $02D855
	dw $6300
org $02DA05
	dw $6300
org $02DB0F
	dw $6300
org $02DC6A
	dw $6300
org $02DE6C
	dw $6300
org $02E029
	dw $6300
org $02E3DF
	dw $6300
org $02E587
	dw $6300
org $02E644
	dw $6300
org $02E68B
	dw $6300
org $02E6F8
	dw $6300
org $02E908
	dw $6300
org $02E9F2
	dw $6300
org $02ED69
	dw $6300
org $02EF4B
	dw $6300
org $02F156
	dw $6300
org $02F1B5
	dw $6300
org $02F1D8
	dw $6300
org $02F49A
	dw $6300
org $02F4F5
	dw $6300
org $02F5F0
	dw $6300
org $02F644
	dw $6300
org $02F7A4
	dw $6300
org $02F96B
	dw $6300
org $02FA35
	dw $6300
org $02FA60
	dw $6300
org $02FA67
	dw $6300
org $02FD54
	dw $6300
org $038409
	dw $6300
org $03849F
	dw $6300
org $0385CD
	dw $6300
org $0386C9
	dw $6300
org $038743
	dw $6300
org $038869
	dw $6300
org $038B66
	dw $6300
org $038D3B
	dw $6300
org $038E35
	dw $6300
org $038EC1
	dw $6300
org $038F40
	dw $6300
org $0391E3
	dw $6300
org $039232
	dw $6300
org $039235
	dw $6300
org $0394EA
	dw $6300
org $0396B7
	dw $6300
org $0397D2
	dw $6300
org $039BA0
	dw $6300
org $039C0C
	dw $6300
org $039E79
	dw $6300
org $039EE5
	dw $6300
org $03A0CA
	dw $6300
org $03A409
	dw $6300
org $03AADE
	dw $6300
org $03ACF0
	dw $6300
org $03AF82
	dw $6300
org $03AFBF
	dw $6300
org $03AFE7
	dw $6300
org $03B233
	dw $6300
org $03B3B9
	dw $6300
org $03B418
	dw $6300
org $03B4CD
	dw $6300
org $03B53B
	dw $6300
org $03C0D8
	dw $6300
org $03C28C
	dw $6300
org $03C41B
	dw $6300
org $03C4AB
	dw $6300
org $03C97C
	dw $6300
org $03CB5C
	dw $6300
org $03D4B0
	dw $6300
org $03D4F5
	dw $6300
org $0CA104
	dw $6300
org $0CA195
	dw $6300
;============== REMAPPER FOR $0301
org $00E483
	dw $6301
org $018E27
	dw $6301
org $01987A
	dw $6301
org $019D31
	dw $6301
org $019DA1
	dw $6301
org $019E05
	dw $6301
org $019E79
	dw $6301
org $019F35
	dw $6301
org $019FDD
	dw $6301
org $01AD87
	dw $6301
org $01AD8B
	dw $6301
org $01AE69
	dw $6301
org $01AE6F
	dw $6301
org $01AF74
	dw $6301
org $01B2ED
	dw $6301
org $01B3AB
	dw $6301
org $01B67C
	dw $6301
org $01B74A
	dw $6301
org $01B81C
	dw $6301
org $01B836
	dw $6301
org $01BB91
	dw $6301
org $01BD18
	dw $6301
org $01BEC1
	dw $6301
org $01C14F
	dw $6301
org $01C650
	dw $6301
org $01C6BB
	dw $6301
org $01C7DB
	dw $6301
org $01C860
	dw $6301
org $01C88A
	dw $6301
org $01C894
	dw $6301
org $01C8E5
	dw $6301
org $01C963
	dw $6301
org $01C97D
	dw $6301
org $01D4CA
	dw $6301
org $01DBB8
	dw $6301
org $01DBE4
	dw $6301
org $01DBEA
	dw $6301
org $01DC21
	dw $6301
org $01DC8D
	dw $6301
org $01DF5E
	dw $6301
org $01E248
	dw $6301
org $01E47D
	dw $6301
org $01E719
	dw $6301
org $01E91C
	dw $6301
org $01EF76
	dw $6301
org $01EF7D
	dw $6301
org $01EFB6
	dw $6301
org $01F088
	dw $6301
org $01FF07
	dw $6301
org $01FF75
	dw $6301
org $028111
	dw $6301
org $02971C
	dw $6301
org $02985A
	dw $6301
org $02993C
	dw $6301
org $0299B2
	dw $6301
org $02A072
	dw $6301
org $02A3CC
	dw $6301
org $02B77F
	dw $6301
org $02B8FD
	dw $6301
org $02BC51
	dw $6301
org $02BED9
	dw $6301
org $02BF33
	dw $6301
org $02BF96
	dw $6301
org $02C8EA
	dw $6301
org $02CA5B
	dw $6301
org $02CAD1
	dw $6301
org $02CB25
	dw $6301
org $02CB79
	dw $6301
org $02CBE8
	dw $6301
org $02CCE7
	dw $6301
org $02CDA1
	dw $6301
org $02CF29
	dw $6301
org $02CF95
	dw $6301
org $02CFB3
	dw $6301
org $02D5FA
	dw $6301
org $02D7B7
	dw $6301
org $02D829
	dw $6301
org $02D85A
	dw $6301
org $02DA0E
	dw $6301
org $02DB18
	dw $6301
org $02DC73
	dw $6301
org $02DC82
	dw $6301
org $02DC88
	dw $6301
org $02DE76
	dw $6301
org $02E038
	dw $6301
org $02E3FA
	dw $6301
org $02E593
	dw $6301
org $02E649
	dw $6301
org $02E69C
	dw $6301
org $02E6FE
	dw $6301
org $02E914
	dw $6301
org $02E9FA
	dw $6301
org $02ED04
	dw $6301
org $02EE0D
	dw $6301
org $02EE17
	dw $6301
org $02EE6B
	dw $6301
org $02EF53
	dw $6301
org $02F169
	dw $6301
org $02F1BB
	dw $6301
org $02F1E1
	dw $6301
org $02F4A9
	dw $6301
org $02F4FD
	dw $6301
org $02F5F6
	dw $6301
org $02F64D
	dw $6301
org $02F7B5
	dw $6301
org $02F97B
	dw $6301
org $02FA3E
	dw $6301
org $02FA6D
	dw $6301
org $02FCDF
	dw $6301
org $02FD5D
	dw $6301
org $03841F
	dw $6301
org $038440
	dw $6301
org $038446
	dw $6301
org $0384A4
	dw $6301
org $0385BB
	dw $6301
org $0386D2
	dw $6301
org $03874D
	dw $6301
org $038873
	dw $6301
org $038B7A
	dw $6301
org $038D44
	dw $6301
org $038E3E
	dw $6301
org $038ECA
	dw $6301
org $038F32
	dw $6301
org $039198
	dw $6301
org $039221
	dw $6301
org $039225
	dw $6301
org $03928C
	dw $6301
org $039290
	dw $6301
org $0394F3
	dw $6301
org $0396C1
	dw $6301
org $0397C4
	dw $6301
org $039BAA
	dw $6301
org $039C14
	dw $6301
org $039E87
	dw $6301
org $039EEE
	dw $6301
org $03A0B8
	dw $6301
org $03A415
	dw $6301
org $03AAE7
	dw $6301
org $03ACF9
	dw $6301
org $03AF8B
	dw $6301
org $03AFC9
	dw $6301
org $03AFED
	dw $6301
org $03B23C
	dw $6301
org $03B3D8
	dw $6301
org $03B420
	dw $6301
org $03B4C5
	dw $6301
org $03B544
	dw $6301
org $03C0E2
	dw $6301
org $03C29A
	dw $6301
org $03C433
	dw $6301
org $03C4B0
	dw $6301
org $03C984
	dw $6301
org $03CB64
	dw $6301
org $03D4B9
	dw $6301
org $03D4FE
	dw $6301
org $0CA109
	dw $6301
org $0CA19A
	dw $6301
;============== REMAPPER FOR $0302
org $00E469
	dw $6302
org $00FBEC
	dw $6302
org $0189FA
	dw $6302
org $018E2F
	dw $6302
org $01988D
	dw $6302
org $019A6C
	dw $6302
org $019B0D
	dw $6302
org $019D3D
	dw $6302
org $019D93
	dw $6302
org $019DFD
	dw $6302
org $019E7F
	dw $6302
org $019F28
	dw $6302
org $01A1CD
	dw $6302
org $01A226
	dw $6302
org $01AE7C
	dw $6302
org $01AF90
	dw $6302
org $01B330
	dw $6302
org $01B347
	dw $6302
org $01B401
	dw $6302
org $01B688
	dw $6302
org $01B78C
	dw $6302
org $01BBC1
	dw $6302
org $01BD85
	dw $6302
org $01C15A
	dw $6302
org $01C1A4
	dw $6302
org $01C361
	dw $6302
org $01C655
	dw $6302
org $01C68A
	dw $6302
org $01C6DB
	dw $6302
org $01C7EC
	dw $6302
org $01C873
	dw $6302
org $01C8C9
	dw $6302
org $01C8F8
	dw $6302
org $01D4D5
	dw $6302
org $01DBC1
	dw $6302
org $01DBF7
	dw $6302
org $01DC2A
	dw $6302
org $01DCA3
	dw $6302
org $01DF78
	dw $6302
org $01E184
	dw $6302
org $01E253
	dw $6302
org $01E463
	dw $6302
org $01E489
	dw $6302
org $01E73B
	dw $6302
org $01E924
	dw $6302
org $01E933
	dw $6302
org $01EE90
	dw $6302
org $01EE99
	dw $6302
org $01EE9F
	dw $6302
org $01EEA8
	dw $6302
org $01EFE8
	dw $6302
org $01EFF1
	dw $6302
org $01EFFB
	dw $6302
org $01F03F
	dw $6302
org $01F08D
	dw $6302
org $01F796
	dw $6302
org $01F7BF
	dw $6302
org $01FA28
	dw $6302
org $01FA72
	dw $6302
org $01FF0D
	dw $6302
org $01FF20
	dw $6302
org $01FF23
	dw $6302
org $01FF81
	dw $6302
org $028116
	dw $6302
org $02973E
	dw $6302
org $02988C
	dw $6302
org $02989E
	dw $6302
org $0299C6
	dw $6302
org $02A085
	dw $6302
org $02A3D8
	dw $6302
org $02B693
	dw $6302
org $02B792
	dw $6302
org $02B92F
	dw $6302
org $02BC66
	dw $6302
org $02BE6D
	dw $6302
org $02BE7C
	dw $6302
org $02BEE4
	dw $6302
org $02BF38
	dw $6302
org $02BFB2
	dw $6302
org $02C8FA
	dw $6302
org $02CA66
	dw $6302
org $02CADA
	dw $6302
org $02CB19
	dw $6302
org $02CB7E
	dw $6302
org $02CBEE
	dw $6302
org $02CD02
	dw $6302
org $02CDA7
	dw $6302
org $02CF2E
	dw $6302
org $02D600
	dw $6302
org $02D7BC
	dw $6302
org $02D82F
	dw $6302
org $02D860
	dw $6302
org $02D8E5
	dw $6302
org $02DA15
	dw $6302
org $02DA35
	dw $6302
org $02DB2E
	dw $6302
org $02DC8F
	dw $6302
org $02DE7C
	dw $6302
org $02E014
	dw $6302
org $02E24F
	dw $6302
org $02E400
	dw $6302
org $02E59B
	dw $6302
org $02E64F
	dw $6302
org $02E6AA
	dw $6302
org $02E709
	dw $6302
org $02E91C
	dw $6302
org $02EA0B
	dw $6302
org $02EA29
	dw $6302
org $02EA32
	dw $6302
org $02ED0A
	dw $6302
org $02EE0A
	dw $6302
org $02EF30
	dw $6302
org $02EF58
	dw $6302
org $02F179
	dw $6302
org $02F1C0
	dw $6302
org $02F1E6
	dw $6302
org $02F4B1
	dw $6302
org $02F520
	dw $6302
org $02F5FC
	dw $6302
org $02F653
	dw $6302
org $02F7AA
	dw $6302
org $02F981
	dw $6302
org $02FA4C
	dw $6302
org $02FA73
	dw $6302
org $02FD74
	dw $6302
org $02FDAF
	dw $6302
org $0383E7
	dw $6302
org $0384AA
	dw $6302
org $0384E3
	dw $6302
org $0385E0
	dw $6302
org $0386D8
	dw $6302
org $038753
	dw $6302
org $03887F
	dw $6302
org $0388B3
	dw $6302
org $03898A
	dw $6302
org $038B88
	dw $6302
org $038D4A
	dw $6302
org $038DB2
	dw $6302
org $038E4A
	dw $6302
org $038ED0
	dw $6302
org $038F4B
	dw $6302
org $038FA1
	dw $6302
org $039013
	dw $6302
org $0391B5
	dw $6302
org $03921E
	dw $6302
org $039295
	dw $6302
org $0394F9
	dw $6302
org $0396C7
	dw $6302
org $03979F
	dw $6302
org $0397E5
	dw $6302
org $039BB5
	dw $6302
org $039C1C
	dw $6302
org $039E94
	dw $6302
org $039F01
	dw $6302
org $03A077
	dw $6302
org $03A0D5
	dw $6302
org $03A41D
	dw $6302
org $03AAED
	dw $6302
org $03ACFF
	dw $6302
org $03AF90
	dw $6302
org $03AFCE
	dw $6302
org $03AFF3
	dw $6302
org $03B242
	dw $6302
org $03B3CF
	dw $6302
org $03B430
	dw $6302
org $03B4D7
	dw $6302
org $03B54F
	dw $6302
org $03C0FE
	dw $6302
org $03C24A
	dw $6302
org $03C2B7
	dw $6302
org $03C439
	dw $6302
org $03C4C5
	dw $6302
org $03C996
	dw $6302
org $03CB7B
	dw $6302
org $03D4BF
	dw $6302
org $03D504
	dw $6302
org $0CA0F9
	dw $6302
org $0CA18B
	dw $6302
;============== REMAPPER FOR $0303
org $00E3D3
	dw $6303
org $018E4C
	dw $6303
org $019895
	dw $6303
org $019A6F
	dw $6303
org $019A74
	dw $6303
org $019D4C
	dw $6303
org $019DC1
	dw $6303
org $019E87
	dw $6303
org $019F49
	dw $6303
org $01A210
	dw $6303
org $01A215
	dw $6303
org $01AF7C
	dw $6303
org $01B35F
	dw $6303
org $01B412
	dw $6303
org $01B68E
	dw $6303
org $01B79F
	dw $6303
org $01BBE9
	dw $6303
org $01BD7A
	dw $6303
org $01C166
	dw $6303
org $01C36D
	dw $6303
org $01C65D
	dw $6303
org $01C690
	dw $6303
org $01C6CF
	dw $6303
org $01C7F1
	dw $6303
org $01C878
	dw $6303
org $01C8CE
	dw $6303
org $01C8FD
	dw $6303
org $01D4C3
	dw $6303
org $01DBC7
	dw $6303
org $01DBFF
	dw $6303
org $01DC30
	dw $6303
org $01DCAE
	dw $6303
org $01DF98
	dw $6303
org $01E18C
	dw $6303
org $01E25D
	dw $6303
org $01E483
	dw $6303
org $01E747
	dw $6303
org $01E938
	dw $6303
org $01F094
	dw $6303
org $01F099
	dw $6303
org $01F7B4
	dw $6303
org $01F7BB
	dw $6303
org $01FA2B
	dw $6303
org $01FA33
	dw $6303
org $01FA7A
	dw $6303
org $01FF30
	dw $6303
org $01FF8B
	dw $6303
org $028123
	dw $6303
org $029730
	dw $6303
org $029875
	dw $6303
org $0299B7
	dw $6303
org $02A08F
	dw $6303
org $02A09A
	dw $6303
org $02A3E7
	dw $6303
org $02B799
	dw $6303
org $02B926
	dw $6303
org $02BC80
	dw $6303
org $02BE75
	dw $6303
org $02BE87
	dw $6303
org $02BE8A
	dw $6303
org $02BEEC
	dw $6303
org $02BF3F
	dw $6303
org $02BF9C
	dw $6303
org $02C8F4
	dw $6303
org $02CA77
	dw $6303
org $02CAE2
	dw $6303
org $02CB30
	dw $6303
org $02CB85
	dw $6303
org $02CBDD
	dw $6303
org $02CD10
	dw $6303
org $02CDB3
	dw $6303
org $02CF35
	dw $6303
org $02D606
	dw $6303
org $02D7C1
	dw $6303
org $02D835
	dw $6303
org $02D865
	dw $6303
org $02D8D5
	dw $6303
org $02DA1D
	dw $6303
org $02DA2C
	dw $6303
org $02DB21
	dw $6303
org $02DC95
	dw $6303
org $02DE89
	dw $6303
org $02E01A
	dw $6303
org $02E021
	dw $6303
org $02E252
	dw $6303
org $02E257
	dw $6303
org $02E406
	dw $6303
org $02E5A6
	dw $6303
org $02E655
	dw $6303
org $02E6B4
	dw $6303
org $02E70E
	dw $6303
org $02E929
	dw $6303
org $02EA1D
	dw $6303
org $02ED60
	dw $6303
org $02EF3C
	dw $6303
org $02EF5D
	dw $6303
org $02F187
	dw $6303
org $02F1F0
	dw $6303
org $02F4B9
	dw $6303
org $02F52B
	dw $6303
org $02F602
	dw $6303
org $02F659
	dw $6303
org $02F7C3
	dw $6303
org $02F991
	dw $6303
org $02FA52
	dw $6303
org $02FA79
	dw $6303
org $02FD86
	dw $6303
org $02FDB4
	dw $6303
org $0383F8
	dw $6303
org $0384B1
	dw $6303
org $0384ED
	dw $6303
org $0384F2
	dw $6303
org $0385D5
	dw $6303
org $0386DE
	dw $6303
org $03875B
	dw $6303
org $03888C
	dw $6303
org $038B70
	dw $6303
org $038D52
	dw $6303
org $038E52
	dw $6303
org $038ED7
	dw $6303
org $038F59
	dw $6303
org $039016
	dw $6303
org $03901D
	dw $6303
org $0391C7
	dw $6303
org $039298
	dw $6303
org $03929D
	dw $6303
org $0394FF
	dw $6303
org $0396D1
	dw $6303
org $0397DA
	dw $6303
org $039BC5
	dw $6303
org $039C24
	dw $6303
org $039E70
	dw $6303
org $039F19
	dw $6303
org $03A07A
	dw $6303
org $03A07F
	dw $6303
org $03A0DD
	dw $6303
org $03A424
	dw $6303
org $03AAFD
	dw $6303
org $03AD0D
	dw $6303
org $03AF98
	dw $6303
org $03AFD5
	dw $6303
org $03AFF9
	dw $6303
org $03B24A
	dw $6303
org $03B3C3
	dw $6303
org $03B428
	dw $6303
org $03B4DE
	dw $6303
org $03B556
	dw $6303
org $03C0E9
	dw $6303
org $03C24D
	dw $6303
org $03C252
	dw $6303
org $03C2C7
	dw $6303
org $03C424
	dw $6303
org $03C4CB
	dw $6303
org $03C9AD
	dw $6303
org $03CB91
	dw $6303
org $03D4C7
	dw $6303
org $03D50C
	dw $6303
org $0CA0FF
	dw $6303
org $0CA190
	dw $6303
;============== REMAPPER FOR $0304
org $019871
	dw $6304
org $019DAF
	dw $6304
org $01A407
	dw $6304
org $01B30E
	dw $6304
org $01B777
	dw $6304
org $01BB5F
	dw $6304
org $01BD49
	dw $6304
org $01C141
	dw $6304
org $01C67B
	dw $6304
org $01C930
	dw $6304
org $01DF38
	dw $6304
org $01E243
	dw $6304
org $01E47A
	dw $6304
org $01E4A5
	dw $6304
org $01E4AA
	dw $6304
org $01E711
	dw $6304
org $02984E
	dw $6304
org $02B91E
	dw $6304
org $02BC32
	dw $6304
org $02BC46
	dw $6304
org $02CA50
	dw $6304
org $02CAC8
	dw $6304
org $02CB14
	dw $6304
org $02CCDE
	dw $6304
org $02E58D
	dw $6304
org $02E694
	dw $6304
org $02E6CE
	dw $6304
org $02E90E
	dw $6304
org $02E9F5
	dw $6304
org $02F1AD
	dw $6304
org $02F1D0
	dw $6304
org $02F22C
	dw $6304
org $02F4A1
	dw $6304
org $02F4F8
	dw $6304
org $039C06
	dw $6304
org $03B26F
	dw $6304
org $03B276
	dw $6304
org $03C28F
	dw $6304
org $03C97F
	dw $6304
;============== REMAPPER FOR $0305
org $018FB0
	dw $6305
org $018FB6
	dw $6305
org $01987D
	dw $6305
org $019DA7
	dw $6305
org $019E0B
	dw $6305
org $01B2F0
	dw $6305
org $01B3C1
	dw $6305
org $01B751
	dw $6305
org $01BB9D
	dw $6305
org $01BD36
	dw $6305
org $01C152
	dw $6305
org $01C683
	dw $6305
org $01C92B
	dw $6305
org $01C9AA
	dw $6305
org $01DF61
	dw $6305
org $01E24E
	dw $6305
org $01E480
	dw $6305
org $01E71C
	dw $6305
org $02985D
	dw $6305
org $02B900
	dw $6305
org $02BC54
	dw $6305
org $02CA60
	dw $6305
org $02CAD4
	dw $6305
org $02CB28
	dw $6305
org $02CCED
	dw $6305
org $02E596
	dw $6305
org $02E6A5
	dw $6305
org $02E6DB
	dw $6305
org $02E917
	dw $6305
org $02EA00
	dw $6305
org $02F1B8
	dw $6305
org $02F1DB
	dw $6305
org $02F238
	dw $6305
org $02F4AC
	dw $6305
org $02F502
	dw $6305
org $038449
	dw $6305
org $039C17
	dw $6305
org $03B279
	dw $6305
org $03B280
	dw $6305
org $03C2A3
	dw $6305
;============== REMAPPER FOR $0306
org $019890
	dw $6306
org $019D99
	dw $6306
org $019DF7
	dw $6306
org $01B335
	dw $6306
org $01B34C
	dw $6306
org $01B780
	dw $6306
org $01BD8A
	dw $6306
org $01C15E
	dw $6306
org $01C68D
	dw $6306
org $01DF7E
	dw $6306
org $01E258
	dw $6306
org $01E48D
	dw $6306
org $01E73E
	dw $6306
org $029894
	dw $6306
org $0298A6
	dw $6306
org $02B945
	dw $6306
org $02BC6C
	dw $6306
org $02CA6C
	dw $6306
org $02CADD
	dw $6306
org $02CB1D
	dw $6306
org $02CD0B
	dw $6306
org $02E017
	dw $6306
org $02E59E
	dw $6306
org $02E6AF
	dw $6306
org $02E921
	dw $6306
org $02EA11
	dw $6306
org $02F4B4
	dw $6306
org $02F526
	dw $6306
org $039C1F
	dw $6306
org $03C2BD
	dw $6306
;============== REMAPPER FOR $0307
org $00E3D6
	dw $6307
org $019898
	dw $6307
org $019DC4
	dw $6307
org $01B362
	dw $6307
org $01B794
	dw $6307
org $01BD7D
	dw $6307
org $01C169
	dw $6307
org $01C695
	dw $6307
org $01DF9B
	dw $6307
org $01E260
	dw $6307
org $01E486
	dw $6307
org $01E74C
	dw $6307
org $029878
	dw $6307
org $02B929
	dw $6307
org $02BC83
	dw $6307
org $02CA7E
	dw $6307
org $02CAE7
	dw $6307
org $02CB33
	dw $6307
org $02CD13
	dw $6307
org $02DEF4
	dw $6307
org $02DEF9
	dw $6307
org $02E026
	dw $6307
org $02E5AB
	dw $6307
org $02E6B9
	dw $6307
org $02E92C
	dw $6307
org $02EA20
	dw $6307
org $02F1C3
	dw $6307
org $02F1E9
	dw $6307
org $02F4BE
	dw $6307
org $02F52E
	dw $6307
org $039C29
	dw $6307
org $03C2CC
	dw $6307
;============== REMAPPER FOR $0308
org $0091F8
	dw $6308
org $019844
	dw $6308
org $01984B
	dw $6308
org $019865
	dw $6308
org $01B314
	dw $6308
org $01B762
	dw $6308
org $01BB62
	dw $6308
org $01BD6F
	dw $6308
org $01BEE5
	dw $6308
org $01C147
	dw $6308
org $01DF32
	dw $6308
org $029848
	dw $6308
org $02BC38
	dw $6308
org $02BC4C
	dw $6308
org $02E02F
	dw $6308
org $03B28A
	dw $6308
org $03B291
	dw $6308
org $03C292
	dw $6308
;============== REMAPPER FOR $0309
org $009227
	dw $6309
org $019874
	dw $6309
org $01B2F3
	dw $6309
org $01B3AE
	dw $6309
org $01B73C
	dw $6309
org $01BBA9
	dw $6309
org $01BD5C
	dw $6309
org $01BEF0
	dw $6309
org $01C155
	dw $6309
org $01DF67
	dw $6309
org $029863
	dw $6309
org $02BC57
	dw $6309
org $02E03B
	dw $6309
org $03B294
	dw $6309
org $03B29B
	dw $6309
org $03C2A9
	dw $6309
;============== REMAPPER FOR $030A
org $00921C
	dw $630A
org $01B338
	dw $630A
org $01B34F
	dw $630A
org $01B374
	dw $630A
org $01B789
	dw $630A
org $01BD8F
	dw $630A
org $01BF07
	dw $630A
org $01C161
	dw $630A
org $01DF84
	dw $630A
org $029897
	dw $630A
org $0298A9
	dw $630A
org $02BC72
	dw $630A
org $02E049
	dw $630A
org $03C2C2
	dw $630A
;============== REMAPPER FOR $030B
org $0091ED
	dw $630B
org $00E3ED
	dw $630B
org $018E8E
	dw $630B
org $018E95
	dw $630B
org $019A48
	dw $630B
org $019A4B
	dw $630B
org $01B365
	dw $630B
org $01B797
	dw $630B
org $01BD80
	dw $630B
org $01BF02
	dw $630B
org $01C16C
	dw $630B
org $01DF9E
	dw $630B
org $02987D
	dw $630B
org $02BC86
	dw $630B
org $02E05C
	dw $630B
org $03C2CF
	dw $630B
;============== REMAPPER FOR $030C
org $0091FB
	dw $630C
org $01B31E
	dw $630C
org $01B769
	dw $630C
org $01BB74
	dw $630C
org $01DF3B
	dw $630C
org $029851
	dw $630C
org $02E035
	dw $630C
;============== REMAPPER FOR $030D
org $00922C
	dw $630D
org $01B2FA
	dw $630D
org $01B3C4
	dw $630D
org $01B743
	dw $630D
org $01BB94
	dw $630D
org $01DF6A
	dw $630D
org $029866
	dw $630D
org $02E03E
	dw $630D
;============== REMAPPER FOR $030E
org $009222
	dw $630E
org $01B33B
	dw $630E
org $01B352
	dw $630E
org $01B436
	dw $630E
org $01B442
	dw $630E
org $01B783
	dw $630E
org $01DF8A
	dw $630E
org $02988F
	dw $630E
org $0298A1
	dw $630E
org $02E04D
	dw $630E
;============== REMAPPER FOR $030F
org $0091F3
	dw $630F
org $00E3D9
	dw $630F
org $01B368
	dw $630F
org $01B791
	dw $630F
org $01DFA1
	dw $630F
org $029880
	dw $630F
org $02E05F
	dw $630F
;============== REMAPPER FOR $0310
org $01B324
	dw $6310
org $01B759
	dw $6310
org $01BB77
	dw $6310
org $01DF2C
	dw $6310
;============== REMAPPER FOR $0311
org $01B2FD
	dw $6311
org $01B3B1
	dw $6311
org $01B733
	dw $6311
org $01BBA0
	dw $6311
org $01DF58
	dw $6311
;============== REMAPPER FOR $0312
org $01B340
	dw $6312
org $01B357
	dw $6312
org $01B431
	dw $6312
org $01B43D
	dw $6312
org $01B786
	dw $6312
org $01DF8F
	dw $6312
;============== REMAPPER FOR $0313
org $00E3DC
	dw $6313
org $01B36B
	dw $6313
org $01B79A
	dw $6313
org $01DFA6
	dw $6313
org $0391FA
	dw $6313
org $0391FD
	dw $6313
;============== REMAPPER FOR $0314
org $01BB7A
	dw $6314
;============== REMAPPER FOR $0315
org $01B3CB
	dw $6315
org $01BBAC
	dw $6315
;============== REMAPPER FOR $0316
;============== REMAPPER FOR $0317
org $039205
	dw $6317
;============== REMAPPER FOR $0318
org $01BB86
	dw $6318
;============== REMAPPER FOR $0319
org $01B3B8
	dw $6319
org $01BB97
	dw $6319
;============== REMAPPER FOR $031A
;============== REMAPPER FOR $031B
;============== REMAPPER FOR $031C
org $01BB89
	dw $631C
;============== REMAPPER FOR $031D
org $01B3CE
	dw $631D
org $01BBA3
	dw $631D
;============== REMAPPER FOR $031E
;============== REMAPPER FOR $031F
;============== REMAPPER FOR $0320
org $01BB8C
	dw $6320
;============== REMAPPER FOR $0321
org $01B3BB
	dw $6321
org $01BBAF
	dw $6321
;============== REMAPPER FOR $0322
;============== REMAPPER FOR $0323
org $039208
	dw $6323
;============== REMAPPER FOR $0324
;============== REMAPPER FOR $0325
;============== REMAPPER FOR $0326
;============== REMAPPER FOR $0327
org $039200
	dw $6327
;============== REMAPPER FOR $0328
;============== REMAPPER FOR $0329
;============== REMAPPER FOR $032A
;============== REMAPPER FOR $032B
;============== REMAPPER FOR $032C
;============== REMAPPER FOR $032D
;============== REMAPPER FOR $032E
;============== REMAPPER FOR $032F
;============== REMAPPER FOR $0330
;============== REMAPPER FOR $0331
;============== REMAPPER FOR $0332
;============== REMAPPER FOR $0333
;============== REMAPPER FOR $0334
;============== REMAPPER FOR $0335
;============== REMAPPER FOR $0336
;============== REMAPPER FOR $0337
;============== REMAPPER FOR $0338
;============== REMAPPER FOR $0339
;============== REMAPPER FOR $033A
;============== REMAPPER FOR $033B
;============== REMAPPER FOR $033C
;============== REMAPPER FOR $033D
;============== REMAPPER FOR $033E
;============== REMAPPER FOR $033F
;============== REMAPPER FOR $0340
org $04F35E
	dw $6340
org $0CD735
	dw $6340
org $0CD779
	dw $6340
;============== REMAPPER FOR $0341
org $04F359
	dw $6341
org $0CD741
	dw $6341
org $0CD77E
	dw $6341
;============== REMAPPER FOR $0342
org $04F363
	dw $6342
org $0CD747
	dw $6342
org $0CD76F
	dw $6342
;============== REMAPPER FOR $0343
org $04F36D
	dw $6343
org $0CD74C
	dw $6343
org $0CD774
	dw $6343
;============== REMAPPER FOR $0344
;============== REMAPPER FOR $0345
;============== REMAPPER FOR $0346
;============== REMAPPER FOR $0347
;============== REMAPPER FOR $0348
;============== REMAPPER FOR $0349
;============== REMAPPER FOR $034A
;============== REMAPPER FOR $034B
;============== REMAPPER FOR $034C
;============== REMAPPER FOR $034D
;============== REMAPPER FOR $034E
;============== REMAPPER FOR $034F
;============== REMAPPER FOR $0350
org $04EB14
	dw $6350
;============== REMAPPER FOR $0351
org $04EAF2
	dw $6351
;============== REMAPPER FOR $0352
org $04EAF9
	dw $6352
;============== REMAPPER FOR $0353
org $04EB0F
	dw $6353
;============== REMAPPER FOR $0354
;============== REMAPPER FOR $0355
;============== REMAPPER FOR $0356
;============== REMAPPER FOR $0357
;============== REMAPPER FOR $0358
;============== REMAPPER FOR $0359
;============== REMAPPER FOR $035A
;============== REMAPPER FOR $035B
;============== REMAPPER FOR $035C
;============== REMAPPER FOR $035D
;============== REMAPPER FOR $035E
;============== REMAPPER FOR $035F
;============== REMAPPER FOR $0360
;============== REMAPPER FOR $0361
;============== REMAPPER FOR $0362
;============== REMAPPER FOR $0363
;============== REMAPPER FOR $0364
;============== REMAPPER FOR $0365
;============== REMAPPER FOR $0366
;============== REMAPPER FOR $0367
;============== REMAPPER FOR $0368
;============== REMAPPER FOR $0369
;============== REMAPPER FOR $036A
;============== REMAPPER FOR $036B
;============== REMAPPER FOR $036C
;============== REMAPPER FOR $036D
;============== REMAPPER FOR $036E
;============== REMAPPER FOR $036F
;============== REMAPPER FOR $0370
;============== REMAPPER FOR $0371
;============== REMAPPER FOR $0372
;============== REMAPPER FOR $0373
;============== REMAPPER FOR $0374
;============== REMAPPER FOR $0375
;============== REMAPPER FOR $0376
;============== REMAPPER FOR $0377
;============== REMAPPER FOR $0378
;============== REMAPPER FOR $0379
;============== REMAPPER FOR $037A
;============== REMAPPER FOR $037B
;============== REMAPPER FOR $037C
;============== REMAPPER FOR $037D
;============== REMAPPER FOR $037E
;============== REMAPPER FOR $037F
;============== REMAPPER FOR $0380
org $0CCB00
	dw $6380
org $0CCB99
	dw $6380
org $0CCBD9
	dw $6380
org $0CCC0B
	dw $6380
org $0CD85F
	dw $6380
;============== REMAPPER FOR $0381
org $0CCB06
	dw $6381
org $0CCB9E
	dw $6381
org $0CCBDE
	dw $6381
org $0CCC10
	dw $6381
org $0CD859
	dw $6381
;============== REMAPPER FOR $0382
org $0CCB0B
	dw $6382
org $0CCBA3
	dw $6382
org $0CCBEB
	dw $6382
org $0CCC16
	dw $6382
org $0CD862
	dw $6382
;============== REMAPPER FOR $0383
org $0CCB10
	dw $6383
org $0CCBA8
	dw $6383
org $0CCBF0
	dw $6383
org $0CCC1B
	dw $6383
org $0CD867
	dw $6383
;============== REMAPPER FOR $0384
;============== REMAPPER FOR $0385
;============== REMAPPER FOR $0386
;============== REMAPPER FOR $0387
;============== REMAPPER FOR $0388
;============== REMAPPER FOR $0389
;============== REMAPPER FOR $038A
;============== REMAPPER FOR $038B
;============== REMAPPER FOR $038C
;============== REMAPPER FOR $038D
;============== REMAPPER FOR $038E
;============== REMAPPER FOR $038F
;============== REMAPPER FOR $0390
;============== REMAPPER FOR $0391
;============== REMAPPER FOR $0392
;============== REMAPPER FOR $0393
;============== REMAPPER FOR $0394
;============== REMAPPER FOR $0395
;============== REMAPPER FOR $0396
;============== REMAPPER FOR $0397
;============== REMAPPER FOR $0398
;============== REMAPPER FOR $0399
;============== REMAPPER FOR $039A
;============== REMAPPER FOR $039B
;============== REMAPPER FOR $039C
;============== REMAPPER FOR $039D
;============== REMAPPER FOR $039E
;============== REMAPPER FOR $039F
;============== REMAPPER FOR $03A0
;============== REMAPPER FOR $03A1
;============== REMAPPER FOR $03A2
;============== REMAPPER FOR $03A3
;============== REMAPPER FOR $03A4
;============== REMAPPER FOR $03A5
;============== REMAPPER FOR $03A6
;============== REMAPPER FOR $03A7
;============== REMAPPER FOR $03A8
;============== REMAPPER FOR $03A9
;============== REMAPPER FOR $03AA
;============== REMAPPER FOR $03AB
;============== REMAPPER FOR $03AC
;============== REMAPPER FOR $03AD
;============== REMAPPER FOR $03AE
;============== REMAPPER FOR $03AF
;============== REMAPPER FOR $03B0
;============== REMAPPER FOR $03B1
;============== REMAPPER FOR $03B2
;============== REMAPPER FOR $03B3
;============== REMAPPER FOR $03B4
;============== REMAPPER FOR $03B5
;============== REMAPPER FOR $03B6
;============== REMAPPER FOR $03B7
;============== REMAPPER FOR $03B8
;============== REMAPPER FOR $03B9
;============== REMAPPER FOR $03BA
;============== REMAPPER FOR $03BB
;============== REMAPPER FOR $03BC
;============== REMAPPER FOR $03BD
;============== REMAPPER FOR $03BE
;============== REMAPPER FOR $03BF
;============== REMAPPER FOR $03C0
;============== REMAPPER FOR $03C1
;============== REMAPPER FOR $03C2
;============== REMAPPER FOR $03C3
;============== REMAPPER FOR $03C4
;============== REMAPPER FOR $03C5
;============== REMAPPER FOR $03C6
;============== REMAPPER FOR $03C7
;============== REMAPPER FOR $03C8
;============== REMAPPER FOR $03C9
;============== REMAPPER FOR $03CA
;============== REMAPPER FOR $03CB
;============== REMAPPER FOR $03CC
;============== REMAPPER FOR $03CD
;============== REMAPPER FOR $03CE
;============== REMAPPER FOR $03CF
;============== REMAPPER FOR $03D0
;============== REMAPPER FOR $03D1
;============== REMAPPER FOR $03D2
;============== REMAPPER FOR $03D3
;============== REMAPPER FOR $03D4
;============== REMAPPER FOR $03D5
;============== REMAPPER FOR $03D6
;============== REMAPPER FOR $03D7
;============== REMAPPER FOR $03D8
;============== REMAPPER FOR $03D9
;============== REMAPPER FOR $03DA
;============== REMAPPER FOR $03DB
;============== REMAPPER FOR $03DC
;============== REMAPPER FOR $03DD
;============== REMAPPER FOR $03DE
;============== REMAPPER FOR $03DF
;============== REMAPPER FOR $03E0
org $0CCA9B
	dw $63E0
;============== REMAPPER FOR $03E1
org $0CCAA1
	dw $63E1
;============== REMAPPER FOR $03E2
org $0CCAA7
	dw $63E2
;============== REMAPPER FOR $03E3
org $0CCAB1
	dw $63E3
;============== REMAPPER FOR $03E4
;============== REMAPPER FOR $03E5
;============== REMAPPER FOR $03E6
;============== REMAPPER FOR $03E7
;============== REMAPPER FOR $03E8
;============== REMAPPER FOR $03E9
;============== REMAPPER FOR $03EA
;============== REMAPPER FOR $03EB
;============== REMAPPER FOR $03EC
org $02FA6A
	dw $63EC
;============== REMAPPER FOR $03ED
org $02FA70
	dw $63ED
;============== REMAPPER FOR $03EE
org $02FA76
	dw $63EE
;============== REMAPPER FOR $03EF
org $02FA7C
	dw $63EF
;============== REMAPPER FOR $03F0
;============== REMAPPER FOR $03F1
;============== REMAPPER FOR $03F2
;============== REMAPPER FOR $03F3
;============== REMAPPER FOR $03F4
;============== REMAPPER FOR $03F5
;============== REMAPPER FOR $03F6
;============== REMAPPER FOR $03F7
;============== REMAPPER FOR $03F8
;============== REMAPPER FOR $03F9
;============== REMAPPER FOR $03FA
;============== REMAPPER FOR $03FB
;============== REMAPPER FOR $03FC
;============== REMAPPER FOR $03FD
;============== REMAPPER FOR $03FE
;============== REMAPPER FOR $03FF
;============== REMAPPER FOR $0400
org $0084AC
	dw $6400
org $0093BE
	dw $6400
org $05B315
	dw $6400
;============== REMAPPER FOR $0401
org $0084C1
	dw $6401
;============== REMAPPER FOR $0402
;============== REMAPPER FOR $0403
;============== REMAPPER FOR $0404
;============== REMAPPER FOR $0405
;============== REMAPPER FOR $0406
;============== REMAPPER FOR $0407
;============== REMAPPER FOR $0408
;============== REMAPPER FOR $0409
;============== REMAPPER FOR $040A
;============== REMAPPER FOR $040B
;============== REMAPPER FOR $040C
;============== REMAPPER FOR $040D
;============== REMAPPER FOR $040E
;============== REMAPPER FOR $040F
;============== REMAPPER FOR $0410
;============== REMAPPER FOR $0411
;============== REMAPPER FOR $0412
;============== REMAPPER FOR $0413
;============== REMAPPER FOR $0414
;============== REMAPPER FOR $0415
;============== REMAPPER FOR $0416
;============== REMAPPER FOR $0417
;============== REMAPPER FOR $0418
;============== REMAPPER FOR $0419
;============== REMAPPER FOR $041A
;============== REMAPPER FOR $041B
;============== REMAPPER FOR $041C
;============== REMAPPER FOR $041D
;============== REMAPPER FOR $041E
;============== REMAPPER FOR $041F
;============== REMAPPER FOR $0420
org $0084A9
	dw $6420
org $0086D0
	dw $6420
org $0090CE
	dw $6420
org $01F4A6
	dw $6420
org $028479
	dw $6420
org $028CB5
	dw $6420
org $028D3F
	dw $6420
org $028DCD
	dw $6420
org $028E70
	dw $6420
org $028EC9
	dw $6420
org $028F28
	dw $6420
org $028F84
	dw $6420
org $02902A
	dw $6420
org $02925F
	dw $6420
org $029790
	dw $6420
org $02982C
	dw $6420
org $02999C
	dw $6420
org $029A61
	dw $6420
org $029AA1
	dw $6420
org $029BA3
	dw $6420
org $029C64
	dw $6420
org $029D42
	dw $6420
org $029D57
	dw $6420
org $029E12
	dw $6420
org $029E7F
	dw $6420
org $029EE0
	dw $6420
org $029F96
	dw $6420
org $02A1A0
	dw $6420
org $02A20B
	dw $6420
org $02A2BC
	dw $6420
org $02A340
	dw $6420
org $02A3A8
	dw $6420
org $02AEEF
	dw $6420
org $02AF26
	dw $6420
org $02BB84
	dw $6420
org $02F429
	dw $6420
org $02F6E6
	dw $6420
org $02F7FF
	dw $6420
org $02FE6E
	dw $6420
org $03B007
	dw $6420
org $03B480
	dw $6420
org $03B526
	dw $6420
org $03CACD
	dw $6420
org $03D69B
	dw $6420
org $048611
	dw $6420
org $07F240
	dw $6420
org $0CA64E
	dw $6420
org $0CA88D
	dw $6420
org $0CA92A
	dw $6420
org $0CA9F8
	dw $6420
org $0CAA4D
	dw $6420
org $0CAB05
	dw $6420
org $0CB60E
	dw $6420
org $0CCB79
	dw $6420
org $0CCED1
	dw $6420
org $0CCF6F
	dw $6420
org $0CCFC2
	dw $6420
org $0CD099
	dw $6420
org $0CD457
	dw $6420
org $0CD4E6
	dw $6420
org $0CD554
	dw $6420
org $0CD5C3
	dw $6420
;============== REMAPPER FOR $0421
org $0084A4
	dw $6421
org $02982F
	dw $6421
org $029AA4
	dw $6421
org $02AEF2
	dw $6421
org $0CA888
	dw $6421
org $0CA9FB
	dw $6421
org $0CAA50
	dw $6421
org $0CCCFF
	dw $6421
org $0CCE8F
	dw $6421
;============== REMAPPER FOR $0422
org $00849F
	dw $6422
org $01E982
	dw $6422
org $029832
	dw $6422
;============== REMAPPER FOR $0423
org $00849A
	dw $6423
org $028324
	dw $6423
org $02835A
	dw $6423
org $029835
	dw $6423
;============== REMAPPER FOR $0424
org $0084BE
	dw $6424
;============== REMAPPER FOR $0425
org $0084B9
	dw $6425
;============== REMAPPER FOR $0426
org $0084B4
	dw $6426
;============== REMAPPER FOR $0427
org $0084AF
	dw $6427
;============== REMAPPER FOR $0428
;============== REMAPPER FOR $0429
;============== REMAPPER FOR $042A
;============== REMAPPER FOR $042B
;============== REMAPPER FOR $042C
;============== REMAPPER FOR $042D
;============== REMAPPER FOR $042E
;============== REMAPPER FOR $042F
;============== REMAPPER FOR $0430
org $04FB2F
	dw $6430
;============== REMAPPER FOR $0431
;============== REMAPPER FOR $0432
;============== REMAPPER FOR $0433
;============== REMAPPER FOR $0434
;============== REMAPPER FOR $0435
;============== REMAPPER FOR $0436
;============== REMAPPER FOR $0437
;============== REMAPPER FOR $0438
;============== REMAPPER FOR $0439
;============== REMAPPER FOR $043A
;============== REMAPPER FOR $043B
;============== REMAPPER FOR $043C
;============== REMAPPER FOR $043D
;============== REMAPPER FOR $043E
;============== REMAPPER FOR $043F
;============== REMAPPER FOR $0440
org $04EC5B
	dw $6440
;============== REMAPPER FOR $0441
org $04EC5E
	dw $6441
;============== REMAPPER FOR $0442
org $04EC61
	dw $6442
;============== REMAPPER FOR $0443
org $04EC64
	dw $6443
;============== REMAPPER FOR $0444
;============== REMAPPER FOR $0445
;============== REMAPPER FOR $0446
;============== REMAPPER FOR $0447
org $0486E2
	dw $6447
org $04F58B
	dw $6447
;============== REMAPPER FOR $0448
org $03AAC1
	dw $6448
org $0486E5
	dw $6448
org $04F58E
	dw $6448
;============== REMAPPER FOR $0449
org $03AAC4
	dw $6449
org $0486E8
	dw $6449
;============== REMAPPER FOR $044A
org $0486EB
	dw $644A
;============== REMAPPER FOR $044B
org $0486EE
	dw $644B
;============== REMAPPER FOR $044C
org $0486F1
	dw $644C
;============== REMAPPER FOR $044D
org $0486F4
	dw $644D
;============== REMAPPER FOR $044E
org $0486F7
	dw $644E
;============== REMAPPER FOR $044F
org $04876F
	dw $644F
;============== REMAPPER FOR $0450
org $048772
	dw $6450
;============== REMAPPER FOR $0451
org $048775
	dw $6451
;============== REMAPPER FOR $0452
org $048778
	dw $6452
;============== REMAPPER FOR $0453
org $04877B
	dw $6453
;============== REMAPPER FOR $0454
org $04877E
	dw $6454
;============== REMAPPER FOR $0455
org $048781
	dw $6455
;============== REMAPPER FOR $0456
org $048784
	dw $6456
;============== REMAPPER FOR $0457
;============== REMAPPER FOR $0458
;============== REMAPPER FOR $0459
;============== REMAPPER FOR $045A
;============== REMAPPER FOR $045B
;============== REMAPPER FOR $045C
;============== REMAPPER FOR $045D
;============== REMAPPER FOR $045E
;============== REMAPPER FOR $045F
org $0CD6C1
	dw $645F
;============== REMAPPER FOR $0460
org $00E4AC
	dw $6460
org $018E3A
	dw $6460
org $0198A1
	dw $6460
org $019DD0
	dw $6460
org $019E91
	dw $6460
org $019F55
	dw $6460
org $01A3EC
	dw $6460
org $01B7E7
	dw $6460
org $01B7EC
	dw $6460
org $01B7F1
	dw $6460
org $01B812
	dw $6460
org $01B817
	dw $6460
org $01C93B
	dw $6460
org $01C95E
	dw $6460
org $01DFB0
	dw $6460
org $01E755
	dw $6460
org $01F09E
	dw $6460
org $01FF3F
	dw $6460
org $01FF94
	dw $6460
org $02812C
	dw $6460
org $029747
	dw $6460
org $0298B2
	dw $6460
org $0299CF
	dw $6460
org $02A0A3
	dw $6460
org $02A3F3
	dw $6460
org $02C903
	dw $6460
org $02CA88
	dw $6460
org $02CAF1
	dw $6460
org $02CB3A
	dw $6460
org $02CB8C
	dw $6460
org $02CBF8
	dw $6460
org $02CD1C
	dw $6460
org $02DA40
	dw $6460
org $02DB3A
	dw $6460
org $02DCA0
	dw $6460
org $02DE94
	dw $6460
org $02ED15
	dw $6460
org $02F191
	dw $6460
org $02F1F9
	dw $6460
org $02F4C7
	dw $6460
org $02F537
	dw $6460
org $02F60E
	dw $6460
org $02F663
	dw $6460
org $02F7CC
	dw $6460
org $02FA5C
	dw $6460
org $02FCD6
	dw $6460
org $02FD8F
	dw $6460
org $0386E9
	dw $6460
org $038B94
	dw $6460
org $038E5D
	dw $6460
org $0396E2
	dw $6460
org $03AB08
	dw $6460
org $03AD16
	dw $6460
org $03B004
	dw $6460
org $03B255
	dw $6460
org $03B3A9
	dw $6460
org $03B4E8
	dw $6460
org $03B560
	dw $6460
org $03C107
	dw $6460
org $03C4D4
	dw $6460
org $03C9B6
	dw $6460
org $03CB9C
	dw $6460
org $03D4D2
	dw $6460
org $03D517
	dw $6460
org $0CA113
	dw $6460
org $0CA1A4
	dw $6460
;============== REMAPPER FOR $0461
org $0198A4
	dw $6461
org $019DD3
	dw $6461
org $01A3FE
	dw $6461
org $01DFB3
	dw $6461
org $01E758
	dw $6461
org $0298B5
	dw $6461
org $02CA8D
	dw $6461
org $02CAF4
	dw $6461
org $02CB3D
	dw $6461
org $02CD1F
	dw $6461
org $02F4CA
	dw $6461
org $02F53A
	dw $6461
;============== REMAPPER FOR $0462
org $009210
	dw $6462
org $01BF13
	dw $6462
org $01DFB6
	dw $6462
org $0298B8
	dw $6462
;============== REMAPPER FOR $0463
org $009213
	dw $6463
org $01BC09
	dw $6463
org $01DFB9
	dw $6463
org $0298BB
	dw $6463
;============== REMAPPER FOR $0464
org $01BC0C
	dw $6464
org $01DFBE
	dw $6464
;============== REMAPPER FOR $0465
org $01BC0F
	dw $6465
;============== REMAPPER FOR $0466
org $01BC14
	dw $6466
;============== REMAPPER FOR $0467
org $01BC17
	dw $6467
;============== REMAPPER FOR $0468
org $01BC1A
	dw $6468
;============== REMAPPER FOR $0469
;============== REMAPPER FOR $046A
;============== REMAPPER FOR $046B
;============== REMAPPER FOR $046C
;============== REMAPPER FOR $046D
;============== REMAPPER FOR $046E
;============== REMAPPER FOR $046F
;============== REMAPPER FOR $0470
org $04F376
	dw $6470
org $0CD6F7
	dw $6470
;============== REMAPPER FOR $0471
;============== REMAPPER FOR $0472
;============== REMAPPER FOR $0473
;============== REMAPPER FOR $0474
org $04EB33
	dw $6474
;============== REMAPPER FOR $0475
;============== REMAPPER FOR $0476
;============== REMAPPER FOR $0477
;============== REMAPPER FOR $0478
;============== REMAPPER FOR $0479
;============== REMAPPER FOR $047A
;============== REMAPPER FOR $047B
;============== REMAPPER FOR $047C
;============== REMAPPER FOR $047D
;============== REMAPPER FOR $047E
;============== REMAPPER FOR $047F
;============== REMAPPER FOR $0480
org $0CCB19
	dw $6480
org $0CCBB2
	dw $6480
org $0CCBF7
	dw $6480
org $0CCC25
	dw $6480
org $0CD86C
	dw $6480
;============== REMAPPER FOR $0481
;============== REMAPPER FOR $0482
;============== REMAPPER FOR $0483
;============== REMAPPER FOR $0484
;============== REMAPPER FOR $0485
;============== REMAPPER FOR $0486
;============== REMAPPER FOR $0487
;============== REMAPPER FOR $0488
;============== REMAPPER FOR $0489
;============== REMAPPER FOR $048A
;============== REMAPPER FOR $048B
;============== REMAPPER FOR $048C
;============== REMAPPER FOR $048D
;============== REMAPPER FOR $048E
;============== REMAPPER FOR $048F
;============== REMAPPER FOR $0490
;============== REMAPPER FOR $0491
;============== REMAPPER FOR $0492
;============== REMAPPER FOR $0493
;============== REMAPPER FOR $0494
;============== REMAPPER FOR $0495
;============== REMAPPER FOR $0496
;============== REMAPPER FOR $0497
;============== REMAPPER FOR $0498
org $0CCAC1
	dw $6498
;============== REMAPPER FOR $0499
;============== REMAPPER FOR $049A
;============== REMAPPER FOR $049B
org $02FA81
	dw $649B
;============== REMAPPER FOR $049C
;============== REMAPPER FOR $049D
;============== REMAPPER FOR $049E
;============== REMAPPER FOR $049F
;============== REMAPPER FOR $04A0
org $00926B
	dw $64A0
org $009292
	dw $64A0
org $0092B5
	dw $64A0
org $00A186
	dw $64A0
org $00CAA0
	dw $64A0
org $00CAAB
	dw $64A0
org $00CAD4
	dw $64A0
org $00CAFC
	dw $64A0
org $03C60A
	dw $64A0
org $03C613
	dw $64A0
org $0CAB7D
	dw $64A0
;============== REMAPPER FOR $04A1
org $00926E
	dw $64A1
org $009297
	dw $64A1
org $0092F9
	dw $64A1
org $00A189
	dw $64A1
org $00CAA3
	dw $64A1
org $00CAAF
	dw $64A1
org $00CAC8
	dw $64A1
org $00CAE2
	dw $64A1
org $00CAF0
	dw $64A1
org $03C619
	dw $64A1
;============== REMAPPER FOR $04A2
;============== REMAPPER FOR $04A3
org $0CAE4E
	dw $64A3
;============== REMAPPER FOR $04A4
org $0092FC
	dw $64A4
;============== REMAPPER FOR $04A5
;============== REMAPPER FOR $04A6
org $0CAE5D
	dw $64A6
;============== REMAPPER FOR $04A7
org $009302
	dw $64A7
;============== REMAPPER FOR $04A8
;============== REMAPPER FOR $04A9
org $0092BE
	dw $64A9
;============== REMAPPER FOR $04AA
org $0092B8
	dw $64AA
;============== REMAPPER FOR $04AB
;============== REMAPPER FOR $04AC
;============== REMAPPER FOR $04AD
org $0CAE51
	dw $64AD
;============== REMAPPER FOR $04AE
;============== REMAPPER FOR $04AF
;============== REMAPPER FOR $04B0
org $0CAE60
	dw $64B0
;============== REMAPPER FOR $04B1
;============== REMAPPER FOR $04B2
;============== REMAPPER FOR $04B3
org $0092C1
	dw $64B3
;============== REMAPPER FOR $04B4
org $0092BB
	dw $64B4
;============== REMAPPER FOR $04B5
;============== REMAPPER FOR $04B6
;============== REMAPPER FOR $04B7
org $0CAE54
	dw $64B7
;============== REMAPPER FOR $04B8
;============== REMAPPER FOR $04B9
;============== REMAPPER FOR $04BA
org $0CAE63
	dw $64BA
;============== REMAPPER FOR $04BB
;============== REMAPPER FOR $04BC
;============== REMAPPER FOR $04BD
org $0092C4
	dw $64BD
;============== REMAPPER FOR $04BE
;============== REMAPPER FOR $04BF
;============== REMAPPER FOR $04C0
;============== REMAPPER FOR $04C1
;============== REMAPPER FOR $04C2
;============== REMAPPER FOR $04C3
;============== REMAPPER FOR $04C4
;============== REMAPPER FOR $04C5
;============== REMAPPER FOR $04C6
;============== REMAPPER FOR $04C7
;============== REMAPPER FOR $04C8
;============== REMAPPER FOR $04C9
;============== REMAPPER FOR $04CA
;============== REMAPPER FOR $04CB
;============== REMAPPER FOR $04CC
;============== REMAPPER FOR $04CD
;============== REMAPPER FOR $04CE
;============== REMAPPER FOR $04CF
;============== REMAPPER FOR $04D0
;============== REMAPPER FOR $04D1
;============== REMAPPER FOR $04D2
;============== REMAPPER FOR $04D3
;============== REMAPPER FOR $04D4
;============== REMAPPER FOR $04D5
;============== REMAPPER FOR $04D6
;============== REMAPPER FOR $04D7
;============== REMAPPER FOR $04D8
;============== REMAPPER FOR $04D9
;============== REMAPPER FOR $04DA
;============== REMAPPER FOR $04DB
;============== REMAPPER FOR $04DC
;============== REMAPPER FOR $04DD
;============== REMAPPER FOR $04DE
;============== REMAPPER FOR $04DF
;============== REMAPPER FOR $04E0
;============== REMAPPER FOR $04E1
;============== REMAPPER FOR $04E2
;============== REMAPPER FOR $04E3
;============== REMAPPER FOR $04E4
;============== REMAPPER FOR $04E5
;============== REMAPPER FOR $04E6
;============== REMAPPER FOR $04E7
;============== REMAPPER FOR $04E8
;============== REMAPPER FOR $04E9
;============== REMAPPER FOR $04EA
;============== REMAPPER FOR $04EB
;============== REMAPPER FOR $04EC
org $05B276
	dw $64EC
;============== REMAPPER FOR $04ED
;============== REMAPPER FOR $04EE
org $04DB82
	dw $64EE
;============== REMAPPER FOR $04EF
;============== REMAPPER FOR $04F0
org $04F45F
	dw $64F0
;============== REMAPPER FOR $04F1
org $04F462
	dw $64F1
;============== REMAPPER FOR $04F2
;============== REMAPPER FOR $04F3
;============== REMAPPER FOR $04F4
;============== REMAPPER FOR $04F5
;============== REMAPPER FOR $04F6
;============== REMAPPER FOR $04F7
;============== REMAPPER FOR $04F8
;============== REMAPPER FOR $04F9
;============== REMAPPER FOR $04FA
;============== REMAPPER FOR $04FB
;============== REMAPPER FOR $04FC
;============== REMAPPER FOR $04FD
;============== REMAPPER FOR $04FE
;============== REMAPPER FOR $04FF
;============== REMAPPER FOR $0500
;============== REMAPPER FOR $0501
;============== REMAPPER FOR $0502
;============== REMAPPER FOR $0503
;============== REMAPPER FOR $0504
;============== REMAPPER FOR $0505
;============== REMAPPER FOR $0506
;============== REMAPPER FOR $0507
;============== REMAPPER FOR $0508
;============== REMAPPER FOR $0509
;============== REMAPPER FOR $050A
;============== REMAPPER FOR $050B
;============== REMAPPER FOR $050C
;============== REMAPPER FOR $050D
;============== REMAPPER FOR $050E
;============== REMAPPER FOR $050F
;============== REMAPPER FOR $0510
;============== REMAPPER FOR $0511
;============== REMAPPER FOR $0512
;============== REMAPPER FOR $0513
;============== REMAPPER FOR $0514
;============== REMAPPER FOR $0515
;============== REMAPPER FOR $0516
;============== REMAPPER FOR $0517
;============== REMAPPER FOR $0518
;============== REMAPPER FOR $0519
;============== REMAPPER FOR $051A
;============== REMAPPER FOR $051B
;============== REMAPPER FOR $051C
;============== REMAPPER FOR $051D
;============== REMAPPER FOR $051E
;============== REMAPPER FOR $051F
;============== REMAPPER FOR $0520
;============== REMAPPER FOR $0521
;============== REMAPPER FOR $0522
;============== REMAPPER FOR $0523
;============== REMAPPER FOR $0524
;============== REMAPPER FOR $0525
;============== REMAPPER FOR $0526
;============== REMAPPER FOR $0527
;============== REMAPPER FOR $0528
;============== REMAPPER FOR $0529
;============== REMAPPER FOR $052A
;============== REMAPPER FOR $052B
;============== REMAPPER FOR $052C
;============== REMAPPER FOR $052D
;============== REMAPPER FOR $052E
;============== REMAPPER FOR $052F
;============== REMAPPER FOR $0530
;============== REMAPPER FOR $0531
;============== REMAPPER FOR $0532
;============== REMAPPER FOR $0533
;============== REMAPPER FOR $0534
;============== REMAPPER FOR $0535
;============== REMAPPER FOR $0536
;============== REMAPPER FOR $0537
;============== REMAPPER FOR $0538
;============== REMAPPER FOR $0539
;============== REMAPPER FOR $053A
;============== REMAPPER FOR $053B
;============== REMAPPER FOR $053C
org $05B279
	dw $653C
;============== REMAPPER FOR $053D
;============== REMAPPER FOR $053E
;============== REMAPPER FOR $053F
;============== REMAPPER FOR $0540
;============== REMAPPER FOR $0541
;============== REMAPPER FOR $0542
;============== REMAPPER FOR $0543
;============== REMAPPER FOR $0544
;============== REMAPPER FOR $0545
;============== REMAPPER FOR $0546
;============== REMAPPER FOR $0547
;============== REMAPPER FOR $0548
org $04F480
	dw $6548
;============== REMAPPER FOR $0549
;============== REMAPPER FOR $054A
;============== REMAPPER FOR $054B
;============== REMAPPER FOR $054C
;============== REMAPPER FOR $054D
;============== REMAPPER FOR $054E
;============== REMAPPER FOR $054F
;============== REMAPPER FOR $0550
;============== REMAPPER FOR $0551
;============== REMAPPER FOR $0552
;============== REMAPPER FOR $0553
;============== REMAPPER FOR $0554
;============== REMAPPER FOR $0555
;============== REMAPPER FOR $0556
;============== REMAPPER FOR $0557
;============== REMAPPER FOR $0558
;============== REMAPPER FOR $0559
;============== REMAPPER FOR $055A
;============== REMAPPER FOR $055B
;============== REMAPPER FOR $055C
;============== REMAPPER FOR $055D
;============== REMAPPER FOR $055E
;============== REMAPPER FOR $055F
;============== REMAPPER FOR $0560
;============== REMAPPER FOR $0561
;============== REMAPPER FOR $0562
;============== REMAPPER FOR $0563
;============== REMAPPER FOR $0564
;============== REMAPPER FOR $0565
;============== REMAPPER FOR $0566
;============== REMAPPER FOR $0567
;============== REMAPPER FOR $0568
;============== REMAPPER FOR $0569
;============== REMAPPER FOR $056A
;============== REMAPPER FOR $056B
;============== REMAPPER FOR $056C
;============== REMAPPER FOR $056D
;============== REMAPPER FOR $056E
;============== REMAPPER FOR $056F
;============== REMAPPER FOR $0570
;============== REMAPPER FOR $0571
;============== REMAPPER FOR $0572
;============== REMAPPER FOR $0573
;============== REMAPPER FOR $0574
;============== REMAPPER FOR $0575
;============== REMAPPER FOR $0576
;============== REMAPPER FOR $0577
;============== REMAPPER FOR $0578
;============== REMAPPER FOR $0579
;============== REMAPPER FOR $057A
;============== REMAPPER FOR $057B
;============== REMAPPER FOR $057C
;============== REMAPPER FOR $057D
;============== REMAPPER FOR $057E
org $0CAB80
	dw $657E
;============== REMAPPER FOR $057F
;============== REMAPPER FOR $0580
;============== REMAPPER FOR $0581
;============== REMAPPER FOR $0582
;============== REMAPPER FOR $0583
;============== REMAPPER FOR $0584
;============== REMAPPER FOR $0585
;============== REMAPPER FOR $0586
;============== REMAPPER FOR $0587
;============== REMAPPER FOR $0588
;============== REMAPPER FOR $0589
;============== REMAPPER FOR $058A
;============== REMAPPER FOR $058B
;============== REMAPPER FOR $058C
;============== REMAPPER FOR $058D
;============== REMAPPER FOR $058E
;============== REMAPPER FOR $058F
;============== REMAPPER FOR $0590
org $04F483
	dw $6590
;============== REMAPPER FOR $0591
;============== REMAPPER FOR $0592
;============== REMAPPER FOR $0593
;============== REMAPPER FOR $0594
;============== REMAPPER FOR $0595
;============== REMAPPER FOR $0596
;============== REMAPPER FOR $0597
;============== REMAPPER FOR $0598
org $04DB85
	dw $6598
;============== REMAPPER FOR $0599
;============== REMAPPER FOR $059A
;============== REMAPPER FOR $059B
;============== REMAPPER FOR $059C
;============== REMAPPER FOR $059D
;============== REMAPPER FOR $059E
;============== REMAPPER FOR $059F
;============== REMAPPER FOR $05A0
;============== REMAPPER FOR $05A1
;============== REMAPPER FOR $05A2
;============== REMAPPER FOR $05A3
;============== REMAPPER FOR $05A4
;============== REMAPPER FOR $05A5
;============== REMAPPER FOR $05A6
;============== REMAPPER FOR $05A7
;============== REMAPPER FOR $05A8
;============== REMAPPER FOR $05A9
;============== REMAPPER FOR $05AA
;============== REMAPPER FOR $05AB
;============== REMAPPER FOR $05AC
;============== REMAPPER FOR $05AD
;============== REMAPPER FOR $05AE
;============== REMAPPER FOR $05AF
;============== REMAPPER FOR $05B0
;============== REMAPPER FOR $05B1
;============== REMAPPER FOR $05B2
;============== REMAPPER FOR $05B3
;============== REMAPPER FOR $05B4
;============== REMAPPER FOR $05B5
;============== REMAPPER FOR $05B6
;============== REMAPPER FOR $05B7
;============== REMAPPER FOR $05B8
;============== REMAPPER FOR $05B9
;============== REMAPPER FOR $05BA
;============== REMAPPER FOR $05BB
;============== REMAPPER FOR $05BC
;============== REMAPPER FOR $05BD
;============== REMAPPER FOR $05BE
;============== REMAPPER FOR $05BF
;============== REMAPPER FOR $05C0
;============== REMAPPER FOR $05C1
;============== REMAPPER FOR $05C2
;============== REMAPPER FOR $05C3
;============== REMAPPER FOR $05C4
;============== REMAPPER FOR $05C5
;============== REMAPPER FOR $05C6
;============== REMAPPER FOR $05C7
;============== REMAPPER FOR $05C8
;============== REMAPPER FOR $05C9
;============== REMAPPER FOR $05CA
;============== REMAPPER FOR $05CB
;============== REMAPPER FOR $05CC
;============== REMAPPER FOR $05CD
;============== REMAPPER FOR $05CE
;============== REMAPPER FOR $05CF
;============== REMAPPER FOR $05D0
;============== REMAPPER FOR $05D1
;============== REMAPPER FOR $05D2
;============== REMAPPER FOR $05D3
;============== REMAPPER FOR $05D4
;============== REMAPPER FOR $05D5
;============== REMAPPER FOR $05D6
;============== REMAPPER FOR $05D7
;============== REMAPPER FOR $05D8
;============== REMAPPER FOR $05D9
;============== REMAPPER FOR $05DA
;============== REMAPPER FOR $05DB
;============== REMAPPER FOR $05DC
;============== REMAPPER FOR $05DD
;============== REMAPPER FOR $05DE
;============== REMAPPER FOR $05DF
;============== REMAPPER FOR $05E0
;============== REMAPPER FOR $05E1
;============== REMAPPER FOR $05E2
;============== REMAPPER FOR $05E3
;============== REMAPPER FOR $05E4
;============== REMAPPER FOR $05E5
;============== REMAPPER FOR $05E6
;============== REMAPPER FOR $05E7
;============== REMAPPER FOR $05E8
;============== REMAPPER FOR $05E9
;============== REMAPPER FOR $05EA
;============== REMAPPER FOR $05EB
;============== REMAPPER FOR $05EC
;============== REMAPPER FOR $05ED
;============== REMAPPER FOR $05EE
;============== REMAPPER FOR $05EF
;============== REMAPPER FOR $05F0
;============== REMAPPER FOR $05F1
;============== REMAPPER FOR $05F2
;============== REMAPPER FOR $05F3
;============== REMAPPER FOR $05F4
;============== REMAPPER FOR $05F5
;============== REMAPPER FOR $05F6
;============== REMAPPER FOR $05F7
;============== REMAPPER FOR $05F8
;============== REMAPPER FOR $05F9
;============== REMAPPER FOR $05FA
;============== REMAPPER FOR $05FB
;============== REMAPPER FOR $05FC
;============== REMAPPER FOR $05FD
;============== REMAPPER FOR $05FE
;============== REMAPPER FOR $05FF
;============== REMAPPER FOR $0600
;============== REMAPPER FOR $0601
;============== REMAPPER FOR $0602
;============== REMAPPER FOR $0603
;============== REMAPPER FOR $0604
;============== REMAPPER FOR $0605
;============== REMAPPER FOR $0606
;============== REMAPPER FOR $0607
;============== REMAPPER FOR $0608
;============== REMAPPER FOR $0609
;============== REMAPPER FOR $060A
;============== REMAPPER FOR $060B
;============== REMAPPER FOR $060C
;============== REMAPPER FOR $060D
;============== REMAPPER FOR $060E
;============== REMAPPER FOR $060F
;============== REMAPPER FOR $0610
;============== REMAPPER FOR $0611
;============== REMAPPER FOR $0612
;============== REMAPPER FOR $0613
;============== REMAPPER FOR $0614
;============== REMAPPER FOR $0615
;============== REMAPPER FOR $0616
;============== REMAPPER FOR $0617
;============== REMAPPER FOR $0618
;============== REMAPPER FOR $0619
;============== REMAPPER FOR $061A
;============== REMAPPER FOR $061B
;============== REMAPPER FOR $061C
;============== REMAPPER FOR $061D
;============== REMAPPER FOR $061E
;============== REMAPPER FOR $061F
;============== REMAPPER FOR $0620
;============== REMAPPER FOR $0621
;============== REMAPPER FOR $0622
;============== REMAPPER FOR $0623
;============== REMAPPER FOR $0624
;============== REMAPPER FOR $0625
;============== REMAPPER FOR $0626
;============== REMAPPER FOR $0627
;============== REMAPPER FOR $0628
;============== REMAPPER FOR $0629
;============== REMAPPER FOR $062A
;============== REMAPPER FOR $062B
;============== REMAPPER FOR $062C
;============== REMAPPER FOR $062D
;============== REMAPPER FOR $062E
;============== REMAPPER FOR $062F
;============== REMAPPER FOR $0630
;============== REMAPPER FOR $0631
;============== REMAPPER FOR $0632
;============== REMAPPER FOR $0633
;============== REMAPPER FOR $0634
;============== REMAPPER FOR $0635
;============== REMAPPER FOR $0636
;============== REMAPPER FOR $0637
;============== REMAPPER FOR $0638
;============== REMAPPER FOR $0639
;============== REMAPPER FOR $063A
;============== REMAPPER FOR $063B
;============== REMAPPER FOR $063C
;============== REMAPPER FOR $063D
;============== REMAPPER FOR $063E
;============== REMAPPER FOR $063F
;============== REMAPPER FOR $0640
;============== REMAPPER FOR $0641
;============== REMAPPER FOR $0642
;============== REMAPPER FOR $0643
;============== REMAPPER FOR $0644
;============== REMAPPER FOR $0645
;============== REMAPPER FOR $0646
;============== REMAPPER FOR $0647
;============== REMAPPER FOR $0648
;============== REMAPPER FOR $0649
;============== REMAPPER FOR $064A
;============== REMAPPER FOR $064B
;============== REMAPPER FOR $064C
;============== REMAPPER FOR $064D
;============== REMAPPER FOR $064E
;============== REMAPPER FOR $064F
;============== REMAPPER FOR $0650
;============== REMAPPER FOR $0651
;============== REMAPPER FOR $0652
;============== REMAPPER FOR $0653
;============== REMAPPER FOR $0654
;============== REMAPPER FOR $0655
;============== REMAPPER FOR $0656
;============== REMAPPER FOR $0657
;============== REMAPPER FOR $0658
;============== REMAPPER FOR $0659
;============== REMAPPER FOR $065A
;============== REMAPPER FOR $065B
;============== REMAPPER FOR $065C
;============== REMAPPER FOR $065D
;============== REMAPPER FOR $065E
;============== REMAPPER FOR $065F
;============== REMAPPER FOR $0660
;============== REMAPPER FOR $0661
;============== REMAPPER FOR $0662
;============== REMAPPER FOR $0663
;============== REMAPPER FOR $0664
;============== REMAPPER FOR $0665
;============== REMAPPER FOR $0666
;============== REMAPPER FOR $0667
;============== REMAPPER FOR $0668
;============== REMAPPER FOR $0669
;============== REMAPPER FOR $066A
;============== REMAPPER FOR $066B
;============== REMAPPER FOR $066C
;============== REMAPPER FOR $066D
;============== REMAPPER FOR $066E
;============== REMAPPER FOR $066F
;============== REMAPPER FOR $0670
;============== REMAPPER FOR $0671
;============== REMAPPER FOR $0672
;============== REMAPPER FOR $0673
;============== REMAPPER FOR $0674
;============== REMAPPER FOR $0675
;============== REMAPPER FOR $0676
;============== REMAPPER FOR $0677
;============== REMAPPER FOR $0678
;============== REMAPPER FOR $0679
;============== REMAPPER FOR $067A
;============== REMAPPER FOR $067B
;============== REMAPPER FOR $067C
;============== REMAPPER FOR $067D
;============== REMAPPER FOR $067E
;============== REMAPPER FOR $067F
;============== REMAPPER FOR $0680
org $00A489
	dw $6680
org $00A4D5
	dw $6680
org $00A4E0
	dw $6680
org $00AFA0
	dw $6680
org $00B042
	dw $6680
org $04DBC2
	dw $6680
org $04EAA1
	dw $6680
;============== REMAPPER FOR $0681
org $008A6E
	dw $6681
org $00A4DA
	dw $6681
org $01C034
	dw $6681
org $01C048
	dw $6681
org $01C05C
	dw $6681
org $038252
	dw $6681
org $038266
	dw $6681
org $03827A
	dw $6681
org $03AF0D
	dw $6681
org $03AF2D
	dw $6681
org $03DFCE
	dw $6681
org $03E058
	dw $6681
org $04F74C
	dw $6681
org $04F76C
	dw $6681
;============== REMAPPER FOR $0682
org $00A4DD
	dw $6682
org $01C04D
	dw $6682
org $03826B
	dw $6682
org $03AF12
	dw $6682
org $03DFD3
	dw $6682
org $04F751
	dw $6682
org $0CABB7
	dw $6682
;============== REMAPPER FOR $0683
org $01C052
	dw $6683
org $038270
	dw $6683
org $03AF17
	dw $6683
org $03DFD6
	dw $6683
org $04F756
	dw $6683
org $0CABBF
	dw $6683
;============== REMAPPER FOR $0684
org $01C03B
	dw $6684
org $038259
	dw $6684
org $03AF1C
	dw $6684
org $03DFD9
	dw $6684
org $03E032
	dw $6684
org $04F75C
	dw $6684
org $0CAC09
	dw $6684
org $0CAC24
	dw $6684
;============== REMAPPER FOR $0685
org $03AF21
	dw $6685
org $03DFDC
	dw $6685
org $04F762
	dw $6685
;============== REMAPPER FOR $0686
org $03AF26
	dw $6686
org $03E047
	dw $6686
org $03E051
	dw $6686
org $04F765
	dw $6686
;============== REMAPPER FOR $0687
;============== REMAPPER FOR $0688
;============== REMAPPER FOR $0689
;============== REMAPPER FOR $068A
;============== REMAPPER FOR $068B
;============== REMAPPER FOR $068C
;============== REMAPPER FOR $068D
;============== REMAPPER FOR $068E
;============== REMAPPER FOR $068F
;============== REMAPPER FOR $0690
org $0CABBA
	dw $6690
;============== REMAPPER FOR $0691
org $0CABC4
	dw $6691
;============== REMAPPER FOR $0692
;============== REMAPPER FOR $0693
;============== REMAPPER FOR $0694
org $01C055
	dw $6694
org $038273
	dw $6694
;============== REMAPPER FOR $0695
;============== REMAPPER FOR $0696
;============== REMAPPER FOR $0697
;============== REMAPPER FOR $0698
;============== REMAPPER FOR $0699
;============== REMAPPER FOR $069A
;============== REMAPPER FOR $069B
;============== REMAPPER FOR $069C
;============== REMAPPER FOR $069D
;============== REMAPPER FOR $069E
;============== REMAPPER FOR $069F
;============== REMAPPER FOR $06A0
;============== REMAPPER FOR $06A1
;============== REMAPPER FOR $06A2
;============== REMAPPER FOR $06A3
;============== REMAPPER FOR $06A4
;============== REMAPPER FOR $06A5
;============== REMAPPER FOR $06A6
;============== REMAPPER FOR $06A7
;============== REMAPPER FOR $06A8
;============== REMAPPER FOR $06A9
;============== REMAPPER FOR $06AA
;============== REMAPPER FOR $06AB
;============== REMAPPER FOR $06AC
;============== REMAPPER FOR $06AD
;============== REMAPPER FOR $06AE
;============== REMAPPER FOR $06AF
;============== REMAPPER FOR $06B0
;============== REMAPPER FOR $06B1
;============== REMAPPER FOR $06B2
;============== REMAPPER FOR $06B3
;============== REMAPPER FOR $06B4
;============== REMAPPER FOR $06B5
;============== REMAPPER FOR $06B6
;============== REMAPPER FOR $06B7
;============== REMAPPER FOR $06B8
;============== REMAPPER FOR $06B9
;============== REMAPPER FOR $06BA
;============== REMAPPER FOR $06BB
;============== REMAPPER FOR $06BC
;============== REMAPPER FOR $06BD
;============== REMAPPER FOR $06BE
;============== REMAPPER FOR $06BF
;============== REMAPPER FOR $06C0
;============== REMAPPER FOR $06C1
;============== REMAPPER FOR $06C2
;============== REMAPPER FOR $06C3
;============== REMAPPER FOR $06C4
;============== REMAPPER FOR $06C5
;============== REMAPPER FOR $06C6
;============== REMAPPER FOR $06C7
;============== REMAPPER FOR $06C8
;============== REMAPPER FOR $06C9
;============== REMAPPER FOR $06CA
;============== REMAPPER FOR $06CB
;============== REMAPPER FOR $06CC
;============== REMAPPER FOR $06CD
;============== REMAPPER FOR $06CE
;============== REMAPPER FOR $06CF
;============== REMAPPER FOR $06D0
;============== REMAPPER FOR $06D1
;============== REMAPPER FOR $06D2
;============== REMAPPER FOR $06D3
;============== REMAPPER FOR $06D4
;============== REMAPPER FOR $06D5
;============== REMAPPER FOR $06D6
;============== REMAPPER FOR $06D7
;============== REMAPPER FOR $06D8
;============== REMAPPER FOR $06D9
;============== REMAPPER FOR $06DA
;============== REMAPPER FOR $06DB
;============== REMAPPER FOR $06DC
;============== REMAPPER FOR $06DD
;============== REMAPPER FOR $06DE
;============== REMAPPER FOR $06DF
;============== REMAPPER FOR $06E0
;============== REMAPPER FOR $06E1
;============== REMAPPER FOR $06E2
;============== REMAPPER FOR $06E3
;============== REMAPPER FOR $06E4
;============== REMAPPER FOR $06E5
;============== REMAPPER FOR $06E6
;============== REMAPPER FOR $06E7
;============== REMAPPER FOR $06E8
;============== REMAPPER FOR $06E9
;============== REMAPPER FOR $06EA
;============== REMAPPER FOR $06EB
;============== REMAPPER FOR $06EC
;============== REMAPPER FOR $06ED
;============== REMAPPER FOR $06EE
;============== REMAPPER FOR $06EF
;============== REMAPPER FOR $06F0
;============== REMAPPER FOR $06F1
;============== REMAPPER FOR $06F2
;============== REMAPPER FOR $06F3
;============== REMAPPER FOR $06F4
;============== REMAPPER FOR $06F5
;============== REMAPPER FOR $06F6
;============== REMAPPER FOR $06F7
;============== REMAPPER FOR $06F8
;============== REMAPPER FOR $06F9
;============== REMAPPER FOR $06FA
;============== REMAPPER FOR $06FB
;============== REMAPPER FOR $06FC
;============== REMAPPER FOR $06FD
;============== REMAPPER FOR $06FE
;============== REMAPPER FOR $06FF
;============== REMAPPER FOR $0700
;============== REMAPPER FOR $0701
org $0093DB
	dw $6701
org $009D31
	dw $6701
org $00A10B
	dw $6701
org $00A5E9
	dw $6701
org $00AC3F
	dw $6701
org $00ADE2
	dw $6701
org $00AE28
	dw $6701
org $00AE4C
	dw $6701
org $00AF89
	dw $6701
org $00AF96
	dw $6701
org $03AC15
	dw $6701
org $03C51D
	dw $6701
org $03C7B1
	dw $6701
org $03DFEC
	dw $6701
org $04962E
	dw $6701
org $04F48C
	dw $6701
org $0CABDC
	dw $6701
org $0CCC5C
	dw $6701
org $0CCC78
	dw $6701
;============== REMAPPER FOR $0702
org $0093DE
	dw $6702
org $03AC18
	dw $6702
org $03C523
	dw $6702
org $03C7B7
	dw $6702
;============== REMAPPER FOR $0703
org $009230
	dw $6703
org $00ACF3
	dw $6703
org $00AD06
	dw $6703
org $00AF59
	dw $6703
org $04DBB5
	dw $6703
org $04EA6B
	dw $6703
;============== REMAPPER FOR $0704
org $009233
	dw $6704
org $04DBBA
	dw $6704
;============== REMAPPER FOR $0705
;============== REMAPPER FOR $0706
;============== REMAPPER FOR $0707
org $03DDB5
	dw $6707
;============== REMAPPER FOR $0708
;============== REMAPPER FOR $0709
;============== REMAPPER FOR $070A
;============== REMAPPER FOR $070B
;============== REMAPPER FOR $070C
;============== REMAPPER FOR $070D
;============== REMAPPER FOR $070E
;============== REMAPPER FOR $070F
;============== REMAPPER FOR $0710
;============== REMAPPER FOR $0711
;============== REMAPPER FOR $0712
;============== REMAPPER FOR $0713
;============== REMAPPER FOR $0714
;============== REMAPPER FOR $0715
;============== REMAPPER FOR $0716
;============== REMAPPER FOR $0717
;============== REMAPPER FOR $0718
;============== REMAPPER FOR $0719
;============== REMAPPER FOR $071A
;============== REMAPPER FOR $071B
org $00A00D
	dw $671B
;============== REMAPPER FOR $071C
;============== REMAPPER FOR $071D
org $00AF7A
	dw $671D
;============== REMAPPER FOR $071E
;============== REMAPPER FOR $071F
;============== REMAPPER FOR $0720
;============== REMAPPER FOR $0721
;============== REMAPPER FOR $0722
;============== REMAPPER FOR $0723
;============== REMAPPER FOR $0724
;============== REMAPPER FOR $0725
;============== REMAPPER FOR $0726
;============== REMAPPER FOR $0727
;============== REMAPPER FOR $0728
;============== REMAPPER FOR $0729
;============== REMAPPER FOR $072A
;============== REMAPPER FOR $072B
;============== REMAPPER FOR $072C
;============== REMAPPER FOR $072D
;============== REMAPPER FOR $072E
;============== REMAPPER FOR $072F
;============== REMAPPER FOR $0730
;============== REMAPPER FOR $0731
;============== REMAPPER FOR $0732
;============== REMAPPER FOR $0733
;============== REMAPPER FOR $0734
;============== REMAPPER FOR $0735
;============== REMAPPER FOR $0736
;============== REMAPPER FOR $0737
;============== REMAPPER FOR $0738
;============== REMAPPER FOR $0739
;============== REMAPPER FOR $073A
;============== REMAPPER FOR $073B
;============== REMAPPER FOR $073C
;============== REMAPPER FOR $073D
;============== REMAPPER FOR $073E
;============== REMAPPER FOR $073F
;============== REMAPPER FOR $0740
;============== REMAPPER FOR $0741
;============== REMAPPER FOR $0742
;============== REMAPPER FOR $0743
;============== REMAPPER FOR $0744
;============== REMAPPER FOR $0745
;============== REMAPPER FOR $0746
;============== REMAPPER FOR $0747
;============== REMAPPER FOR $0748
;============== REMAPPER FOR $0749
;============== REMAPPER FOR $074A
;============== REMAPPER FOR $074B
;============== REMAPPER FOR $074C
;============== REMAPPER FOR $074D
;============== REMAPPER FOR $074E
;============== REMAPPER FOR $074F
;============== REMAPPER FOR $0750
;============== REMAPPER FOR $0751
;============== REMAPPER FOR $0752
;============== REMAPPER FOR $0753
org $04F759
	dw $6753
;============== REMAPPER FOR $0754
org $04F75F
	dw $6754
;============== REMAPPER FOR $0755
;============== REMAPPER FOR $0756
;============== REMAPPER FOR $0757
;============== REMAPPER FOR $0758
;============== REMAPPER FOR $0759
;============== REMAPPER FOR $075A
;============== REMAPPER FOR $075B
;============== REMAPPER FOR $075C
;============== REMAPPER FOR $075D
;============== REMAPPER FOR $075E
;============== REMAPPER FOR $075F
;============== REMAPPER FOR $0760
;============== REMAPPER FOR $0761
;============== REMAPPER FOR $0762
;============== REMAPPER FOR $0763
;============== REMAPPER FOR $0764
;============== REMAPPER FOR $0765
;============== REMAPPER FOR $0766
;============== REMAPPER FOR $0767
;============== REMAPPER FOR $0768
;============== REMAPPER FOR $0769
;============== REMAPPER FOR $076A
;============== REMAPPER FOR $076B
;============== REMAPPER FOR $076C
;============== REMAPPER FOR $076D
;============== REMAPPER FOR $076E
;============== REMAPPER FOR $076F
;============== REMAPPER FOR $0770
;============== REMAPPER FOR $0771
;============== REMAPPER FOR $0772
;============== REMAPPER FOR $0773
;============== REMAPPER FOR $0774
;============== REMAPPER FOR $0775
;============== REMAPPER FOR $0776
;============== REMAPPER FOR $0777
;============== REMAPPER FOR $0778
;============== REMAPPER FOR $0779
;============== REMAPPER FOR $077A
;============== REMAPPER FOR $077B
;============== REMAPPER FOR $077C
;============== REMAPPER FOR $077D
;============== REMAPPER FOR $077E
;============== REMAPPER FOR $077F
;============== REMAPPER FOR $0780
;============== REMAPPER FOR $0781
;============== REMAPPER FOR $0782
;============== REMAPPER FOR $0783
org $00B018
	dw $6783
org $00B025
	dw $6783
org $04EA7B
	dw $6783
;============== REMAPPER FOR $0784
;============== REMAPPER FOR $0785
;============== REMAPPER FOR $0786
;============== REMAPPER FOR $0787
;============== REMAPPER FOR $0788
;============== REMAPPER FOR $0789
;============== REMAPPER FOR $078A
;============== REMAPPER FOR $078B
;============== REMAPPER FOR $078C
;============== REMAPPER FOR $078D
;============== REMAPPER FOR $078E
;============== REMAPPER FOR $078F
;============== REMAPPER FOR $0790
;============== REMAPPER FOR $0791
;============== REMAPPER FOR $0792
;============== REMAPPER FOR $0793
;============== REMAPPER FOR $0794
;============== REMAPPER FOR $0795
;============== REMAPPER FOR $0796
;============== REMAPPER FOR $0797
;============== REMAPPER FOR $0798
;============== REMAPPER FOR $0799
;============== REMAPPER FOR $079A
;============== REMAPPER FOR $079B
;============== REMAPPER FOR $079C
;============== REMAPPER FOR $079D
;============== REMAPPER FOR $079E
;============== REMAPPER FOR $079F
;============== REMAPPER FOR $07A0
;============== REMAPPER FOR $07A1
;============== REMAPPER FOR $07A2
;============== REMAPPER FOR $07A3
;============== REMAPPER FOR $07A4
;============== REMAPPER FOR $07A5
;============== REMAPPER FOR $07A6
;============== REMAPPER FOR $07A7
;============== REMAPPER FOR $07A8
;============== REMAPPER FOR $07A9
;============== REMAPPER FOR $07AA
;============== REMAPPER FOR $07AB
;============== REMAPPER FOR $07AC
;============== REMAPPER FOR $07AD
;============== REMAPPER FOR $07AE
;============== REMAPPER FOR $07AF
;============== REMAPPER FOR $07B0
;============== REMAPPER FOR $07B1
;============== REMAPPER FOR $07B2
;============== REMAPPER FOR $07B3
;============== REMAPPER FOR $07B4
;============== REMAPPER FOR $07B5
;============== REMAPPER FOR $07B6
;============== REMAPPER FOR $07B7
;============== REMAPPER FOR $07B8
;============== REMAPPER FOR $07B9
;============== REMAPPER FOR $07BA
;============== REMAPPER FOR $07BB
;============== REMAPPER FOR $07BC
;============== REMAPPER FOR $07BD
;============== REMAPPER FOR $07BE
;============== REMAPPER FOR $07BF
;============== REMAPPER FOR $07C0
;============== REMAPPER FOR $07C1
;============== REMAPPER FOR $07C2
;============== REMAPPER FOR $07C3
;============== REMAPPER FOR $07C4
;============== REMAPPER FOR $07C5
;============== REMAPPER FOR $07C6
;============== REMAPPER FOR $07C7
;============== REMAPPER FOR $07C8
;============== REMAPPER FOR $07C9
;============== REMAPPER FOR $07CA
;============== REMAPPER FOR $07CB
;============== REMAPPER FOR $07CC
;============== REMAPPER FOR $07CD
;============== REMAPPER FOR $07CE
;============== REMAPPER FOR $07CF
;============== REMAPPER FOR $07D0
;============== REMAPPER FOR $07D1
;============== REMAPPER FOR $07D2
;============== REMAPPER FOR $07D3
;============== REMAPPER FOR $07D4
;============== REMAPPER FOR $07D5
;============== REMAPPER FOR $07D6
;============== REMAPPER FOR $07D7
;============== REMAPPER FOR $07D8
;============== REMAPPER FOR $07D9
;============== REMAPPER FOR $07DA
;============== REMAPPER FOR $07DB
;============== REMAPPER FOR $07DC
;============== REMAPPER FOR $07DD
;============== REMAPPER FOR $07DE
;============== REMAPPER FOR $07DF
;============== REMAPPER FOR $07E0
;============== REMAPPER FOR $07E1
;============== REMAPPER FOR $07E2
;============== REMAPPER FOR $07E3
;============== REMAPPER FOR $07E4
;============== REMAPPER FOR $07E5
;============== REMAPPER FOR $07E6
;============== REMAPPER FOR $07E7
;============== REMAPPER FOR $07E8
;============== REMAPPER FOR $07E9
;============== REMAPPER FOR $07EA
;============== REMAPPER FOR $07EB
;============== REMAPPER FOR $07EC
;============== REMAPPER FOR $07ED
;============== REMAPPER FOR $07EE
;============== REMAPPER FOR $07EF
;============== REMAPPER FOR $07F0
;============== REMAPPER FOR $07F1
;============== REMAPPER FOR $07F2
;============== REMAPPER FOR $07F3
;============== REMAPPER FOR $07F4
;============== REMAPPER FOR $07F5
;============== REMAPPER FOR $07F6
;============== REMAPPER FOR $07F7
;============== REMAPPER FOR $07F8
;============== REMAPPER FOR $07F9
;============== REMAPPER FOR $07FA
;============== REMAPPER FOR $07FB
;============== REMAPPER FOR $07FC
;============== REMAPPER FOR $07FD
;============== REMAPPER FOR $07FE
;============== REMAPPER FOR $07FF
;============== REMAPPER FOR $0800
;============== REMAPPER FOR $0801
;============== REMAPPER FOR $0802
;============== REMAPPER FOR $0803
org $04DBBD
	dw $6803
;============== REMAPPER FOR $0804
;============== REMAPPER FOR $0805
;============== REMAPPER FOR $0806
;============== REMAPPER FOR $0807
org $009607
	dw $6807
;============== REMAPPER FOR $0808
;============== REMAPPER FOR $0809
;============== REMAPPER FOR $080A
;============== REMAPPER FOR $080B
;============== REMAPPER FOR $080C
;============== REMAPPER FOR $080D
;============== REMAPPER FOR $080E
;============== REMAPPER FOR $080F
;============== REMAPPER FOR $0810
;============== REMAPPER FOR $0811
;============== REMAPPER FOR $0812
;============== REMAPPER FOR $0813
;============== REMAPPER FOR $0814
;============== REMAPPER FOR $0815
;============== REMAPPER FOR $0816
;============== REMAPPER FOR $0817
;============== REMAPPER FOR $0818
;============== REMAPPER FOR $0819
;============== REMAPPER FOR $081A
;============== REMAPPER FOR $081B
;============== REMAPPER FOR $081C
;============== REMAPPER FOR $081D
;============== REMAPPER FOR $081E
;============== REMAPPER FOR $081F
;============== REMAPPER FOR $0820
;============== REMAPPER FOR $0821
;============== REMAPPER FOR $0822
;============== REMAPPER FOR $0823
org $00B073
	dw $6823
;============== REMAPPER FOR $0824
;============== REMAPPER FOR $0825
;============== REMAPPER FOR $0826
;============== REMAPPER FOR $0827
org $00960D
	dw $6827
;============== REMAPPER FOR $0828
;============== REMAPPER FOR $0829
;============== REMAPPER FOR $082A
;============== REMAPPER FOR $082B
;============== REMAPPER FOR $082C
;============== REMAPPER FOR $082D
;============== REMAPPER FOR $082E
;============== REMAPPER FOR $082F
;============== REMAPPER FOR $0830
;============== REMAPPER FOR $0831
;============== REMAPPER FOR $0832
;============== REMAPPER FOR $0833
;============== REMAPPER FOR $0834
;============== REMAPPER FOR $0835
;============== REMAPPER FOR $0836
;============== REMAPPER FOR $0837
;============== REMAPPER FOR $0838
;============== REMAPPER FOR $0839
;============== REMAPPER FOR $083A
;============== REMAPPER FOR $083B
;============== REMAPPER FOR $083C
;============== REMAPPER FOR $083D
;============== REMAPPER FOR $083E
;============== REMAPPER FOR $083F
;============== REMAPPER FOR $0840
;============== REMAPPER FOR $0841
;============== REMAPPER FOR $0842
;============== REMAPPER FOR $0843
;============== REMAPPER FOR $0844
;============== REMAPPER FOR $0845
;============== REMAPPER FOR $0846
;============== REMAPPER FOR $0847
;============== REMAPPER FOR $0848
;============== REMAPPER FOR $0849
;============== REMAPPER FOR $084A
;============== REMAPPER FOR $084B
;============== REMAPPER FOR $084C
;============== REMAPPER FOR $084D
;============== REMAPPER FOR $084E
;============== REMAPPER FOR $084F
;============== REMAPPER FOR $0850
;============== REMAPPER FOR $0851
;============== REMAPPER FOR $0852
;============== REMAPPER FOR $0853
;============== REMAPPER FOR $0854
;============== REMAPPER FOR $0855
;============== REMAPPER FOR $0856
;============== REMAPPER FOR $0857
;============== REMAPPER FOR $0858
;============== REMAPPER FOR $0859
;============== REMAPPER FOR $085A
;============== REMAPPER FOR $085B
;============== REMAPPER FOR $085C
;============== REMAPPER FOR $085D
;============== REMAPPER FOR $085E
;============== REMAPPER FOR $085F
;============== REMAPPER FOR $0860
;============== REMAPPER FOR $0861
;============== REMAPPER FOR $0862
;============== REMAPPER FOR $0863
;============== REMAPPER FOR $0864
;============== REMAPPER FOR $0865
;============== REMAPPER FOR $0866
;============== REMAPPER FOR $0867
;============== REMAPPER FOR $0868
;============== REMAPPER FOR $0869
;============== REMAPPER FOR $086A
;============== REMAPPER FOR $086B
;============== REMAPPER FOR $086C
;============== REMAPPER FOR $086D
;============== REMAPPER FOR $086E
;============== REMAPPER FOR $086F
;============== REMAPPER FOR $0870
;============== REMAPPER FOR $0871
;============== REMAPPER FOR $0872
;============== REMAPPER FOR $0873
;============== REMAPPER FOR $0874
;============== REMAPPER FOR $0875
;============== REMAPPER FOR $0876
;============== REMAPPER FOR $0877
;============== REMAPPER FOR $0878
;============== REMAPPER FOR $0879
;============== REMAPPER FOR $087A
;============== REMAPPER FOR $087B
;============== REMAPPER FOR $087C
;============== REMAPPER FOR $087D
;============== REMAPPER FOR $087E
;============== REMAPPER FOR $087F
;============== REMAPPER FOR $0880
;============== REMAPPER FOR $0881
;============== REMAPPER FOR $0882
;============== REMAPPER FOR $0883
;============== REMAPPER FOR $0884
;============== REMAPPER FOR $0885
;============== REMAPPER FOR $0886
;============== REMAPPER FOR $0887
;============== REMAPPER FOR $0888
;============== REMAPPER FOR $0889
;============== REMAPPER FOR $088A
;============== REMAPPER FOR $088B
;============== REMAPPER FOR $088C
;============== REMAPPER FOR $088D
;============== REMAPPER FOR $088E
;============== REMAPPER FOR $088F
;============== REMAPPER FOR $0890
;============== REMAPPER FOR $0891
;============== REMAPPER FOR $0892
;============== REMAPPER FOR $0893
;============== REMAPPER FOR $0894
;============== REMAPPER FOR $0895
;============== REMAPPER FOR $0896
;============== REMAPPER FOR $0897
;============== REMAPPER FOR $0898
;============== REMAPPER FOR $0899
;============== REMAPPER FOR $089A
;============== REMAPPER FOR $089B
;============== REMAPPER FOR $089C
;============== REMAPPER FOR $089D
;============== REMAPPER FOR $089E
;============== REMAPPER FOR $089F
;============== REMAPPER FOR $08A0
;============== REMAPPER FOR $08A1
;============== REMAPPER FOR $08A2
;============== REMAPPER FOR $08A3
;============== REMAPPER FOR $08A4
;============== REMAPPER FOR $08A5
;============== REMAPPER FOR $08A6
;============== REMAPPER FOR $08A7
org $009664
	dw $68A7
;============== REMAPPER FOR $08A8
;============== REMAPPER FOR $08A9
;============== REMAPPER FOR $08AA
;============== REMAPPER FOR $08AB
;============== REMAPPER FOR $08AC
;============== REMAPPER FOR $08AD
;============== REMAPPER FOR $08AE
;============== REMAPPER FOR $08AF
;============== REMAPPER FOR $08B0
;============== REMAPPER FOR $08B1
;============== REMAPPER FOR $08B2
;============== REMAPPER FOR $08B3
;============== REMAPPER FOR $08B4
;============== REMAPPER FOR $08B5
;============== REMAPPER FOR $08B6
;============== REMAPPER FOR $08B7
;============== REMAPPER FOR $08B8
;============== REMAPPER FOR $08B9
;============== REMAPPER FOR $08BA
;============== REMAPPER FOR $08BB
;============== REMAPPER FOR $08BC
;============== REMAPPER FOR $08BD
;============== REMAPPER FOR $08BE
;============== REMAPPER FOR $08BF
;============== REMAPPER FOR $08C0
;============== REMAPPER FOR $08C1
;============== REMAPPER FOR $08C2
;============== REMAPPER FOR $08C3
;============== REMAPPER FOR $08C4
;============== REMAPPER FOR $08C5
;============== REMAPPER FOR $08C6
;============== REMAPPER FOR $08C7
org $00966A
	dw $68C7
;============== REMAPPER FOR $08C8
;============== REMAPPER FOR $08C9
;============== REMAPPER FOR $08CA
;============== REMAPPER FOR $08CB
;============== REMAPPER FOR $08CC
;============== REMAPPER FOR $08CD
;============== REMAPPER FOR $08CE
;============== REMAPPER FOR $08CF
;============== REMAPPER FOR $08D0
;============== REMAPPER FOR $08D1
;============== REMAPPER FOR $08D2
;============== REMAPPER FOR $08D3
;============== REMAPPER FOR $08D4
;============== REMAPPER FOR $08D5
;============== REMAPPER FOR $08D6
;============== REMAPPER FOR $08D7
;============== REMAPPER FOR $08D8
;============== REMAPPER FOR $08D9
;============== REMAPPER FOR $08DA
;============== REMAPPER FOR $08DB
;============== REMAPPER FOR $08DC
;============== REMAPPER FOR $08DD
;============== REMAPPER FOR $08DE
;============== REMAPPER FOR $08DF
;============== REMAPPER FOR $08E0
;============== REMAPPER FOR $08E1
;============== REMAPPER FOR $08E2
;============== REMAPPER FOR $08E3
;============== REMAPPER FOR $08E4
;============== REMAPPER FOR $08E5
;============== REMAPPER FOR $08E6
;============== REMAPPER FOR $08E7
org $009670
	dw $68E7
;============== REMAPPER FOR $08E8
;============== REMAPPER FOR $08E9
;============== REMAPPER FOR $08EA
;============== REMAPPER FOR $08EB
;============== REMAPPER FOR $08EC
;============== REMAPPER FOR $08ED
;============== REMAPPER FOR $08EE
;============== REMAPPER FOR $08EF
;============== REMAPPER FOR $08F0
;============== REMAPPER FOR $08F1
;============== REMAPPER FOR $08F2
;============== REMAPPER FOR $08F3
;============== REMAPPER FOR $08F4
;============== REMAPPER FOR $08F5
;============== REMAPPER FOR $08F6
;============== REMAPPER FOR $08F7
;============== REMAPPER FOR $08F8
;============== REMAPPER FOR $08F9
;============== REMAPPER FOR $08FA
;============== REMAPPER FOR $08FB
;============== REMAPPER FOR $08FC
;============== REMAPPER FOR $08FD
;============== REMAPPER FOR $08FE
;============== REMAPPER FOR $08FF
;============== REMAPPER FOR $0900
;============== REMAPPER FOR $0901
;============== REMAPPER FOR $0902
;============== REMAPPER FOR $0903
org $00A5EC
	dw $6903
org $00AF8E
	dw $6903
;============== REMAPPER FOR $0904
;============== REMAPPER FOR $0905
org $00AF49
	dw $6905
org $00AF54
	dw $6905
org $00AF61
	dw $6905
org $04EA91
	dw $6905
;============== REMAPPER FOR $0906
;============== REMAPPER FOR $0907
org $00B013
	dw $6907
org $00B022
	dw $6907
org $04EA6E
	dw $6907
org $04EA7E
	dw $6907
;============== REMAPPER FOR $0908
;============== REMAPPER FOR $0909
;============== REMAPPER FOR $090A
;============== REMAPPER FOR $090B
;============== REMAPPER FOR $090C
;============== REMAPPER FOR $090D
;============== REMAPPER FOR $090E
;============== REMAPPER FOR $090F
;============== REMAPPER FOR $0910
;============== REMAPPER FOR $0911
;============== REMAPPER FOR $0912
;============== REMAPPER FOR $0913
;============== REMAPPER FOR $0914
;============== REMAPPER FOR $0915
;============== REMAPPER FOR $0916
;============== REMAPPER FOR $0917
;============== REMAPPER FOR $0918
;============== REMAPPER FOR $0919
;============== REMAPPER FOR $091A
;============== REMAPPER FOR $091B
;============== REMAPPER FOR $091C
;============== REMAPPER FOR $091D
;============== REMAPPER FOR $091E
;============== REMAPPER FOR $091F
org $00AF75
	dw $691F
org $00AF82
	dw $691F
;============== REMAPPER FOR $0920
;============== REMAPPER FOR $0921
;============== REMAPPER FOR $0922
;============== REMAPPER FOR $0923
;============== REMAPPER FOR $0924
;============== REMAPPER FOR $0925
;============== REMAPPER FOR $0926
;============== REMAPPER FOR $0927
;============== REMAPPER FOR $0928
;============== REMAPPER FOR $0929
;============== REMAPPER FOR $092A
;============== REMAPPER FOR $092B
;============== REMAPPER FOR $092C
;============== REMAPPER FOR $092D
;============== REMAPPER FOR $092E
;============== REMAPPER FOR $092F
;============== REMAPPER FOR $0930
;============== REMAPPER FOR $0931
;============== REMAPPER FOR $0932
;============== REMAPPER FOR $0933
;============== REMAPPER FOR $0934
;============== REMAPPER FOR $0935
;============== REMAPPER FOR $0936
;============== REMAPPER FOR $0937
;============== REMAPPER FOR $0938
;============== REMAPPER FOR $0939
;============== REMAPPER FOR $093A
;============== REMAPPER FOR $093B
;============== REMAPPER FOR $093C
;============== REMAPPER FOR $093D
;============== REMAPPER FOR $093E
;============== REMAPPER FOR $093F
;============== REMAPPER FOR $0940
;============== REMAPPER FOR $0941
;============== REMAPPER FOR $0942
;============== REMAPPER FOR $0943
;============== REMAPPER FOR $0944
;============== REMAPPER FOR $0945
;============== REMAPPER FOR $0946
;============== REMAPPER FOR $0947
;============== REMAPPER FOR $0948
;============== REMAPPER FOR $0949
;============== REMAPPER FOR $094A
;============== REMAPPER FOR $094B
;============== REMAPPER FOR $094C
;============== REMAPPER FOR $094D
;============== REMAPPER FOR $094E
;============== REMAPPER FOR $094F
;============== REMAPPER FOR $0950
;============== REMAPPER FOR $0951
;============== REMAPPER FOR $0952
;============== REMAPPER FOR $0953
;============== REMAPPER FOR $0954
;============== REMAPPER FOR $0955
;============== REMAPPER FOR $0956
;============== REMAPPER FOR $0957
;============== REMAPPER FOR $0958
;============== REMAPPER FOR $0959
;============== REMAPPER FOR $095A
;============== REMAPPER FOR $095B
;============== REMAPPER FOR $095C
;============== REMAPPER FOR $095D
;============== REMAPPER FOR $095E
;============== REMAPPER FOR $095F
;============== REMAPPER FOR $0960
;============== REMAPPER FOR $0961
;============== REMAPPER FOR $0962
;============== REMAPPER FOR $0963
;============== REMAPPER FOR $0964
;============== REMAPPER FOR $0965
;============== REMAPPER FOR $0966
;============== REMAPPER FOR $0967
;============== REMAPPER FOR $0968
;============== REMAPPER FOR $0969
;============== REMAPPER FOR $096A
;============== REMAPPER FOR $096B
;============== REMAPPER FOR $096C
;============== REMAPPER FOR $096D
;============== REMAPPER FOR $096E
;============== REMAPPER FOR $096F
;============== REMAPPER FOR $0970
;============== REMAPPER FOR $0971
;============== REMAPPER FOR $0972
;============== REMAPPER FOR $0973
;============== REMAPPER FOR $0974
;============== REMAPPER FOR $0975
;============== REMAPPER FOR $0976
;============== REMAPPER FOR $0977
org $04EA97
	dw $6977
;============== REMAPPER FOR $0978
;============== REMAPPER FOR $0979
org $00B02B
	dw $6979
org $04EA71
	dw $6979
;============== REMAPPER FOR $097A
;============== REMAPPER FOR $097B
;============== REMAPPER FOR $097C
;============== REMAPPER FOR $097D
;============== REMAPPER FOR $097E
;============== REMAPPER FOR $097F
;============== REMAPPER FOR $0980
;============== REMAPPER FOR $0981
;============== REMAPPER FOR $0982
;============== REMAPPER FOR $0983
;============== REMAPPER FOR $0984
;============== REMAPPER FOR $0985
;============== REMAPPER FOR $0986
;============== REMAPPER FOR $0987
;============== REMAPPER FOR $0988
;============== REMAPPER FOR $0989
;============== REMAPPER FOR $098A
;============== REMAPPER FOR $098B
;============== REMAPPER FOR $098C
;============== REMAPPER FOR $098D
;============== REMAPPER FOR $098E
;============== REMAPPER FOR $098F
;============== REMAPPER FOR $0990
;============== REMAPPER FOR $0991
;============== REMAPPER FOR $0992
;============== REMAPPER FOR $0993
;============== REMAPPER FOR $0994
;============== REMAPPER FOR $0995
;============== REMAPPER FOR $0996
;============== REMAPPER FOR $0997
;============== REMAPPER FOR $0998
;============== REMAPPER FOR $0999
;============== REMAPPER FOR $099A
;============== REMAPPER FOR $099B
;============== REMAPPER FOR $099C
;============== REMAPPER FOR $099D
;============== REMAPPER FOR $099E
;============== REMAPPER FOR $099F
;============== REMAPPER FOR $09A0
;============== REMAPPER FOR $09A1
;============== REMAPPER FOR $09A2
;============== REMAPPER FOR $09A3
;============== REMAPPER FOR $09A4
;============== REMAPPER FOR $09A5
;============== REMAPPER FOR $09A6
;============== REMAPPER FOR $09A7
;============== REMAPPER FOR $09A8
;============== REMAPPER FOR $09A9
;============== REMAPPER FOR $09AA
;============== REMAPPER FOR $09AB
;============== REMAPPER FOR $09AC
;============== REMAPPER FOR $09AD
;============== REMAPPER FOR $09AE
;============== REMAPPER FOR $09AF
;============== REMAPPER FOR $09B0
;============== REMAPPER FOR $09B1
;============== REMAPPER FOR $09B2
;============== REMAPPER FOR $09B3
;============== REMAPPER FOR $09B4
;============== REMAPPER FOR $09B5
;============== REMAPPER FOR $09B6
;============== REMAPPER FOR $09B7
;============== REMAPPER FOR $09B8
;============== REMAPPER FOR $09B9
;============== REMAPPER FOR $09BA
;============== REMAPPER FOR $09BB
;============== REMAPPER FOR $09BC
;============== REMAPPER FOR $09BD
;============== REMAPPER FOR $09BE
;============== REMAPPER FOR $09BF
;============== REMAPPER FOR $09C0
;============== REMAPPER FOR $09C1
;============== REMAPPER FOR $09C2
;============== REMAPPER FOR $09C3
;============== REMAPPER FOR $09C4
;============== REMAPPER FOR $09C5
;============== REMAPPER FOR $09C6
;============== REMAPPER FOR $09C7
;============== REMAPPER FOR $09C8
;============== REMAPPER FOR $09C9
;============== REMAPPER FOR $09CA
;============== REMAPPER FOR $09CB
;============== REMAPPER FOR $09CC
;============== REMAPPER FOR $09CD
;============== REMAPPER FOR $09CE
;============== REMAPPER FOR $09CF
;============== REMAPPER FOR $09D0
;============== REMAPPER FOR $09D1
;============== REMAPPER FOR $09D2
;============== REMAPPER FOR $09D3
;============== REMAPPER FOR $09D4
;============== REMAPPER FOR $09D5
;============== REMAPPER FOR $09D6
;============== REMAPPER FOR $09D7
;============== REMAPPER FOR $09D8
;============== REMAPPER FOR $09D9
;============== REMAPPER FOR $09DA
;============== REMAPPER FOR $09DB
;============== REMAPPER FOR $09DC
;============== REMAPPER FOR $09DD
;============== REMAPPER FOR $09DE
;============== REMAPPER FOR $09DF
;============== REMAPPER FOR $09E0
;============== REMAPPER FOR $09E1
;============== REMAPPER FOR $09E2
;============== REMAPPER FOR $09E3
;============== REMAPPER FOR $09E4
;============== REMAPPER FOR $09E5
;============== REMAPPER FOR $09E6
;============== REMAPPER FOR $09E7
;============== REMAPPER FOR $09E8
;============== REMAPPER FOR $09E9
org $04EA9C
	dw $69E9
;============== REMAPPER FOR $09EA
;============== REMAPPER FOR $09EB
;============== REMAPPER FOR $09EC
;============== REMAPPER FOR $09ED
;============== REMAPPER FOR $09EE
;============== REMAPPER FOR $09EF
;============== REMAPPER FOR $09F0
;============== REMAPPER FOR $09F1
;============== REMAPPER FOR $09F2
;============== REMAPPER FOR $09F3
;============== REMAPPER FOR $09F4
;============== REMAPPER FOR $09F5
;============== REMAPPER FOR $09F6
;============== REMAPPER FOR $09F7
;============== REMAPPER FOR $09F8
;============== REMAPPER FOR $09F9
;============== REMAPPER FOR $09FA
;============== REMAPPER FOR $09FB
;============== REMAPPER FOR $09FC
;============== REMAPPER FOR $09FD
;============== REMAPPER FOR $09FE
;============== REMAPPER FOR $09FF
;============== REMAPPER FOR $0A00
;============== REMAPPER FOR $0A01
;============== REMAPPER FOR $0A02
;============== REMAPPER FOR $0A03
;============== REMAPPER FOR $0A04
;============== REMAPPER FOR $0A05
org $00AF9B
	dw $6A05
org $00B063
	dw $6A05
;============== REMAPPER FOR $0A06
;============== REMAPPER FOR $0A07
;============== REMAPPER FOR $0A08
;============== REMAPPER FOR $0A09
;============== REMAPPER FOR $0A0A
;============== REMAPPER FOR $0A0B
;============== REMAPPER FOR $0A0C
;============== REMAPPER FOR $0A0D
;============== REMAPPER FOR $0A0E
;============== REMAPPER FOR $0A0F
;============== REMAPPER FOR $0A10
;============== REMAPPER FOR $0A11
org $00B059
	dw $6A11
;============== REMAPPER FOR $0A12
;============== REMAPPER FOR $0A13
;============== REMAPPER FOR $0A14
;============== REMAPPER FOR $0A15
;============== REMAPPER FOR $0A16
;============== REMAPPER FOR $0A17
;============== REMAPPER FOR $0A18
;============== REMAPPER FOR $0A19
;============== REMAPPER FOR $0A1A
;============== REMAPPER FOR $0A1B
;============== REMAPPER FOR $0A1C
;============== REMAPPER FOR $0A1D
;============== REMAPPER FOR $0A1E
;============== REMAPPER FOR $0A1F
;============== REMAPPER FOR $0A20
;============== REMAPPER FOR $0A21
;============== REMAPPER FOR $0A22
;============== REMAPPER FOR $0A23
;============== REMAPPER FOR $0A24
;============== REMAPPER FOR $0A25
org $00B06E
	dw $6A25
org $00B07B
	dw $6A25
;============== REMAPPER FOR $0A26
;============== REMAPPER FOR $0A27
;============== REMAPPER FOR $0A28
;============== REMAPPER FOR $0A29
;============== REMAPPER FOR $0A2A
;============== REMAPPER FOR $0A2B
;============== REMAPPER FOR $0A2C
;============== REMAPPER FOR $0A2D
;============== REMAPPER FOR $0A2E
;============== REMAPPER FOR $0A2F
;============== REMAPPER FOR $0A30
;============== REMAPPER FOR $0A31
;============== REMAPPER FOR $0A32
;============== REMAPPER FOR $0A33
;============== REMAPPER FOR $0A34
;============== REMAPPER FOR $0A35
;============== REMAPPER FOR $0A36
;============== REMAPPER FOR $0A37
;============== REMAPPER FOR $0A38
;============== REMAPPER FOR $0A39
;============== REMAPPER FOR $0A3A
;============== REMAPPER FOR $0A3B
;============== REMAPPER FOR $0A3C
;============== REMAPPER FOR $0A3D
;============== REMAPPER FOR $0A3E
;============== REMAPPER FOR $0A3F
;============== REMAPPER FOR $0A40
;============== REMAPPER FOR $0A41
;============== REMAPPER FOR $0A42
;============== REMAPPER FOR $0A43
;============== REMAPPER FOR $0A44
;============== REMAPPER FOR $0A45
;============== REMAPPER FOR $0A46
;============== REMAPPER FOR $0A47
;============== REMAPPER FOR $0A48
;============== REMAPPER FOR $0A49
;============== REMAPPER FOR $0A4A
;============== REMAPPER FOR $0A4B
;============== REMAPPER FOR $0A4C
;============== REMAPPER FOR $0A4D
;============== REMAPPER FOR $0A4E
;============== REMAPPER FOR $0A4F
;============== REMAPPER FOR $0A50
;============== REMAPPER FOR $0A51
;============== REMAPPER FOR $0A52
;============== REMAPPER FOR $0A53
;============== REMAPPER FOR $0A54
;============== REMAPPER FOR $0A55
;============== REMAPPER FOR $0A56
;============== REMAPPER FOR $0A57
;============== REMAPPER FOR $0A58
;============== REMAPPER FOR $0A59
;============== REMAPPER FOR $0A5A
;============== REMAPPER FOR $0A5B
;============== REMAPPER FOR $0A5C
;============== REMAPPER FOR $0A5D
;============== REMAPPER FOR $0A5E
;============== REMAPPER FOR $0A5F
;============== REMAPPER FOR $0A60
;============== REMAPPER FOR $0A61
;============== REMAPPER FOR $0A62
;============== REMAPPER FOR $0A63
;============== REMAPPER FOR $0A64
;============== REMAPPER FOR $0A65
;============== REMAPPER FOR $0A66
;============== REMAPPER FOR $0A67
;============== REMAPPER FOR $0A68
;============== REMAPPER FOR $0A69
;============== REMAPPER FOR $0A6A
;============== REMAPPER FOR $0A6B
;============== REMAPPER FOR $0A6C
;============== REMAPPER FOR $0A6D
;============== REMAPPER FOR $0A6E
;============== REMAPPER FOR $0A6F
;============== REMAPPER FOR $0A70
;============== REMAPPER FOR $0A71
;============== REMAPPER FOR $0A72
;============== REMAPPER FOR $0A73
;============== REMAPPER FOR $0A74
;============== REMAPPER FOR $0A75
;============== REMAPPER FOR $0A76
;============== REMAPPER FOR $0A77
;============== REMAPPER FOR $0A78
;============== REMAPPER FOR $0A79
;============== REMAPPER FOR $0A7A
;============== REMAPPER FOR $0A7B
;============== REMAPPER FOR $0A7C
;============== REMAPPER FOR $0A7D
;============== REMAPPER FOR $0A7E
;============== REMAPPER FOR $0A7F
;============== REMAPPER FOR $0A80
;============== REMAPPER FOR $0A81
;============== REMAPPER FOR $0A82
;============== REMAPPER FOR $0A83
;============== REMAPPER FOR $0A84
;============== REMAPPER FOR $0A85
;============== REMAPPER FOR $0A86
;============== REMAPPER FOR $0A87
;============== REMAPPER FOR $0A88
;============== REMAPPER FOR $0A89
;============== REMAPPER FOR $0A8A
;============== REMAPPER FOR $0A8B
;============== REMAPPER FOR $0A8C
;============== REMAPPER FOR $0A8D
;============== REMAPPER FOR $0A8E
;============== REMAPPER FOR $0A8F
;============== REMAPPER FOR $0A90
;============== REMAPPER FOR $0A91
;============== REMAPPER FOR $0A92
;============== REMAPPER FOR $0A93
;============== REMAPPER FOR $0A94
;============== REMAPPER FOR $0A95
;============== REMAPPER FOR $0A96
;============== REMAPPER FOR $0A97
;============== REMAPPER FOR $0A98
;============== REMAPPER FOR $0A99
;============== REMAPPER FOR $0A9A
;============== REMAPPER FOR $0A9B
;============== REMAPPER FOR $0A9C
;============== REMAPPER FOR $0A9D
;============== REMAPPER FOR $0A9E
;============== REMAPPER FOR $0A9F
;============== REMAPPER FOR $0AA0
;============== REMAPPER FOR $0AA1
;============== REMAPPER FOR $0AA2
;============== REMAPPER FOR $0AA3
;============== REMAPPER FOR $0AA4
;============== REMAPPER FOR $0AA5
;============== REMAPPER FOR $0AA6
;============== REMAPPER FOR $0AA7
;============== REMAPPER FOR $0AA8
;============== REMAPPER FOR $0AA9
;============== REMAPPER FOR $0AAA
;============== REMAPPER FOR $0AAB
;============== REMAPPER FOR $0AAC
;============== REMAPPER FOR $0AAD
;============== REMAPPER FOR $0AAE
;============== REMAPPER FOR $0AAF
;============== REMAPPER FOR $0AB0
;============== REMAPPER FOR $0AB1
;============== REMAPPER FOR $0AB2
;============== REMAPPER FOR $0AB3
;============== REMAPPER FOR $0AB4
;============== REMAPPER FOR $0AB5
;============== REMAPPER FOR $0AB6
;============== REMAPPER FOR $0AB7
;============== REMAPPER FOR $0AB8
;============== REMAPPER FOR $0AB9
;============== REMAPPER FOR $0ABA
;============== REMAPPER FOR $0ABB
;============== REMAPPER FOR $0ABC
;============== REMAPPER FOR $0ABD
;============== REMAPPER FOR $0ABE
;============== REMAPPER FOR $0ABF
;============== REMAPPER FOR $0AC0
;============== REMAPPER FOR $0AC1
;============== REMAPPER FOR $0AC2
;============== REMAPPER FOR $0AC3
;============== REMAPPER FOR $0AC4
;============== REMAPPER FOR $0AC5
;============== REMAPPER FOR $0AC6
;============== REMAPPER FOR $0AC7
;============== REMAPPER FOR $0AC8
;============== REMAPPER FOR $0AC9
;============== REMAPPER FOR $0ACA
;============== REMAPPER FOR $0ACB
;============== REMAPPER FOR $0ACC
;============== REMAPPER FOR $0ACD
;============== REMAPPER FOR $0ACE
;============== REMAPPER FOR $0ACF
;============== REMAPPER FOR $0AD0
;============== REMAPPER FOR $0AD1
;============== REMAPPER FOR $0AD2
;============== REMAPPER FOR $0AD3
;============== REMAPPER FOR $0AD4
;============== REMAPPER FOR $0AD5
;============== REMAPPER FOR $0AD6
;============== REMAPPER FOR $0AD7
;============== REMAPPER FOR $0AD8
;============== REMAPPER FOR $0AD9
;============== REMAPPER FOR $0ADA
;============== REMAPPER FOR $0ADB
;============== REMAPPER FOR $0ADC
;============== REMAPPER FOR $0ADD
;============== REMAPPER FOR $0ADE
;============== REMAPPER FOR $0ADF
;============== REMAPPER FOR $0AE0
;============== REMAPPER FOR $0AE1
;============== REMAPPER FOR $0AE2
;============== REMAPPER FOR $0AE3
;============== REMAPPER FOR $0AE4
;============== REMAPPER FOR $0AE5
;============== REMAPPER FOR $0AE6
;============== REMAPPER FOR $0AE7
;============== REMAPPER FOR $0AE8
;============== REMAPPER FOR $0AE9
;============== REMAPPER FOR $0AEA
;============== REMAPPER FOR $0AEB
;============== REMAPPER FOR $0AEC
;============== REMAPPER FOR $0AED
;============== REMAPPER FOR $0AEE
;============== REMAPPER FOR $0AEF
;============== REMAPPER FOR $0AF0
;============== REMAPPER FOR $0AF1
;============== REMAPPER FOR $0AF2
;============== REMAPPER FOR $0AF3
;============== REMAPPER FOR $0AF4
;============== REMAPPER FOR $0AF5
org $00B08E
	dw $6AF5
;============== REMAPPER FOR $0AF6
org $01CCC0
	dw $6AF6
org $03D9AF
	dw $6AF6
org $0480C6
	dw $6AF6
org $0480D6
	dw $6AF6
org $0480E9
	dw $6AF6
org $0480F5
	dw $6AF6
org $0480FC
	dw $6AF6
org $04817E
	dw $6AF6
org $048184
	dw $6AF6
org $04818B
	dw $6AF6
org $0CA07E
	dw $6AF6
org $0CA42C
	dw $6AF6
org $0CA8AA
	dw $6AF6
org $0CA8C4
	dw $6AF6
;============== REMAPPER FOR $0AF7
;============== REMAPPER FOR $0AF8
;============== REMAPPER FOR $0AF9
;============== REMAPPER FOR $0AFA
;============== REMAPPER FOR $0AFB
;============== REMAPPER FOR $0AFC
;============== REMAPPER FOR $0AFD
org $0CA561
	dw $6AFD
;============== REMAPPER FOR $0AFE
;============== REMAPPER FOR $0AFF
;============== REMAPPER FOR $0B00
;============== REMAPPER FOR $0B01
;============== REMAPPER FOR $0B02
;============== REMAPPER FOR $0B03
;============== REMAPPER FOR $0B04
;============== REMAPPER FOR $0B05
org $0CA079
	dw $6B05
org $0CA318
	dw $6B05
org $0CA31E
	dw $6B05
org $0CA32D
	dw $6B05
org $0CA427
	dw $6B05
org $0CA5E6
	dw $6B05
org $0CA5F0
	dw $6B05
org $0CA722
	dw $6B05
org $0CA731
	dw $6B05
org $0CA8A6
	dw $6B05
org $0CA8AD
	dw $6B05
org $0CA8BF
	dw $6B05
org $0CCD3C
	dw $6B05
org $0CCD78
	dw $6B05
org $0CCDC9
	dw $6B05
org $0CCE07
	dw $6B05
org $0CD0E8
	dw $6B05
org $0CD14D
	dw $6B05
org $0CD33B
	dw $6B05
org $0CD34A
	dw $6B05
org $0CD3C9
	dw $6B05
org $0CD3FC
	dw $6B05
org $0CD409
	dw $6B05
org $0CD507
	dw $6B05
org $0CD56E
	dw $6B05
;============== REMAPPER FOR $0B06
org $0CA337
	dw $6B06
org $0CA3FC
	dw $6B06
org $0CCD73
	dw $6B06
org $0CCDED
	dw $6B06
org $0CD327
	dw $6B06
;============== REMAPPER FOR $0B07
org $0CD302
	dw $6B07
;============== REMAPPER FOR $0B08
org $0CA53D
	dw $6B08
;============== REMAPPER FOR $0B09
org $0CA540
	dw $6B09
;============== REMAPPER FOR $0B0A
org $0CA545
	dw $6B0A
;============== REMAPPER FOR $0B0B
org $0CA548
	dw $6B0B
;============== REMAPPER FOR $0B0C
org $0CA55C
	dw $6B0C
;============== REMAPPER FOR $0B0D
;============== REMAPPER FOR $0B0E
;============== REMAPPER FOR $0B0F
;============== REMAPPER FOR $0B10
;============== REMAPPER FOR $0B11
;============== REMAPPER FOR $0B12
;============== REMAPPER FOR $0B13
;============== REMAPPER FOR $0B14
org $0CA252
	dw $6B14
org $0CA2F2
	dw $6B14
org $0CA5FB
	dw $6B14
org $0CA65E
	dw $6B14
org $0CA664
	dw $6B14
org $0CCAEE
	dw $6B14
org $0CCB3E
	dw $6B14
org $0CCD99
	dw $6B14
org $0CD152
	dw $6B14
org $0CD3CF
	dw $6B14
org $0CD569
	dw $6B14
;============== REMAPPER FOR $0B15
;============== REMAPPER FOR $0B16
org $0CA5BF
	dw $6B16
org $0CD307
	dw $6B16
;============== REMAPPER FOR $0B17
;============== REMAPPER FOR $0B18
;============== REMAPPER FOR $0B19
;============== REMAPPER FOR $0B1A
;============== REMAPPER FOR $0B1B
;============== REMAPPER FOR $0B1C
;============== REMAPPER FOR $0B1D
;============== REMAPPER FOR $0B1E
;============== REMAPPER FOR $0B1F
;============== REMAPPER FOR $0B20
;============== REMAPPER FOR $0B21
;============== REMAPPER FOR $0B22
;============== REMAPPER FOR $0B23
org $0CA057
	dw $6B23
org $0CA72A
	dw $6B23
org $0CA72D
	dw $6B23
org $0CA8BA
	dw $6B23
org $0CD343
	dw $6B23
org $0CD346
	dw $6B23
org $0CD374
	dw $6B23
;============== REMAPPER FOR $0B24
org $0CD37A
	dw $6B24
;============== REMAPPER FOR $0B25
;============== REMAPPER FOR $0B26
;============== REMAPPER FOR $0B27
;============== REMAPPER FOR $0B28
;============== REMAPPER FOR $0B29
;============== REMAPPER FOR $0B2A
;============== REMAPPER FOR $0B2B
;============== REMAPPER FOR $0B2C
;============== REMAPPER FOR $0B2D
;============== REMAPPER FOR $0B2E
;============== REMAPPER FOR $0B2F
;============== REMAPPER FOR $0B30
;============== REMAPPER FOR $0B31
;============== REMAPPER FOR $0B32
org $0CA05A
	dw $6B32
org $0CA3E1
	dw $6B32
org $0CD377
	dw $6B32
;============== REMAPPER FOR $0B33
org $0CA3E4
	dw $6B33
org $0CD37D
	dw $6B33
;============== REMAPPER FOR $0B34
org $0CD380
	dw $6B34
org $0CD383
	dw $6B34
;============== REMAPPER FOR $0B35
;============== REMAPPER FOR $0B36
org $048115
	dw $6B36
org $048119
	dw $6B36
;============== REMAPPER FOR $0B37
;============== REMAPPER FOR $0B38
;============== REMAPPER FOR $0B39
org $0CA3E7
	dw $6B39
;============== REMAPPER FOR $0B3A
;============== REMAPPER FOR $0B3B
;============== REMAPPER FOR $0B3C
;============== REMAPPER FOR $0B3D
;============== REMAPPER FOR $0B3E
;============== REMAPPER FOR $0B3F
;============== REMAPPER FOR $0B40
;============== REMAPPER FOR $0B41
org $0CA067
	dw $6B41
org $0CA324
	dw $6B41
org $0CA332
	dw $6B41
org $0CA418
	dw $6B41
org $0CA623
	dw $6B41
org $0CA630
	dw $6B41
org $0CA742
	dw $6B41
org $0CA745
	dw $6B41
org $0CA8B3
	dw $6B41
org $0CA8C9
	dw $6B41
org $0CA8F1
	dw $6B41
org $0CCD32
	dw $6B41
org $0CCD4C
	dw $6B41
org $0CCD7D
	dw $6B41
org $0CCD86
	dw $6B41
org $0CCDBE
	dw $6B41
org $0CCDCF
	dw $6B41
org $0CCDE0
	dw $6B41
org $0CCDF0
	dw $6B41
org $0CCE0C
	dw $6B41
org $0CCE15
	dw $6B41
org $0CCE22
	dw $6B41
org $0CCE39
	dw $6B41
org $0CD0DE
	dw $6B41
org $0CD0EE
	dw $6B41
org $0CD138
	dw $6B41
org $0CD15B
	dw $6B41
org $0CD35B
	dw $6B41
org $0CD35E
	dw $6B41
org $0CD3DF
	dw $6B41
org $0CD412
	dw $6B41
org $0CD439
	dw $6B41
org $0CD50D
	dw $6B41
;============== REMAPPER FOR $0B42
org $0CA368
	dw $6B42
org $0CA384
	dw $6B42
org $0CA3A6
	dw $6B42
org $0CA401
	dw $6B42
org $0CA44C
	dw $6B42
org $0CA6DC
	dw $6B42
org $0CCE77
	dw $6B42
org $0CD31D
	dw $6B42
;============== REMAPPER FOR $0B43
org $0CCE25
	dw $6B43
org $0CCEB3
	dw $6B43
org $0CCF00
	dw $6B43
org $0CCF59
	dw $6B43
org $0CD2C5
	dw $6B43
org $0CD2F2
	dw $6B43
org $0CD4FE
	dw $6B43
org $0CD530
	dw $6B43
org $0CD53C
	dw $6B43
;============== REMAPPER FOR $0B44
org $0CA567
	dw $6B44
org $0CA609
	dw $6B44
org $0CD55D
	dw $6B44
org $0CD5A2
	dw $6B44
;============== REMAPPER FOR $0B45
org $0CA56A
	dw $6B45
;============== REMAPPER FOR $0B46
org $0CA570
	dw $6B46
;============== REMAPPER FOR $0B47
org $0CA573
	dw $6B47
;============== REMAPPER FOR $0B48
org $0CA564
	dw $6B48
;============== REMAPPER FOR $0B49
;============== REMAPPER FOR $0B4A
;============== REMAPPER FOR $0B4B
;============== REMAPPER FOR $0B4C
;============== REMAPPER FOR $0B4D
;============== REMAPPER FOR $0B4E
;============== REMAPPER FOR $0B4F
;============== REMAPPER FOR $0B50
org $0CA070
	dw $6B50
org $0CA201
	dw $6B50
org $0CA230
	dw $6B50
org $0CA258
	dw $6B50
org $0CA26E
	dw $6B50
org $0CA291
	dw $6B50
org $0CA3D9
	dw $6B50
org $0CA421
	dw $6B50
org $0CA62A
	dw $6B50
org $0CA66A
	dw $6B50
org $0CA6EC
	dw $6B50
org $0CA8EC
	dw $6B50
org $0CCB24
	dw $6B50
org $0CCB88
	dw $6B50
org $0CCBCA
	dw $6B50
org $0CD142
	dw $6B50
org $0CD165
	dw $6B50
org $0CD322
	dw $6B50
org $0CD3D7
	dw $6B50
org $0CD42F
	dw $6B50
org $0CD577
	dw $6B50
;============== REMAPPER FOR $0B51
org $0CCA62
	dw $6B51
org $0CCAD9
	dw $6B51
org $0CCAE3
	dw $6B51
org $0CCB03
	dw $6B51
;============== REMAPPER FOR $0B52
org $0CA5BC
	dw $6B52
org $0CCF53
	dw $6B52
org $0CD2FA
	dw $6B52
;============== REMAPPER FOR $0B53
org $0CA585
	dw $6B53
org $0CD560
	dw $6B53
org $0CD596
	dw $6B53
org $0CD5AE
	dw $6B53
;============== REMAPPER FOR $0B54
org $0CA58E
	dw $6B54
;============== REMAPPER FOR $0B55
org $0CA588
	dw $6B55
;============== REMAPPER FOR $0B56
org $0CA591
	dw $6B56
;============== REMAPPER FOR $0B57
org $0CA2C4
	dw $6B57
org $0CA582
	dw $6B57
;============== REMAPPER FOR $0B58
;============== REMAPPER FOR $0B59
;============== REMAPPER FOR $0B5A
;============== REMAPPER FOR $0B5B
org $0CA2E9
	dw $6B5B
;============== REMAPPER FOR $0B5C
;============== REMAPPER FOR $0B5D
;============== REMAPPER FOR $0B5E
;============== REMAPPER FOR $0B5F
org $0CA06A
	dw $6B5F
org $0CA41B
	dw $6B5F
org $0CA61E
	dw $6B5F
org $0CA749
	dw $6B5F
org $0CA74C
	dw $6B5F
org $0CCD37
	dw $6B5F
org $0CCD47
	dw $6B5F
org $0CCDC3
	dw $6B5F
org $0CCDDB
	dw $6B5F
org $0CD0E3
	dw $6B5F
org $0CD103
	dw $6B5F
org $0CD13D
	dw $6B5F
org $0CD160
	dw $6B5F
org $0CD362
	dw $6B5F
org $0CD365
	dw $6B5F
;============== REMAPPER FOR $0B60
;============== REMAPPER FOR $0B61
org $0CD2F5
	dw $6B61
;============== REMAPPER FOR $0B62
org $0CA576
	dw $6B62
;============== REMAPPER FOR $0B63
org $0CA579
	dw $6B63
;============== REMAPPER FOR $0B64
org $0CA57C
	dw $6B64
;============== REMAPPER FOR $0B65
org $0CA57F
	dw $6B65
;============== REMAPPER FOR $0B66
;============== REMAPPER FOR $0B67
;============== REMAPPER FOR $0B68
;============== REMAPPER FOR $0B69
;============== REMAPPER FOR $0B6A
;============== REMAPPER FOR $0B6B
;============== REMAPPER FOR $0B6C
;============== REMAPPER FOR $0B6D
;============== REMAPPER FOR $0B6E
org $0CA073
	dw $6B6E
org $0CA238
	dw $6B6E
org $0CA25D
	dw $6B6E
org $0CA276
	dw $6B6E
org $0CA299
	dw $6B6E
org $0CA3DE
	dw $6B6E
org $0CA42F
	dw $6B6E
org $0CA619
	dw $6B6E
org $0CA6F4
	dw $6B6E
org $0CA8E7
	dw $6B6E
org $0CD147
	dw $6B6E
org $0CD16A
	dw $6B6E
;============== REMAPPER FOR $0B6F
;============== REMAPPER FOR $0B70
org $0CA5B7
	dw $6B70
org $0CD2FD
	dw $6B70
;============== REMAPPER FOR $0B71
org $0CA594
	dw $6B71
;============== REMAPPER FOR $0B72
org $0CA597
	dw $6B72
;============== REMAPPER FOR $0B73
org $0CA59A
	dw $6B73
;============== REMAPPER FOR $0B74
org $0CA59D
	dw $6B74
;============== REMAPPER FOR $0B75
org $0CA2C9
	dw $6B75
;============== REMAPPER FOR $0B76
;============== REMAPPER FOR $0B77
;============== REMAPPER FOR $0B78
;============== REMAPPER FOR $0B79
;============== REMAPPER FOR $0B7A
;============== REMAPPER FOR $0B7B
;============== REMAPPER FOR $0B7C
;============== REMAPPER FOR $0B7D
org $0CD3C3
	dw $6B7D
org $0CD406
	dw $6B7D
;============== REMAPPER FOR $0B7E
;============== REMAPPER FOR $0B7F
;============== REMAPPER FOR $0B80
;============== REMAPPER FOR $0B81
;============== REMAPPER FOR $0B82
;============== REMAPPER FOR $0B83
;============== REMAPPER FOR $0B84
;============== REMAPPER FOR $0B85
;============== REMAPPER FOR $0B86
;============== REMAPPER FOR $0B87
;============== REMAPPER FOR $0B88
;============== REMAPPER FOR $0B89
;============== REMAPPER FOR $0B8A
;============== REMAPPER FOR $0B8B
;============== REMAPPER FOR $0B8C
org $0CD3B7
	dw $6B8C
org $0CD3BE
	dw $6B8C
org $0CD3F7
	dw $6B8C
org $0CD419
	dw $6B8C
org $0CD42A
	dw $6B8C
;============== REMAPPER FOR $0B8D
;============== REMAPPER FOR $0B8E
;============== REMAPPER FOR $0B8F
;============== REMAPPER FOR $0B90
;============== REMAPPER FOR $0B91
;============== REMAPPER FOR $0B92
;============== REMAPPER FOR $0B93
;============== REMAPPER FOR $0B94
;============== REMAPPER FOR $0B95
;============== REMAPPER FOR $0B96
;============== REMAPPER FOR $0B97
;============== REMAPPER FOR $0B98
;============== REMAPPER FOR $0B99
;============== REMAPPER FOR $0B9A
;============== REMAPPER FOR $0B9B
;============== REMAPPER FOR $0B9C
;============== REMAPPER FOR $0B9D
;============== REMAPPER FOR $0B9E
;============== REMAPPER FOR $0B9F
;============== REMAPPER FOR $0BA0
;============== REMAPPER FOR $0BA1
;============== REMAPPER FOR $0BA2
;============== REMAPPER FOR $0BA3
;============== REMAPPER FOR $0BA4
;============== REMAPPER FOR $0BA5
;============== REMAPPER FOR $0BA6
;============== REMAPPER FOR $0BA7
;============== REMAPPER FOR $0BA8
;============== REMAPPER FOR $0BA9
;============== REMAPPER FOR $0BAA
;============== REMAPPER FOR $0BAB
;============== REMAPPER FOR $0BAC
;============== REMAPPER FOR $0BAD
;============== REMAPPER FOR $0BAE
;============== REMAPPER FOR $0BAF
;============== REMAPPER FOR $0BB0
;============== REMAPPER FOR $0BB1
;============== REMAPPER FOR $0BB2
;============== REMAPPER FOR $0BB3
;============== REMAPPER FOR $0BB4
;============== REMAPPER FOR $0BB5
;============== REMAPPER FOR $0BB6
;============== REMAPPER FOR $0BB7
;============== REMAPPER FOR $0BB8
;============== REMAPPER FOR $0BB9
;============== REMAPPER FOR $0BBA
;============== REMAPPER FOR $0BBB
;============== REMAPPER FOR $0BBC
;============== REMAPPER FOR $0BBD
;============== REMAPPER FOR $0BBE
;============== REMAPPER FOR $0BBF
;============== REMAPPER FOR $0BC0
;============== REMAPPER FOR $0BC1
;============== REMAPPER FOR $0BC2
;============== REMAPPER FOR $0BC3
;============== REMAPPER FOR $0BC4
;============== REMAPPER FOR $0BC5
;============== REMAPPER FOR $0BC6
;============== REMAPPER FOR $0BC7
;============== REMAPPER FOR $0BC8
;============== REMAPPER FOR $0BC9
;============== REMAPPER FOR $0BCA
;============== REMAPPER FOR $0BCB
;============== REMAPPER FOR $0BCC
;============== REMAPPER FOR $0BCD
;============== REMAPPER FOR $0BCE
;============== REMAPPER FOR $0BCF
;============== REMAPPER FOR $0BD0
;============== REMAPPER FOR $0BD1
;============== REMAPPER FOR $0BD2
;============== REMAPPER FOR $0BD3
;============== REMAPPER FOR $0BD4
;============== REMAPPER FOR $0BD5
;============== REMAPPER FOR $0BD6
;============== REMAPPER FOR $0BD7
;============== REMAPPER FOR $0BD8
;============== REMAPPER FOR $0BD9
;============== REMAPPER FOR $0BDA
;============== REMAPPER FOR $0BDB
;============== REMAPPER FOR $0BDC
;============== REMAPPER FOR $0BDD
;============== REMAPPER FOR $0BDE
;============== REMAPPER FOR $0BDF
;============== REMAPPER FOR $0BE0
;============== REMAPPER FOR $0BE1
;============== REMAPPER FOR $0BE2
;============== REMAPPER FOR $0BE3
;============== REMAPPER FOR $0BE4
;============== REMAPPER FOR $0BE5
;============== REMAPPER FOR $0BE6
;============== REMAPPER FOR $0BE7
;============== REMAPPER FOR $0BE8
;============== REMAPPER FOR $0BE9
;============== REMAPPER FOR $0BEA
;============== REMAPPER FOR $0BEB
;============== REMAPPER FOR $0BEC
;============== REMAPPER FOR $0BED
;============== REMAPPER FOR $0BEE
;============== REMAPPER FOR $0BEF
;============== REMAPPER FOR $0BF0
;============== REMAPPER FOR $0BF1
;============== REMAPPER FOR $0BF2
;============== REMAPPER FOR $0BF3
;============== REMAPPER FOR $0BF4
;============== REMAPPER FOR $0BF5
;============== REMAPPER FOR $0BF6
org $00A88C
	dw $6BF6
org $00A8A0
	dw $6BF6
;============== REMAPPER FOR $0BF7
;============== REMAPPER FOR $0BF8
;============== REMAPPER FOR $0BF9
;============== REMAPPER FOR $0BFA
;============== REMAPPER FOR $0BFB
;============== REMAPPER FOR $0BFC
;============== REMAPPER FOR $0BFD
;============== REMAPPER FOR $0BFE
;============== REMAPPER FOR $0BFF
;============== REMAPPER FOR $0C00
;============== REMAPPER FOR $0C01
;============== REMAPPER FOR $0C02
;============== REMAPPER FOR $0C03
;============== REMAPPER FOR $0C04
;============== REMAPPER FOR $0C05
;============== REMAPPER FOR $0C06
;============== REMAPPER FOR $0C07
;============== REMAPPER FOR $0C08
;============== REMAPPER FOR $0C09
;============== REMAPPER FOR $0C0A
;============== REMAPPER FOR $0C0B
;============== REMAPPER FOR $0C0C
;============== REMAPPER FOR $0C0D
;============== REMAPPER FOR $0C0E
;============== REMAPPER FOR $0C0F
;============== REMAPPER FOR $0C10
;============== REMAPPER FOR $0C11
;============== REMAPPER FOR $0C12
;============== REMAPPER FOR $0C13
;============== REMAPPER FOR $0C14
;============== REMAPPER FOR $0C15
;============== REMAPPER FOR $0C16
;============== REMAPPER FOR $0C17
;============== REMAPPER FOR $0C18
;============== REMAPPER FOR $0C19
;============== REMAPPER FOR $0C1A
;============== REMAPPER FOR $0C1B
;============== REMAPPER FOR $0C1C
;============== REMAPPER FOR $0C1D
;============== REMAPPER FOR $0C1E
;============== REMAPPER FOR $0C1F
;============== REMAPPER FOR $0C20
;============== REMAPPER FOR $0C21
;============== REMAPPER FOR $0C22
;============== REMAPPER FOR $0C23
;============== REMAPPER FOR $0C24
;============== REMAPPER FOR $0C25
;============== REMAPPER FOR $0C26
;============== REMAPPER FOR $0C27
;============== REMAPPER FOR $0C28
;============== REMAPPER FOR $0C29
;============== REMAPPER FOR $0C2A
;============== REMAPPER FOR $0C2B
;============== REMAPPER FOR $0C2C
;============== REMAPPER FOR $0C2D
;============== REMAPPER FOR $0C2E
;============== REMAPPER FOR $0C2F
;============== REMAPPER FOR $0C30
;============== REMAPPER FOR $0C31
;============== REMAPPER FOR $0C32
;============== REMAPPER FOR $0C33
;============== REMAPPER FOR $0C34
;============== REMAPPER FOR $0C35
;============== REMAPPER FOR $0C36
;============== REMAPPER FOR $0C37
;============== REMAPPER FOR $0C38
;============== REMAPPER FOR $0C39
;============== REMAPPER FOR $0C3A
;============== REMAPPER FOR $0C3B
;============== REMAPPER FOR $0C3C
;============== REMAPPER FOR $0C3D
;============== REMAPPER FOR $0C3E
;============== REMAPPER FOR $0C3F
;============== REMAPPER FOR $0C40
;============== REMAPPER FOR $0C41
;============== REMAPPER FOR $0C42
;============== REMAPPER FOR $0C43
;============== REMAPPER FOR $0C44
;============== REMAPPER FOR $0C45
;============== REMAPPER FOR $0C46
;============== REMAPPER FOR $0C47
;============== REMAPPER FOR $0C48
;============== REMAPPER FOR $0C49
;============== REMAPPER FOR $0C4A
;============== REMAPPER FOR $0C4B
;============== REMAPPER FOR $0C4C
;============== REMAPPER FOR $0C4D
;============== REMAPPER FOR $0C4E
;============== REMAPPER FOR $0C4F
;============== REMAPPER FOR $0C50
;============== REMAPPER FOR $0C51
;============== REMAPPER FOR $0C52
;============== REMAPPER FOR $0C53
;============== REMAPPER FOR $0C54
;============== REMAPPER FOR $0C55
;============== REMAPPER FOR $0C56
;============== REMAPPER FOR $0C57
;============== REMAPPER FOR $0C58
;============== REMAPPER FOR $0C59
;============== REMAPPER FOR $0C5A
;============== REMAPPER FOR $0C5B
;============== REMAPPER FOR $0C5C
;============== REMAPPER FOR $0C5D
;============== REMAPPER FOR $0C5E
;============== REMAPPER FOR $0C5F
;============== REMAPPER FOR $0C60
;============== REMAPPER FOR $0C61
;============== REMAPPER FOR $0C62
;============== REMAPPER FOR $0C63
;============== REMAPPER FOR $0C64
;============== REMAPPER FOR $0C65
;============== REMAPPER FOR $0C66
;============== REMAPPER FOR $0C67
;============== REMAPPER FOR $0C68
;============== REMAPPER FOR $0C69
;============== REMAPPER FOR $0C6A
;============== REMAPPER FOR $0C6B
;============== REMAPPER FOR $0C6C
;============== REMAPPER FOR $0C6D
;============== REMAPPER FOR $0C6E
;============== REMAPPER FOR $0C6F
;============== REMAPPER FOR $0C70
;============== REMAPPER FOR $0C71
;============== REMAPPER FOR $0C72
;============== REMAPPER FOR $0C73
;============== REMAPPER FOR $0C74
;============== REMAPPER FOR $0C75
;============== REMAPPER FOR $0C76
;============== REMAPPER FOR $0C77
;============== REMAPPER FOR $0C78
;============== REMAPPER FOR $0C79
;============== REMAPPER FOR $0C7A
;============== REMAPPER FOR $0C7B
;============== REMAPPER FOR $0C7C
;============== REMAPPER FOR $0C7D
;============== REMAPPER FOR $0C7E
;============== REMAPPER FOR $0C7F
;============== REMAPPER FOR $0C80
;============== REMAPPER FOR $0C81
;============== REMAPPER FOR $0C82
;============== REMAPPER FOR $0C83
;============== REMAPPER FOR $0C84
;============== REMAPPER FOR $0C85
;============== REMAPPER FOR $0C86
;============== REMAPPER FOR $0C87
;============== REMAPPER FOR $0C88
;============== REMAPPER FOR $0C89
;============== REMAPPER FOR $0C8A
;============== REMAPPER FOR $0C8B
;============== REMAPPER FOR $0C8C
;============== REMAPPER FOR $0C8D
;============== REMAPPER FOR $0C8E
;============== REMAPPER FOR $0C8F
;============== REMAPPER FOR $0C90
;============== REMAPPER FOR $0C91
;============== REMAPPER FOR $0C92
;============== REMAPPER FOR $0C93
;============== REMAPPER FOR $0C94
;============== REMAPPER FOR $0C95
;============== REMAPPER FOR $0C96
;============== REMAPPER FOR $0C97
;============== REMAPPER FOR $0C98
;============== REMAPPER FOR $0C99
;============== REMAPPER FOR $0C9A
;============== REMAPPER FOR $0C9B
;============== REMAPPER FOR $0C9C
;============== REMAPPER FOR $0C9D
;============== REMAPPER FOR $0C9E
;============== REMAPPER FOR $0C9F
;============== REMAPPER FOR $0CA0
;============== REMAPPER FOR $0CA1
;============== REMAPPER FOR $0CA2
;============== REMAPPER FOR $0CA3
;============== REMAPPER FOR $0CA4
;============== REMAPPER FOR $0CA5
;============== REMAPPER FOR $0CA6
;============== REMAPPER FOR $0CA7
;============== REMAPPER FOR $0CA8
;============== REMAPPER FOR $0CA9
;============== REMAPPER FOR $0CAA
;============== REMAPPER FOR $0CAB
;============== REMAPPER FOR $0CAC
;============== REMAPPER FOR $0CAD
;============== REMAPPER FOR $0CAE
;============== REMAPPER FOR $0CAF
;============== REMAPPER FOR $0CB0
;============== REMAPPER FOR $0CB1
;============== REMAPPER FOR $0CB2
;============== REMAPPER FOR $0CB3
;============== REMAPPER FOR $0CB4
;============== REMAPPER FOR $0CB5
;============== REMAPPER FOR $0CB6
;============== REMAPPER FOR $0CB7
;============== REMAPPER FOR $0CB8
;============== REMAPPER FOR $0CB9
;============== REMAPPER FOR $0CBA
;============== REMAPPER FOR $0CBB
;============== REMAPPER FOR $0CBC
;============== REMAPPER FOR $0CBD
;============== REMAPPER FOR $0CBE
;============== REMAPPER FOR $0CBF
;============== REMAPPER FOR $0CC0
;============== REMAPPER FOR $0CC1
;============== REMAPPER FOR $0CC2
;============== REMAPPER FOR $0CC3
;============== REMAPPER FOR $0CC4
;============== REMAPPER FOR $0CC5
;============== REMAPPER FOR $0CC6
;============== REMAPPER FOR $0CC7
;============== REMAPPER FOR $0CC8
;============== REMAPPER FOR $0CC9
;============== REMAPPER FOR $0CCA
;============== REMAPPER FOR $0CCB
;============== REMAPPER FOR $0CCC
;============== REMAPPER FOR $0CCD
;============== REMAPPER FOR $0CCE
;============== REMAPPER FOR $0CCF
;============== REMAPPER FOR $0CD0
;============== REMAPPER FOR $0CD1
;============== REMAPPER FOR $0CD2
;============== REMAPPER FOR $0CD3
;============== REMAPPER FOR $0CD4
;============== REMAPPER FOR $0CD5
;============== REMAPPER FOR $0CD6
;============== REMAPPER FOR $0CD7
;============== REMAPPER FOR $0CD8
;============== REMAPPER FOR $0CD9
;============== REMAPPER FOR $0CDA
;============== REMAPPER FOR $0CDB
;============== REMAPPER FOR $0CDC
;============== REMAPPER FOR $0CDD
;============== REMAPPER FOR $0CDE
;============== REMAPPER FOR $0CDF
;============== REMAPPER FOR $0CE0
;============== REMAPPER FOR $0CE1
;============== REMAPPER FOR $0CE2
;============== REMAPPER FOR $0CE3
;============== REMAPPER FOR $0CE4
;============== REMAPPER FOR $0CE5
;============== REMAPPER FOR $0CE6
;============== REMAPPER FOR $0CE7
;============== REMAPPER FOR $0CE8
;============== REMAPPER FOR $0CE9
;============== REMAPPER FOR $0CEA
;============== REMAPPER FOR $0CEB
;============== REMAPPER FOR $0CEC
;============== REMAPPER FOR $0CED
;============== REMAPPER FOR $0CEE
;============== REMAPPER FOR $0CEF
;============== REMAPPER FOR $0CF0
;============== REMAPPER FOR $0CF1
;============== REMAPPER FOR $0CF2
;============== REMAPPER FOR $0CF3
;============== REMAPPER FOR $0CF4
;============== REMAPPER FOR $0CF5
;============== REMAPPER FOR $0CF6
;============== REMAPPER FOR $0CF7
;============== REMAPPER FOR $0CF8
;============== REMAPPER FOR $0CF9
;============== REMAPPER FOR $0CFA
;============== REMAPPER FOR $0CFB
;============== REMAPPER FOR $0CFC
;============== REMAPPER FOR $0CFD
;============== REMAPPER FOR $0CFE
;============== REMAPPER FOR $0CFF
;============== REMAPPER FOR $0D00
;============== REMAPPER FOR $0D01
;============== REMAPPER FOR $0D02
;============== REMAPPER FOR $0D03
;============== REMAPPER FOR $0D04
;============== REMAPPER FOR $0D05
;============== REMAPPER FOR $0D06
;============== REMAPPER FOR $0D07
;============== REMAPPER FOR $0D08
;============== REMAPPER FOR $0D09
;============== REMAPPER FOR $0D0A
;============== REMAPPER FOR $0D0B
;============== REMAPPER FOR $0D0C
;============== REMAPPER FOR $0D0D
;============== REMAPPER FOR $0D0E
;============== REMAPPER FOR $0D0F
;============== REMAPPER FOR $0D10
;============== REMAPPER FOR $0D11
;============== REMAPPER FOR $0D12
;============== REMAPPER FOR $0D13
;============== REMAPPER FOR $0D14
;============== REMAPPER FOR $0D15
;============== REMAPPER FOR $0D16
;============== REMAPPER FOR $0D17
;============== REMAPPER FOR $0D18
;============== REMAPPER FOR $0D19
;============== REMAPPER FOR $0D1A
;============== REMAPPER FOR $0D1B
;============== REMAPPER FOR $0D1C
;============== REMAPPER FOR $0D1D
;============== REMAPPER FOR $0D1E
;============== REMAPPER FOR $0D1F
;============== REMAPPER FOR $0D20
;============== REMAPPER FOR $0D21
;============== REMAPPER FOR $0D22
;============== REMAPPER FOR $0D23
;============== REMAPPER FOR $0D24
;============== REMAPPER FOR $0D25
;============== REMAPPER FOR $0D26
;============== REMAPPER FOR $0D27
;============== REMAPPER FOR $0D28
;============== REMAPPER FOR $0D29
;============== REMAPPER FOR $0D2A
;============== REMAPPER FOR $0D2B
;============== REMAPPER FOR $0D2C
;============== REMAPPER FOR $0D2D
;============== REMAPPER FOR $0D2E
;============== REMAPPER FOR $0D2F
;============== REMAPPER FOR $0D30
;============== REMAPPER FOR $0D31
;============== REMAPPER FOR $0D32
;============== REMAPPER FOR $0D33
;============== REMAPPER FOR $0D34
;============== REMAPPER FOR $0D35
;============== REMAPPER FOR $0D36
;============== REMAPPER FOR $0D37
;============== REMAPPER FOR $0D38
;============== REMAPPER FOR $0D39
;============== REMAPPER FOR $0D3A
;============== REMAPPER FOR $0D3B
;============== REMAPPER FOR $0D3C
;============== REMAPPER FOR $0D3D
;============== REMAPPER FOR $0D3E
;============== REMAPPER FOR $0D3F
;============== REMAPPER FOR $0D40
;============== REMAPPER FOR $0D41
;============== REMAPPER FOR $0D42
;============== REMAPPER FOR $0D43
;============== REMAPPER FOR $0D44
;============== REMAPPER FOR $0D45
;============== REMAPPER FOR $0D46
;============== REMAPPER FOR $0D47
;============== REMAPPER FOR $0D48
;============== REMAPPER FOR $0D49
;============== REMAPPER FOR $0D4A
;============== REMAPPER FOR $0D4B
;============== REMAPPER FOR $0D4C
;============== REMAPPER FOR $0D4D
;============== REMAPPER FOR $0D4E
;============== REMAPPER FOR $0D4F
;============== REMAPPER FOR $0D50
;============== REMAPPER FOR $0D51
;============== REMAPPER FOR $0D52
;============== REMAPPER FOR $0D53
;============== REMAPPER FOR $0D54
;============== REMAPPER FOR $0D55
;============== REMAPPER FOR $0D56
;============== REMAPPER FOR $0D57
;============== REMAPPER FOR $0D58
;============== REMAPPER FOR $0D59
;============== REMAPPER FOR $0D5A
;============== REMAPPER FOR $0D5B
;============== REMAPPER FOR $0D5C
;============== REMAPPER FOR $0D5D
;============== REMAPPER FOR $0D5E
;============== REMAPPER FOR $0D5F
;============== REMAPPER FOR $0D60
;============== REMAPPER FOR $0D61
;============== REMAPPER FOR $0D62
;============== REMAPPER FOR $0D63
;============== REMAPPER FOR $0D64
;============== REMAPPER FOR $0D65
;============== REMAPPER FOR $0D66
;============== REMAPPER FOR $0D67
;============== REMAPPER FOR $0D68
;============== REMAPPER FOR $0D69
;============== REMAPPER FOR $0D6A
;============== REMAPPER FOR $0D6B
;============== REMAPPER FOR $0D6C
;============== REMAPPER FOR $0D6D
;============== REMAPPER FOR $0D6E
;============== REMAPPER FOR $0D6F
;============== REMAPPER FOR $0D70
;============== REMAPPER FOR $0D71
;============== REMAPPER FOR $0D72
;============== REMAPPER FOR $0D73
;============== REMAPPER FOR $0D74
;============== REMAPPER FOR $0D75
;============== REMAPPER FOR $0D76
org $00A3E0
	dw $6D76
org $00A3F1
	dw $6D76
org $00A406
	dw $6D76
org $05BB9A
	dw $6D76
;============== REMAPPER FOR $0D77
;============== REMAPPER FOR $0D78
org $00A3C4
	dw $6D78
;============== REMAPPER FOR $0D79
;============== REMAPPER FOR $0D7A
org $00A3AD
	dw $6D7A
;============== REMAPPER FOR $0D7B
;============== REMAPPER FOR $0D7C
org $00A3D3
	dw $6D7C
org $05BB63
	dw $6D7C
;============== REMAPPER FOR $0D7D
;============== REMAPPER FOR $0D7E
org $00A3BC
	dw $6D7E
org $05BB5D
	dw $6D7E
;============== REMAPPER FOR $0D7F
;============== REMAPPER FOR $0D80
org $00A3A5
	dw $6D80
org $05BB57
	dw $6D80
;============== REMAPPER FOR $0D81
;============== REMAPPER FOR $0D82
org $00A315
	dw $6D82
org $00B04F
	dw $6D82
org $00E322
	dw $6D82
;============== REMAPPER FOR $0D83
;============== REMAPPER FOR $0D84
org $00962D
	dw $6D84
org $00A305
	dw $6D84
org $00A369
	dw $6D84
org $00A389
	dw $6D84
org $00F69C
	dw $6D84
org $0485D6
	dw $6D84
;============== REMAPPER FOR $0D85
org $00A356
	dw $6D85
org $00F64D
	dw $6D85
;============== REMAPPER FOR $0D86
;============== REMAPPER FOR $0D87
org $00F66B
	dw $6D87
;============== REMAPPER FOR $0D88
;============== REMAPPER FOR $0D89
org $00F680
	dw $6D89
;============== REMAPPER FOR $0D8A
;============== REMAPPER FOR $0D8B
org $01E1AC
	dw $6D8B
org $01EEB8
	dw $6D8B
org $02EA42
	dw $6D8B
;============== REMAPPER FOR $0D8C
;============== REMAPPER FOR $0D8D
org $01EECD
	dw $6D8D
;============== REMAPPER FOR $0D8E
;============== REMAPPER FOR $0D8F
org $00A376
	dw $6D8F
org $00F654
	dw $6D8F
;============== REMAPPER FOR $0D90
;============== REMAPPER FOR $0D91
org $00F672
	dw $6D91
;============== REMAPPER FOR $0D92
;============== REMAPPER FOR $0D93
org $00F687
	dw $6D93
;============== REMAPPER FOR $0D94
;============== REMAPPER FOR $0D95
org $01E1B3
	dw $6D95
org $01EEBF
	dw $6D95
org $02EA49
	dw $6D95
;============== REMAPPER FOR $0D96
;============== REMAPPER FOR $0D97
org $01EED4
	dw $6D97
;============== REMAPPER FOR $0D98
;============== REMAPPER FOR $0D99
org $00A33A
	dw $6D99
org $00F695
	dw $6D99
;============== REMAPPER FOR $0D9A
;============== REMAPPER FOR $0D9B
org $0081C7
	dw $6D9B
org $0081DF
	dw $6D9B
org $0081ED
	dw $6D9B
org $008276
	dw $6D9B
org $0082DB
	dw $6D9B
org $0082E3
	dw $6D9B
org $008346
	dw $6D9B
org $00835F
	dw $6D9B
org $008388
	dw $6D9B
org $0083BB
	dw $6D9B
org $008E22
	dw $6D9B
org $00907C
	dw $6D9B
org $009083
	dw $6D9B
org $009287
	dw $6D9B
org $0093ED
	dw $6D9B
org $009730
	dw $6D9B
org $0097DD
	dw $6D9B
org $009881
	dw $6D9B
org $0098AA
	dw $6D9B
org $00994C
	dw $6D9B
org $009A53
	dw $6D9B
org $009AAB
	dw $6D9B
org $00A17C
	dw $6D9B
org $00A28B
	dw $6D9B
org $00A5B0
	dw $6D9B
org $00CCE1
	dw $6D9B
org $00CCE9
	dw $6D9B
org $00F8F6
	dw $6D9B
org $019203
	dw $6D9B
org $01A818
	dw $6D9B
org $01C3F4
	dw $6D9B
org $01C3FB
	dw $6D9B
org $01C625
	dw $6D9B
org $01C62C
	dw $6D9B
org $0296FB
	dw $6D9B
org $0297A4
	dw $6D9B
org $0297A9
	dw $6D9B
org $02992D
	dw $6D9B
org $02995B
	dw $6D9B
org $02A033
	dw $6D9B
org $02A179
	dw $6D9B
org $02A35A
	dw $6D9B
org $02A57D
	dw $6D9B
org $02A586
	dw $6D9B
org $02A75B
	dw $6D9B
org $02ADA5
	dw $6D9B
org $02ADAA
	dw $6D9B
org $02AE9F
	dw $6D9B
org $03D971
	dw $6D9B
org $03DF01
	dw $6D9B
org $05851E
	dw $6D9B
;============== REMAPPER FOR $0D9C
;============== REMAPPER FOR $0D9D
org $058106
	dw $6D9D
org $05850A
	dw $6D9D
;============== REMAPPER FOR $0D9E
org $05810F
	dw $6D9E
org $058511
	dw $6D9E
;============== REMAPPER FOR $0D9F
org $00828A
	dw $6D9F
org $0082B7
	dw $6D9F
org $008352
	dw $6D9F
org $009261
	dw $6D9F
org $0092A3
	dw $6D9F
org $0092EB
	dw $6D9F
org $009CAE
	dw $6D9F
org $00C5CF
	dw $6D9F
org $00CB0D
	dw $6D9F
org $03C512
	dw $6D9F
org $04DB9A
	dw $6D9F
org $04F40E
	dw $6D9F
org $05B12A
	dw $6D9F
org $05B297
	dw $6D9F
org $0CAB99
	dw $6D9F
;============== REMAPPER FOR $0DA0
org $0086A1
	dw $6DA0
org $009A88
	dw $6DA0
;============== REMAPPER FOR $0DA1
;============== REMAPPER FOR $0DA2
org $008669
	dw $6DA2
org $008670
	dw $6DA2
org $0086AE
	dw $6DA2
;============== REMAPPER FOR $0DA3
org $008691
	dw $6DA3
org $008698
	dw $6DA3
org $00A24F
	dw $6DA3
;============== REMAPPER FOR $0DA4
org $008656
	dw $6DA4
org $00865D
	dw $6DA4
org $0086A9
	dw $6DA4
org $0086B3
	dw $6DA4
;============== REMAPPER FOR $0DA5
org $00867E
	dw $6DA5
org $008685
	dw $6DA5
;============== REMAPPER FOR $0DA6
org $008673
	dw $6DA6
org $0086BD
	dw $6DA6
org $048247
	dw $6DA6
org $04F514
	dw $6DA6
org $04F52C
	dw $6DA6
;============== REMAPPER FOR $0DA7
org $00869B
	dw $6DA7
org $00A24A
	dw $6DA7
org $04F517
	dw $6DA7
org $04F533
	dw $6DA7
;============== REMAPPER FOR $0DA8
org $008660
	dw $6DA8
org $0086B8
	dw $6DA8
org $0086C2
	dw $6DA8
org $048367
	dw $6DA8
;============== REMAPPER FOR $0DA9
org $008688
	dw $6DA9
org $04836A
	dw $6DA9
;============== REMAPPER FOR $0DAA
org $00866D
	dw $6DAA
org $008676
	dw $6DAA
;============== REMAPPER FOR $0DAB
org $008695
	dw $6DAB
org $00869E
	dw $6DAB
;============== REMAPPER FOR $0DAC
org $00865A
	dw $6DAC
org $008663
	dw $6DAC
;============== REMAPPER FOR $0DAD
org $008682
	dw $6DAD
org $00868B
	dw $6DAD
;============== REMAPPER FOR $0DAE
org $008284
	dw $6DAE
org $0082B1
	dw $6DAE
org $00834C
	dw $6DAE
org $0093CD
	dw $6DAE
org $009741
	dw $6DAE
org $0097BF
	dw $6DAE
org $009F4D
	dw $6DAE
org $009F54
	dw $6DAE
org $00C9F9
	dw $6DAE
org $049E30
	dw $6DAE
org $049E38
	dw $6DAE
;============== REMAPPER FOR $0DAF
org $0093D2
	dw $6DAF
org $009744
	dw $6DAF
org $009F40
	dw $6DAF
org $009F5F
	dw $6DAF
org $009F64
	dw $6DAF
org $009F78
	dw $6DAF
org $00C9FC
	dw $6DAF
org $049E2D
	dw $6DAF
org $049E44
	dw $6DAF
org $049E49
	dw $6DAF
;============== REMAPPER FOR $0DB0
org $0097C2
	dw $6DB0
org $009F43
	dw $6DB0
org $009F4A
	dw $6DB0
org $009F69
	dw $6DB0
org $00A0A6
	dw $6DB0
org $00C9EE
	dw $6DB0
;============== REMAPPER FOR $0DB1
org $009F2C
	dw $6DB1
org $009F38
	dw $6DB1
org $009F70
	dw $6DB1
org $009F7D
	dw $6DB1
org $048EF4
	dw $6DB1
org $048FE4
	dw $6DB1
org $048FF2
	dw $6DB1
org $0491DE
	dw $6DB1
org $049DBD
	dw $6DB1
org $049DC4
	dw $6DB1
org $049E17
	dw $6DB1
org $049E23
	dw $6DB1
org $049E2A
	dw $6DB1
org $04E62F
	dw $6DB1
;============== REMAPPER FOR $0DB2
org $009E0E
	dw $6DB2
org $009E22
	dw $6DB2
org $04828B
	dw $6DB2
org $04873C
	dw $6DB2
org $049D9B
	dw $6DB2
org $04DBDE
	dw $6DB2
;============== REMAPPER FOR $0DB3
org $0086A6
	dw $6DB3
org $008EF0
	dw $6DB3
org $008F5C
	dw $6DB3
org $008F87
	dw $6DB3
org $008FC9
	dw $6DB3
org $0091D9
	dw $6DB3
org $009E60
	dw $6DB3
org $00A0BD
	dw $6DB3
org $00A12B
	dw $6DB3
org $00E318
	dw $6DB3
org $01E2F4
	dw $6DB3
org $01EC2A
	dw $6DB3
org $028759
	dw $6DB3
org $02875D
	dw $6DB3
org $02AE13
	dw $6DB3
org $02AE17
	dw $6DB3
org $02DA7A
	dw $6DB3
org $0392F9
	dw $6DB3
org $048376
	dw $6DB3
org $04850A
	dw $6DB3
org $048793
	dw $6DB3
org $04897E
	dw $6DB3
org $048E3B
	dw $6DB3
org $048E58
	dw $6DB3
org $0491B6
	dw $6DB3
org $049335
	dw $6DB3
org $049DA0
	dw $6DB3
org $049DD2
	dw $6DB3
org $049DD7
	dw $6DB3
org $049E09
	dw $6DB3
org $04EB3B
	dw $6DB3
org $04F51E
	dw $6DB3
org $04FD7A
	dw $6DB3
org $05CC69
	dw $6DB3
org $05CCB2
	dw $6DB3
org $05CED2
	dw $6DB3
org $05CF13
	dw $6DB3
org $05DC04
	dw $6DB3
;============== REMAPPER FOR $0DB4
org $009770
	dw $6DB4
org $009E27
	dw $6DB4
org $00A0C8
	dw $6DB4
org $0491BF
	dw $6DB4
org $049DA6
	dw $6DB4
org $049DE1
	dw $6DB4
org $04F418
	dw $6DB4
org $04F521
	dw $6DB4
org $04F553
	dw $6DB4
org $04F55A
	dw $6DB4
org $04F562
	dw $6DB4
org $04F565
	dw $6DB4
org $04F5B0
	dw $6DB4
org $04F601
	dw $6DB4
org $05DC0B
	dw $6DB4
;============== REMAPPER FOR $0DB5
org $009773
	dw $6DB5
org $009E1F
	dw $6DB5
org $04F41B
	dw $6DB5
org $04F5C0
	dw $6DB5
org $04F60C
	dw $6DB5
;============== REMAPPER FOR $0DB6
org $009E40
	dw $6DB6
org $00A0D3
	dw $6DB6
org $0491B9
	dw $6DB6
org $049DDB
	dw $6DB6
;============== REMAPPER FOR $0DB7
;============== REMAPPER FOR $0DB8
org $009E43
	dw $6DB8
org $00A0CD
	dw $6DB8
org $0491C5
	dw $6DB8
org $049DE7
	dw $6DB8
;============== REMAPPER FOR $0DB9
;============== REMAPPER FOR $0DBA
org $009E46
	dw $6DBA
org $00A0DE
	dw $6DBA
org $04824E
	dw $6DBA
org $048956
	dw $6DBA
org $0491CA
	dw $6DBA
org $049DEC
	dw $6DBA
;============== REMAPPER FOR $0DBB
;============== REMAPPER FOR $0DBC
org $00A0E4
	dw $6DBC
org $0491D6
	dw $6DBC
org $049DF8
	dw $6DBC
;============== REMAPPER FOR $0DBD
;============== REMAPPER FOR $0DBE
org $008F3C
	dw $6DBE
org $008F47
	dw $6DBE
org $008F4A
	dw $6DBE
org $009768
	dw $6DBE
org $009E2D
	dw $6DBE
org $00A0C0
	dw $6DBE
org $00D0D9
	dw $6DBE
org $028AD3
	dw $6DBE
org $0491C2
	dw $6DBE
org $049DE4
	dw $6DBE
org $04F524
	dw $6DBE
;============== REMAPPER FOR $0DBF
org $008F26
	dw $6DBF
org $008F29
	dw $6DBF
org $008F33
	dw $6DBF
org $008F39
	dw $6DBF
org $008F74
	dw $6DBF
org $009E30
	dw $6DBF
org $00A0D0
	dw $6DBF
org $0491BC
	dw $6DBF
org $049DDE
	dw $6DBF
;============== REMAPPER FOR $0DC0
org $0091AE
	dw $6DC0
org $00F1A8
	dw $6DC0
org $05B33A
	dw $6DC0
org $05B346
	dw $6DC0
org $05B353
	dw $6DC0
org $05B358
	dw $6DC0
org $05DB71
	dw $6DC0
;============== REMAPPER FOR $0DC1
org $00976D
	dw $6DC1
org $009E33
	dw $6DC1
org $00A0D6
	dw $6DC1
org $00A6C1
	dw $6DC1
org $00C908
	dw $6DC1
org $00D0D6
	dw $6DC1
org $00FC36
	dw $6DC1
org $00FC77
	dw $6DC1
org $0183E7
	dw $6DC1
org $01EB88
	dw $6DC1
org $01EBE4
	dw $6DC1
org $01EC01
	dw $6DC1
org $01EDAB
	dw $6DC1
org $01F741
	dw $6DC1
org $02A48E
	dw $6DC1
org $02A764
	dw $6DC1
org $0491CD
	dw $6DC1
org $049DEF
	dw $6DC1
;============== REMAPPER FOR $0DC2
org $009091
	dw $6DC2
org $0090BF
	dw $6DC2
org $009E38
	dw $6DC2
org $009E49
	dw $6DC2
org $00A0E1
	dw $6DC2
org $00FB37
	dw $6DC2
org $01C546
	dw $6DC2
org $02800A
	dw $6DC2
org $02800F
	dw $6DC2
org $03B455
	dw $6DC2
org $03B458
	dw $6DC2
org $0491D9
	dw $6DC2
org $049DFB
	dw $6DC2
;============== REMAPPER FOR $0DC3
;============== REMAPPER FOR $0DC4
;============== REMAPPER FOR $0DC5
;============== REMAPPER FOR $0DC6
;============== REMAPPER FOR $0DC7
org $0493E1
	dw $6DC7
org $0493EF
	dw $6DC7
org $049476
	dw $6DC7
org $0497B5
	dw $6DC7
org $0497D1
	dw $6DC7
;============== REMAPPER FOR $0DC8
;============== REMAPPER FOR $0DC9
org $0497CC
	dw $6DC9
org $0497E4
	dw $6DC9
;============== REMAPPER FOR $0DCA
;============== REMAPPER FOR $0DCB
;============== REMAPPER FOR $0DCC
;============== REMAPPER FOR $0DCD
;============== REMAPPER FOR $0DCE
;============== REMAPPER FOR $0DCF
org $049503
	dw $6DCF
org $049816
	dw $6DCF
;============== REMAPPER FOR $0DD0
;============== REMAPPER FOR $0DD1
;============== REMAPPER FOR $0DD2
;============== REMAPPER FOR $0DD3
org $0492BE
	dw $6DD3
org $049568
	dw $6DD3
org $0497F5
	dw $6DD3
;============== REMAPPER FOR $0DD4
org $048DC8
	dw $6DD4
;============== REMAPPER FOR $0DD5
org $009E5D
	dw $6DD5
org $00A26A
	dw $6DD5
org $00A27F
	dw $6DD5
org $00C9FF
	dw $6DD5
org $00CA10
	dw $6DD5
org $00D0CE
	dw $6DD5
org $048EB2
	dw $6DD5
org $048EDA
	dw $6DD5
org $048F3B
	dw $6DD5
org $048FDD
	dw $6DD5
org $049129
	dw $6DD5
org $049191
	dw $6DD5
org $049210
	dw $6DD5
org $04925D
	dw $6DD5
org $04937D
	dw $6DD5
org $049904
	dw $6DD5
org $049DAB
	dw $6DD5
org $049DB5
	dw $6DD5
org $049DC7
	dw $6DD5
org $04E5EF
	dw $6DD5
org $04E62A
	dw $6DD5
org $04E63D
	dw $6DD5
org $05B166
	dw $6DD5
;============== REMAPPER FOR $0DD6
org $00A546
	dw $6DD6
org $048516
	dw $6DD6
org $048541
	dw $6DD6
org $048631
	dw $6DD6
org $0486A9
	dw $6DD6
org $0486C8
	dw $6DD6
org $0486D5
	dw $6DD6
org $04871B
	dw $6DD6
org $04875F
	dw $6DD6
org $048DF3
	dw $6DD6
org $048E60
	dw $6DD6
org $048E63
	dw $6DD6
org $048EBB
	dw $6DD6
org $048F16
	dw $6DD6
org $048FA2
	dw $6DD6
org $049008
	dw $6DD6
org $0491A0
	dw $6DD6
org $0491EC
	dw $6DD6
org $049277
	dw $6DD6
org $0492D8
	dw $6DD6
org $049322
	dw $6DD6
org $04939D
	dw $6DD6
org $0493D7
	dw $6DD6
org $04946B
	dw $6DD6
org $04952B
	dw $6DD6
org $049583
	dw $6DD6
org $0495A3
	dw $6DD6
org $049603
	dw $6DD6
org $049664
	dw $6DD6
org $049677
	dw $6DD6
org $0496D3
	dw $6DD6
org $049791
	dw $6DD6
org $04979E
	dw $6DD6
org $049804
	dw $6DD6
org $049842
	dw $6DD6
org $049915
	dw $6DD6
org $049A27
	dw $6DD6
org $049A3D
	dw $6DD6
org $049A94
	dw $6DD6
org $049E83
	dw $6DD6
org $04D6FA
	dw $6DD6
org $04D75B
	dw $6DD6
org $04DB9E
	dw $6DD6
org $04DBD8
	dw $6DD6
org $04DC0C
	dw $6DD6
org $04DCD2
	dw $6DD6
org $04F2B1
	dw $6DD6
org $04F893
	dw $6DD6
org $04F9D8
	dw $6DD6
org $04FC47
	dw $6DD6
org $04FEFD
	dw $6DD6
org $04FF1D
	dw $6DD6
org $05D7C6
	dw $6DD6
org $05D84E
	dw $6DD6
org $05D883
	dw $6DD6
;============== REMAPPER FOR $0DD7
;============== REMAPPER FOR $0DD8
org $048362
	dw $6DD8
org $049121
	dw $6DD8
org $04945E
	dw $6DD8
org $049E1F
	dw $6DD8
;============== REMAPPER FOR $0DD9
;============== REMAPPER FOR $0DDA
org $009726
	dw $6DDA
org $009729
	dw $6DDA
org $00973E
	dw $6DDA
org $00A0BA
	dw $6DDA
org $00A646
	dw $6DDA
org $00A64B
	dw $6DDA
org $00A652
	dw $6DDA
org $00A6EE
	dw $6DDA
org $00A6F3
	dw $6DDA
org $00C53F
	dw $6DDA
org $00C9F4
	dw $6DDA
org $00E2EC
	dw $6DDA
org $00E2F5
	dw $6DDA
org $00EECA
	dw $6DDA
org $00F612
	dw $6DDA
org $018781
	dw $6DDA
org $01AB03
	dw $6DDA
org $01C0F7
	dw $6DDA
org $01C58B
	dw $6DDA
org $01C58F
	dw $6DDA
org $02E280
	dw $6DDA
org $058556
	dw $6DDA
org $05855D
	dw $6DDA
org $058564
	dw $6DDA
;============== REMAPPER FOR $0DDB
;============== REMAPPER FOR $0DDC
;============== REMAPPER FOR $0DDD
;============== REMAPPER FOR $0DDE
org $009B44
	dw $6DDE
org $009B74
	dw $6DDE
org $009B77
	dw $6DDE
org $009CE8
	dw $6DDE
org $04F6C0
	dw $6DDE
org $04F812
	dw $6DDE
org $04F81F
	dw $6DDE
org $04F913
	dw $6DDE
org $04F98C
	dw $6DDE
org $04FC90
	dw $6DDE
org $04FCDE
	dw $6DDE
org $04FD6D
	dw $6DDE
org $04FE6D
	dw $6DDE
org $04FEA9
	dw $6DDE
org $04FF9F
	dw $6DDE
;============== REMAPPER FOR $0DDF
org $04F7CF
	dw $6DDF
org $04F7E7
	dw $6DDF
org $04F7F8
	dw $6DDF
org $04FB7C
	dw $6DDF
org $04FB82
	dw $6DDF
;============== REMAPPER FOR $0DE0
org $04F7B2
	dw $6DE0
org $04F7C0
	dw $6DE0
org $04F7E4
	dw $6DE0
org $04F7EB
	dw $6DE0
org $04F81B
	dw $6DE0
;============== REMAPPER FOR $0DE1
;============== REMAPPER FOR $0DE2
;============== REMAPPER FOR $0DE3
;============== REMAPPER FOR $0DE4
;============== REMAPPER FOR $0DE5
org $048EDF
	dw $6DE5
org $04F771
	dw $6DE5
org $04F778
	dw $6DE5
org $04F859
	dw $6DE5
org $04F87D
	dw $6DE5
org $04FB62
	dw $6DE5
;============== REMAPPER FOR $0DE6
;============== REMAPPER FOR $0DE7
;============== REMAPPER FOR $0DE8
org $04F680
	dw $6DE8
;============== REMAPPER FOR $0DE9
;============== REMAPPER FOR $0DEA
;============== REMAPPER FOR $0DEB
;============== REMAPPER FOR $0DEC
;============== REMAPPER FOR $0DED
;============== REMAPPER FOR $0DEE
;============== REMAPPER FOR $0DEF
;============== REMAPPER FOR $0DF0
;============== REMAPPER FOR $0DF1
;============== REMAPPER FOR $0DF2
;============== REMAPPER FOR $0DF3
;============== REMAPPER FOR $0DF4
;============== REMAPPER FOR $0DF5
org $048EAC
	dw $6DF5
org $04F949
	dw $6DF5
org $04F97D
	dw $6DF5
org $04F985
	dw $6DF5
org $04FA3F
	dw $6DF5
org $04FA71
	dw $6DF5
org $04FA9C
	dw $6DF5
org $04FAA2
	dw $6DF5
org $04FB99
	dw $6DF5
org $04FBCE
	dw $6DF5
org $04FBE7
	dw $6DF5
org $04FBF4
	dw $6DF5
org $04FC70
	dw $6DF5
org $04FC7A
	dw $6DF5
org $04FC8A
	dw $6DF5
org $04FD53
	dw $6DF5
org $04FD6A
	dw $6DF5
org $04FDD3
	dw $6DF5
;============== REMAPPER FOR $0DF6
;============== REMAPPER FOR $0DF7
;============== REMAPPER FOR $0DF8
;============== REMAPPER FOR $0DF9
;============== REMAPPER FOR $0DFA
;============== REMAPPER FOR $0DFB
;============== REMAPPER FOR $0DFC
;============== REMAPPER FOR $0DFD
;============== REMAPPER FOR $0DFE
;============== REMAPPER FOR $0DFF
;============== REMAPPER FOR $0E00
;============== REMAPPER FOR $0E01
;============== REMAPPER FOR $0E02
;============== REMAPPER FOR $0E03
;============== REMAPPER FOR $0E04
org $04F94C
	dw $6E04
org $04F95E
	dw $6E04
;============== REMAPPER FOR $0E05
org $04F929
	dw $6E05
org $04F93E
	dw $6E05
org $04F943
	dw $6E05
org $04F972
	dw $6E05
org $04F975
	dw $6E05
org $04F98F
	dw $6E05
org $04FBE1
	dw $6E05
org $04FC06
	dw $6E05
org $04FD46
	dw $6E05
;============== REMAPPER FOR $0E06
;============== REMAPPER FOR $0E07
;============== REMAPPER FOR $0E08
;============== REMAPPER FOR $0E09
;============== REMAPPER FOR $0E0A
;============== REMAPPER FOR $0E0B
;============== REMAPPER FOR $0E0C
;============== REMAPPER FOR $0E0D
;============== REMAPPER FOR $0E0E
;============== REMAPPER FOR $0E0F
;============== REMAPPER FOR $0E10
;============== REMAPPER FOR $0E11
;============== REMAPPER FOR $0E12
;============== REMAPPER FOR $0E13
;============== REMAPPER FOR $0E14
;============== REMAPPER FOR $0E15
org $04F921
	dw $6E15
org $04FD3D
	dw $6E15
org $04FD40
	dw $6E15
org $04FF56
	dw $6E15
;============== REMAPPER FOR $0E16
;============== REMAPPER FOR $0E17
;============== REMAPPER FOR $0E18
;============== REMAPPER FOR $0E19
;============== REMAPPER FOR $0E1A
;============== REMAPPER FOR $0E1B
;============== REMAPPER FOR $0E1C
;============== REMAPPER FOR $0E1D
;============== REMAPPER FOR $0E1E
;============== REMAPPER FOR $0E1F
;============== REMAPPER FOR $0E20
;============== REMAPPER FOR $0E21
;============== REMAPPER FOR $0E22
;============== REMAPPER FOR $0E23
;============== REMAPPER FOR $0E24
;============== REMAPPER FOR $0E25
org $04F6B2
	dw $6E25
org $04F806
	dw $6E25
org $04F80B
	dw $6E25
org $04FA80
	dw $6E25
org $04FA97
	dw $6E25
org $04FACD
	dw $6E25
org $04FBD6
	dw $6E25
org $04FBDC
	dw $6E25
org $04FBFE
	dw $6E25
org $04FDB5
	dw $6E25
org $04FDBA
	dw $6E25
;============== REMAPPER FOR $0E26
;============== REMAPPER FOR $0E27
;============== REMAPPER FOR $0E28
;============== REMAPPER FOR $0E29
;============== REMAPPER FOR $0E2A
;============== REMAPPER FOR $0E2B
;============== REMAPPER FOR $0E2C
;============== REMAPPER FOR $0E2D
;============== REMAPPER FOR $0E2E
;============== REMAPPER FOR $0E2F
;============== REMAPPER FOR $0E30
;============== REMAPPER FOR $0E31
;============== REMAPPER FOR $0E32
;============== REMAPPER FOR $0E33
;============== REMAPPER FOR $0E34
;============== REMAPPER FOR $0E35
org $04F794
	dw $6E35
org $04FA52
	dw $6E35
org $04FBB7
	dw $6E35
org $04FBEA
	dw $6E35
org $04FC55
	dw $6E35
org $04FE82
	dw $6E35
org $04FE99
	dw $6E35
org $04FE9E
	dw $6E35
org $04FECA
	dw $6E35
org $04FECD
	dw $6E35
org $04FEF4
	dw $6E35
;============== REMAPPER FOR $0E36
;============== REMAPPER FOR $0E37
;============== REMAPPER FOR $0E38
org $04F693
	dw $6E38
;============== REMAPPER FOR $0E39
;============== REMAPPER FOR $0E3A
;============== REMAPPER FOR $0E3B
;============== REMAPPER FOR $0E3C
;============== REMAPPER FOR $0E3D
;============== REMAPPER FOR $0E3E
;============== REMAPPER FOR $0E3F
;============== REMAPPER FOR $0E40
;============== REMAPPER FOR $0E41
;============== REMAPPER FOR $0E42
;============== REMAPPER FOR $0E43
;============== REMAPPER FOR $0E44
;============== REMAPPER FOR $0E45
org $04F7A5
	dw $6E45
org $04F7C3
	dw $6E45
org $04F7D6
	dw $6E45
org $04F9DE
	dw $6E45
org $04FA5E
	dw $6E45
org $04FBC3
	dw $6E45
org $04FC61
	dw $6E45
org $04FF14
	dw $6E45
;============== REMAPPER FOR $0E46
;============== REMAPPER FOR $0E47
;============== REMAPPER FOR $0E48
org $04F69F
	dw $6E48
;============== REMAPPER FOR $0E49
;============== REMAPPER FOR $0E4A
;============== REMAPPER FOR $0E4B
;============== REMAPPER FOR $0E4C
;============== REMAPPER FOR $0E4D
;============== REMAPPER FOR $0E4E
;============== REMAPPER FOR $0E4F
;============== REMAPPER FOR $0E50
;============== REMAPPER FOR $0E51
;============== REMAPPER FOR $0E52
;============== REMAPPER FOR $0E53
;============== REMAPPER FOR $0E54
;============== REMAPPER FOR $0E55
org $04F784
	dw $6E55
org $04FA94
	dw $6E55
org $04FE09
	dw $6E55
org $04FE52
	dw $6E55
org $04FE73
	dw $6E55
org $04FF38
	dw $6E55
org $04FF64
	dw $6E55
;============== REMAPPER FOR $0E56
;============== REMAPPER FOR $0E57
;============== REMAPPER FOR $0E58
org $04F68D
	dw $6E58
;============== REMAPPER FOR $0E59
;============== REMAPPER FOR $0E5A
;============== REMAPPER FOR $0E5B
;============== REMAPPER FOR $0E5C
;============== REMAPPER FOR $0E5D
;============== REMAPPER FOR $0E5E
;============== REMAPPER FOR $0E5F
;============== REMAPPER FOR $0E60
;============== REMAPPER FOR $0E61
;============== REMAPPER FOR $0E62
;============== REMAPPER FOR $0E63
;============== REMAPPER FOR $0E64
;============== REMAPPER FOR $0E65
org $04F798
	dw $6E65
org $04FA58
	dw $6E65
org $04FBBD
	dw $6E65
org $04FC5B
	dw $6E65
org $04FE7E
	dw $6E65
org $04FED1
	dw $6E65
org $04FED4
	dw $6E65
org $04FEF0
	dw $6E65
;============== REMAPPER FOR $0E66
;============== REMAPPER FOR $0E67
;============== REMAPPER FOR $0E68
org $04F699
	dw $6E68
;============== REMAPPER FOR $0E69
;============== REMAPPER FOR $0E6A
;============== REMAPPER FOR $0E6B
;============== REMAPPER FOR $0E6C
;============== REMAPPER FOR $0E6D
;============== REMAPPER FOR $0E6E
;============== REMAPPER FOR $0E6F
;============== REMAPPER FOR $0E70
;============== REMAPPER FOR $0E71
;============== REMAPPER FOR $0E72
;============== REMAPPER FOR $0E73
;============== REMAPPER FOR $0E74
;============== REMAPPER FOR $0E75
org $04F7A9
	dw $6E75
org $04F7C8
	dw $6E75
org $04F7D2
	dw $6E75
org $04F9E4
	dw $6E75
org $04FA64
	dw $6E75
org $04FBC9
	dw $6E75
org $04FC67
	dw $6E75
org $04FF10
	dw $6E75
;============== REMAPPER FOR $0E76
;============== REMAPPER FOR $0E77
;============== REMAPPER FOR $0E78
org $04F6A5
	dw $6E78
;============== REMAPPER FOR $0E79
;============== REMAPPER FOR $0E7A
;============== REMAPPER FOR $0E7B
;============== REMAPPER FOR $0E7C
;============== REMAPPER FOR $0E7D
;============== REMAPPER FOR $0E7E
;============== REMAPPER FOR $0E7F
;============== REMAPPER FOR $0E80
;============== REMAPPER FOR $0E81
;============== REMAPPER FOR $0E82
;============== REMAPPER FOR $0E83
;============== REMAPPER FOR $0E84
;============== REMAPPER FOR $0E85
;============== REMAPPER FOR $0E86
;============== REMAPPER FOR $0E87
;============== REMAPPER FOR $0E88
;============== REMAPPER FOR $0E89
;============== REMAPPER FOR $0E8A
;============== REMAPPER FOR $0E8B
;============== REMAPPER FOR $0E8C
;============== REMAPPER FOR $0E8D
;============== REMAPPER FOR $0E8E
;============== REMAPPER FOR $0E8F
;============== REMAPPER FOR $0E90
;============== REMAPPER FOR $0E91
;============== REMAPPER FOR $0E92
;============== REMAPPER FOR $0E93
;============== REMAPPER FOR $0E94
;============== REMAPPER FOR $0E95
org $04F999
	dw $6E95
org $04F9A5
	dw $6E95
org $04F9C9
	dw $6E95
org $04F9D5
	dw $6E95
org $04F9EF
	dw $6E95
org $04FA0B
	dw $6E95
org $04FB3A
	dw $6E95
org $04FBD3
	dw $6E95
org $04FBF9
	dw $6E95
org $04FD30
	dw $6E95
org $04FD56
	dw $6E95
org $04FD5D
	dw $6E95
org $04FDA8
	dw $6E95
org $04FEAC
	dw $6E95
org $04FEBA
	dw $6E95
org $04FF59
	dw $6E95
org $04FFA4
	dw $6E95
;============== REMAPPER FOR $0E96
;============== REMAPPER FOR $0E97
;============== REMAPPER FOR $0E98
;============== REMAPPER FOR $0E99
;============== REMAPPER FOR $0E9A
;============== REMAPPER FOR $0E9B
;============== REMAPPER FOR $0E9C
;============== REMAPPER FOR $0E9D
;============== REMAPPER FOR $0E9E
;============== REMAPPER FOR $0E9F
;============== REMAPPER FOR $0EA0
;============== REMAPPER FOR $0EA1
;============== REMAPPER FOR $0EA2
;============== REMAPPER FOR $0EA3
;============== REMAPPER FOR $0EA4
;============== REMAPPER FOR $0EA5
org $04FB3F
	dw $6EA5
org $04FF5C
	dw $6EA5
org $04FFA9
	dw $6EA5
;============== REMAPPER FOR $0EA6
;============== REMAPPER FOR $0EA7
;============== REMAPPER FOR $0EA8
;============== REMAPPER FOR $0EA9
;============== REMAPPER FOR $0EAA
;============== REMAPPER FOR $0EAB
;============== REMAPPER FOR $0EAC
;============== REMAPPER FOR $0EAD
;============== REMAPPER FOR $0EAE
;============== REMAPPER FOR $0EAF
;============== REMAPPER FOR $0EB0
;============== REMAPPER FOR $0EB1
;============== REMAPPER FOR $0EB2
;============== REMAPPER FOR $0EB3
;============== REMAPPER FOR $0EB4
;============== REMAPPER FOR $0EB5
org $04F6B9
	dw $6EB5
org $04F92F
	dw $6EB5
org $04F936
	dw $6EB5
org $04FA76
	dw $6EB5
org $04FA84
	dw $6EB5
org $04FA87
	dw $6EB5
org $04FAA7
	dw $6EB5
org $04FF5F
	dw $6EB5
org $04FFAE
	dw $6EB5
;============== REMAPPER FOR $0EB6
;============== REMAPPER FOR $0EB7
;============== REMAPPER FOR $0EB8
;============== REMAPPER FOR $0EB9
;============== REMAPPER FOR $0EBA
;============== REMAPPER FOR $0EBB
;============== REMAPPER FOR $0EBC
;============== REMAPPER FOR $0EBD
;============== REMAPPER FOR $0EBE
;============== REMAPPER FOR $0EBF
;============== REMAPPER FOR $0EC0
;============== REMAPPER FOR $0EC1
;============== REMAPPER FOR $0EC2
;============== REMAPPER FOR $0EC3
;============== REMAPPER FOR $0EC4
;============== REMAPPER FOR $0EC5
org $04FEB4
	dw $6EC5
org $04FEB7
	dw $6EC5
;============== REMAPPER FOR $0EC6
;============== REMAPPER FOR $0EC7
;============== REMAPPER FOR $0EC8
;============== REMAPPER FOR $0EC9
;============== REMAPPER FOR $0ECA
;============== REMAPPER FOR $0ECB
;============== REMAPPER FOR $0ECC
;============== REMAPPER FOR $0ECD
;============== REMAPPER FOR $0ECE
;============== REMAPPER FOR $0ECF
;============== REMAPPER FOR $0ED0
;============== REMAPPER FOR $0ED1
;============== REMAPPER FOR $0ED2
;============== REMAPPER FOR $0ED3
;============== REMAPPER FOR $0ED4
;============== REMAPPER FOR $0ED5
;============== REMAPPER FOR $0ED6
;============== REMAPPER FOR $0ED7
;============== REMAPPER FOR $0ED8
;============== REMAPPER FOR $0ED9
;============== REMAPPER FOR $0EDA
;============== REMAPPER FOR $0EDB
;============== REMAPPER FOR $0EDC
;============== REMAPPER FOR $0EDD
;============== REMAPPER FOR $0EDE
;============== REMAPPER FOR $0EDF
;============== REMAPPER FOR $0EE0
;============== REMAPPER FOR $0EE1
;============== REMAPPER FOR $0EE2
;============== REMAPPER FOR $0EE3
;============== REMAPPER FOR $0EE4
;============== REMAPPER FOR $0EE5
;============== REMAPPER FOR $0EE6
;============== REMAPPER FOR $0EE7
;============== REMAPPER FOR $0EE8
;============== REMAPPER FOR $0EE9
;============== REMAPPER FOR $0EEA
;============== REMAPPER FOR $0EEB
;============== REMAPPER FOR $0EEC
;============== REMAPPER FOR $0EED
;============== REMAPPER FOR $0EEE
;============== REMAPPER FOR $0EEF
;============== REMAPPER FOR $0EF0
;============== REMAPPER FOR $0EF1
;============== REMAPPER FOR $0EF2
;============== REMAPPER FOR $0EF3
;============== REMAPPER FOR $0EF4
;============== REMAPPER FOR $0EF5
org $048ED2
	dw $6EF5
org $048ED5
	dw $6EF5
org $04FBAC
	dw $6EF5
;============== REMAPPER FOR $0EF6
org $048EAF
	dw $6EF6
org $04FBA9
	dw $6EF6
;============== REMAPPER FOR $0EF7
org $048EA1
	dw $6EF7
org $049124
	dw $6EF7
org $04F7FB
	dw $6EF7
org $04FC1B
	dw $6EF7
org $04FEEC
	dw $6EF7
;============== REMAPPER FOR $0EF8
org $01EC31
	dw $6EF8
org $01EC39
	dw $6EF8
;============== REMAPPER FOR $0EF9
org $008D83
	dw $6EF9
org $008FD3
	dw $6EF9
;============== REMAPPER FOR $0EFA
;============== REMAPPER FOR $0EFB
;============== REMAPPER FOR $0EFC
;============== REMAPPER FOR $0EFD
;============== REMAPPER FOR $0EFE
;============== REMAPPER FOR $0EFF
org $008FF0
	dw $6EFF
;============== REMAPPER FOR $0F00
;============== REMAPPER FOR $0F01
;============== REMAPPER FOR $0F02
;============== REMAPPER FOR $0F03
org $008FA8
	dw $6F03
org $008FB8
	dw $6F03
;============== REMAPPER FOR $0F04
;============== REMAPPER FOR $0F05
;============== REMAPPER FOR $0F06
;============== REMAPPER FOR $0F07
;============== REMAPPER FOR $0F08
;============== REMAPPER FOR $0F09
;============== REMAPPER FOR $0F0A
;============== REMAPPER FOR $0F0B
;============== REMAPPER FOR $0F0C
;============== REMAPPER FOR $0F0D
;============== REMAPPER FOR $0F0E
;============== REMAPPER FOR $0F0F
;============== REMAPPER FOR $0F10
;============== REMAPPER FOR $0F11
;============== REMAPPER FOR $0F12
;============== REMAPPER FOR $0F13
org $008F82
	dw $6F13
;============== REMAPPER FOR $0F14
org $008F7F
	dw $6F14
;============== REMAPPER FOR $0F15
org $008E8D
	dw $6F15
org $009015
	dw $6F15
org $009035
	dw $6F15
org $009054
	dw $6F15
org $009069
	dw $6F15
;============== REMAPPER FOR $0F16
org $008F56
	dw $6F16
;============== REMAPPER FOR $0F17
org $008F59
	dw $6F17
;============== REMAPPER FOR $0F18
;============== REMAPPER FOR $0F19
;============== REMAPPER FOR $0F1A
;============== REMAPPER FOR $0F1B
;============== REMAPPER FOR $0F1C
;============== REMAPPER FOR $0F1D
;============== REMAPPER FOR $0F1E
org $008F9E
	dw $6F1E
org $008FA5
	dw $6F1E
org $008FB0
	dw $6F1E
org $008FBE
	dw $6F1E
;============== REMAPPER FOR $0F1F
;============== REMAPPER FOR $0F20
;============== REMAPPER FOR $0F21
;============== REMAPPER FOR $0F22
;============== REMAPPER FOR $0F23
;============== REMAPPER FOR $0F24
;============== REMAPPER FOR $0F25
org $008E73
	dw $6F25
;============== REMAPPER FOR $0F26
org $008E79
	dw $6F26
;============== REMAPPER FOR $0F27
org $008E7F
	dw $6F27
;============== REMAPPER FOR $0F28
;============== REMAPPER FOR $0F29
org $008EE1
	dw $6F29
org $008EE8
	dw $6F29
org $008F0F
	dw $6F29
org $008F16
	dw $6F29
;============== REMAPPER FOR $0F2A
;============== REMAPPER FOR $0F2B
;============== REMAPPER FOR $0F2C
;============== REMAPPER FOR $0F2D
;============== REMAPPER FOR $0F2E
;============== REMAPPER FOR $0F2F
;============== REMAPPER FOR $0F30
org $008D8D
	dw $6F30
org $008E29
	dw $6F30
org $008E30
	dw $6F30
;============== REMAPPER FOR $0F31
org $008E33
	dw $6F31
org $008E40
	dw $6F31
org $008E47
	dw $6F31
org $008E4D
	dw $6F31
org $008E61
	dw $6F31
org $008E70
	dw $6F31
org $008E86
	dw $6F31
org $0091BE
	dw $6F31
org $009A92
	dw $6F31
org $00D0E9
	dw $6F31
org $01F10F
	dw $6F31
org $058588
	dw $6F31
org $05CCD4
	dw $6F31
org $05CE4F
	dw $6F31
org $05DB85
	dw $6F31
;============== REMAPPER FOR $0F32
org $008E36
	dw $6F32
org $008E52
	dw $6F32
org $008E64
	dw $6F32
org $008E76
	dw $6F32
org $0091C1
	dw $6F32
org $00D0EC
	dw $6F32
org $01F103
	dw $6F32
org $01F112
	dw $6F32
org $05858B
	dw $6F32
org $05CC78
	dw $6F32
org $05CE59
	dw $6F32
org $05DB8C
	dw $6F32
org $05DB9E
	dw $6F32
;============== REMAPPER FOR $0F33
org $008E39
	dw $6F33
org $008E55
	dw $6F33
org $008E67
	dw $6F33
org $008E7C
	dw $6F33
org $0091C4
	dw $6F33
org $00D0EF
	dw $6F33
org $05858E
	dw $6F33
org $05CC7D
	dw $6F33
org $05CE68
	dw $6F33
org $05DB95
	dw $6F33
;============== REMAPPER FOR $0F34
org $008EA1
	dw $6F34
org $008EBD
	dw $6F34
org $008ED3
	dw $6F34
org $009E4F
	dw $6F34
org $028761
	dw $6F34
org $028767
	dw $6F34
org $02AE1B
	dw $6F34
org $02AE22
	dw $6F34
org $05CEF7
	dw $6F34
org $05CEFA
	dw $6F34
;============== REMAPPER FOR $0F35
org $008EB8
	dw $6F35
org $008ECE
	dw $6F35
org $02876C
	dw $6F35
org $02AE25
	dw $6F35
org $02AE2B
	dw $6F35
;============== REMAPPER FOR $0F36
org $008E98
	dw $6F36
org $008EB3
	dw $6F36
org $008EC7
	dw $6F36
org $009E57
	dw $6F36
org $028771
	dw $6F36
org $02AE2E
	dw $6F36
org $02AE33
	dw $6F36
org $05CEFD
	dw $6F36
org $05CF03
	dw $6F36
;============== REMAPPER FOR $0F37
org $008F01
	dw $6F37
org $009E52
	dw $6F37
;============== REMAPPER FOR $0F38
org $008EFC
	dw $6F38
;============== REMAPPER FOR $0F39
org $008EF5
	dw $6F39
org $009E5A
	dw $6F39
;============== REMAPPER FOR $0F3A
;============== REMAPPER FOR $0F3B
;============== REMAPPER FOR $0F3C
;============== REMAPPER FOR $0F3D
;============== REMAPPER FOR $0F3E
;============== REMAPPER FOR $0F3F
;============== REMAPPER FOR $0F40
org $05CD05
	dw $6F40
org $05CEDE
	dw $6F40
org $05CEEE
	dw $6F40
org $05CF37
	dw $6F40
org $05CF67
	dw $6F40
;============== REMAPPER FOR $0F41
;============== REMAPPER FOR $0F42
;============== REMAPPER FOR $0F43
;============== REMAPPER FOR $0F44
;============== REMAPPER FOR $0F45
;============== REMAPPER FOR $0F46
;============== REMAPPER FOR $0F47
;============== REMAPPER FOR $0F48
org $008F5F
	dw $6F48
org $008F6B
	dw $6F48
org $008F71
	dw $6F48
org $008F90
	dw $6F48
org $009E4C
	dw $6F48
org $05CC6C
	dw $6F48
org $05CF16
	dw $6F48
org $05CF1C
	dw $6F48
;============== REMAPPER FOR $0F49
;============== REMAPPER FOR $0F4A
org $02AA4B
	dw $6F4A
org $02AA87
	dw $6F4A
org $02AAED
	dw $6F4A
org $02AB40
	dw $6F4A
org $02DF77
	dw $6F4A
org $02F91D
	dw $6F4A
org $02F926
	dw $6F4A
org $02F9B6
	dw $6F4A
org $02FA29
	dw $6F4A
org $02FA43
	dw $6F4A
org $02FAA9
	dw $6F4A
org $02FCF9
	dw $6F4A
org $02FD0E
	dw $6F4A
;============== REMAPPER FOR $0F4B
;============== REMAPPER FOR $0F4C
;============== REMAPPER FOR $0F4D
;============== REMAPPER FOR $0F4E
;============== REMAPPER FOR $0F4F
;============== REMAPPER FOR $0F50
;============== REMAPPER FOR $0F51
;============== REMAPPER FOR $0F52
;============== REMAPPER FOR $0F53
;============== REMAPPER FOR $0F54
;============== REMAPPER FOR $0F55
;============== REMAPPER FOR $0F56
;============== REMAPPER FOR $0F57
;============== REMAPPER FOR $0F58
;============== REMAPPER FOR $0F59
;============== REMAPPER FOR $0F5A
;============== REMAPPER FOR $0F5B
;============== REMAPPER FOR $0F5C
;============== REMAPPER FOR $0F5D
;============== REMAPPER FOR $0F5E
;============== REMAPPER FOR $0F5F
;============== REMAPPER FOR $0F60
;============== REMAPPER FOR $0F61
;============== REMAPPER FOR $0F62
;============== REMAPPER FOR $0F63
;============== REMAPPER FOR $0F64
;============== REMAPPER FOR $0F65
;============== REMAPPER FOR $0F66
;============== REMAPPER FOR $0F67
;============== REMAPPER FOR $0F68
;============== REMAPPER FOR $0F69
;============== REMAPPER FOR $0F6A
;============== REMAPPER FOR $0F6B
;============== REMAPPER FOR $0F6C
;============== REMAPPER FOR $0F6D
;============== REMAPPER FOR $0F6E
;============== REMAPPER FOR $0F6F
;============== REMAPPER FOR $0F70
;============== REMAPPER FOR $0F71
;============== REMAPPER FOR $0F72
org $02AB3B
	dw $6F72
org $02FAF2
	dw $6F72
org $02FC1D
	dw $6F72
org $02FC7E
	dw $6F72
;============== REMAPPER FOR $0F73
;============== REMAPPER FOR $0F74
;============== REMAPPER FOR $0F75
;============== REMAPPER FOR $0F76
;============== REMAPPER FOR $0F77
;============== REMAPPER FOR $0F78
;============== REMAPPER FOR $0F79
;============== REMAPPER FOR $0F7A
;============== REMAPPER FOR $0F7B
;============== REMAPPER FOR $0F7C
;============== REMAPPER FOR $0F7D
;============== REMAPPER FOR $0F7E
;============== REMAPPER FOR $0F7F
;============== REMAPPER FOR $0F80
;============== REMAPPER FOR $0F81
;============== REMAPPER FOR $0F82
;============== REMAPPER FOR $0F83
;============== REMAPPER FOR $0F84
;============== REMAPPER FOR $0F85
;============== REMAPPER FOR $0F86
org $02AA39
	dw $6F86
org $02AADB
	dw $6F86
org $02AB36
	dw $6F86
org $02D6DE
	dw $6F86
org $02FA99
	dw $6F86
org $02FB7D
	dw $6F86
org $02FBE4
	dw $6F86
org $02FBE9
	dw $6F86
org $02FC4E
	dw $6F86
org $02FC88
	dw $6F86
org $02FDA4
	dw $6F86
org $02FF0F
	dw $6F86
;============== REMAPPER FOR $0F87
;============== REMAPPER FOR $0F88
;============== REMAPPER FOR $0F89
;============== REMAPPER FOR $0F8A
;============== REMAPPER FOR $0F8B
;============== REMAPPER FOR $0F8C
;============== REMAPPER FOR $0F8D
;============== REMAPPER FOR $0F8E
;============== REMAPPER FOR $0F8F
;============== REMAPPER FOR $0F90
;============== REMAPPER FOR $0F91
;============== REMAPPER FOR $0F92
;============== REMAPPER FOR $0F93
;============== REMAPPER FOR $0F94
;============== REMAPPER FOR $0F95
;============== REMAPPER FOR $0F96
;============== REMAPPER FOR $0F97
;============== REMAPPER FOR $0F98
;============== REMAPPER FOR $0F99
;============== REMAPPER FOR $0F9A
org $02FBEE
	dw $6F9A
org $02FC46
	dw $6F9A
org $02FC4B
	dw $6F9A
org $02FC5A
	dw $6F9A
org $02FCEE
	dw $6F9A
org $02FD18
	dw $6F9A
;============== REMAPPER FOR $0F9B
;============== REMAPPER FOR $0F9C
;============== REMAPPER FOR $0F9D
;============== REMAPPER FOR $0F9E
;============== REMAPPER FOR $0F9F
;============== REMAPPER FOR $0FA0
;============== REMAPPER FOR $0FA1
;============== REMAPPER FOR $0FA2
;============== REMAPPER FOR $0FA3
;============== REMAPPER FOR $0FA4
;============== REMAPPER FOR $0FA5
;============== REMAPPER FOR $0FA6
;============== REMAPPER FOR $0FA7
;============== REMAPPER FOR $0FA8
;============== REMAPPER FOR $0FA9
;============== REMAPPER FOR $0FAA
;============== REMAPPER FOR $0FAB
;============== REMAPPER FOR $0FAC
;============== REMAPPER FOR $0FAD
;============== REMAPPER FOR $0FAE
org $02FAB5
	dw $6FAE
org $02FAB8
	dw $6FAE
org $02FAFB
	dw $6FAE
;============== REMAPPER FOR $0FAF
;============== REMAPPER FOR $0FB0
org $02FABB
	dw $6FB0
org $02FAC2
	dw $6FB0
org $02FB03
	dw $6FB0
;============== REMAPPER FOR $0FB1
;============== REMAPPER FOR $0FB2
org $02AB5C
	dw $6FB2
org $02FAC5
	dw $6FB2
org $02FB89
	dw $6FB2
;============== REMAPPER FOR $0FB3
;============== REMAPPER FOR $0FB4
org $02AB61
	dw $6FB4
org $02FACA
	dw $6FB4
org $02FB8F
	dw $6FB4
;============== REMAPPER FOR $0FB5
;============== REMAPPER FOR $0FB6
org $02AB51
	dw $6FB6
org $02FBA0
	dw $6FB6
;============== REMAPPER FOR $0FB7
;============== REMAPPER FOR $0FB8
org $02AB57
	dw $6FB8
org $02FBA6
	dw $6FB8
;============== REMAPPER FOR $0FB9
;============== REMAPPER FOR $0FBA
org $02AB66
	dw $6FBA
org $02FA9C
	dw $6FBA
org $02FAE3
	dw $6FBA
;============== REMAPPER FOR $0FBB
;============== REMAPPER FOR $0FBC
org $02AB6B
	dw $6FBC
org $02FAE7
	dw $6FBC
;============== REMAPPER FOR $0FBD
;============== REMAPPER FOR $0FBE
org $00C17D
	dw $6FBE
org $00C25F
	dw $6FBE
org $04DC45
	dw $6FBE
org $0580ED
	dw $6FBE
org $0581A8
	dw $6FBE
org $058246
	dw $6FBE
org $058258
	dw $6FBE
org $0582A0
	dw $6FBE
org $0582B8
	dw $6FBE
org $0587BC
	dw $6FBE
org $058A67
	dw $6FBE
org $058B47
	dw $6FBE
org $058C35
	dw $6FBE
org $058D2C
	dw $6FBE
org $0C94AE
	dw $6FBE
org $0C94FE
	dw $6FBE
;============== REMAPPER FOR $0FBF
;============== REMAPPER FOR $0FC0
;============== REMAPPER FOR $0FC1
;============== REMAPPER FOR $0FC2
;============== REMAPPER FOR $0FC3
;============== REMAPPER FOR $0FC4
;============== REMAPPER FOR $0FC5
;============== REMAPPER FOR $0FC6
;============== REMAPPER FOR $0FC7
;============== REMAPPER FOR $0FC8
;============== REMAPPER FOR $0FC9
;============== REMAPPER FOR $0FCA
;============== REMAPPER FOR $0FCB
;============== REMAPPER FOR $0FCC
;============== REMAPPER FOR $0FCD
;============== REMAPPER FOR $0FCE
;============== REMAPPER FOR $0FCF
;============== REMAPPER FOR $0FD0
;============== REMAPPER FOR $0FD1
;============== REMAPPER FOR $0FD2
;============== REMAPPER FOR $0FD3
;============== REMAPPER FOR $0FD4
;============== REMAPPER FOR $0FD5
;============== REMAPPER FOR $0FD6
;============== REMAPPER FOR $0FD7
;============== REMAPPER FOR $0FD8
;============== REMAPPER FOR $0FD9
;============== REMAPPER FOR $0FDA
;============== REMAPPER FOR $0FDB
;============== REMAPPER FOR $0FDC
;============== REMAPPER FOR $0FDD
;============== REMAPPER FOR $0FDE
;============== REMAPPER FOR $0FDF
;============== REMAPPER FOR $0FE0
;============== REMAPPER FOR $0FE1
;============== REMAPPER FOR $0FE2
;============== REMAPPER FOR $0FE3
;============== REMAPPER FOR $0FE4
;============== REMAPPER FOR $0FE5
;============== REMAPPER FOR $0FE6
;============== REMAPPER FOR $0FE7
;============== REMAPPER FOR $0FE8
;============== REMAPPER FOR $0FE9
;============== REMAPPER FOR $0FEA
;============== REMAPPER FOR $0FEB
;============== REMAPPER FOR $0FEC
;============== REMAPPER FOR $0FED
;============== REMAPPER FOR $0FEE
;============== REMAPPER FOR $0FEF
;============== REMAPPER FOR $0FF0
;============== REMAPPER FOR $0FF1
;============== REMAPPER FOR $0FF2
;============== REMAPPER FOR $0FF3
;============== REMAPPER FOR $0FF4
;============== REMAPPER FOR $0FF5
;============== REMAPPER FOR $0FF6
;============== REMAPPER FOR $0FF7
;============== REMAPPER FOR $0FF8
;============== REMAPPER FOR $0FF9
;============== REMAPPER FOR $0FFA
;============== REMAPPER FOR $0FFB
;============== REMAPPER FOR $0FFC
;============== REMAPPER FOR $0FFD
;============== REMAPPER FOR $0FFE
;============== REMAPPER FOR $0FFF
;============== REMAPPER FOR $1000
;============== REMAPPER FOR $1001
;============== REMAPPER FOR $1002
;============== REMAPPER FOR $1003
;============== REMAPPER FOR $1004
;============== REMAPPER FOR $1005
;============== REMAPPER FOR $1006
;============== REMAPPER FOR $1007
;============== REMAPPER FOR $1008
;============== REMAPPER FOR $1009
;============== REMAPPER FOR $100A
;============== REMAPPER FOR $100B
;============== REMAPPER FOR $100C
;============== REMAPPER FOR $100D
;============== REMAPPER FOR $100E
;============== REMAPPER FOR $100F
;============== REMAPPER FOR $1010
;============== REMAPPER FOR $1011
;============== REMAPPER FOR $1012
;============== REMAPPER FOR $1013
;============== REMAPPER FOR $1014
;============== REMAPPER FOR $1015
;============== REMAPPER FOR $1016
;============== REMAPPER FOR $1017
;============== REMAPPER FOR $1018
;============== REMAPPER FOR $1019
;============== REMAPPER FOR $101A
;============== REMAPPER FOR $101B
;============== REMAPPER FOR $101C
;============== REMAPPER FOR $101D
;============== REMAPPER FOR $101E
;============== REMAPPER FOR $101F
;============== REMAPPER FOR $1020
;============== REMAPPER FOR $1021
;============== REMAPPER FOR $1022
;============== REMAPPER FOR $1023
;============== REMAPPER FOR $1024
;============== REMAPPER FOR $1025
;============== REMAPPER FOR $1026
;============== REMAPPER FOR $1027
;============== REMAPPER FOR $1028
;============== REMAPPER FOR $1029
;============== REMAPPER FOR $102A
;============== REMAPPER FOR $102B
;============== REMAPPER FOR $102C
;============== REMAPPER FOR $102D
;============== REMAPPER FOR $102E
;============== REMAPPER FOR $102F
;============== REMAPPER FOR $1030
;============== REMAPPER FOR $1031
;============== REMAPPER FOR $1032
;============== REMAPPER FOR $1033
;============== REMAPPER FOR $1034
;============== REMAPPER FOR $1035
;============== REMAPPER FOR $1036
;============== REMAPPER FOR $1037
;============== REMAPPER FOR $1038
;============== REMAPPER FOR $1039
;============== REMAPPER FOR $103A
;============== REMAPPER FOR $103B
;============== REMAPPER FOR $103C
;============== REMAPPER FOR $103D
;============== REMAPPER FOR $103E
;============== REMAPPER FOR $103F
;============== REMAPPER FOR $1040
;============== REMAPPER FOR $1041
;============== REMAPPER FOR $1042
;============== REMAPPER FOR $1043
;============== REMAPPER FOR $1044
;============== REMAPPER FOR $1045
;============== REMAPPER FOR $1046
;============== REMAPPER FOR $1047
;============== REMAPPER FOR $1048
;============== REMAPPER FOR $1049
;============== REMAPPER FOR $104A
;============== REMAPPER FOR $104B
;============== REMAPPER FOR $104C
;============== REMAPPER FOR $104D
;============== REMAPPER FOR $104E
;============== REMAPPER FOR $104F
;============== REMAPPER FOR $1050
;============== REMAPPER FOR $1051
;============== REMAPPER FOR $1052
;============== REMAPPER FOR $1053
;============== REMAPPER FOR $1054
;============== REMAPPER FOR $1055
;============== REMAPPER FOR $1056
;============== REMAPPER FOR $1057
;============== REMAPPER FOR $1058
;============== REMAPPER FOR $1059
;============== REMAPPER FOR $105A
;============== REMAPPER FOR $105B
;============== REMAPPER FOR $105C
;============== REMAPPER FOR $105D
;============== REMAPPER FOR $105E
;============== REMAPPER FOR $105F
;============== REMAPPER FOR $1060
;============== REMAPPER FOR $1061
;============== REMAPPER FOR $1062
;============== REMAPPER FOR $1063
;============== REMAPPER FOR $1064
;============== REMAPPER FOR $1065
;============== REMAPPER FOR $1066
;============== REMAPPER FOR $1067
;============== REMAPPER FOR $1068
;============== REMAPPER FOR $1069
;============== REMAPPER FOR $106A
;============== REMAPPER FOR $106B
;============== REMAPPER FOR $106C
;============== REMAPPER FOR $106D
;============== REMAPPER FOR $106E
;============== REMAPPER FOR $106F
;============== REMAPPER FOR $1070
;============== REMAPPER FOR $1071
;============== REMAPPER FOR $1072
;============== REMAPPER FOR $1073
;============== REMAPPER FOR $1074
;============== REMAPPER FOR $1075
;============== REMAPPER FOR $1076
;============== REMAPPER FOR $1077
;============== REMAPPER FOR $1078
;============== REMAPPER FOR $1079
;============== REMAPPER FOR $107A
;============== REMAPPER FOR $107B
;============== REMAPPER FOR $107C
;============== REMAPPER FOR $107D
;============== REMAPPER FOR $107E
;============== REMAPPER FOR $107F
;============== REMAPPER FOR $1080
;============== REMAPPER FOR $1081
;============== REMAPPER FOR $1082
;============== REMAPPER FOR $1083
;============== REMAPPER FOR $1084
;============== REMAPPER FOR $1085
;============== REMAPPER FOR $1086
;============== REMAPPER FOR $1087
;============== REMAPPER FOR $1088
;============== REMAPPER FOR $1089
;============== REMAPPER FOR $108A
;============== REMAPPER FOR $108B
;============== REMAPPER FOR $108C
;============== REMAPPER FOR $108D
;============== REMAPPER FOR $108E
;============== REMAPPER FOR $108F
;============== REMAPPER FOR $1090
;============== REMAPPER FOR $1091
;============== REMAPPER FOR $1092
;============== REMAPPER FOR $1093
;============== REMAPPER FOR $1094
;============== REMAPPER FOR $1095
;============== REMAPPER FOR $1096
;============== REMAPPER FOR $1097
;============== REMAPPER FOR $1098
;============== REMAPPER FOR $1099
;============== REMAPPER FOR $109A
;============== REMAPPER FOR $109B
;============== REMAPPER FOR $109C
;============== REMAPPER FOR $109D
;============== REMAPPER FOR $109E
;============== REMAPPER FOR $109F
;============== REMAPPER FOR $10A0
;============== REMAPPER FOR $10A1
;============== REMAPPER FOR $10A2
;============== REMAPPER FOR $10A3
;============== REMAPPER FOR $10A4
;============== REMAPPER FOR $10A5
;============== REMAPPER FOR $10A6
;============== REMAPPER FOR $10A7
;============== REMAPPER FOR $10A8
;============== REMAPPER FOR $10A9
;============== REMAPPER FOR $10AA
;============== REMAPPER FOR $10AB
;============== REMAPPER FOR $10AC
;============== REMAPPER FOR $10AD
;============== REMAPPER FOR $10AE
;============== REMAPPER FOR $10AF
;============== REMAPPER FOR $10B0
;============== REMAPPER FOR $10B1
;============== REMAPPER FOR $10B2
;============== REMAPPER FOR $10B3
;============== REMAPPER FOR $10B4
;============== REMAPPER FOR $10B5
;============== REMAPPER FOR $10B6
;============== REMAPPER FOR $10B7
;============== REMAPPER FOR $10B8
;============== REMAPPER FOR $10B9
;============== REMAPPER FOR $10BA
;============== REMAPPER FOR $10BB
;============== REMAPPER FOR $10BC
;============== REMAPPER FOR $10BD
;============== REMAPPER FOR $10BE
;============== REMAPPER FOR $10BF
;============== REMAPPER FOR $10C0
;============== REMAPPER FOR $10C1
;============== REMAPPER FOR $10C2
;============== REMAPPER FOR $10C3
;============== REMAPPER FOR $10C4
;============== REMAPPER FOR $10C5
;============== REMAPPER FOR $10C6
;============== REMAPPER FOR $10C7
;============== REMAPPER FOR $10C8
;============== REMAPPER FOR $10C9
;============== REMAPPER FOR $10CA
;============== REMAPPER FOR $10CB
;============== REMAPPER FOR $10CC
;============== REMAPPER FOR $10CD
;============== REMAPPER FOR $10CE
;============== REMAPPER FOR $10CF
;============== REMAPPER FOR $10D0
;============== REMAPPER FOR $10D1
;============== REMAPPER FOR $10D2
;============== REMAPPER FOR $10D3
;============== REMAPPER FOR $10D4
;============== REMAPPER FOR $10D5
;============== REMAPPER FOR $10D6
;============== REMAPPER FOR $10D7
;============== REMAPPER FOR $10D8
;============== REMAPPER FOR $10D9
;============== REMAPPER FOR $10DA
;============== REMAPPER FOR $10DB
;============== REMAPPER FOR $10DC
;============== REMAPPER FOR $10DD
;============== REMAPPER FOR $10DE
;============== REMAPPER FOR $10DF
;============== REMAPPER FOR $10E0
;============== REMAPPER FOR $10E1
;============== REMAPPER FOR $10E2
;============== REMAPPER FOR $10E3
;============== REMAPPER FOR $10E4
;============== REMAPPER FOR $10E5
;============== REMAPPER FOR $10E6
;============== REMAPPER FOR $10E7
;============== REMAPPER FOR $10E8
;============== REMAPPER FOR $10E9
;============== REMAPPER FOR $10EA
;============== REMAPPER FOR $10EB
;============== REMAPPER FOR $10EC
;============== REMAPPER FOR $10ED
;============== REMAPPER FOR $10EE
;============== REMAPPER FOR $10EF
;============== REMAPPER FOR $10F0
;============== REMAPPER FOR $10F1
;============== REMAPPER FOR $10F2
;============== REMAPPER FOR $10F3
;============== REMAPPER FOR $10F4
;============== REMAPPER FOR $10F5
;============== REMAPPER FOR $10F6
;============== REMAPPER FOR $10F7
;============== REMAPPER FOR $10F8
;============== REMAPPER FOR $10F9
;============== REMAPPER FOR $10FA
;============== REMAPPER FOR $10FB
;============== REMAPPER FOR $10FC
;============== REMAPPER FOR $10FD
;============== REMAPPER FOR $10FE
;============== REMAPPER FOR $10FF
;============== REMAPPER FOR $1100
;============== REMAPPER FOR $1101
;============== REMAPPER FOR $1102
;============== REMAPPER FOR $1103
;============== REMAPPER FOR $1104
;============== REMAPPER FOR $1105
;============== REMAPPER FOR $1106
;============== REMAPPER FOR $1107
;============== REMAPPER FOR $1108
;============== REMAPPER FOR $1109
;============== REMAPPER FOR $110A
;============== REMAPPER FOR $110B
;============== REMAPPER FOR $110C
;============== REMAPPER FOR $110D
;============== REMAPPER FOR $110E
;============== REMAPPER FOR $110F
;============== REMAPPER FOR $1110
;============== REMAPPER FOR $1111
;============== REMAPPER FOR $1112
;============== REMAPPER FOR $1113
;============== REMAPPER FOR $1114
;============== REMAPPER FOR $1115
;============== REMAPPER FOR $1116
;============== REMAPPER FOR $1117
;============== REMAPPER FOR $1118
;============== REMAPPER FOR $1119
;============== REMAPPER FOR $111A
;============== REMAPPER FOR $111B
;============== REMAPPER FOR $111C
;============== REMAPPER FOR $111D
;============== REMAPPER FOR $111E
;============== REMAPPER FOR $111F
;============== REMAPPER FOR $1120
;============== REMAPPER FOR $1121
;============== REMAPPER FOR $1122
;============== REMAPPER FOR $1123
;============== REMAPPER FOR $1124
;============== REMAPPER FOR $1125
;============== REMAPPER FOR $1126
;============== REMAPPER FOR $1127
;============== REMAPPER FOR $1128
;============== REMAPPER FOR $1129
;============== REMAPPER FOR $112A
;============== REMAPPER FOR $112B
;============== REMAPPER FOR $112C
;============== REMAPPER FOR $112D
;============== REMAPPER FOR $112E
;============== REMAPPER FOR $112F
;============== REMAPPER FOR $1130
;============== REMAPPER FOR $1131
;============== REMAPPER FOR $1132
;============== REMAPPER FOR $1133
;============== REMAPPER FOR $1134
;============== REMAPPER FOR $1135
;============== REMAPPER FOR $1136
;============== REMAPPER FOR $1137
;============== REMAPPER FOR $1138
;============== REMAPPER FOR $1139
;============== REMAPPER FOR $113A
;============== REMAPPER FOR $113B
;============== REMAPPER FOR $113C
;============== REMAPPER FOR $113D
;============== REMAPPER FOR $113E
;============== REMAPPER FOR $113F
;============== REMAPPER FOR $1140
;============== REMAPPER FOR $1141
;============== REMAPPER FOR $1142
;============== REMAPPER FOR $1143
;============== REMAPPER FOR $1144
;============== REMAPPER FOR $1145
;============== REMAPPER FOR $1146
;============== REMAPPER FOR $1147
;============== REMAPPER FOR $1148
;============== REMAPPER FOR $1149
;============== REMAPPER FOR $114A
;============== REMAPPER FOR $114B
;============== REMAPPER FOR $114C
;============== REMAPPER FOR $114D
;============== REMAPPER FOR $114E
;============== REMAPPER FOR $114F
;============== REMAPPER FOR $1150
;============== REMAPPER FOR $1151
;============== REMAPPER FOR $1152
;============== REMAPPER FOR $1153
;============== REMAPPER FOR $1154
;============== REMAPPER FOR $1155
;============== REMAPPER FOR $1156
;============== REMAPPER FOR $1157
;============== REMAPPER FOR $1158
;============== REMAPPER FOR $1159
;============== REMAPPER FOR $115A
;============== REMAPPER FOR $115B
;============== REMAPPER FOR $115C
;============== REMAPPER FOR $115D
;============== REMAPPER FOR $115E
;============== REMAPPER FOR $115F
;============== REMAPPER FOR $1160
;============== REMAPPER FOR $1161
;============== REMAPPER FOR $1162
;============== REMAPPER FOR $1163
;============== REMAPPER FOR $1164
;============== REMAPPER FOR $1165
;============== REMAPPER FOR $1166
;============== REMAPPER FOR $1167
;============== REMAPPER FOR $1168
;============== REMAPPER FOR $1169
;============== REMAPPER FOR $116A
;============== REMAPPER FOR $116B
;============== REMAPPER FOR $116C
;============== REMAPPER FOR $116D
;============== REMAPPER FOR $116E
;============== REMAPPER FOR $116F
;============== REMAPPER FOR $1170
;============== REMAPPER FOR $1171
;============== REMAPPER FOR $1172
;============== REMAPPER FOR $1173
;============== REMAPPER FOR $1174
;============== REMAPPER FOR $1175
;============== REMAPPER FOR $1176
;============== REMAPPER FOR $1177
;============== REMAPPER FOR $1178
;============== REMAPPER FOR $1179
;============== REMAPPER FOR $117A
;============== REMAPPER FOR $117B
;============== REMAPPER FOR $117C
;============== REMAPPER FOR $117D
;============== REMAPPER FOR $117E
;============== REMAPPER FOR $117F
;============== REMAPPER FOR $1180
;============== REMAPPER FOR $1181
;============== REMAPPER FOR $1182
;============== REMAPPER FOR $1183
;============== REMAPPER FOR $1184
;============== REMAPPER FOR $1185
;============== REMAPPER FOR $1186
;============== REMAPPER FOR $1187
;============== REMAPPER FOR $1188
;============== REMAPPER FOR $1189
;============== REMAPPER FOR $118A
;============== REMAPPER FOR $118B
;============== REMAPPER FOR $118C
;============== REMAPPER FOR $118D
;============== REMAPPER FOR $118E
;============== REMAPPER FOR $118F
;============== REMAPPER FOR $1190
;============== REMAPPER FOR $1191
;============== REMAPPER FOR $1192
;============== REMAPPER FOR $1193
;============== REMAPPER FOR $1194
;============== REMAPPER FOR $1195
;============== REMAPPER FOR $1196
;============== REMAPPER FOR $1197
;============== REMAPPER FOR $1198
;============== REMAPPER FOR $1199
;============== REMAPPER FOR $119A
;============== REMAPPER FOR $119B
;============== REMAPPER FOR $119C
;============== REMAPPER FOR $119D
;============== REMAPPER FOR $119E
;============== REMAPPER FOR $119F
;============== REMAPPER FOR $11A0
;============== REMAPPER FOR $11A1
;============== REMAPPER FOR $11A2
;============== REMAPPER FOR $11A3
;============== REMAPPER FOR $11A4
;============== REMAPPER FOR $11A5
;============== REMAPPER FOR $11A6
;============== REMAPPER FOR $11A7
;============== REMAPPER FOR $11A8
;============== REMAPPER FOR $11A9
;============== REMAPPER FOR $11AA
;============== REMAPPER FOR $11AB
;============== REMAPPER FOR $11AC
;============== REMAPPER FOR $11AD
;============== REMAPPER FOR $11AE
;============== REMAPPER FOR $11AF
;============== REMAPPER FOR $11B0
;============== REMAPPER FOR $11B1
;============== REMAPPER FOR $11B2
;============== REMAPPER FOR $11B3
;============== REMAPPER FOR $11B4
;============== REMAPPER FOR $11B5
;============== REMAPPER FOR $11B6
;============== REMAPPER FOR $11B7
;============== REMAPPER FOR $11B8
;============== REMAPPER FOR $11B9
;============== REMAPPER FOR $11BA
;============== REMAPPER FOR $11BB
;============== REMAPPER FOR $11BC
;============== REMAPPER FOR $11BD
;============== REMAPPER FOR $11BE
;============== REMAPPER FOR $11BF
;============== REMAPPER FOR $11C0
;============== REMAPPER FOR $11C1
;============== REMAPPER FOR $11C2
;============== REMAPPER FOR $11C3
;============== REMAPPER FOR $11C4
;============== REMAPPER FOR $11C5
;============== REMAPPER FOR $11C6
;============== REMAPPER FOR $11C7
;============== REMAPPER FOR $11C8
;============== REMAPPER FOR $11C9
;============== REMAPPER FOR $11CA
;============== REMAPPER FOR $11CB
;============== REMAPPER FOR $11CC
;============== REMAPPER FOR $11CD
;============== REMAPPER FOR $11CE
;============== REMAPPER FOR $11CF
;============== REMAPPER FOR $11D0
;============== REMAPPER FOR $11D1
;============== REMAPPER FOR $11D2
;============== REMAPPER FOR $11D3
;============== REMAPPER FOR $11D4
;============== REMAPPER FOR $11D5
;============== REMAPPER FOR $11D6
;============== REMAPPER FOR $11D7
;============== REMAPPER FOR $11D8
;============== REMAPPER FOR $11D9
;============== REMAPPER FOR $11DA
;============== REMAPPER FOR $11DB
;============== REMAPPER FOR $11DC
;============== REMAPPER FOR $11DD
;============== REMAPPER FOR $11DE
;============== REMAPPER FOR $11DF
;============== REMAPPER FOR $11E0
;============== REMAPPER FOR $11E1
;============== REMAPPER FOR $11E2
;============== REMAPPER FOR $11E3
;============== REMAPPER FOR $11E4
;============== REMAPPER FOR $11E5
;============== REMAPPER FOR $11E6
;============== REMAPPER FOR $11E7
;============== REMAPPER FOR $11E8
;============== REMAPPER FOR $11E9
;============== REMAPPER FOR $11EA
;============== REMAPPER FOR $11EB
;============== REMAPPER FOR $11EC
;============== REMAPPER FOR $11ED
;============== REMAPPER FOR $11EE
;============== REMAPPER FOR $11EF
;============== REMAPPER FOR $11F0
;============== REMAPPER FOR $11F1
;============== REMAPPER FOR $11F2
;============== REMAPPER FOR $11F3
;============== REMAPPER FOR $11F4
;============== REMAPPER FOR $11F5
;============== REMAPPER FOR $11F6
;============== REMAPPER FOR $11F7
;============== REMAPPER FOR $11F8
;============== REMAPPER FOR $11F9
;============== REMAPPER FOR $11FA
;============== REMAPPER FOR $11FB
;============== REMAPPER FOR $11FC
;============== REMAPPER FOR $11FD
;============== REMAPPER FOR $11FE
;============== REMAPPER FOR $11FF
;============== REMAPPER FOR $1200
;============== REMAPPER FOR $1201
;============== REMAPPER FOR $1202
;============== REMAPPER FOR $1203
;============== REMAPPER FOR $1204
;============== REMAPPER FOR $1205
;============== REMAPPER FOR $1206
;============== REMAPPER FOR $1207
;============== REMAPPER FOR $1208
;============== REMAPPER FOR $1209
;============== REMAPPER FOR $120A
;============== REMAPPER FOR $120B
;============== REMAPPER FOR $120C
;============== REMAPPER FOR $120D
;============== REMAPPER FOR $120E
;============== REMAPPER FOR $120F
;============== REMAPPER FOR $1210
;============== REMAPPER FOR $1211
;============== REMAPPER FOR $1212
;============== REMAPPER FOR $1213
;============== REMAPPER FOR $1214
;============== REMAPPER FOR $1215
;============== REMAPPER FOR $1216
;============== REMAPPER FOR $1217
;============== REMAPPER FOR $1218
;============== REMAPPER FOR $1219
;============== REMAPPER FOR $121A
;============== REMAPPER FOR $121B
;============== REMAPPER FOR $121C
;============== REMAPPER FOR $121D
;============== REMAPPER FOR $121E
;============== REMAPPER FOR $121F
;============== REMAPPER FOR $1220
;============== REMAPPER FOR $1221
;============== REMAPPER FOR $1222
;============== REMAPPER FOR $1223
;============== REMAPPER FOR $1224
;============== REMAPPER FOR $1225
;============== REMAPPER FOR $1226
;============== REMAPPER FOR $1227
;============== REMAPPER FOR $1228
;============== REMAPPER FOR $1229
;============== REMAPPER FOR $122A
;============== REMAPPER FOR $122B
;============== REMAPPER FOR $122C
;============== REMAPPER FOR $122D
;============== REMAPPER FOR $122E
;============== REMAPPER FOR $122F
;============== REMAPPER FOR $1230
;============== REMAPPER FOR $1231
;============== REMAPPER FOR $1232
;============== REMAPPER FOR $1233
;============== REMAPPER FOR $1234
;============== REMAPPER FOR $1235
;============== REMAPPER FOR $1236
;============== REMAPPER FOR $1237
;============== REMAPPER FOR $1238
;============== REMAPPER FOR $1239
;============== REMAPPER FOR $123A
;============== REMAPPER FOR $123B
;============== REMAPPER FOR $123C
;============== REMAPPER FOR $123D
;============== REMAPPER FOR $123E
;============== REMAPPER FOR $123F
;============== REMAPPER FOR $1240
;============== REMAPPER FOR $1241
;============== REMAPPER FOR $1242
;============== REMAPPER FOR $1243
;============== REMAPPER FOR $1244
;============== REMAPPER FOR $1245
;============== REMAPPER FOR $1246
;============== REMAPPER FOR $1247
;============== REMAPPER FOR $1248
;============== REMAPPER FOR $1249
;============== REMAPPER FOR $124A
;============== REMAPPER FOR $124B
;============== REMAPPER FOR $124C
;============== REMAPPER FOR $124D
;============== REMAPPER FOR $124E
;============== REMAPPER FOR $124F
;============== REMAPPER FOR $1250
;============== REMAPPER FOR $1251
;============== REMAPPER FOR $1252
;============== REMAPPER FOR $1253
;============== REMAPPER FOR $1254
;============== REMAPPER FOR $1255
;============== REMAPPER FOR $1256
;============== REMAPPER FOR $1257
;============== REMAPPER FOR $1258
;============== REMAPPER FOR $1259
;============== REMAPPER FOR $125A
;============== REMAPPER FOR $125B
;============== REMAPPER FOR $125C
;============== REMAPPER FOR $125D
;============== REMAPPER FOR $125E
;============== REMAPPER FOR $125F
;============== REMAPPER FOR $1260
;============== REMAPPER FOR $1261
;============== REMAPPER FOR $1262
;============== REMAPPER FOR $1263
;============== REMAPPER FOR $1264
;============== REMAPPER FOR $1265
;============== REMAPPER FOR $1266
;============== REMAPPER FOR $1267
;============== REMAPPER FOR $1268
;============== REMAPPER FOR $1269
;============== REMAPPER FOR $126A
;============== REMAPPER FOR $126B
;============== REMAPPER FOR $126C
;============== REMAPPER FOR $126D
;============== REMAPPER FOR $126E
;============== REMAPPER FOR $126F
;============== REMAPPER FOR $1270
;============== REMAPPER FOR $1271
;============== REMAPPER FOR $1272
;============== REMAPPER FOR $1273
;============== REMAPPER FOR $1274
;============== REMAPPER FOR $1275
;============== REMAPPER FOR $1276
;============== REMAPPER FOR $1277
;============== REMAPPER FOR $1278
;============== REMAPPER FOR $1279
;============== REMAPPER FOR $127A
;============== REMAPPER FOR $127B
;============== REMAPPER FOR $127C
;============== REMAPPER FOR $127D
;============== REMAPPER FOR $127E
;============== REMAPPER FOR $127F
;============== REMAPPER FOR $1280
;============== REMAPPER FOR $1281
;============== REMAPPER FOR $1282
;============== REMAPPER FOR $1283
;============== REMAPPER FOR $1284
;============== REMAPPER FOR $1285
;============== REMAPPER FOR $1286
;============== REMAPPER FOR $1287
;============== REMAPPER FOR $1288
;============== REMAPPER FOR $1289
;============== REMAPPER FOR $128A
;============== REMAPPER FOR $128B
;============== REMAPPER FOR $128C
;============== REMAPPER FOR $128D
;============== REMAPPER FOR $128E
;============== REMAPPER FOR $128F
;============== REMAPPER FOR $1290
;============== REMAPPER FOR $1291
;============== REMAPPER FOR $1292
;============== REMAPPER FOR $1293
;============== REMAPPER FOR $1294
;============== REMAPPER FOR $1295
;============== REMAPPER FOR $1296
;============== REMAPPER FOR $1297
;============== REMAPPER FOR $1298
;============== REMAPPER FOR $1299
;============== REMAPPER FOR $129A
;============== REMAPPER FOR $129B
;============== REMAPPER FOR $129C
;============== REMAPPER FOR $129D
;============== REMAPPER FOR $129E
;============== REMAPPER FOR $129F
;============== REMAPPER FOR $12A0
;============== REMAPPER FOR $12A1
;============== REMAPPER FOR $12A2
;============== REMAPPER FOR $12A3
;============== REMAPPER FOR $12A4
;============== REMAPPER FOR $12A5
;============== REMAPPER FOR $12A6
;============== REMAPPER FOR $12A7
;============== REMAPPER FOR $12A8
;============== REMAPPER FOR $12A9
;============== REMAPPER FOR $12AA
;============== REMAPPER FOR $12AB
;============== REMAPPER FOR $12AC
;============== REMAPPER FOR $12AD
;============== REMAPPER FOR $12AE
;============== REMAPPER FOR $12AF
;============== REMAPPER FOR $12B0
;============== REMAPPER FOR $12B1
;============== REMAPPER FOR $12B2
;============== REMAPPER FOR $12B3
;============== REMAPPER FOR $12B4
;============== REMAPPER FOR $12B5
;============== REMAPPER FOR $12B6
;============== REMAPPER FOR $12B7
;============== REMAPPER FOR $12B8
;============== REMAPPER FOR $12B9
;============== REMAPPER FOR $12BA
;============== REMAPPER FOR $12BB
;============== REMAPPER FOR $12BC
;============== REMAPPER FOR $12BD
;============== REMAPPER FOR $12BE
;============== REMAPPER FOR $12BF
;============== REMAPPER FOR $12C0
;============== REMAPPER FOR $12C1
;============== REMAPPER FOR $12C2
;============== REMAPPER FOR $12C3
;============== REMAPPER FOR $12C4
;============== REMAPPER FOR $12C5
;============== REMAPPER FOR $12C6
;============== REMAPPER FOR $12C7
;============== REMAPPER FOR $12C8
;============== REMAPPER FOR $12C9
;============== REMAPPER FOR $12CA
;============== REMAPPER FOR $12CB
;============== REMAPPER FOR $12CC
;============== REMAPPER FOR $12CD
;============== REMAPPER FOR $12CE
;============== REMAPPER FOR $12CF
;============== REMAPPER FOR $12D0
;============== REMAPPER FOR $12D1
;============== REMAPPER FOR $12D2
;============== REMAPPER FOR $12D3
;============== REMAPPER FOR $12D4
;============== REMAPPER FOR $12D5
;============== REMAPPER FOR $12D6
;============== REMAPPER FOR $12D7
;============== REMAPPER FOR $12D8
;============== REMAPPER FOR $12D9
;============== REMAPPER FOR $12DA
;============== REMAPPER FOR $12DB
;============== REMAPPER FOR $12DC
;============== REMAPPER FOR $12DD
;============== REMAPPER FOR $12DE
;============== REMAPPER FOR $12DF
;============== REMAPPER FOR $12E0
;============== REMAPPER FOR $12E1
;============== REMAPPER FOR $12E2
;============== REMAPPER FOR $12E3
;============== REMAPPER FOR $12E4
;============== REMAPPER FOR $12E5
;============== REMAPPER FOR $12E6
;============== REMAPPER FOR $12E7
;============== REMAPPER FOR $12E8
;============== REMAPPER FOR $12E9
;============== REMAPPER FOR $12EA
;============== REMAPPER FOR $12EB
;============== REMAPPER FOR $12EC
;============== REMAPPER FOR $12ED
;============== REMAPPER FOR $12EE
;============== REMAPPER FOR $12EF
;============== REMAPPER FOR $12F0
;============== REMAPPER FOR $12F1
;============== REMAPPER FOR $12F2
;============== REMAPPER FOR $12F3
;============== REMAPPER FOR $12F4
;============== REMAPPER FOR $12F5
;============== REMAPPER FOR $12F6
;============== REMAPPER FOR $12F7
;============== REMAPPER FOR $12F8
;============== REMAPPER FOR $12F9
;============== REMAPPER FOR $12FA
;============== REMAPPER FOR $12FB
;============== REMAPPER FOR $12FC
;============== REMAPPER FOR $12FD
;============== REMAPPER FOR $12FE
;============== REMAPPER FOR $12FF
;============== REMAPPER FOR $1300
;============== REMAPPER FOR $1301
;============== REMAPPER FOR $1302
;============== REMAPPER FOR $1303
;============== REMAPPER FOR $1304
;============== REMAPPER FOR $1305
;============== REMAPPER FOR $1306
;============== REMAPPER FOR $1307
;============== REMAPPER FOR $1308
;============== REMAPPER FOR $1309
;============== REMAPPER FOR $130A
;============== REMAPPER FOR $130B
;============== REMAPPER FOR $130C
;============== REMAPPER FOR $130D
;============== REMAPPER FOR $130E
;============== REMAPPER FOR $130F
;============== REMAPPER FOR $1310
;============== REMAPPER FOR $1311
;============== REMAPPER FOR $1312
;============== REMAPPER FOR $1313
;============== REMAPPER FOR $1314
;============== REMAPPER FOR $1315
;============== REMAPPER FOR $1316
;============== REMAPPER FOR $1317
;============== REMAPPER FOR $1318
;============== REMAPPER FOR $1319
;============== REMAPPER FOR $131A
;============== REMAPPER FOR $131B
;============== REMAPPER FOR $131C
;============== REMAPPER FOR $131D
;============== REMAPPER FOR $131E
;============== REMAPPER FOR $131F
;============== REMAPPER FOR $1320
;============== REMAPPER FOR $1321
;============== REMAPPER FOR $1322
;============== REMAPPER FOR $1323
;============== REMAPPER FOR $1324
;============== REMAPPER FOR $1325
;============== REMAPPER FOR $1326
;============== REMAPPER FOR $1327
;============== REMAPPER FOR $1328
;============== REMAPPER FOR $1329
;============== REMAPPER FOR $132A
;============== REMAPPER FOR $132B
;============== REMAPPER FOR $132C
;============== REMAPPER FOR $132D
;============== REMAPPER FOR $132E
;============== REMAPPER FOR $132F
;============== REMAPPER FOR $1330
;============== REMAPPER FOR $1331
;============== REMAPPER FOR $1332
;============== REMAPPER FOR $1333
;============== REMAPPER FOR $1334
;============== REMAPPER FOR $1335
;============== REMAPPER FOR $1336
;============== REMAPPER FOR $1337
;============== REMAPPER FOR $1338
;============== REMAPPER FOR $1339
;============== REMAPPER FOR $133A
;============== REMAPPER FOR $133B
;============== REMAPPER FOR $133C
;============== REMAPPER FOR $133D
;============== REMAPPER FOR $133E
;============== REMAPPER FOR $133F
;============== REMAPPER FOR $1340
;============== REMAPPER FOR $1341
;============== REMAPPER FOR $1342
;============== REMAPPER FOR $1343
;============== REMAPPER FOR $1344
;============== REMAPPER FOR $1345
;============== REMAPPER FOR $1346
;============== REMAPPER FOR $1347
;============== REMAPPER FOR $1348
;============== REMAPPER FOR $1349
;============== REMAPPER FOR $134A
;============== REMAPPER FOR $134B
;============== REMAPPER FOR $134C
;============== REMAPPER FOR $134D
;============== REMAPPER FOR $134E
;============== REMAPPER FOR $134F
;============== REMAPPER FOR $1350
;============== REMAPPER FOR $1351
;============== REMAPPER FOR $1352
;============== REMAPPER FOR $1353
;============== REMAPPER FOR $1354
;============== REMAPPER FOR $1355
;============== REMAPPER FOR $1356
;============== REMAPPER FOR $1357
;============== REMAPPER FOR $1358
;============== REMAPPER FOR $1359
;============== REMAPPER FOR $135A
;============== REMAPPER FOR $135B
;============== REMAPPER FOR $135C
;============== REMAPPER FOR $135D
;============== REMAPPER FOR $135E
;============== REMAPPER FOR $135F
;============== REMAPPER FOR $1360
;============== REMAPPER FOR $1361
;============== REMAPPER FOR $1362
;============== REMAPPER FOR $1363
;============== REMAPPER FOR $1364
;============== REMAPPER FOR $1365
;============== REMAPPER FOR $1366
;============== REMAPPER FOR $1367
;============== REMAPPER FOR $1368
;============== REMAPPER FOR $1369
;============== REMAPPER FOR $136A
;============== REMAPPER FOR $136B
;============== REMAPPER FOR $136C
;============== REMAPPER FOR $136D
;============== REMAPPER FOR $136E
;============== REMAPPER FOR $136F
;============== REMAPPER FOR $1370
;============== REMAPPER FOR $1371
;============== REMAPPER FOR $1372
;============== REMAPPER FOR $1373
;============== REMAPPER FOR $1374
;============== REMAPPER FOR $1375
;============== REMAPPER FOR $1376
;============== REMAPPER FOR $1377
;============== REMAPPER FOR $1378
;============== REMAPPER FOR $1379
;============== REMAPPER FOR $137A
;============== REMAPPER FOR $137B
;============== REMAPPER FOR $137C
;============== REMAPPER FOR $137D
;============== REMAPPER FOR $137E
;============== REMAPPER FOR $137F
;============== REMAPPER FOR $1380
;============== REMAPPER FOR $1381
;============== REMAPPER FOR $1382
;============== REMAPPER FOR $1383
;============== REMAPPER FOR $1384
;============== REMAPPER FOR $1385
;============== REMAPPER FOR $1386
;============== REMAPPER FOR $1387
;============== REMAPPER FOR $1388
;============== REMAPPER FOR $1389
;============== REMAPPER FOR $138A
;============== REMAPPER FOR $138B
;============== REMAPPER FOR $138C
;============== REMAPPER FOR $138D
;============== REMAPPER FOR $138E
;============== REMAPPER FOR $138F
;============== REMAPPER FOR $1390
;============== REMAPPER FOR $1391
;============== REMAPPER FOR $1392
;============== REMAPPER FOR $1393
;============== REMAPPER FOR $1394
;============== REMAPPER FOR $1395
;============== REMAPPER FOR $1396
;============== REMAPPER FOR $1397
;============== REMAPPER FOR $1398
;============== REMAPPER FOR $1399
;============== REMAPPER FOR $139A
;============== REMAPPER FOR $139B
;============== REMAPPER FOR $139C
;============== REMAPPER FOR $139D
;============== REMAPPER FOR $139E
;============== REMAPPER FOR $139F
;============== REMAPPER FOR $13A0
;============== REMAPPER FOR $13A1
;============== REMAPPER FOR $13A2
;============== REMAPPER FOR $13A3
;============== REMAPPER FOR $13A4
;============== REMAPPER FOR $13A5
;============== REMAPPER FOR $13A6
;============== REMAPPER FOR $13A7
;============== REMAPPER FOR $13A8
;============== REMAPPER FOR $13A9
;============== REMAPPER FOR $13AA
;============== REMAPPER FOR $13AB
;============== REMAPPER FOR $13AC
;============== REMAPPER FOR $13AD
;============== REMAPPER FOR $13AE
;============== REMAPPER FOR $13AF
;============== REMAPPER FOR $13B0
;============== REMAPPER FOR $13B1
;============== REMAPPER FOR $13B2
;============== REMAPPER FOR $13B3
;============== REMAPPER FOR $13B4
;============== REMAPPER FOR $13B5
;============== REMAPPER FOR $13B6
;============== REMAPPER FOR $13B7
;============== REMAPPER FOR $13B8
;============== REMAPPER FOR $13B9
;============== REMAPPER FOR $13BA
;============== REMAPPER FOR $13BB
;============== REMAPPER FOR $13BC
;============== REMAPPER FOR $13BD
;============== REMAPPER FOR $13BE
org $00C03B
	dw $73BE
org $0585B4
	dw $73BE
org $0DA5F5
	dw $73BE
org $0DA8E1
	dw $73BE
org $0DB2E1
	dw $73BE
org $0DB34F
	dw $73BE
;============== REMAPPER FOR $13BF
org $00A262
	dw $73BF
org $00CA09
	dw $73BF
org $00F3B3
	dw $73BF
org $00F3BA
	dw $73BF
org $01E527
	dw $73BF
org $01E5A1
	dw $73BF
org $048DD2
	dw $73BF
org $048E26
	dw $73BF
org $04E65D
	dw $73BF
org $05B1B5
	dw $73BF
org $05D8A0
	dw $73BF
org $05D9CA
	dw $73BF
org $05D9D5
	dw $73BF
org $05DA1A
	dw $73BF
org $05DA48
	dw $73BF
org $05DAE2
	dw $73BF
org $0DA58A
	dw $73BF
org $0DA591
	dw $73BF
org $0DA68F
	dw $73BF
org $0DB2CB
	dw $73BF
org $0DB2D2
	dw $73BF
;============== REMAPPER FOR $13C0
;============== REMAPPER FOR $13C1
org $0096A2
	dw $73C1
org $048E9C
	dw $73C1
org $048F8D
	dw $73C1
org $04902F
	dw $73C1
org $049139
	dw $73C1
org $04914A
	dw $73C1
org $04915F
	dw $73C1
org $04917E
	dw $73C1
org $049266
	dw $73C1
org $049385
	dw $73C1
org $04955D
	dw $73C1
org $0495DF
	dw $73C1
org $04968E
	dw $73C1
org $0496A9
	dw $73C1
org $04E620
	dw $73C1
org $04FA44
	dw $73C1
org $04FB9E
	dw $73C1
;============== REMAPPER FOR $13C2
;============== REMAPPER FOR $13C3
org $04856B
	dw $73C3
org $049A33
	dw $73C3
org $049A56
	dw $73C3
org $049A6D
	dw $73C3
org $049AA3
	dw $73C3
org $049E0F
	dw $73C3
;============== REMAPPER FOR $13C4
org $049E12
	dw $73C4
;============== REMAPPER FOR $13C5
org $00F31C
	dw $73C5
;============== REMAPPER FOR $13C6
org $0081F8
	dw $73C6
org $00827D
	dw $73C6
org $009472
	dw $73C6
org $009502
	dw $73C6
org $009517
	dw $73C6
org $009584
	dw $73C6
org $00C740
	dw $73C6
org $00C927
	dw $73C6
org $00CA02
	dw $73C6
org $00CA21
	dw $73C6
org $01D049
	dw $73C6
org $01EA93
	dw $73C6
org $01EFCE
	dw $73C6
org $01FB26
	dw $73C6
org $038095
	dw $73C6
org $0398DF
	dw $73C6
org $03C79F
	dw $73C6
org $03CE92
	dw $73C6
org $048DE0
	dw $73C6
org $048DE8
	dw $73C6
org $048DEE
	dw $73C6
org $0CC95E
	dw $73C6
org $0CC99E
	dw $73C6
org $0CCB35
	dw $73C6
org $0CCC69
	dw $73C6
;============== REMAPPER FOR $13C7
org $00A0DB
	dw $73C7
org $00FCC6
	dw $73C7
org $01EB8E
	dw $73C7
org $0491D0
	dw $73C7
org $049DF2
	dw $73C7
;============== REMAPPER FOR $13C8
;============== REMAPPER FOR $13C9
org $009786
	dw $73C9
org $009B97
	dw $73C9
org $009E3B
	dw $73C9
org $00A0EF
	dw $73C9
org $048276
	dw $73C9
;============== REMAPPER FOR $13CA
org $048FEA
	dw $73CA
org $048FFC
	dw $73CA
org $04903D
	dw $73CA
org $04904D
	dw $73CA
;============== REMAPPER FOR $13CB
org $00A684
	dw $73CB
org $00C481
	dw $73CB
org $00C48A
	dw $73CB
org $00FB5D
	dw $73CB
;============== REMAPPER FOR $13CC
org $008F1E
	dw $73CC
org $008F23
	dw $73CC
org $05B334
	dw $73CC
org $05B337
	dw $73CC
org $05B34B
	dw $73CC
;============== REMAPPER FOR $13CD
org $00F2D9
	dw $73CD
org $05D9C4
	dw $73CD
;============== REMAPPER FOR $13CE
org $00CA2E
	dw $73CE
org $048F36
	dw $73CE
org $05B156
	dw $73CE
org $05D9C7
	dw $73CE
org $0DA69A
	dw $73CE
;============== REMAPPER FOR $13CF
org $00A6AD
	dw $73CF
org $00A737
	dw $73CF
org $05D79C
	dw $73CF
org $05D9DF
	dw $73CF
org $05DA61
	dw $73CF
;============== REMAPPER FOR $13D0
org $04E6B5
	dw $73D0
org $04EED4
	dw $73D0
org $04EF28
	dw $73D0
;============== REMAPPER FOR $13D1
org $04E68B
	dw $73D1
org $04EEC1
	dw $73D1
;============== REMAPPER FOR $13D2
org $00C92A
	dw $73D2
org $00C936
	dw $73D2
org $00C957
	dw $73D2
org $00EEB8
	dw $73D2
org $04826B
	dw $73D2
org $04F298
	dw $73D2
org $04F366
	dw $73D2
org $05B136
	dw $73D2
org $05B14B
	dw $73D2
org $05B1CB
	dw $73D2
org $05B288
	dw $73D2
;============== REMAPPER FOR $13D3
org $00A1B6
	dw $73D3
org $00A212
	dw $73D3
org $00A217
	dw $73D3
org $00A22F
	dw $73D3
;============== REMAPPER FOR $13D4
org $00A234
	dw $73D4
org $00A239
	dw $73D4
org $00A243
	dw $73D4
org $048296
	dw $73D4
org $0482E8
	dw $73D4
org $048384
	dw $73D4
org $048387
	dw $73D4
org $04839B
	dw $73D4
;============== REMAPPER FOR $13D5
org $0096EA
	dw $73D5
org $00A013
	dw $73D5
org $04980F
	dw $73D5
org $049819
	dw $73D5
org $05B246
	dw $73D5
org $05BC40
	dw $73D5
org $05CC87
	dw $73D5
;============== REMAPPER FOR $13D6
org $0096F2
	dw $73D6
org $05CDD6
	dw $73D6
org $05CF43
	dw $73D6
;============== REMAPPER FOR $13D7
org $0498CD
	dw $73D7
org $0498D0
	dw $73D7
;============== REMAPPER FOR $13D8
;============== REMAPPER FOR $13D9
org $008223
	dw $73D9
org $0096ED
	dw $73D9
org $00A174
	dw $73D9
org $00A50D
	dw $73D9
org $00A67E
	dw $73D9
org $048357
	dw $73D9
org $0483F8
	dw $73D9
org $048577
	dw $73D9
org $048701
	dw $73D9
org $048991
	dw $73D9
org $048D05
	dw $73D9
org $048F0E
	dw $73D9
org $048F5B
	dw $73D9
org $048F78
	dw $73D9
org $048FF7
	dw $73D9
org $049034
	dw $73D9
org $049178
	dw $73D9
org $049233
	dw $73D9
org $04940C
	dw $73D9
org $049465
	dw $73D9
org $049554
	dw $73D9
org $049641
	dw $73D9
org $0497F8
	dw $73D9
org $049834
	dw $73D9
org $0498F4
	dw $73D9
org $049DB2
	dw $73D9
org $049DCA
	dw $73D9
org $049E1C
	dw $73D9
org $049E41
	dw $73D9
org $049E4F
	dw $73D9
org $04DBD5
	dw $73D9
org $04E625
	dw $73D9
org $04E638
	dw $73D9
org $04EA05
	dw $73D9
org $04F885
	dw $73D9
org $05CC08
	dw $73D9
org $05CD29
	dw $73D9
org $05CDE1
	dw $73D9
org $05CF46
	dw $73D9
;============== REMAPPER FOR $13DA
org $00DB43
	dw $73DA
org $00DC57
	dw $73DA
org $00DC5A
	dw $73DA
org $00E9F4
	dw $73DA
;============== REMAPPER FOR $13DB
org $00CFE4
	dw $73DB
org $00D004
	dw $73DB
org $00D02B
	dw $73DB
org $00E35E
	dw $73DB
org $0CD667
	dw $73DB
org $0CD702
	dw $73DB
org $0CD824
	dw $73DB
;============== REMAPPER FOR $13DC
;============== REMAPPER FOR $13DD
org $00CD3A
	dw $73DD
org $00CFB8
	dw $73DD
org $00D709
	dw $73DD
org $019F75
	dw $73DD
org $01A0CE
	dw $73DD
;============== REMAPPER FOR $13DE
org $00C5B6
	dw $73DE
org $00C6EB
	dw $73DE
org $00C899
	dw $73DE
org $00C91C
	dw $73DE
org $00CCCE
	dw $73DE
org $00CFD0
	dw $73DE
org $00D008
	dw $73DE
org $00D19B
	dw $73DE
;============== REMAPPER FOR $13DF
org $00A71F
	dw $73DF
org $00CEB7
	dw $73DF
org $00CF0B
	dw $73DF
org $00CF33
	dw $73DF
org $00D207
	dw $73DF
org $00DB1C
	dw $73DF
org $00E421
	dw $73DF
;============== REMAPPER FOR $13E0
org $00C7EE
	dw $73E0
org $00CA3B
	dw $73E0
org $00CCDD
	dw $73E0
org $00CDA6
	dw $73E0
org $00CDC7
	dw $73E0
org $00D031
	dw $73E0
org $00D0BB
	dw $73E0
org $00D135
	dw $73E0
org $00D185
	dw $73E0
org $00D1B0
	dw $73E0
org $00D22B
	dw $73E0
org $00DAA6
	dw $73E0
org $00DB93
	dw $73E0
org $00DBCE
	dw $73E0
org $00E327
	dw $73E0
org $00E3A7
	dw $73E0
org $00E407
	dw $73E0
org $0CA20D
	dw $73E0
org $0CA6C7
	dw $73E0
org $0CD67E
	dw $73E0
org $0CD765
	dw $73E0
org $0CD7B8
	dw $73E0
;============== REMAPPER FOR $13E1
org $00CF56
	dw $73E1
org $00D69E
	dw $73E1
org $00D6C9
	dw $73E1
org $00D6D0
	dw $73E1
org $00D6F1
	dw $73E1
org $00D73D
	dw $73E1
org $00D76C
	dw $73E1
org $00EAAC
	dw $73E1
org $00EF09
	dw $73E1
;============== REMAPPER FOR $13E2
org $00C871
	dw $73E2
org $00D096
	dw $73E2
org $00D099
	dw $73E2
org $00D0A1
	dw $73E2
org $00D654
	dw $73E2
;============== REMAPPER FOR $13E3
org $00D01B
	dw $73E3
org $00DC32
	dw $73E3
org $00E32C
	dw $73E3
org $00E331
	dw $73E3
org $00EAE2
	dw $73E3
org $00EB04
	dw $73E3
org $00EB17
	dw $73E3
org $00EB3F
	dw $73E3
org $00EB43
	dw $73E3
org $00EB74
	dw $73E3
org $00F04A
	dw $73E3
org $00F5CA
	dw $73E3
org $00F82D
	dw $73E3
;============== REMAPPER FOR $13E4
org $00CCB6
	dw $73E4
org $00D66B
	dw $73E4
org $00D96B
	dw $73E4
org $00D97D
	dw $73E4
;============== REMAPPER FOR $13E5
org $00CFE1
	dw $73E5
org $00CFF9
	dw $73E5
org $00EA29
	dw $73E5
org $00EAA7
	dw $73E5
org $00EC62
	dw $73E5
org $00EF1D
	dw $73E5
;============== REMAPPER FOR $13E6
;============== REMAPPER FOR $13E7
;============== REMAPPER FOR $13E8
org $00CCCB
	dw $73E8
org $00D047
	dw $73E8
org $00D609
	dw $73E8
org $00DA3A
	dw $73E8
org $0294F6
	dw $73E8
;============== REMAPPER FOR $13E9
org $00D054
	dw $73E9
org $029517
	dw $73E9
org $02951D
	dw $73E9
org $029567
	dw $73E9
org $0295C9
	dw $73E9
org $029697
	dw $73E9
;============== REMAPPER FOR $13EA
org $029520
	dw $73EA
org $029525
	dw $73EA
org $029572
	dw $73EA
org $0295D4
	dw $73EA
org $02969F
	dw $73EA
;============== REMAPPER FOR $13EB
org $00D05D
	dw $73EB
org $029528
	dw $73EB
org $02952E
	dw $73EB
org $02954D
	dw $73EB
org $0295AF
	dw $73EB
org $0296AA
	dw $73EB
;============== REMAPPER FOR $13EC
org $029531
	dw $73EC
org $029536
	dw $73EC
org $02955A
	dw $73EC
org $0295BC
	dw $73EC
org $0296AF
	dw $73EC
;============== REMAPPER FOR $13ED
org $00C5B9
	dw $73ED
org $00C91F
	dw $73ED
org $00CF4F
	dw $73ED
org $00D170
	dw $73ED
org $00D17D
	dw $73ED
org $00D182
	dw $73ED
org $00D5FC
	dw $73ED
org $00D680
	dw $73ED
org $00D683
	dw $73ED
org $00D68E
	dw $73ED
org $00D6B2
	dw $73ED
org $00D7F9
	dw $73ED
org $00D800
	dw $73ED
org $00D989
	dw $73ED
org $00D9A9
	dw $73ED
org $00DA02
	dw $73ED
org $00EEE7
	dw $73ED
org $00EEFC
	dw $73ED
org $00EF03
	dw $73ED
org $00EFAB
	dw $73ED
org $01A8E7
	dw $73ED
;============== REMAPPER FOR $13EE
org $00D696
	dw $73EE
org $00EAAF
	dw $73EE
org $00EEF0
	dw $73EE
;============== REMAPPER FOR $13EF
org $00E939
	dw $73EF
org $00E93E
	dw $73EF
org $00E979
	dw $73EF
org $00EDB7
	dw $73EF
org $00EED2
	dw $73EF
org $00EF66
	dw $73EF
;============== REMAPPER FOR $13F0
org $00DB69
	dw $73F0
org $00DBB8
	dw $73F0
;============== REMAPPER FOR $13F1
org $00A6D3
	dw $73F1
org $00F865
	dw $73F1
org $00F86A
	dw $73F1
org $00F86D
	dw $73F1
org $00F8A8
	dw $73F1
;============== REMAPPER FOR $13F2
;============== REMAPPER FOR $13F3
org $00CD3D
	dw $73F3
org $00CDA1
	dw $73F3
org $00F20C
	dw $73F3
org $00F213
	dw $73F3
org $00F216
	dw $73F3
org $00F24C
	dw $73F3
org $00F83D
	dw $73F3
org $00FA81
	dw $73F3
org $019FBC
	dw $73F3
org $019FC5
	dw $73F3
org $01C2EE
	dw $73F3
org $01C302
	dw $73F3
org $01ED96
	dw $73F3
org $028040
	dw $73F3
;============== REMAPPER FOR $13F4
org $00A661
	dw $73F4
;============== REMAPPER FOR $13F5
org $00A664
	dw $73F5
;============== REMAPPER FOR $13F6
org $00A667
	dw $73F6
;============== REMAPPER FOR $13F7
org $00A66A
	dw $73F7
;============== REMAPPER FOR $13F8
org $00A66D
	dw $73F8
;============== REMAPPER FOR $13F9
org $0097F4
	dw $73F9
org $00D234
	dw $73F9
org $00D26B
	dw $73F9
org $00D28D
	dw $73F9
org $00D2AB
	dw $73F9
org $00DB82
	dw $73F9
org $00E3C3
	dw $73F9
org $00E449
	dw $73F9
org $00EA35
	dw $73F9
org $00EA40
	dw $73F9
org $00FF01
	dw $73F9
org $01A81D
	dw $73F9
org $01BB2C
	dw $73F9
org $01BB31
	dw $73F9
org $0293DA
	dw $73F9
org $02A3F7
	dw $73F9
org $03AC1D
	dw $73F9
org $0485CD
	dw $73F9
org $0CA765
	dw $73F9
;============== REMAPPER FOR $13FA
org $00D9BF
	dw $73FA
org $00D9F2
	dw $73FA
org $00EA43
	dw $73FA
org $00EA76
	dw $73FA
;============== REMAPPER FOR $13FB
org $00C492
	dw $73FB
org $00C4F9
	dw $73FB
org $00E37F
	dw $73FB
org $01CDAC
	dw $73FB
org $01D451
	dw $73FB
org $01E21B
	dw $73FB
org $01EBCB
	dw $73FB
org $01EC1E
	dw $73FB
org $01EC27
	dw $73FB
org $01EC79
	dw $73FB
org $01F030
	dw $73FB
org $0283EA
	dw $73FB
org $028431
	dw $73FB
;============== REMAPPER FOR $13FC
org $008364
	dw $73FC
org $0097E5
	dw $73FC
org $00995E
	dw $73FC
org $009A61
	dw $73FC
org $00F8FE
	dw $73FC
org $03DD84
	dw $73FC
org $03DD9F
	dw $73FC
;============== REMAPPER FOR $13FD
org $00CDE6
	dw $73FD
org $00CE28
	dw $73FD
org $00CE6E
	dw $73FD
org $00F8AC
	dw $73FD
;============== REMAPPER FOR $13FE
org $00CDE3
	dw $73FE
org $00CDF2
	dw $73FE
org $00CE46
	dw $73FE
org $00CE6B
	dw $73FE
;============== REMAPPER FOR $13FF
org $00CE52
	dw $73FF
org $00CE63
	dw $73FF
org $00F8B3
	dw $73FF
;============== REMAPPER FOR $1400
org $00CDED
	dw $7400
org $00CE74
	dw $7400
org $00F8DC
	dw $7400
;============== REMAPPER FOR $1401
org $00CE0C
	dw $7401
org $00CE0F
	dw $7401
org $00CE4A
	dw $7401
;============== REMAPPER FOR $1402
org $00C590
	dw $7402
org $00EC70
	dw $7402
org $02915A
	dw $7402
;============== REMAPPER FOR $1403
org $009FD2
	dw $7403
org $00DA56
	dw $7403
org $00DA6D
	dw $7403
org $05BC4D
	dw $7403
org $05C40D
	dw $7403
;============== REMAPPER FOR $1404
org $009710
	dw $7404
org $00F826
	dw $7404
org $00F876
	dw $7404
org $00F87F
	dw $7404
;============== REMAPPER FOR $1405
org $00D24C
	dw $7405
org $01EBA5
	dw $7405
;============== REMAPPER FOR $1406
org $00EF70
	dw $7406
org $00F02E
	dw $7406
org $00F843
	dw $7406
org $01E6A5
	dw $7406
;============== REMAPPER FOR $1407
org $00CFA7
	dw $7407
org $00D175
	dw $7407
org $00D17A
	dw $7407
org $00D6B7
	dw $7407
org $00D7E5
	dw $7407
org $00D840
	dw $7407
org $00D862
	dw $7407
org $00D86E
	dw $7407
org $00D882
	dw $7407
org $00D98E
	dw $7407
org $00EF7A
	dw $7407
org $00EF9D
	dw $7407
org $00F5DE
	dw $7407
org $00F623
	dw $7407
org $01A9C8
	dw $7407
;============== REMAPPER FOR $1408
org $00D82C
	dw $7408
org $00D852
	dw $7408
org $00D87F
	dw $7408
;============== REMAPPER FOR $1409
org $00D81B
	dw $7409
org $00D873
	dw $7409
org $00D8A0
	dw $7409
org $00D8B0
	dw $7409
org $00D8B7
	dw $7409
org $00D960
	dw $7409
org $00D965
	dw $7409
;============== REMAPPER FOR $140A
org $00D950
	dw $740A
;============== REMAPPER FOR $140B
;============== REMAPPER FOR $140C
;============== REMAPPER FOR $140D
org $00C8F6
	dw $740D
org $00CF17
	dw $740D
org $00D072
	dw $740D
org $00D091
	dw $740D
org $00D647
	dw $740D
org $00D7F4
	dw $740D
org $00D991
	dw $740D
org $00DB1F
	dw $740D
org $00EA8B
	dw $740D
org $00EE6C
	dw $740D
org $00EF73
	dw $740D
org $00F5EA
	dw $740D
org $00F619
	dw $740D
org $01A8D1
	dw $740D
org $01A91D
	dw $740D
org $01AA43
	dw $740D
org $01E696
	dw $740D
org $0395AC
	dw $740D
;============== REMAPPER FOR $140E
org $00EAB6
	dw $740E
org $00EF40
	dw $740E
org $05C858
	dw $740E
;============== REMAPPER FOR $140F
org $01C620
	dw $740F
org $029932
	dw $740F
org $029956
	dw $740F
org $02A355
	dw $740F
org $02A578
	dw $740F
org $039891
	dw $740F
;============== REMAPPER FOR $1410
org $00F834
	dw $7410
org $01EBD1
	dw $7410
org $01EEE0
	dw $7410
org $01F0AD
	dw $7410
;============== REMAPPER FOR $1411
org $009956
	dw $7411
org $00C990
	dw $7411
org $00CDDE
	dw $7411
org $00E9CF
	dw $7411
org $00F714
	dw $7411
org $00F767
	dw $7411
org $01CE26
	dw $7411
org $0585C3
	dw $7411
org $05BD37
	dw $7411
org $05BEA7
	dw $7411
org $05BF98
	dw $7411
org $05BFBB
	dw $7411
org $05C006
	dw $7411
org $05D926
	dw $7411
org $05DA9F
	dw $7411
;============== REMAPPER FOR $1412
org $00F7F5
	dw $7412
org $00F85F
	dw $7412
org $0585C8
	dw $7412
org $05D9B6
	dw $7412
org $05DA15
	dw $7412
;============== REMAPPER FOR $1413
org $00F79E
	dw $7413
org $05C023
	dw $7413
org $05D91A
	dw $7413
org $05DA99
	dw $7413
;============== REMAPPER FOR $1414
org $00A799
	dw $7414
org $00F7AB
	dw $7414
org $05BF0B
	dw $7414
org $05D921
	dw $7414
org $05DA0A
	dw $7414
org $05DA9C
	dw $7414
;============== REMAPPER FOR $1415
;============== REMAPPER FOR $1416
;============== REMAPPER FOR $1417
org $00A7B7
	dw $7417
org $00F7BE
	dw $7417
;============== REMAPPER FOR $1418
;============== REMAPPER FOR $1419
org $00A690
	dw $7419
org $00A724
	dw $7419
org $00A749
	dw $7419
org $00D26E
	dw $7419
org $00D2AE
	dw $7419
org $00F432
	dw $7419
org $019F7A
	dw $7419
org $019F8A
	dw $7419
org $019FEA
	dw $7419
org $01A009
	dw $7419
org $01A0C5
	dw $7419
org $01EB34
	dw $7419
org $01EBA0
	dw $7419
org $01EC0A
	dw $7419
org $01EE6D
	dw $7419
org $01EE7E
	dw $7419
org $01EF5D
	dw $7419
org $01F405
	dw $7419
;============== REMAPPER FOR $141A
org $008141
	dw $741A
org $0091A7
	dw $741A
org $009697
	dw $741A
org $0096DC
	dw $741A
org $00A6A5
	dw $741A
org $00D274
	dw $741A
org $05857F
	dw $741A
org $05D7AC
	dw $741A
org $05D9B9
	dw $741A
org $05DA39
	dw $741A
org $05DAD8
	dw $741A
org $05DBC6
	dw $741A
;============== REMAPPER FOR $141B
org $00A672
	dw $741B
org $00F227
	dw $741B
;============== REMAPPER FOR $141C
org $00C9D2
	dw $741C
org $01C0ED
	dw $741C
;============== REMAPPER FOR $141D
org $008144
	dw $741D
org $00969A
	dw $741D
org $0096E1
	dw $741D
org $00A6A2
	dw $741D
org $00C8FC
	dw $741D
org $05DA3E
	dw $741D
;============== REMAPPER FOR $141E
org $00CDCA
	dw $741E
org $00D8D9
	dw $741E
org $00F850
	dw $741E
org $00FC39
	dw $741E
org $01A2B9
	dw $741E
org $01EBCE
	dw $741E
org $01EBD4
	dw $741E
org $01F153
	dw $741E
org $01F199
	dw $741E
org $01F6D5
	dw $741E
org $03C060
	dw $741E
;============== REMAPPER FOR $141F
org $00A6A8
	dw $741F
org $05D93E
	dw $741F
org $05DA43
	dw $741F
;============== REMAPPER FOR $1420
org $00F378
	dw $7420
org $00F37B
	dw $7420
;============== REMAPPER FOR $1421
org $00F295
	dw $7421
org $00F29B
	dw $7421
org $00F2A0
	dw $7421
org $00F2AA
	dw $7421
;============== REMAPPER FOR $1422
org $008FD9
	dw $7422
org $00F344
	dw $7422
org $00F347
	dw $7422
org $05DB41
	dw $7422
;============== REMAPPER FOR $1423
org $00EE90
	dw $7423
org $00F468
	dw $7423
org $00F568
	dw $7423
;============== REMAPPER FOR $1424
org $05CD2E
	dw $7424
org $05CD7C
	dw $7424
org $05CDDE
	dw $7424
org $05CFA5
	dw $7424
;============== REMAPPER FOR $1425
org $008135
	dw $7425
org $008F68
	dw $7425
org $0091B9
	dw $7425
org $009692
	dw $7425
org $00A1E5
	dw $7425
org $00A834
	dw $7425
org $00C51A
	dw $7425
org $00C9E2
	dw $7425
org $00C9E9
	dw $7425
org $05D7A4
	dw $7425
org $05DADD
	dw $7425
;============== REMAPPER FOR $1426
org $00A1DB
	dw $7426
org $00C968
	dw $7426
org $01E76C
	dw $7426
org $01EC3E
	dw $7426
org $038D91
	dw $7426
org $05B11E
	dw $7426
org $05B1B0
	dw $7426
org $05B1BD
	dw $7426
;============== REMAPPER FOR $1427
org $03A310
	dw $7427
org $03A318
	dw $7427
org $03A6BD
	dw $7427
org $03AB67
	dw $7427
org $03DF9C
	dw $7427
;============== REMAPPER FOR $1428
org $03A297
	dw $7428
org $03DF07
	dw $7428
;============== REMAPPER FOR $1429
org $03A283
	dw $7429
org $03E037
	dw $7429
;============== REMAPPER FOR $142A
org $00A7BD
	dw $742A
org $00CE19
	dw $742A
org $00CE25
	dw $742A
org $00CE57
	dw $742A
org $00CE71
	dw $742A
org $00F6E1
	dw $742A
org $00F722
	dw $742A
org $00F775
	dw $742A
org $00F8BA
	dw $742A
;============== REMAPPER FOR $142B
;============== REMAPPER FOR $142C
org $00F6E8
	dw $742C
org $00F72E
	dw $742C
org $00F77D
	dw $742C
;============== REMAPPER FOR $142D
;============== REMAPPER FOR $142E
org $00F6EF
	dw $742E
;============== REMAPPER FOR $142F
;============== REMAPPER FOR $1430
org $0192F0
	dw $7430
org $05820D
	dw $7430
org $058284
	dw $7430
;============== REMAPPER FOR $1431
org $0192F5
	dw $7431
org $058212
	dw $7431
org $058287
	dw $7431
;============== REMAPPER FOR $1432
org $02895D
	dw $7432
org $02896D
	dw $7432
;============== REMAPPER FOR $1433
org $009437
	dw $7433
org $009441
	dw $7433
org $00C49A
	dw $7433
org $00C4C1
	dw $7433
org $00C9CD
	dw $7433
org $00CA41
	dw $7433
org $00CA45
	dw $7433
org $00CA6F
	dw $7433
org $00CA72
	dw $7433
org $00CA99
	dw $7433
org $00CC1E
	dw $7433
org $00CC38
	dw $7433
org $00CC4C
	dw $7433
;============== REMAPPER FOR $1434
org $00A6E9
	dw $7434
org $00A73A
	dw $7434
org $00C48D
	dw $7434
org $00C4B8
	dw $7434
org $01E213
	dw $7434
;============== REMAPPER FOR $1435
org $00C497
	dw $7435
org $00C4A5
	dw $7435
;============== REMAPPER FOR $1436
org $00A6FA
	dw $7436
org $00C4E0
	dw $7436
org $00CCF4
	dw $7436
org $00CD07
	dw $7436
org $00F972
	dw $7436
org $01E228
	dw $7436
org $04F2AE
	dw $7436
org $04F30A
	dw $7436
org $04F387
	dw $7436
;============== REMAPPER FOR $1437
org $01E223
	dw $7437
org $04F29C
	dw $7437
org $04F30F
	dw $7437
org $04F315
	dw $7437
;============== REMAPPER FOR $1438
org $00A702
	dw $7438
org $00C4EB
	dw $7438
org $00CCF9
	dw $7438
org $00CD12
	dw $7438
org $00F97E
	dw $7438
org $01E233
	dw $7438
org $04F2F9
	dw $7438
org $04F305
	dw $7438
org $04F318
	dw $7438
;============== REMAPPER FOR $1439
org $01E22E
	dw $7439
org $04F291
	dw $7439
org $04F312
	dw $7439
org $04F38C
	dw $7439
;============== REMAPPER FOR $143A
org $00820E
	dw $743A
org $0082CB
	dw $743A
org $00A5A3
	dw $743A
org $00A8BD
	dw $743A
;============== REMAPPER FOR $143B
org $009799
	dw $743B
org $00D0F6
	dw $743B
;============== REMAPPER FOR $143C
org $00975E
	dw $743C
org $00978F
	dw $743C
org $0097A5
	dw $743C
org $00D0FB
	dw $743C
;============== REMAPPER FOR $143D
org $009763
	dw $743D
org $00D100
	dw $743D
;============== REMAPPER FOR $143E
org $00C726
	dw $743E
org $00C79E
	dw $743E
org $00C7DB
	dw $743E
org $02A86B
	dw $743E
org $02A87A
	dw $743E
org $02AC56
	dw $743E
org $05BC7F
	dw $743E
org $05BCEA
	dw $743E
org $05BD44
	dw $743E
org $05BD86
	dw $743E
org $05BDE8
	dw $743E
org $05BE45
	dw $743E
org $05BEB4
	dw $743E
org $05BF18
	dw $743E
org $05BFAA
	dw $743E
org $05BFD9
	dw $743E
org $0CCB1D
	dw $743E
org $0CCB5E
	dw $743E
org $0CCB83
	dw $743E
org $0CCBC5
	dw $743E
org $0CD004
	dw $743E
org $0CD02C
	dw $743E
org $0CD03C
	dw $743E
org $0CD0BD
	dw $743E
org $0CD0CA
	dw $743E
org $0CD0D3
	dw $743E
org $0CD109
	dw $743E
org $0CD19D
	dw $743E
;============== REMAPPER FOR $143F
org $02A86E
	dw $743F
org $02AC59
	dw $743F
org $05BC2D
	dw $743F
org $05BCAB
	dw $743F
org $05BD0F
	dw $743F
org $0CCB29
	dw $743F
org $0CCB44
	dw $743F
org $0CCB4B
	dw $743F
org $0CCC83
	dw $743F
org $0CCC95
	dw $743F
org $0CCDFB
	dw $743F
org $0CCE49
	dw $743F
org $0CCE50
	dw $743F
org $0CCF10
	dw $743F
org $0CCF26
	dw $743F
org $0CCF73
	dw $743F
org $0CCF7A
	dw $743F
org $0CCFCF
	dw $743F
org $0CCFD4
	dw $743F
org $0CD015
	dw $743F
org $0CD01A
	dw $743F
org $0CD027
	dw $743F
org $0CD037
	dw $743F
org $0CD03F
	dw $743F
org $0CD128
	dw $743F
org $0CD190
	dw $743F
org $0CD2A7
	dw $743F
org $0CD2D3
	dw $743F
org $0CD2E7
	dw $743F
org $0CD30C
	dw $743F
org $0CD32F
	dw $743F
;============== REMAPPER FOR $1440
org $02A882
	dw $7440
org $05BD3A
	dw $7440
org $05BD4A
	dw $7440
org $05BD64
	dw $7440
org $05BD7C
	dw $7440
org $05BD8C
	dw $7440
org $05BD91
	dw $7440
org $05BDDE
	dw $7440
org $05BDEE
	dw $7440
org $05BDF3
	dw $7440
org $05BE3B
	dw $7440
org $05BE4B
	dw $7440
org $05BE50
	dw $7440
org $05BEAA
	dw $7440
org $05BEBA
	dw $7440
org $05BEC9
	dw $7440
org $05BF0E
	dw $7440
org $05BF1E
	dw $7440
org $05BF23
	dw $7440
org $05BF6B
	dw $7440
org $05BF71
	dw $7440
org $05BF82
	dw $7440
org $05BFCD
	dw $7440
org $05C009
	dw $7440
org $05C013
	dw $7440
org $05C037
	dw $7440
org $05C212
	dw $7440
org $05C2E6
	dw $7440
org $05C3C6
	dw $7440
org $05C545
	dw $7440
org $05C5E1
	dw $7440
org $05C6C0
	dw $7440
org $05C794
	dw $7440
org $05C956
	dw $7440
org $0CCB2C
	dw $7440
org $0CCB4E
	dw $7440
org $0CCB53
	dw $7440
org $0CCBE3
	dw $7440
org $0CCC88
	dw $7440
org $0CCC8E
	dw $7440
org $0CCCB7
	dw $7440
org $0CCCDF
	dw $7440
org $0CCE53
	dw $7440
org $0CCE58
	dw $7440
org $0CCE61
	dw $7440
org $0CCE6A
	dw $7440
org $0CCEE3
	dw $7440
org $0CCEF0
	dw $7440
org $0CCEF5
	dw $7440
org $0CCF09
	dw $7440
org $0CCF20
	dw $7440
org $0CCF4A
	dw $7440
org $0CCF7D
	dw $7440
org $0CCF80
	dw $7440
org $0CCFA4
	dw $7440
org $0CD29D
	dw $7440
org $0CD2D6
	dw $7440
org $0CD30F
	dw $7440
org $0CD32A
	dw $7440
;============== REMAPPER FOR $1441
org $05BD6C
	dw $7441
org $05BD9C
	dw $7441
org $05BDFE
	dw $7441
org $05BE5B
	dw $7441
org $05BED4
	dw $7441
org $05BF2E
	dw $7441
org $05BF77
	dw $7441
org $05BFB7
	dw $7441
org $05C21D
	dw $7441
org $05C2F1
	dw $7441
org $05C3D1
	dw $7441
org $05C54D
	dw $7441
org $05C5E9
	dw $7441
org $05C65A
	dw $7441
org $05C65F
	dw $7441
org $05C694
	dw $7441
org $05C959
	dw $7441
org $0CCC61
	dw $7441
org $0CD2A2
	dw $7441
;============== REMAPPER FOR $1442
org $05BD72
	dw $7442
org $05BDAB
	dw $7442
org $05BE0D
	dw $7442
org $05BE6A
	dw $7442
org $05BEE3
	dw $7442
org $05BF3D
	dw $7442
org $05BFD6
	dw $7442
org $05C062
	dw $7442
org $05C119
	dw $7442
org $05C14C
	dw $7442
org $05C22C
	dw $7442
org $05C232
	dw $7442
org $05C257
	dw $7442
org $05C2A1
	dw $7442
org $05C2CD
	dw $7442
org $05C34C
	dw $7442
org $05C378
	dw $7442
org $05C3A9
	dw $7442
org $05C564
	dw $7442
org $05C56A
	dw $7442
org $05C58F
	dw $7442
org $05C600
	dw $7442
org $05C606
	dw $7442
org $05C62B
	dw $7442
org $05C83E
	dw $7442
org $05C855
	dw $7442
org $05C85B
	dw $7442
org $05C970
	dw $7442
org $05C98C
	dw $7442
org $0CA1D8
	dw $7442
org $0CA216
	dw $7442
org $0CA2D7
	dw $7442
org $0CA2DC
	dw $7442
org $0CA3D4
	dw $7442
org $0CA476
	dw $7442
org $0CA5C7
	dw $7442
org $0CA671
	dw $7442
org $0CC9BA
	dw $7442
org $0CC9D0
	dw $7442
org $0CC9EA
	dw $7442
org $0CCA08
	dw $7442
org $0CCA19
	dw $7442
org $0CCA36
	dw $7442
org $0CCA43
	dw $7442
org $0CCA68
	dw $7442
org $0CCA73
	dw $7442
org $0CCACF
	dw $7442
org $0CCBD4
	dw $7442
org $0CCC7D
	dw $7442
org $0CCD8D
	dw $7442
org $0CCDFE
	dw $7442
org $0CCF87
	dw $7442
org $0CCFD9
	dw $7442
org $0CCFEF
	dw $7442
org $0CCFFD
	dw $7442
org $0CD044
	dw $7442
org $0CD0C4
	dw $7442
org $0CD0F7
	dw $7442
org $0CD130
	dw $7442
org $0CD199
	dw $7442
org $0CD2AA
	dw $7442
org $0CD2DE
	dw $7442
org $0CD315
	dw $7442
org $0CD332
	dw $7442
org $0CD581
	dw $7442
org $0CD5C7
	dw $7442
;============== REMAPPER FOR $1443
org $05C72F
	dw $7443
org $05C739
	dw $7443
org $05C990
	dw $7443
org $05C9B8
	dw $7443
org $05C9CE
	dw $7443
org $0CC94F
	dw $7443
org $0CC954
	dw $7443
org $0CC957
	dw $7443
org $0CC967
	dw $7443
org $0CCFDF
	dw $7443
org $0CCFF8
	dw $7443
org $0CD5CC
	dw $7443
;============== REMAPPER FOR $1444
org $04940F
	dw $7444
org $049523
	dw $7444
org $04968B
	dw $7444
org $05BD78
	dw $7444
org $05BDDA
	dw $7444
org $05BFD3
	dw $7444
org $05C03D
	dw $7444
org $05C054
	dw $7444
org $05C11E
	dw $7444
org $05C1B5
	dw $7444
org $05C1BA
	dw $7444
org $05C1BD
	dw $7444
org $05C204
	dw $7444
org $05C828
	dw $7444
org $05C979
	dw $7444
org $05C983
	dw $7444
org $05C988
	dw $7444
org $05C9B5
	dw $7444
org $0CCA55
	dw $7444
org $0CCAD4
	dw $7444
org $0CCADE
	dw $7444
org $0CCD57
	dw $7444
org $0CD280
	dw $7444
;============== REMAPPER FOR $1445
org $00C7A5
	dw $7445
org $00C7BC
	dw $7445
org $05C043
	dw $7445
org $05C734
	dw $7445
org $05C74D
	dw $7445
org $05C821
	dw $7445
org $0CCA0F
	dw $7445
org $0CCFC6
	dw $7445
org $0CD3A7
	dw $7445
org $0CD4B8
	dw $7445
org $0CD662
	dw $7445
org $0CD66C
	dw $7445
org $0CD796
	dw $7445
org $0CD7CA
	dw $7445
;============== REMAPPER FOR $1446
org $00C7B2
	dw $7446
org $00C7C6
	dw $7446
org $00E9DA
	dw $7446
org $05BD52
	dw $7446
org $05BDCA
	dw $7446
org $05BE2F
	dw $7446
org $05BE7F
	dw $7446
org $05BFDC
	dw $7446
org $05C05C
	dw $7446
org $05C17B
	dw $7446
org $05C184
	dw $7446
org $05C18B
	dw $7446
org $05C3EB
	dw $7446
org $05C3F4
	dw $7446
org $05C3FB
	dw $7446
org $05C501
	dw $7446
org $05C5A6
	dw $7446
org $05C5AF
	dw $7446
org $05C5B6
	dw $7446
org $05C6B5
	dw $7446
org $05C6C3
	dw $7446
org $05C79C
	dw $7446
org $05C7A5
	dw $7446
org $05C7B4
	dw $7446
org $0C9F72
	dw $7446
org $0C9F8C
	dw $7446
org $0C9FD3
	dw $7446
org $0CD25A
	dw $7446
org $0CD4F9
	dw $7446
org $0CD517
	dw $7446
org $0CD558
	dw $7446
org $0CD57E
	dw $7446
org $0CD6FD
	dw $7446
org $0CD75C
	dw $7446
org $0CD799
	dw $7446
org $0CD7D1
	dw $7446
org $0CD7E3
	dw $7446
;============== REMAPPER FOR $1447
org $0CCDA8
	dw $7447
org $0CCDAE
	dw $7447
org $0CCDB7
	dw $7447
org $0CCDC6
	dw $7447
org $0CCF15
	dw $7447
org $0CCF19
	dw $7447
org $0CD0FC
	dw $7447
org $0CD110
	dw $7447
org $0CD113
	dw $7447
org $0CD11F
	dw $7447
org $0CD14A
	dw $7447
org $0CD2C8
	dw $7447
org $0CD312
	dw $7447
;============== REMAPPER FOR $1448
org $05BD55
	dw $7448
org $05BDCD
	dw $7448
org $05BE32
	dw $7448
org $05BE82
	dw $7448
org $05BF62
	dw $7448
org $05BF65
	dw $7448
org $05BFDF
	dw $7448
org $05C20C
	dw $7448
org $05C26E
	dw $7448
org $05C277
	dw $7448
org $05C27E
	dw $7448
org $05C30B
	dw $7448
org $05C314
	dw $7448
org $05C31B
	dw $7448
org $05C642
	dw $7448
org $05C64B
	dw $7448
org $05C652
	dw $7448
org $05C6DF
	dw $7448
org $05C6EA
	dw $7448
;============== REMAPPER FOR $1449
org $0CD7A1
	dw $7449
org $0CD7A6
	dw $7449
org $0CD7E8
	dw $7449
;============== REMAPPER FOR $144A
org $05BFE8
	dw $744A
org $05C028
	dw $744A
org $05C7C8
	dw $744A
org $05C7D1
	dw $744A
org $0CCA90
	dw $744A
org $0CD65C
	dw $744A
org $0CD6ED
	dw $744A
org $0CD804
	dw $744A
org $0CD84A
	dw $744A
;============== REMAPPER FOR $144B
org $0CD84D
	dw $744B
org $0CD850
	dw $744B
;============== REMAPPER FOR $144C
org $05BFAD
	dw $744C
org $05BFEB
	dw $744C
org $05C02B
	dw $744C
org $05C679
	dw $744C
org $05C682
	dw $744C
org $05C68D
	dw $744C
org $05C6D3
	dw $744C
org $05C6DC
	dw $744C
org $05C6E7
	dw $744C
org $05C744
	dw $744C
org $05C771
	dw $744C
org $05C77D
	dw $744C
org $05C847
	dw $744C
org $05C86A
	dw $744C
org $05C876
	dw $744C
org $0CD81F
	dw $744C
org $0CD85C
	dw $744C
;============== REMAPPER FOR $144D
org $05C747
	dw $744D
org $0CC993
	dw $744D
org $0CC998
	dw $744D
org $0CCFE2
	dw $744D
org $0CD5D1
	dw $744D
;============== REMAPPER FOR $144E
org $00E9F1
	dw $744E
org $048D9A
	dw $744E
org $04926F
	dw $744E
org $049274
	dw $744E
org $049409
	dw $744E
org $05BD58
	dw $744E
org $05BDC4
	dw $744E
org $05BE2C
	dw $744E
org $05BE85
	dw $744E
org $05BF05
	dw $744E
org $05BF5C
	dw $744E
org $05BFE2
	dw $744E
org $05C1DA
	dw $744E
org $05C1E1
	dw $744E
org $05C248
	dw $744E
org $05C24B
	dw $744E
org $05C289
	dw $744E
org $05C4FA
	dw $744E
org $05C504
	dw $744E
org $05C5C3
	dw $744E
org $05C5CA
	dw $744E
org $05C61C
	dw $744E
org $05C61F
	dw $744E
org $0C9FCC
	dw $744E
org $0C9FD6
	dw $744E
org $0CA2A4
	dw $744E
org $0CA2AB
	dw $744E
org $0CA3EC
	dw $744E
;============== REMAPPER FOR $144F
org $0CA2AE
	dw $744F
org $0CA2B3
	dw $744F
org $0CA2B6
	dw $744F
org $0CA3EF
	dw $744F
;============== REMAPPER FOR $1450
org $05BD5B
	dw $7450
org $05BDC7
	dw $7450
org $05BE35
	dw $7450
org $05BE7C
	dw $7450
org $05BF02
	dw $7450
org $05BF5F
	dw $7450
org $05BFE5
	dw $7450
org $05C20F
	dw $7450
org $05C334
	dw $7450
org $05C527
	dw $7450
org $05C52E
	dw $7450
org $05C580
	dw $7450
org $05C583
	dw $7450
;============== REMAPPER FOR $1451
;============== REMAPPER FOR $1452
org $05BFEE
	dw $7452
org $05C02E
	dw $7452
;============== REMAPPER FOR $1453
;============== REMAPPER FOR $1454
org $05BFB0
	dw $7454
org $05BFF1
	dw $7454
org $05C031
	dw $7454
org $05C84A
	dw $7454
;============== REMAPPER FOR $1455
;============== REMAPPER FOR $1456
org $05BC77
	dw $7456
org $05BCA8
	dw $7456
org $05BCDA
	dw $7456
org $05BCE2
	dw $7456
org $05BD4D
	dw $7456
org $05BD67
	dw $7456
org $05BD94
	dw $7456
org $05BD9F
	dw $7456
org $05BDBA
	dw $7456
org $05BDF6
	dw $7456
org $05BE01
	dw $7456
org $05BE1B
	dw $7456
org $05BE53
	dw $7456
org $05BE5E
	dw $7456
org $05BE6E
	dw $7456
org $05BECC
	dw $7456
org $05BED7
	dw $7456
org $05BEF8
	dw $7456
org $05BF26
	dw $7456
org $05BF31
	dw $7456
org $05BF52
	dw $7456
org $05C04E
	dw $7456
org $05C059
	dw $7456
org $05C076
	dw $7456
org $05C110
	dw $7456
org $05C143
	dw $7456
org $05C174
	dw $7456
org $05C1AF
	dw $7456
org $05C1C6
	dw $7456
org $05C1D7
	dw $7456
org $05C1FA
	dw $7456
org $05C209
	dw $7456
org $05C215
	dw $7456
org $05C242
	dw $7456
org $05C24E
	dw $7456
org $05C269
	dw $7456
org $05C286
	dw $7456
org $05C298
	dw $7456
org $05C2C4
	dw $7456
org $05C2D1
	dw $7456
org $05C2E9
	dw $7456
org $05C306
	dw $7456
org $05C31E
	dw $7456
org $05C331
	dw $7456
org $05C343
	dw $7456
org $05C36F
	dw $7456
org $05C37C
	dw $7456
org $05C3A0
	dw $7456
org $05C3C9
	dw $7456
org $05C3E6
	dw $7456
org $05C3FE
	dw $7456
org $05C522
	dw $7456
org $05C548
	dw $7456
org $05C55B
	dw $7456
org $05C57A
	dw $7456
org $05C586
	dw $7456
org $05C5A1
	dw $7456
org $05C5BE
	dw $7456
org $05C5E4
	dw $7456
org $05C5F7
	dw $7456
org $05C616
	dw $7456
org $05C622
	dw $7456
org $05C63D
	dw $7456
org $05C78E
	dw $7456
org $05C797
	dw $7456
org $0CA797
	dw $7456
org $0CA79D
	dw $7456
;============== REMAPPER FOR $1457
org $0CA359
	dw $7457
org $0CA3CF
	dw $7457
;============== REMAPPER FOR $1458
org $05BE96
	dw $7458
org $05C449
	dw $7458
org $05C452
	dw $7458
org $05C459
	dw $7458
org $05C463
	dw $7458
org $0CA356
	dw $7458
org $0CA36D
	dw $7458
org $0CA389
	dw $7458
org $0CA39A
	dw $7458
org $0CA3F2
	dw $7458
org $0CA43D
	dw $7458
org $0CA447
	dw $7458
org $0CA455
	dw $7458
org $0CA467
	dw $7458
org $0CA46A
	dw $7458
org $0CA473
	dw $7458
org $0CA479
	dw $7458
org $0CA48A
	dw $7458
org $0CA4A4
	dw $7458
org $0CA4C1
	dw $7458
org $0CA4D9
	dw $7458
org $0CA4EA
	dw $7458
org $0CA506
	dw $7458
org $0CA69E
	dw $7458
org $0CA6A1
	dw $7458
org $0CA6AA
	dw $7458
org $0CA6D0
	dw $7458
;============== REMAPPER FOR $1459
org $0CA3F7
	dw $7459
org $0CA45D
	dw $7459
org $0CA464
	dw $7459
org $0CA694
	dw $7459
org $0CA69B
	dw $7459
;============== REMAPPER FOR $145A
org $05BE99
	dw $745A
org $05C4A6
	dw $745A
org $05C4B9
	dw $745A
org $05C4CE
	dw $745A
org $05C4DC
	dw $745A
org $0CA5A3
	dw $745A
org $0CA8E0
	dw $745A
;============== REMAPPER FOR $145B
org $0C93B1
	dw $745B
org $0CA54B
	dw $745B
org $0CA5A6
	dw $745B
org $0CA5A9
	dw $745B
org $0CA71E
	dw $745B
org $0CAEA7
	dw $745B
org $0CAEB7
	dw $745B
org $0CAEC6
	dw $745B
org $0CAECB
	dw $745B
org $0CAEF9
	dw $745B
;============== REMAPPER FOR $145C
org $05BE9C
	dw $745C
org $05C45C
	dw $745C
org $05C466
	dw $745C
org $05C4D6
	dw $745C
org $05C4D9
	dw $745C
org $0CA533
	dw $745C
org $0CA557
	dw $745C
org $0CA5DF
	dw $745C
org $0CA612
	dw $745C
;============== REMAPPER FOR $145D
org $0CA676
	dw $745D
org $0CA711
	dw $745D
org $0CA714
	dw $745D
;============== REMAPPER FOR $145E
;============== REMAPPER FOR $145F
;============== REMAPPER FOR $1460
org $05BE93
	dw $7460
org $05C42E
	dw $7460
org $05C49D
	dw $7460
org $05C4CB
	dw $7460
;============== REMAPPER FOR $1461
;============== REMAPPER FOR $1462
org $0092FF
	dw $7462
org $0096FD
	dw $7462
org $00981B
	dw $7462
org $009931
	dw $7462
org $00E9B2
	dw $7462
org $00E9C6
	dw $7462
org $00F6F2
	dw $7462
org $00F7C8
	dw $7462
org $00F7ED
	dw $7462
org $05BC0D
	dw $7462
org $05BC56
	dw $7462
org $05BC63
	dw $7462
org $05BEBF
	dw $7462
org $05BEFC
	dw $7462
org $05BF9F
	dw $7462
org $05C07D
	dw $7462
org $05C1A1
	dw $7462
org $05C338
	dw $7462
org $05C38B
	dw $7462
org $05C38E
	dw $7462
org $05C511
	dw $7462
org $05C514
	dw $7462
org $05C52B
	dw $7462
org $05C701
	dw $7462
org $05C7AF
	dw $7462
org $0CAE7E
	dw $7462
org $0CAE93
	dw $7462
org $0CAEC1
	dw $7462
org $0CAEDB
	dw $7462
org $0CAEE2
	dw $7462
org $0CAEEF
	dw $7462
org $0CB5E6
	dw $7462
;============== REMAPPER FOR $1463
org $05C6BB
	dw $7463
org $05C6F8
	dw $7463
;============== REMAPPER FOR $1464
org $009823
	dw $7464
org $009936
	dw $7464
org $00F6F7
	dw $7464
org $00F7D1
	dw $7464
org $05BC1A
	dw $7464
org $05BC6B
	dw $7464
org $05BDBE
	dw $7464
org $05BE29
	dw $7464
org $05BF56
	dw $7464
org $05C082
	dw $7464
org $05C1C9
	dw $7464
org $05C1CF
	dw $7464
org $05C1DE
	dw $7464
org $05C28D
	dw $7464
org $05C2E0
	dw $7464
org $05C2E3
	dw $7464
org $05C5C7
	dw $7464
org $05C66C
	dw $7464
;============== REMAPPER FOR $1465
;============== REMAPPER FOR $1466
org $00F6FC
	dw $7466
org $00F7DA
	dw $7466
org $05BC27
	dw $7466
org $05BC52
	dw $7466
org $05BEC4
	dw $7466
org $05BFA4
	dw $7466
org $05BFC2
	dw $7466
org $05C19E
	dw $7466
org $05C712
	dw $7466
org $05C7E8
	dw $7466
org $05C7EB
	dw $7466
org $05C831
	dw $7466
org $05C95E
	dw $7466
org $0CAE81
	dw $7466
org $0CAEA1
	dw $7466
org $0CAEEA
	dw $7466
;============== REMAPPER FOR $1467
;============== REMAPPER FOR $1468
org $00F701
	dw $7468
org $00F7E3
	dw $7468
org $05BC37
	dw $7468
org $05BC5B
	dw $7468
org $05BF90
	dw $7468
org $05BFCA
	dw $7468
org $05C685
	dw $7468
org $05C6E2
	dw $7468
org $05C73C
	dw $7468
org $05C741
	dw $7468
org $05C752
	dw $7468
org $05C844
	dw $7468
org $05C862
	dw $7468
org $05C976
	dw $7468
org $05C998
	dw $7468
org $05C9AD
	dw $7468
;============== REMAPPER FOR $1469
;============== REMAPPER FOR $146A
org $0CAE84
	dw $746A
org $0CAE96
	dw $746A
org $0CAEE5
	dw $746A
;============== REMAPPER FOR $146B
;============== REMAPPER FOR $146C
;============== REMAPPER FOR $146D
;============== REMAPPER FOR $146E
;============== REMAPPER FOR $146F
;============== REMAPPER FOR $1470
org $018093
	dw $7470
org $01A12C
	dw $7470
org $01AA5F
	dw $7470
org $01AA6C
	dw $7470
org $01DA10
	dw $7470
org $01E6D3
	dw $7470
org $01ED3D
	dw $7470
;============== REMAPPER FOR $1471
org $00D60C
	dw $7471
org $00EA04
	dw $7471
org $00EE1E
	dw $7471
org $018099
	dw $7471
org $01A0DA
	dw $7471
org $01AAD6
	dw $7471
org $01B47D
	dw $7471
org $01B880
	dw $7471
org $01CA37
	dw $7471
org $01E681
	dw $7471
org $01E68B
	dw $7471
org $01E881
	dw $7471
org $029157
	dw $7471
org $02CCA9
	dw $7471
org $02CFCC
	dw $7471
org $02D72A
	dw $7471
org $02EE73
	dw $7471
org $0387ED
	dw $7471
org $038CCF
	dw $7471
;============== REMAPPER FOR $1472
org $03C53B
	dw $7472
org $03C57B
	dw $7472
;============== REMAPPER FOR $1473
;============== REMAPPER FOR $1474
org $03C540
	dw $7474
org $03C596
	dw $7474
;============== REMAPPER FOR $1475
;============== REMAPPER FOR $1476
org $03C531
	dw $7476
org $03C551
	dw $7476
org $03C558
	dw $7476
org $03C582
	dw $7476
;============== REMAPPER FOR $1477
;============== REMAPPER FOR $1478
org $03C536
	dw $7478
org $03C55B
	dw $7478
org $03C562
	dw $7478
org $03C59D
	dw $7478
;============== REMAPPER FOR $1479
;============== REMAPPER FOR $147A
org $03C57E
	dw $747A
org $03C5D3
	dw $747A
org $03C5DB
	dw $747A
org $03C5DE
	dw $747A
org $03C610
	dw $747A
;============== REMAPPER FOR $147B
;============== REMAPPER FOR $147C
org $03C599
	dw $747C
org $03C5F6
	dw $747C
org $03C5FE
	dw $747C
org $03C601
	dw $747C
org $03C616
	dw $747C
;============== REMAPPER FOR $147D
;============== REMAPPER FOR $147E
org $03C591
	dw $747E
org $03C5BE
	dw $747E
org $03C5C5
	dw $747E
org $03C5D0
	dw $747E
;============== REMAPPER FOR $147F
org $03C5AC
	dw $747F
org $03C5E1
	dw $747F
org $03C5E8
	dw $747F
org $03C5F3
	dw $747F
;============== REMAPPER FOR $1480
org $03C58B
	dw $7480
org $03C5C2
	dw $7480
;============== REMAPPER FOR $1481
org $03C5A6
	dw $7481
org $03C5E5
	dw $7481
;============== REMAPPER FOR $1482
org $03C52A
	dw $7482
org $03C54B
	dw $7482
;============== REMAPPER FOR $1483
org $03C548
	dw $7483
org $03C54E
	dw $7483
org $03C56A
	dw $7483
org $03C570
	dw $7483
;============== REMAPPER FOR $1484
org $03C58E
	dw $7484
org $03C5D6
	dw $7484
;============== REMAPPER FOR $1485
org $03C5A9
	dw $7485
org $03C5F9
	dw $7485
;============== REMAPPER FOR $1486
org $03C545
	dw $7486
;============== REMAPPER FOR $1487
;============== REMAPPER FOR $1488
;============== REMAPPER FOR $1489
;============== REMAPPER FOR $148A
;============== REMAPPER FOR $148B
org $01AD08
	dw $748B
org $01AD0E
	dw $748B
org $01AD11
	dw $748B
org $01AD2A
	dw $748B
;============== REMAPPER FOR $148C
org $01AD14
	dw $748C
org $01AD19
	dw $748C
org $01AD24
	dw $748C
org $01AD27
	dw $748C
;============== REMAPPER FOR $148D
org $018F5B
	dw $748D
org $01AD2D
	dw $748D
org $01B080
	dw $748D
org $01B093
	dw $748D
org $0285A3
	dw $748D
org $0285FE
	dw $748D
org $02B360
	dw $748D
org $02FD11
	dw $748D
;============== REMAPPER FOR $148E
org $01B075
	dw $748E
org $01B17B
	dw $748E
org $01BC76
	dw $748E
org $02856F
	dw $748E
org $0285AE
	dw $748E
org $028614
	dw $748E
org $02AAF7
	dw $748E
org $02B1A3
	dw $748E
org $02B304
	dw $748E
org $03AD97
	dw $748E
;============== REMAPPER FOR $148F
org $0094D5
	dw $748F
org $00C7E5
	dw $748F
org $00C7F1
	dw $748F
org $00CD4F
	dw $748F
org $00CF65
	dw $748F
org $00CFAF
	dw $748F
org $00D00B
	dw $748F
org $00D1CD
	dw $748F
org $00D641
	dw $748F
org $00D6DC
	dw $748F
org $00D7EE
	dw $748F
org $00D996
	dw $748F
org $00DAA0
	dw $748F
org $00EA85
	dw $748F
org $00EAFA
	dw $748F
org $00EEF9
	dw $748F
org $00F041
	dw $748F
org $00F270
	dw $748F
org $00F421
	dw $748F
org $018090
	dw $748F
org $018096
	dw $748F
org $01A129
	dw $748F
org $028660
	dw $748F
org $0CD83B
	dw $748F
;============== REMAPPER FOR $1490
org $00A641
	dw $7490
org $00A65E
	dw $7490
org $00E2D0
	dw $7490
org $00E2E1
	dw $7490
org $00F1CA
	dw $7490
org $00F5BF
	dw $7490
org $00FB03
	dw $7490
org $01A83C
	dw $7490
org $01B0F8
	dw $7490
org $01C0FF
	dw $7490
org $01C583
	dw $7490
org $01F70F
	dw $7490
org $028AD6
	dw $7490
org $02A46A
	dw $7490
org $02BFE3
	dw $7490
org $02C7A9
	dw $7490
org $02F250
	dw $7490
org $02F9F1
	dw $7490
org $03958C
	dw $7490
org $039D95
	dw $7490
;============== REMAPPER FOR $1491
org $0185C4
	dw $7491
org $01AC0A
	dw $7491
org $01ADF0
	dw $7491
org $01B2B4
	dw $7491
org $01B2B7
	dw $7491
org $01B545
	dw $7491
org $01B575
	dw $7491
org $01B8A2
	dw $7491
org $01C7C9
	dw $7491
org $01CA5F
	dw $7491
org $02D2C4
	dw $7491
org $02E567
	dw $7491
org $02EE99
	dw $7491
org $03880E
	dw $7491
org $038CD4
	dw $7491
org $038DF5
	dw $7491
;============== REMAPPER FOR $1492
org $00C99B
	dw $7492
org $00C9B3
	dw $7492
org $00C9B8
	dw $7492
;============== REMAPPER FOR $1493
org $0083E4
	dw $7493
org $008E1B
	dw $7493
org $00A203
	dw $7493
org $00A222
	dw $7493
org $00AF18
	dw $7493
org $00AF23
	dw $7493
org $00AFF2
	dw $7493
org $00C5BC
	dw $7493
org $00C952
	dw $7493
org $00C974
	dw $7493
org $00C9F1
	dw $7493
org $00CCBC
	dw $7493
org $00D77D
	dw $7493
org $00EECF
	dw $7493
org $00F5C2
	dw $7493
org $01877E
	dw $7493
org $01C0FC
	dw $7493
org $01D04C
	dw $7493
org $01FB2B
	dw $7493
org $03809A
	dw $7493
org $0398E4
	dw $7493
org $03C121
	dw $7493
org $03C7A4
	dw $7493
org $03CE97
	dw $7493
;============== REMAPPER FOR $1494
org $00C99F
	dw $7494
org $04EA66
	dw $7494
;============== REMAPPER FOR $1495
org $0083E9
	dw $7495
org $00A68D
	dw $7495
org $00AF3C
	dw $7495
org $00AFA7
	dw $7495
org $00C509
	dw $7495
org $00C50E
	dw $7495
org $00C93E
	dw $7495
org $00C9A2
	dw $7495
org $04EA63
	dw $7495
org $04EAA5
	dw $7495
org $04EB49
	dw $7495
;============== REMAPPER FOR $1496
org $00CFE7
	dw $7496
org $00D000
	dw $7496
org $00D0C4
	dw $7496
org $00D0C7
	dw $7496
org $00D12A
	dw $7496
org $00D138
	dw $7496
org $00D13D
	dw $7496
org $00D148
	dw $7496
org $00D164
	dw $7496
org $00DA95
	dw $7496
org $00DAAF
	dw $7496
org $00DAB4
	dw $7496
org $00DC1B
	dw $7496
org $00DC20
	dw $7496
org $00F61E
	dw $7496
org $01C568
	dw $7496
org $01C5BB
	dw $7496
org $0485D9
	dw $7496
org $0485DE
	dw $7496
org $0CA768
	dw $7496
org $0CA76D
	dw $7496
;============== REMAPPER FOR $1497
org $00CC8C
	dw $7497
org $00D143
	dw $7497
org $00E36E
	dw $7497
org $00E37A
	dw $7497
org $00F5BC
	dw $7497
org $00F5EF
	dw $7497
org $01A8FA
	dw $7497
org $01E609
	dw $7497
org $01F746
	dw $7497
org $02A4AA
	dw $7497
org $0395CB
	dw $7497
;============== REMAPPER FOR $1498
org $00A68A
	dw $7498
org $00C794
	dw $7498
org $00C7E2
	dw $7498
org $00CF8B
	dw $7498
org $01A114
	dw $7498
org $01AA71
	dw $7498
org $02865D
	dw $7498
org $0CD809
	dw $7498
org $0CD838
	dw $7498
;============== REMAPPER FOR $1499
org $00CF92
	dw $7499
org $00D1D4
	dw $7499
org $00D1D9
	dw $7499
org $00D6E1
	dw $7499
org $00D6E8
	dw $7499
org $00F42E
	dw $7499
org $019F7F
	dw $7499
org $01A0B9
	dw $7499
;============== REMAPPER FOR $149A
org $00A687
	dw $749A
org $00CF81
	dw $749A
org $01A0AE
	dw $749A
org $01B12D
	dw $749A
;============== REMAPPER FOR $149B
org $00D188
	dw $749B
org $00E2CB
	dw $749B
org $01C5EF
	dw $749B
;============== REMAPPER FOR $149C
org $00CF70
	dw $749C
org $00DA90
	dw $749C
org $00FEBD
	dw $749C
;============== REMAPPER FOR $149D
org $00DB22
	dw $749D
org $01BAE8
	dw $749D
;============== REMAPPER FOR $149E
org $00DB85
	dw $749E
org $00DBC8
	dw $749E
org $01BB0B
	dw $749E
;============== REMAPPER FOR $149F
org $00CCB9
	dw $749F
org $00D672
	dw $749F
org $00D679
	dw $749F
org $00D80D
	dw $749F
org $00D8F6
	dw $749F
org $00D8FB
	dw $749F
org $00F838
	dw $749F
;============== REMAPPER FOR $14A0
org $00CFA2
	dw $74A0
org $00D72E
	dw $74A0
;============== REMAPPER FOR $14A1
org $00D6FE
	dw $74A1
org $00EDD0
	dw $74A1
;============== REMAPPER FOR $14A2
org $00CEB2
	dw $74A2
org $00CF14
	dw $74A2
org $00D1F5
	dw $74A2
org $00D1FA
	dw $74A2
org $0485E1
	dw $74A2
org $0485E6
	dw $74A2
org $0CA770
	dw $74A2
org $0CA775
	dw $74A2
;============== REMAPPER FOR $14A3
org $00CDAE
	dw $74A3
org $01F0B4
	dw $74A3
org $01F30C
	dw $74A3
org $02D1D1
	dw $74A3
;============== REMAPPER FOR $14A4
org $00D857
	dw $74A4
org $00D87C
	dw $74A4
;============== REMAPPER FOR $14A5
org $00D900
	dw $74A5
org $00D90B
	dw $74A5
org $05C665
	dw $74A5
;============== REMAPPER FOR $14A6
org $00CF1A
	dw $74A6
org $00D079
	dw $74A6
org $00DA84
	dw $74A6
;============== REMAPPER FOR $14A7
org $03D734
	dw $74A7
org $03D750
	dw $74A7
;============== REMAPPER FOR $14A8
org $00C55F
	dw $74A8
org $00C564
	dw $74A8
;============== REMAPPER FOR $14A9
org $0294C7
	dw $74A9
;============== REMAPPER FOR $14AA
org $01F6D0
	dw $74AA
;============== REMAPPER FOR $14AB
org $00A1EA
	dw $74AB
org $00C51F
	dw $74AB
org $01E049
	dw $74AB
org $02FE46
	dw $74AB
;============== REMAPPER FOR $14AC
;============== REMAPPER FOR $14AD
org $00A636
	dw $74AD
org $00A655
	dw $74AD
org $00C534
	dw $74AD
org $00E2F9
	dw $74AD
org $00EBF1
	dw $74AD
org $00F32E
	dw $74AD
org $00F550
	dw $74AD
org $00F56D
	dw $74AD
org $00F57F
	dw $74AD
org $01AB1D
	dw $74AD
org $02E23B
	dw $74AD
org $02E278
	dw $74AD
org $05BB78
	dw $74AD
;============== REMAPPER FOR $14AE
org $00A639
	dw $74AE
org $00A658
	dw $74AE
org $00C537
	dw $74AE
org $00C53C
	dw $74AE
org $00E2FC
	dw $74AE
org $00F589
	dw $74AE
org $01EA2D
	dw $74AE
org $02A99F
	dw $74AE
org $02E27B
	dw $74AE
;============== REMAPPER FOR $14AF
org $01D84B
	dw $74AF
org $01D852
	dw $74AF
org $029192
	dw $74AF
org $029197
	dw $74AF
org $05C728
	dw $74AF
org $05C76C
	dw $74AF
;============== REMAPPER FOR $14B0
org $01C827
	dw $74B0
org $01C863
	dw $74B0
org $01C919
	dw $74B0
org $01CAEC
	dw $74B0
org $01CBB8
	dw $74B0
org $01CCCC
	dw $74B0
org $01CCD8
	dw $74B0
org $01E8EE
	dw $74B0
org $01E90F
	dw $74B0
org $01E964
	dw $74B0
org $03A2E5
	dw $74B0
org $03A2F0
	dw $74B0
org $03A48D
	dw $74B0
org $03A4FE
	dw $74B0
org $03A5BA
	dw $74B0
org $03A61A
	dw $74B0
org $03A674
	dw $74B0
org $03A79C
	dw $74B0
org $03A7BD
	dw $74B0
org $03A8AB
	dw $74B0
;============== REMAPPER FOR $14B1
org $01C921
	dw $74B1
org $01CAF5
	dw $74B1
org $03A52A
	dw $74B1
org $03A5AE
	dw $74B1
org $03A5B3
	dw $74B1
org $03A5C7
	dw $74B1
org $03A667
	dw $74B1
org $03B0A7
	dw $74B1
;============== REMAPPER FOR $14B2
org $01C7FA
	dw $74B2
org $01C855
	dw $74B2
org $01C90A
	dw $74B2
org $01CB0A
	dw $74B2
org $01CC1D
	dw $74B2
org $01CCD1
	dw $74B2
org $01CCE2
	dw $74B2
org $01E8F3
	dw $74B2
org $01E919
	dw $74B2
org $01E96D
	dw $74B2
org $03A71C
	dw $74B2
org $03A76E
	dw $74B2
org $03A78B
	dw $74B2
;============== REMAPPER FOR $14B3
org $01C912
	dw $74B3
org $01CB13
	dw $74B3
org $03AFA3
	dw $74B3
org $03AFA6
	dw $74B3
org $03B121
	dw $74B3
;============== REMAPPER FOR $14B4
org $00CD0A
	dw $74B4
org $00F96F
	dw $74B4
org $00F9B1
	dw $74B4
org $01CADC
	dw $74B4
org $01CAE5
	dw $74B4
org $01CCD4
	dw $74B4
org $01FD56
	dw $74B4
org $01FF9E
	dw $74B4
org $02A599
	dw $74B4
org $03A889
	dw $74B4
org $03A89E
	dw $74B4
org $03B127
	dw $74B4
;============== REMAPPER FOR $14B5
org $01CAE2
	dw $74B5
org $01CAEF
	dw $74B5
org $01CC9E
	dw $74B5
org $01FD5E
	dw $74B5
org $01FFA6
	dw $74B5
org $02A5A1
	dw $74B5
org $03A2A6
	dw $74B5
org $03A662
	dw $74B5
org $03A66D
	dw $74B5
org $03A695
	dw $74B5
org $03B117
	dw $74B5
org $03B11E
	dw $74B5
;============== REMAPPER FOR $14B6
org $00CD15
	dw $74B6
org $00F97B
	dw $74B6
org $00F9BA
	dw $74B6
org $01CAFA
	dw $74B6
org $01CB03
	dw $74B6
org $01CCDE
	dw $74B6
org $01FD66
	dw $74B6
org $01FFAE
	dw $74B6
org $02A5AA
	dw $74B6
org $03A516
	dw $74B6
org $03A5D9
	dw $74B6
org $03A5DE
	dw $74B6
org $03A5FD
	dw $74B6
org $03A66A
	dw $74B6
org $03B0AA
	dw $74B6
;============== REMAPPER FOR $14B7
org $01CB00
	dw $74B7
org $01CB0D
	dw $74B7
org $01CCA1
	dw $74B7
org $01FD6E
	dw $74B7
org $01FFB6
	dw $74B7
org $02A5B2
	dw $74B7
org $03A7A5
	dw $74B7
org $03A806
	dw $74B7
org $03A810
	dw $74B7
;============== REMAPPER FOR $14B8
org $00F969
	dw $74B8
org $00F9DB
	dw $74B8
org $01C7C2
	dw $74B8
org $01C7DE
	dw $74B8
org $01C823
	dw $74B8
org $01C8E8
	dw $74B8
org $01C988
	dw $74B8
org $01C9F1
	dw $74B8
org $01CA9D
	dw $74B8
org $01CBBB
	dw $74B8
org $01CCB6
	dw $74B8
org $01FB71
	dw $74B8
org $01FC78
	dw $74B8
org $01FC85
	dw $74B8
org $01FCDE
	dw $74B8
org $01FDD1
	dw $74B8
org $01FEEF
	dw $74B8
org $01FF66
	dw $74B8
org $03A50A
	dw $74B8
org $03A50D
	dw $74B8
org $03A51B
	dw $74B8
org $03A611
	dw $74B8
;============== REMAPPER FOR $14B9
org $01C98D
	dw $74B9
org $01C9ED
	dw $74B9
org $01CAA5
	dw $74B9
;============== REMAPPER FOR $14BA
org $00F975
	dw $74BA
org $00F9E7
	dw $74BA
org $01C7D2
	dw $74BA
org $01C7F6
	dw $74BA
org $01C8DC
	dw $74BA
org $01C992
	dw $74BA
org $01CA19
	dw $74BA
org $01CA48
	dw $74BA
org $01CAB0
	dw $74BA
org $01CC23
	dw $74BA
org $01CCAF
	dw $74BA
org $01FB76
	dw $74BA
org $01FC7D
	dw $74BA
org $01FC8D
	dw $74BA
org $01FCE6
	dw $74BA
org $01FDE2
	dw $74BA
org $01FEFD
	dw $74BA
org $01FF6F
	dw $74BA
;============== REMAPPER FOR $14BB
org $01C997
	dw $74BB
org $01CA50
	dw $74BB
org $01CAB8
	dw $74BB
;============== REMAPPER FOR $14BC
org $01CACE
	dw $74BC
org $01CAE9
	dw $74BC
org $01CB5B
	dw $74BC
org $01CBEC
	dw $74BC
org $01CCDB
	dw $74BC
;============== REMAPPER FOR $14BD
org $01CAD4
	dw $74BD
org $01CAF2
	dw $74BD
;============== REMAPPER FOR $14BE
;============== REMAPPER FOR $14BF
org $01CAD1
	dw $74BF
org $01CB07
	dw $74BF
org $01CB84
	dw $74BF
org $01CBC3
	dw $74BF
org $01CCE5
	dw $74BF
;============== REMAPPER FOR $14C0
org $01CAD7
	dw $74C0
org $01CB10
	dw $74C0
;============== REMAPPER FOR $14C1
;============== REMAPPER FOR $14C2
org $01CB34
	dw $74C2
org $01CB7F
	dw $74C2
org $01CBE7
	dw $74C2
;============== REMAPPER FOR $14C3
;============== REMAPPER FOR $14C4
;============== REMAPPER FOR $14C5
org $01CB48
	dw $74C5
org $01CB56
	dw $74C5
org $01CBBE
	dw $74C5
;============== REMAPPER FOR $14C6
;============== REMAPPER FOR $14C7
;============== REMAPPER FOR $14C8
org $00FA13
	dw $74C8
org $00FA54
	dw $74C8
org $00FA92
	dw $74C8
org $00FAC1
	dw $74C8
org $00FACF
	dw $74C8
org $00FB6C
	dw $74C8
org $00FC1C
	dw $74C8
org $00FC26
	dw $74C8
org $00FC9B
	dw $74C8
org $00FCEF
	dw $74C8
org $0180E6
	dw $74C8
org $018128
	dw $74C8
org $018175
	dw $74C8
org $0183EC
	dw $74C8
org $018438
	dw $74C8
org $018463
	dw $74C8
org $018473
	dw $74C8
org $0184AC
	dw $74C8
org $018779
	dw $74C8
org $0188A2
	dw $74C8
org $018973
	dw $74C8
org $01899B
	dw $74C8
org $018A1E
	dw $74C8
org $018A76
	dw $74C8
org $018AA6
	dw $74C8
org $018AF2
	dw $74C8
org $018C1D
	dw $74C8
org $019021
	dw $74C8
org $019333
	dw $74C8
org $01938F
	dw $74C8
org $0193C0
	dw $74C8
org $019565
	dw $74C8
org $019643
	dw $74C8
org $019699
	dw $74C8
org $0196CE
	dw $74C8
org $0196EA
	dw $74C8
org $01976E
	dw $74C8
org $019779
	dw $74C8
org $0199DD
	dw $74C8
org $019ACE
	dw $74C8
org $019AEE
	dw $74C8
org $019FF1
	dw $74C8
org $019FF5
	dw $74C8
org $01A02B
	dw $74C8
org $01A085
	dw $74C8
org $01A16A
	dw $74C8
org $01A25E
	dw $74C8
org $01A28E
	dw $74C8
org $01A2C3
	dw $74C8
org $01A398
	dw $74C8
org $01A418
	dw $74C8
org $01A4BB
	dw $74C8
org $01A4CF
	dw $74C8
org $01A4F3
	dw $74C8
org $01A507
	dw $74C8
org $01A51B
	dw $74C8
org $01A556
	dw $74C8
org $01A5E6
	dw $74C8
org $01A66E
	dw $74C8
org $01A692
	dw $74C8
org $01A6AF
	dw $74C8
org $01A86E
	dw $74C8
org $01A88C
	dw $74C8
org $01A9D6
	dw $74C8
org $01A9EC
	dw $74C8
org $01AA02
	dw $74C8
org $01AA30
	dw $74C8
org $01AA69
	dw $74C8
org $01AAA2
	dw $74C8
org $01AC8F
	dw $74C8
org $01ACA2
	dw $74C8
org $01AEA7
	dw $74C8
org $01AFA0
	dw $74C8
org $01B034
	dw $74C8
org $01B143
	dw $74C8
org $01B265
	dw $74C8
org $01B55A
	dw $74C8
org $01BC65
	dw $74C8
org $01BC95
	dw $74C8
org $01BCDD
	dw $74C8
org $01BDC0
	dw $74C8
org $01BDCC
	dw $74C8
org $01BDF8
	dw $74C8
org $01BF20
	dw $74C8
org $01BF30
	dw $74C8
org $01C180
	dw $74C8
org $01C1F3
	dw $74C8
org $01C2BA
	dw $74C8
org $01C2D6
	dw $74C8
org $01C2E6
	dw $74C8
org $01C2F5
	dw $74C8
org $01C310
	dw $74C8
org $01C3B3
	dw $74C8
org $01C4C7
	dw $74C8
org $01C702
	dw $74C8
org $01D054
	dw $74C8
org $01D061
	dw $74C8
org $01D06C
	dw $74C8
org $01D43F
	dw $74C8
org $01D485
	dw $74C8
org $01D4FC
	dw $74C8
org $01DA0B
	dw $74C8
org $01DB60
	dw $74C8
org $01DDB2
	dw $74C8
org $01DDBA
	dw $74C8
org $01E16B
	dw $74C8
org $01E1CB
	dw $74C8
org $01E1F4
	dw $74C8
org $01E42C
	dw $74C8
org $01E6DD
	dw $74C8
org $01E769
	dw $74C8
org $01E7CE
	dw $74C8
org $01E7DE
	dw $74C8
org $01E9AE
	dw $74C8
org $01E9B6
	dw $74C8
org $01EA2A
	dw $74C8
org $01EBDD
	dw $74C8
org $01EBF7
	dw $74C8
org $01EC8E
	dw $74C8
org $01F1B8
	dw $74C8
org $01F235
	dw $74C8
org $01F27F
	dw $74C8
org $01F359
	dw $74C8
org $01F376
	dw $74C8
org $01F576
	dw $74C8
org $01F5CA
	dw $74C8
org $01F641
	dw $74C8
org $01F64B
	dw $74C8
org $01F6DA
	dw $74C8
org $01F6F6
	dw $74C8
org $01F74F
	dw $74C8
org $01F84D
	dw $74C8
org $01F891
	dw $74C8
org $01F8E5
	dw $74C8
org $01FA0A
	dw $74C8
org $01FA3E
	dw $74C8
org $01FB33
	dw $74C8
org $01FDAA
	dw $74C8
org $01FDBA
	dw $74C8
org $02801A
	dw $74C8
org $028039
	dw $74C8
org $028045
	dw $74C8
org $0280A2
	dw $74C8
org $028142
	dw $74C8
org $02816B
	dw $74C8
org $028639
	dw $74C8
org $028908
	dw $74C8
org $02892B
	dw $74C8
org $028962
	dw $74C8
org $0289B8
	dw $74C8
org $0289E2
	dw $74C8
org $028B3F
	dw $74C8
org $0293B4
	dw $74C8
org $029433
	dw $74C8
org $02945E
	dw $74C8
org $029483
	dw $74C8
org $0294CF
	dw $74C8
org $029DA4
	dw $74C8
org $02A0BE
	dw $74C8
org $02A10E
	dw $74C8
org $02A130
	dw $74C8
org $02A919
	dw $74C8
org $02A976
	dw $74C8
org $02A9B7
	dw $74C8
org $02A9FF
	dw $74C8
org $02AC06
	dw $74C8
org $02AC0D
	dw $74C8
org $02AC1B
	dw $74C8
org $02AC20
	dw $74C8
org $02AF4F
	dw $74C8
org $02AFB9
	dw $74C8
org $02B04B
	dw $74C8
org $02B091
	dw $74C8
org $02B123
	dw $74C8
org $02B16B
	dw $74C8
org $02B1CC
	dw $74C8
org $02B217
	dw $74C8
org $02B27E
	dw $74C8
org $02B28B
	dw $74C8
org $02B2E6
	dw $74C8
org $02B339
	dw $74C8
org $02B3EE
	dw $74C8
org $02B4AF
	dw $74C8
org $02B678
	dw $74C8
org $02B696
	dw $74C8
org $02B6AC
	dw $74C8
org $02B7B5
	dw $74C8
org $02B837
	dw $74C8
org $02B9C5
	dw $74C8
org $02B9E1
	dw $74C8
org $02BAB8
	dw $74C8
org $02BAC3
	dw $74C8
org $02BD30
	dw $74C8
org $02BDB1
	dw $74C8
org $02C1A3
	dw $74C8
org $02C22D
	dw $74C8
org $02C5C5
	dw $74C8
org $02C7B6
	dw $74C8
org $02D07B
	dw $74C8
org $02D08E
	dw $74C8
org $02D58B
	dw $74C8
org $02D8F7
	dw $74C8
org $02D900
	dw $74C8
org $02DA5E
	dw $74C8
org $02DB67
	dw $74C8
org $02DC00
	dw $74C8
org $02DCBF
	dw $74C8
org $02DD9D
	dw $74C8
org $02DF03
	dw $74C8
org $02E275
	dw $74C8
org $02E319
	dw $74C8
org $02E606
	dw $74C8
org $02E93E
	dw $74C8
org $02EA64
	dw $74C8
org $02EAFB
	dw $74C8
org $02EB35
	dw $74C8
org $02ED9C
	dw $74C8
org $02EDE0
	dw $74C8
org $02EDF0
	dw $74C8
org $02EE22
	dw $74C8
org $02EF71
	dw $74C8
org $02EF7E
	dw $74C8
org $02F21E
	dw $74C8
org $02F2A0
	dw $74C8
org $02F460
	dw $74C8
org $02F54B
	dw $74C8
org $02F55B
	dw $74C8
org $038090
	dw $74C8
org $0381D6
	dw $74C8
org $0381E7
	dw $74C8
org $038212
	dw $74C8
org $0384E6
	dw $74C8
org $038537
	dw $74C8
org $038718
	dw $74C8
org $038774
	dw $74C8
org $0388B7
	dw $74C8
org $03898D
	dw $74C8
org $038AE2
	dw $74C8
org $038FA5
	dw $74C8
org $039388
	dw $74C8
org $03951B
	dw $74C8
org $039531
	dw $74C8
org $0395E1
	dw $74C8
org $0395F5
	dw $74C8
org $039911
	dw $74C8
org $039ACF
	dw $74C8
org $039BD9
	dw $74C8
org $039C4F
	dw $74C8
org $03A51E
	dw $74C8
org $03A6CB
	dw $74C8
org $03A6E5
	dw $74C8
org $03A7EC
	dw $74C8
org $03A7FE
	dw $74C8
org $03A8D9
	dw $74C8
org $03A8EB
	dw $74C8
org $03B023
	dw $74C8
org $03B02E
	dw $74C8
org $03B0E0
	dw $74C8
org $03B158
	dw $74C8
org $03B2AE
	dw $74C8
org $03B8AD
	dw $74C8
org $03B8C0
	dw $74C8
org $03C035
	dw $74C8
org $03C06A
	dw $74C8
org $03C212
	dw $74C8
org $03C2DD
	dw $74C8
org $03C2E9
	dw $74C8
org $03C4E9
	dw $74C8
org $03C4F7
	dw $74C8
org $03C7C8
	dw $74C8
org $03C7D3
	dw $74C8
org $03C956
	dw $74C8
org $03CBC8
	dw $74C8
org $03CC18
	dw $74C8
org $03CCEB
	dw $74C8
org $03CDFA
	dw $74C8
org $03CE8F
	dw $74C8
;============== REMAPPER FOR $14C9
org $03A523
	dw $74C9
;============== REMAPPER FOR $14CA
;============== REMAPPER FOR $14CB
org $02AA6F
	dw $74CB
;============== REMAPPER FOR $14CC
;============== REMAPPER FOR $14CD
;============== REMAPPER FOR $14CE
;============== REMAPPER FOR $14CF
;============== REMAPPER FOR $14D0
org $03A620
	dw $74D0
org $03AC66
	dw $74D0
;============== REMAPPER FOR $14D1
;============== REMAPPER FOR $14D2
;============== REMAPPER FOR $14D3
;============== REMAPPER FOR $14D4
org $00FA71
	dw $74D4
org $00FC61
	dw $74D4
org $00FCBA
	dw $74D4
org $00FD05
	dw $74D4
org $00FF4A
	dw $74D4
org $00FF7B
	dw $74D4
org $018363
	dw $74D4
org $018368
	dw $74D4
org $0183BB
	dw $74D4
org $018409
	dw $74D4
org $018496
	dw $74D4
org $0184BF
	dw $74D4
org $0184C2
	dw $74D4
org $0185A9
	dw $74D4
org $0185AE
	dw $74D4
org $0185C0
	dw $74D4
org $0188C5
	dw $74D4
org $018BF8
	dw $74D4
org $018BFE
	dw $74D4
org $018C05
	dw $74D4
org $018F85
	dw $74D4
org $019176
	dw $74D4
org $01917B
	dw $74D4
org $019197
	dw $74D4
org $01919C
	dw $74D4
org $0193A5
	dw $74D4
org $0193AA
	dw $74D4
org $019462
	dw $74D4
org $0194CC
	dw $74D4
org $0195BB
	dw $74D4
org $01970E
	dw $74D4
org $019711
	dw $74D4
org $019791
	dw $74D4
org $019794
	dw $74D4
org $0199F4
	dw $74D4
org $019E9E
	dw $74D4
org $019EA4
	dw $74D4
org $019F03
	dw $74D4
org $01A124
	dw $74D4
org $01A246
	dw $74D4
org $01A2D1
	dw $74D4
org $01A2D6
	dw $74D4
org $01A348
	dw $74D4
org $01A34D
	dw $74D4
org $01A3B3
	dw $74D4
org $01A475
	dw $74D4
org $01A492
	dw $74D4
org $01AAEB
	dw $74D4
org $01AC00
	dw $74D4
org $01AC03
	dw $74D4
org $01AC44
	dw $74D4
org $01ACE7
	dw $74D4
org $01AD4E
	dw $74D4
org $01AE24
	dw $74D4
org $01B187
	dw $74D4
org $01B250
	dw $74D4
org $01B255
	dw $74D4
org $01B492
	dw $74D4
org $01B63C
	dw $74D4
org $01B642
	dw $74D4
org $01B649
	dw $74D4
org $01B7CC
	dw $74D4
org $01B899
	dw $74D4
org $01B925
	dw $74D4
org $01B9A7
	dw $74D4
org $01B9BF
	dw $74D4
org $01B9C4
	dw $74D4
org $01B9F5
	dw $74D4
org $01BCA9
	dw $74D4
org $01BE1C
	dw $74D4
org $01BF4B
	dw $74D4
org $01BF50
	dw $74D4
org $01C06D
	dw $74D4
org $01C072
	dw $74D4
org $01C08A
	dw $74D4
org $01C092
	dw $74D4
org $01C1C4
	dw $74D4
org $01C1E1
	dw $74D4
org $01C405
	dw $74D4
org $01C76B
	dw $74D4
org $01C770
	dw $74D4
org $01CAFD
	dw $74D4
org $01CD46
	dw $74D4
org $01CFEF
	dw $74D4
org $01D085
	dw $74D4
org $01D08A
	dw $74D4
org $01D0C5
	dw $74D4
org $01D396
	dw $74D4
org $01D39B
	dw $74D4
org $01D432
	dw $74D4
org $01D518
	dw $74D4
org $01D5D2
	dw $74D4
org $01D5D8
	dw $74D4
org $01D62D
	dw $74D4
org $01D632
	dw $74D4
org $01D667
	dw $74D4
org $01D6BE
	dw $74D4
org $01D812
	dw $74D4
org $01D8A9
	dw $74D4
org $01D8BD
	dw $74D4
org $01D93F
	dw $74D4
org $01DA56
	dw $74D4
org $01DAC7
	dw $74D4
org $01DACD
	dw $74D4
org $01DAD4
	dw $74D4
org $01DB19
	dw $74D4
org $01DB1F
	dw $74D4
org $01DB33
	dw $74D4
org $01DDD7
	dw $74D4
org $01E056
	dw $74D4
org $01E063
	dw $74D4
org $01E068
	dw $74D4
org $01E0EB
	dw $74D4
org $01E22B
	dw $74D4
org $01E337
	dw $74D4
org $01E674
	dw $74D4
org $01E827
	dw $74D4
org $01E87C
	dw $74D4
org $01E8BE
	dw $74D4
org $01E8C3
	dw $74D4
org $01EA4B
	dw $74D4
org $01EA4E
	dw $74D4
org $01EB70
	dw $74D4
org $01ECBC
	dw $74D4
org $01ECC1
	dw $74D4
org $01ED22
	dw $74D4
org $01EDD9
	dw $74D4
org $01EF30
	dw $74D4
org $01EF36
	dw $74D4
org $01EFA1
	dw $74D4
org $01EFA8
	dw $74D4
org $01F219
	dw $74D4
org $01F21C
	dw $74D4
org $01F2AE
	dw $74D4
org $01F510
	dw $74D4
org $01F515
	dw $74D4
org $01F558
	dw $74D4
org $01F5E3
	dw $74D4
org $01F7D6
	dw $74D4
org $01FD69
	dw $74D4
org $01FDEF
	dw $74D4
org $01FFB1
	dw $74D4
org $02806B
	dw $74D4
org $02854A
	dw $74D4
org $028622
	dw $74D4
org $028642
	dw $74D4
org $028982
	dw $74D4
org $0289A3
	dw $74D4
org $028B5F
	dw $74D4
org $028BDE
	dw $74D4
org $02A957
	dw $74D4
org $02A966
	dw $74D4
org $02AC35
	dw $74D4
org $02AC38
	dw $74D4
org $02AD03
	dw $74D4
org $02AF69
	dw $74D4
org $02AFDC
	dw $74D4
org $02B068
	dw $74D4
org $02B0AF
	dw $74D4
org $02B14A
	dw $74D4
org $02B181
	dw $74D4
org $02B1E8
	dw $74D4
org $02B233
	dw $74D4
org $02B2A6
	dw $74D4
org $02B301
	dw $74D4
org $02B35D
	dw $74D4
org $02B40B
	dw $74D4
org $02B4D1
	dw $74D4
org $02B858
	dw $74D4
org $02B85B
	dw $74D4
org $02B9B4
	dw $74D4
org $02BAE2
	dw $74D4
org $02C1E1
	dw $74D4
org $02C1E6
	dw $74D4
org $02C490
	dw $74D4
org $02C5DD
	dw $74D4
org $02C5E0
	dw $74D4
org $02CC3C
	dw $74D4
org $02CC3F
	dw $74D4
org $02CC4F
	dw $74D4
org $02CD75
	dw $74D4
org $02D03E
	dw $74D4
org $02D0B7
	dw $74D4
org $02D0F4
	dw $74D4
org $02D156
	dw $74D4
org $02D2BA
	dw $74D4
org $02D2BD
	dw $74D4
org $02D2E5
	dw $74D4
org $02D3BF
	dw $74D4
org $02D440
	dw $74D4
org $02D518
	dw $74D4
org $02D6DA
	dw $74D4
org $02D711
	dw $74D4
org $02D716
	dw $74D4
org $02D759
	dw $74D4
org $02DAD9
	dw $74D4
org $02DB91
	dw $74D4
org $02DB96
	dw $74D4
org $02DDB4
	dw $74D4
org $02DDB7
	dw $74D4
org $02DF6C
	dw $74D4
org $02E0AB
	dw $74D4
org $02E105
	dw $74D4
org $02E10B
	dw $74D4
org $02E11A
	dw $74D4
org $02E1E8
	dw $74D4
org $02E2D1
	dw $74D4
org $02E484
	dw $74D4
org $02E4B6
	dw $74D4
org $02E4BD
	dw $74D4
org $02E4D5
	dw $74D4
org $02E512
	dw $74D4
org $02E546
	dw $74D4
org $02E854
	dw $74D4
org $02E85A
	dw $74D4
org $02E863
	dw $74D4
org $02E8D9
	dw $74D4
org $02E8F9
	dw $74D4
org $02EB13
	dw $74D4
org $02EB16
	dw $74D4
org $02EDA9
	dw $74D4
org $02EDAC
	dw $74D4
org $02EE8A
	dw $74D4
org $02EEE0
	dw $74D4
org $02EF96
	dw $74D4
org $02EF99
	dw $74D4
org $02EFD7
	dw $74D4
org $02F56F
	dw $74D4
org $02F95D
	dw $74D4
org $02FC27
	dw $74D4
org $038222
	dw $74D4
org $038805
	dw $74D4
org $038B17
	dw $74D4
org $038B1C
	dw $74D4
org $038CC1
	dw $74D4
org $03904D
	dw $74D4
org $039119
	dw $74D4
org $03935F
	dw $74D4
org $039365
	dw $74D4
org $03936D
	dw $74D4
org $03939B
	dw $74D4
org $0398B7
	dw $74D4
org $0399E7
	dw $74D4
org $039AE7
	dw $74D4
org $039AEA
	dw $74D4
org $039B2C
	dw $74D4
org $039B35
	dw $74D4
org $039B3E
	dw $74D4
org $039DE2
	dw $74D4
org $039F7B
	dw $74D4
org $03A02C
	dw $74D4
org $03A04E
	dw $74D4
org $03A054
	dw $74D4
org $03A05C
	dw $74D4
org $03A0FF
	dw $74D4
org $03A63D
	dw $74D4
org $03A7D2
	dw $74D4
org $03A81D
	dw $74D4
org $03A90B
	dw $74D4
org $03A910
	dw $74D4
org $03AB80
	dw $74D4
org $03ABA3
	dw $74D4
org $03AC60
	dw $74D4
org $03AC83
	dw $74D4
org $03AD4C
	dw $74D4
org $03ADA1
	dw $74D4
org $03B03E
	dw $74D4
org $03B043
	dw $74D4
org $03B18F
	dw $74D4
org $03B6D6
	dw $74D4
org $03B71C
	dw $74D4
org $03B7A7
	dw $74D4
org $03B835
	dw $74D4
org $03B870
	dw $74D4
org $03B8E9
	dw $74D4
org $03C018
	dw $74D4
org $03C078
	dw $74D4
org $03C07D
	dw $74D4
org $03C2FF
	dw $74D4
org $03C32D
	dw $74D4
org $03C332
	dw $74D4
org $03C46F
	dw $74D4
org $03C7EC
	dw $74D4
org $03CBD0
	dw $74D4
org $03CBD3
	dw $74D4
org $03CD1B
	dw $74D4
org $03CD1E
	dw $74D4
org $03CE6A
	dw $74D4
org $03DEEE
	dw $74D4
org $07FC64
	dw $74D4
org $0CA010
	dw $74D4
org $0CA284
	dw $74D4
;============== REMAPPER FOR $14D5
;============== REMAPPER FOR $14D6
;============== REMAPPER FOR $14D7
;============== REMAPPER FOR $14D8
;============== REMAPPER FOR $14D9
;============== REMAPPER FOR $14DA
;============== REMAPPER FOR $14DB
;============== REMAPPER FOR $14DC
org $03A642
	dw $74DC
org $03AC88
	dw $74DC
;============== REMAPPER FOR $14DD
;============== REMAPPER FOR $14DE
;============== REMAPPER FOR $14DF
;============== REMAPPER FOR $14E0
org $00FA60
	dw $74E0
org $00FBC3
	dw $74E0
org $00FBC6
	dw $74E0
org $00FC57
	dw $74E0
org $00FCA8
	dw $74E0
org $00FCFC
	dw $74E0
org $00FF33
	dw $74E0
org $00FF62
	dw $74E0
org $0183D2
	dw $74E0
org $018446
	dw $74E0
org $01844B
	dw $74E0
org $0184B4
	dw $74E0
org $0184B7
	dw $74E0
org $0188B5
	dw $74E0
org $018F75
	dw $74E0
org $019167
	dw $74E0
org $01916C
	dw $74E0
org $019188
	dw $74E0
org $01918D
	dw $74E0
org $0191B9
	dw $74E0
org $0191BC
	dw $74E0
org $0191D9
	dw $74E0
org $0191DF
	dw $74E0
org $0193FD
	dw $74E0
org $019403
	dw $74E0
org $019477
	dw $74E0
org $0194E8
	dw $74E0
org $0195AE
	dw $74E0
org $019703
	dw $74E0
org $019706
	dw $74E0
org $019786
	dw $74E0
org $019789
	dw $74E0
org $0199EB
	dw $74E0
org $019E41
	dw $74E0
org $019EAF
	dw $74E0
org $019EB5
	dw $74E0
org $019EDC
	dw $74E0
org $019EE1
	dw $74E0
org $019EFC
	dw $74E0
org $01A057
	dw $74E0
org $01A105
	dw $74E0
org $01A238
	dw $74E0
org $01A338
	dw $74E0
org $01A33D
	dw $74E0
org $01A370
	dw $74E0
org $01A37A
	dw $74E0
org $01A442
	dw $74E0
org $01A44C
	dw $74E0
org $01A574
	dw $74E0
org $01A577
	dw $74E0
org $01A7AB
	dw $74E0
org $01A7B5
	dw $74E0
org $01AC70
	dw $74E0
org $01ACB6
	dw $74E0
org $01AD3C
	dw $74E0
org $01AE1B
	dw $74E0
org $01B16E
	dw $74E0
org $01B52E
	dw $74E0
org $01B7DA
	dw $74E0
org $01B8F8
	dw $74E0
org $01B90F
	dw $74E0
org $01BC9E
	dw $74E0
org $01BE2E
	dw $74E0
org $01BF3D
	dw $74E0
org $01BF40
	dw $74E0
org $01C07D
	dw $74E0
org $01C1D8
	dw $74E0
org $01C75C
	dw $74E0
org $01C761
	dw $74E0
org $01CADF
	dw $74E0
org $01CD84
	dw $74E0
org $01CEC0
	dw $74E0
org $01D078
	dw $74E0
org $01D09F
	dw $74E0
org $01D35A
	dw $74E0
org $01D360
	dw $74E0
org $01D373
	dw $74E0
org $01D413
	dw $74E0
org $01D473
	dw $74E0
org $01D611
	dw $74E0
org $01D618
	dw $74E0
org $01D6B7
	dw $74E0
org $01D6FE
	dw $74E0
org $01D703
	dw $74E0
org $01D802
	dw $74E0
org $01D8B2
	dw $74E0
org $01D8C6
	dw $74E0
org $01D948
	dw $74E0
org $01DAB6
	dw $74E0
org $01DABC
	dw $74E0
org $01DADB
	dw $74E0
org $01DB08
	dw $74E0
org $01DB0E
	dw $74E0
org $01DB3A
	dw $74E0
org $01DDC9
	dw $74E0
org $01E1C0
	dw $74E0
org $01E1C5
	dw $74E0
org $01E220
	dw $74E0
org $01E32E
	dw $74E0
org $01E830
	dw $74E0
org $01E86D
	dw $74E0
org $01E8B0
	dw $74E0
org $01E8B3
	dw $74E0
org $01EA40
	dw $74E0
org $01EA43
	dw $74E0
org $01EB5F
	dw $74E0
org $01ECAA
	dw $74E0
org $01ECB1
	dw $74E0
org $01ED14
	dw $74E0
org $01EF4C
	dw $74E0
org $01EF53
	dw $74E0
org $01EF89
	dw $74E0
org $01F20A
	dw $74E0
org $01F211
	dw $74E0
org $01F2A3
	dw $74E0
org $01F4DF
	dw $74E0
org $01F4E5
	dw $74E0
org $01F547
	dw $74E0
org $01F5D9
	dw $74E0
org $01FD59
	dw $74E0
org $01FDDF
	dw $74E0
org $01FFA1
	dw $74E0
org $02805D
	dw $74E0
org $028499
	dw $74E0
org $0284FE
	dw $74E0
org $028558
	dw $74E0
org $02860C
	dw $74E0
org $02864B
	dw $74E0
org $028979
	dw $74E0
org $028995
	dw $74E0
org $028B54
	dw $74E0
org $02A94E
	dw $74E0
org $02A96F
	dw $74E0
org $02AC2B
	dw $74E0
org $02AC2E
	dw $74E0
org $02AD28
	dw $74E0
org $02AF60
	dw $74E0
org $02AFD3
	dw $74E0
org $02B076
	dw $74E0
org $02B0C3
	dw $74E0
org $02B13A
	dw $74E0
org $02B1A0
	dw $74E0
org $02B200
	dw $74E0
org $02B247
	dw $74E0
org $02B2C5
	dw $74E0
org $02B317
	dw $74E0
org $02B384
	dw $74E0
org $02B3FF
	dw $74E0
org $02B4C0
	dw $74E0
org $02B844
	dw $74E0
org $02B847
	dw $74E0
org $02B96E
	dw $74E0
org $02B9AB
	dw $74E0
org $02BAD4
	dw $74E0
org $02BB2F
	dw $74E0
org $02C1B4
	dw $74E0
org $02C1CF
	dw $74E0
org $02C483
	dw $74E0
org $02C5D2
	dw $74E0
org $02C5D5
	dw $74E0
org $02CC17
	dw $74E0
org $02CC1C
	dw $74E0
org $02CC46
	dw $74E0
org $02CD69
	dw $74E0
org $02D06A
	dw $74E0
org $02D10E
	dw $74E0
org $02D172
	dw $74E0
org $02D2DB
	dw $74E0
org $02D383
	dw $74E0
org $02D38D
	dw $74E0
org $02D404
	dw $74E0
org $02D407
	dw $74E0
org $02D43B
	dw $74E0
org $02D4B4
	dw $74E0
org $02D506
	dw $74E0
org $02D6D3
	dw $74E0
org $02D6FC
	dw $74E0
org $02D701
	dw $74E0
org $02D760
	dw $74E0
org $02DACE
	dw $74E0
org $02DB83
	dw $74E0
org $02DB86
	dw $74E0
org $02DDA7
	dw $74E0
org $02DDAC
	dw $74E0
org $02DF31
	dw $74E0
org $02E09E
	dw $74E0
org $02E1DB
	dw $74E0
org $02E2C8
	dw $74E0
org $02E47B
	dw $74E0
org $02E4AF
	dw $74E0
org $02E4CC
	dw $74E0
org $02E4DC
	dw $74E0
org $02E53D
	dw $74E0
org $02E8D0
	dw $74E0
org $02E8EE
	dw $74E0
org $02EAC3
	dw $74E0
org $02EAC6
	dw $74E0
org $02EAEA
	dw $74E0
org $02EB08
	dw $74E0
org $02EB0B
	dw $74E0
org $02EDBD
	dw $74E0
org $02EDC2
	dw $74E0
org $02EF8B
	dw $74E0
org $02EF8E
	dw $74E0
org $02EFCA
	dw $74E0
org $02F207
	dw $74E0
org $02F2F2
	dw $74E0
org $02F56A
	dw $74E0
org $02F952
	dw $74E0
org $02FC0C
	dw $74E0
org $038219
	dw $74E0
org $038AEE
	dw $74E0
org $038B06
	dw $74E0
org $039042
	dw $74E0
org $039104
	dw $74E0
org $03934E
	dw $74E0
org $039354
	dw $74E0
org $039374
	dw $74E0
org $039392
	dw $74E0
org $0398B0
	dw $74E0
org $0399C3
	dw $74E0
org $039ADC
	dw $74E0
org $039ADF
	dw $74E0
org $039B19
	dw $74E0
org $039C9B
	dw $74E0
org $039CA1
	dw $74E0
org $039DCD
	dw $74E0
org $039F70
	dw $74E0
org $03A021
	dw $74E0
org $03A108
	dw $74E0
org $03A62E
	dw $74E0
org $03A78E
	dw $74E0
org $03A7B6
	dw $74E0
org $03A815
	dw $74E0
org $03A8FB
	dw $74E0
org $03A900
	dw $74E0
org $03AB37
	dw $74E0
org $03AC5D
	dw $74E0
org $03AC74
	dw $74E0
org $03AD8F
	dw $74E0
org $03B04A
	dw $74E0
org $03B060
	dw $74E0
org $03B6B9
	dw $74E0
org $03B6FF
	dw $74E0
org $03B76B
	dw $74E0
org $03B775
	dw $74E0
org $03B823
	dw $74E0
org $03B89C
	dw $74E0
org $03C00A
	dw $74E0
org $03C1DE
	dw $74E0
org $03C1E4
	dw $74E0
org $03C2F6
	dw $74E0
org $03C47C
	dw $74E0
org $03C7DD
	dw $74E0
org $03CBDA
	dw $74E0
org $03CBF4
	dw $74E0
org $03CD10
	dw $74E0
org $03CD13
	dw $74E0
org $03DEE3
	dw $74E0
org $07FC74
	dw $74E0
org $0CA009
	dw $74E0
org $0CA27B
	dw $74E0
;============== REMAPPER FOR $14E1
;============== REMAPPER FOR $14E2
;============== REMAPPER FOR $14E3
;============== REMAPPER FOR $14E4
;============== REMAPPER FOR $14E5
;============== REMAPPER FOR $14E6
;============== REMAPPER FOR $14E7
;============== REMAPPER FOR $14E8
org $03A633
	dw $74E8
org $03AC79
	dw $74E8
;============== REMAPPER FOR $14E9
;============== REMAPPER FOR $14EA
;============== REMAPPER FOR $14EB
;============== REMAPPER FOR $14EC
org $01ABE2
	dw $74EC
org $01ABE5
	dw $74EC
org $02D29C
	dw $74EC
org $02D29F
	dw $74EC
org $07F75C
	dw $74EC
;============== REMAPPER FOR $14ED
;============== REMAPPER FOR $14EE
;============== REMAPPER FOR $14EF
;============== REMAPPER FOR $14F0
;============== REMAPPER FOR $14F1
;============== REMAPPER FOR $14F2
;============== REMAPPER FOR $14F3
;============== REMAPPER FOR $14F4
;============== REMAPPER FOR $14F5
;============== REMAPPER FOR $14F6
;============== REMAPPER FOR $14F7
;============== REMAPPER FOR $14F8
org $07F757
	dw $74F8
;============== REMAPPER FOR $14F9
;============== REMAPPER FOR $14FA
;============== REMAPPER FOR $14FB
;============== REMAPPER FOR $14FC
;============== REMAPPER FOR $14FD
;============== REMAPPER FOR $14FE
;============== REMAPPER FOR $14FF
;============== REMAPPER FOR $1500
;============== REMAPPER FOR $1501
;============== REMAPPER FOR $1502
;============== REMAPPER FOR $1503
;============== REMAPPER FOR $1504
org $01C786
	dw $7504
org $01C790
	dw $7504
org $01C793
	dw $7504
org $01CA8D
	dw $7504
org $01CA99
	dw $7504
org $01CCF1
	dw $7504
org $01CD02
	dw $7504
org $07F780
	dw $7504
;============== REMAPPER FOR $1505
;============== REMAPPER FOR $1506
;============== REMAPPER FOR $1507
;============== REMAPPER FOR $1508
;============== REMAPPER FOR $1509
;============== REMAPPER FOR $150A
;============== REMAPPER FOR $150B
;============== REMAPPER FOR $150C
;============== REMAPPER FOR $150D
;============== REMAPPER FOR $150E
;============== REMAPPER FOR $150F
;============== REMAPPER FOR $1510
org $01CCF9
	dw $7510
org $01CCFC
	dw $7510
;============== REMAPPER FOR $1511
;============== REMAPPER FOR $1512
;============== REMAPPER FOR $1513
;============== REMAPPER FOR $1514
;============== REMAPPER FOR $1515
;============== REMAPPER FOR $1516
;============== REMAPPER FOR $1517
;============== REMAPPER FOR $1518
;============== REMAPPER FOR $1519
;============== REMAPPER FOR $151A
;============== REMAPPER FOR $151B
org $02A4A2
	dw $751B
;============== REMAPPER FOR $151C
org $0183BE
	dw $751C
org $01840F
	dw $751C
org $018414
	dw $751C
org $018422
	dw $751C
org $018457
	dw $751C
org $0184D3
	dw $751C
org $018523
	dw $751C
org $01855B
	dw $751C
org $018B55
	dw $751C
org $018B9B
	dw $751C
org $018BAE
	dw $751C
org $018D0B
	dw $751C
org $018D20
	dw $751C
org $018D51
	dw $751C
org $018D7B
	dw $751C
org $018D88
	dw $751C
org $018D8D
	dw $751C
org $018D94
	dw $751C
org $018FB9
	dw $751C
org $0198B4
	dw $751C
org $01A9BB
	dw $751C
org $01AB18
	dw $751C
org $01AD62
	dw $751C
org $01AE2E
	dw $751C
org $01AE99
	dw $751C
org $01AF2F
	dw $751C
org $01B00F
	dw $751C
org $01B0B7
	dw $751C
org $01B0D0
	dw $751C
org $01B1BC
	dw $751C
org $01B1F1
	dw $751C
org $01B239
	dw $751C
org $01B244
	dw $751C
org $01B281
	dw $751C
org $01B296
	dw $751C
org $01B5EB
	dw $751C
org $01B5EE
	dw $751C
org $01B6B8
	dw $751C
org $01B6C7
	dw $751C
org $01B6CE
	dw $751C
org $01B6EA
	dw $751C
org $01B6F9
	dw $751C
org $01B700
	dw $751C
org $01B721
	dw $751C
org $01C082
	dw $751C
org $01C0C7
	dw $751C
org $01C224
	dw $751C
org $01C237
	dw $751C
org $01C31A
	dw $751C
org $01C3CC
	dw $751C
org $01C3DB
	dw $751C
org $01C470
	dw $751C
org $01C4B2
	dw $751C
org $01C74D
	dw $751C
org $01C796
	dw $751C
org $01C7A1
	dw $751C
org $01C7A4
	dw $751C
org $01C7BF
	dw $751C
org $01CA7F
	dw $751C
org $01CB16
	dw $751C
org $01CD11
	dw $751C
org $01CD14
	dw $751C
org $01CE0C
	dw $751C
org $01CE31
	dw $751C
org $01CE3B
	dw $751C
org $01CE54
	dw $751C
org $01CFBA
	dw $751C
org $01CFD8
	dw $751C
org $01D03B
	dw $751C
org $01D2A9
	dw $751C
org $01D3A9
	dw $751C
org $01D3B2
	dw $751C
org $01D51B
	dw $751C
org $01D6A4
	dw $751C
org $01D7B6
	dw $751C
org $01D8D1
	dw $751C
org $01E059
	dw $751C
org $01E0EE
	dw $751C
org $01E1E7
	dw $751C
org $01E397
	dw $751C
org $01E7FA
	dw $751C
org $01E837
	dw $751C
org $01EA0A
	dw $751C
org $01EAFC
	dw $751C
org $01EB28
	dw $751C
org $01ECDD
	dw $751C
org $01ED89
	dw $751C
org $01EFCB
	dw $751C
org $01EFE3
	dw $751C
org $01F1D4
	dw $751C
org $01F315
	dw $751C
org $01F31B
	dw $751C
org $01F338
	dw $751C
org $01F340
	dw $751C
org $01F345
	dw $751C
org $01F43F
	dw $751C
org $01F4BF
	dw $751C
org $01F4C4
	dw $751C
org $01F52D
	dw $751C
org $01F532
	dw $751C
org $01F73B
	dw $751C
org $01F78B
	dw $751C
org $01F83E
	dw $751C
org $0289FF
	dw $751C
org $028A33
	dw $751C
org $02AF77
	dw $751C
org $02B2CD
	dw $751C
org $02B737
	dw $751C
org $02B80B
	dw $751C
org $02BBD8
	dw $751C
org $02C077
	dw $751C
org $02C091
	dw $751C
org $02C153
	dw $751C
org $02C191
	dw $751C
org $02C222
	dw $751C
org $02C39F
	dw $751C
org $02C561
	dw $751C
org $02C698
	dw $751C
org $02C6F3
	dw $751C
org $02C774
	dw $751C
org $02C8B2
	dw $751C
org $02CDE5
	dw $751C
org $02CE25
	dw $751C
org $02CE30
	dw $751C
org $02CE45
	dw $751C
org $02CE4A
	dw $751C
org $02CE62
	dw $751C
org $02CE68
	dw $751C
org $02CFF3
	dw $751C
org $02D64C
	dw $751C
org $02D651
	dw $751C
org $02D654
	dw $751C
org $02D943
	dw $751C
org $02D956
	dw $751C
org $02DBC2
	dw $751C
org $02DBD5
	dw $751C
org $02DF9B
	dw $751C
org $02DFEC
	dw $751C
org $02E051
	dw $751C
org $02E0F2
	dw $751C
org $02E178
	dw $751C
org $02E2AE
	dw $751C
org $02E2BF
	dw $751C
org $02E4BA
	dw $751C
org $02E515
	dw $751C
org $02E578
	dw $751C
org $02E57B
	dw $751C
org $02E6E5
	dw $751C
org $02EBAC
	dw $751C
org $02EBAF
	dw $751C
org $02F06E
	dw $751C
org $02F08A
	dw $751C
org $02F11E
	dw $751C
org $02F275
	dw $751C
org $02F290
	dw $751C
org $02F483
	dw $751C
org $02F486
	dw $751C
org $038151
	dw $751C
org $038164
	dw $751C
org $03862D
	dw $751C
org $0387D5
	dw $751C
org $038843
	dw $751C
org $03893D
	dw $751C
org $038950
	dw $751C
org $038C63
	dw $751C
org $038C7E
	dw $751C
org $0392ED
	dw $751C
org $039476
	dw $751C
org $0399EA
	dw $751C
org $039AB0
	dw $751C
org $039AC4
	dw $751C
org $039B76
	dw $751C
org $039D76
	dw $751C
org $039EAA
	dw $751C
org $039F26
	dw $751C
org $039F73
	dw $751C
org $03A01E
	dw $751C
org $03A309
	dw $751C
org $03A326
	dw $751C
org $03A488
	dw $751C
org $03A503
	dw $751C
org $03A67C
	dw $751C
org $03A68A
	dw $751C
org $03A6C3
	dw $751C
org $03A797
	dw $751C
org $03A7C9
	dw $751C
org $03A8A2
	dw $751C
org $03ABB2
	dw $751C
org $03ABE8
	dw $751C
org $03ADC0
	dw $751C
org $03ADF1
	dw $751C
org $03B07F
	dw $751C
org $03B124
	dw $751C
org $03B12F
	dw $751C
org $03C878
	dw $751C
org $03C8B9
	dw $751C
org $03C8C6
	dw $751C
org $03C8D0
	dw $751C
org $03C8D7
	dw $751C
org $03C8E5
	dw $751C
org $03CC23
	dw $751C
org $03CCD7
	dw $751C
org $03CD2C
	dw $751C
org $03CDD7
	dw $751C
org $03CDFE
	dw $751C
org $03CE20
	dw $751C
org $03CE77
	dw $751C
org $03CEDE
	dw $751C
org $07F72B
	dw $751C
;============== REMAPPER FOR $151D
;============== REMAPPER FOR $151E
;============== REMAPPER FOR $151F
;============== REMAPPER FOR $1520
org $0398F7
	dw $7520
org $03D70E
	dw $7520
;============== REMAPPER FOR $1521
org $0398F4
	dw $7521
org $03D712
	dw $7521
;============== REMAPPER FOR $1522
org $0398F1
	dw $7522
org $03D715
	dw $7522
;============== REMAPPER FOR $1523
org $0398ED
	dw $7523
org $03D718
	dw $7523
;============== REMAPPER FOR $1524
;============== REMAPPER FOR $1525
;============== REMAPPER FOR $1526
;============== REMAPPER FOR $1527
;============== REMAPPER FOR $1528
org $0189B5
	dw $7528
org $018A10
	dw $7528
org $018A2A
	dw $7528
org $018BA1
	dw $7528
org $018BB1
	dw $7528
org $019763
	dw $7528
org $019929
	dw $7528
org $01993A
	dw $7528
org $01A797
	dw $7528
org $01AD8E
	dw $7528
org $01ADF3
	dw $7528
org $01AE4E
	dw $7528
org $01AED5
	dw $7528
org $01AEE3
	dw $7528
org $01AEF1
	dw $7528
org $01AF2A
	dw $7528
org $01AF58
	dw $7528
org $01B2BA
	dw $7528
org $01B4A1
	dw $7528
org $01B548
	dw $7528
org $01C087
	dw $7528
org $01C0DA
	dw $7528
org $01C112
	dw $7528
org $01C398
	dw $7528
org $01C716
	dw $7528
org $01C729
	dw $7528
org $01C752
	dw $7528
org $01C79A
	dw $7528
org $01C7A9
	dw $7528
org $01C7AE
	dw $7528
org $01C7BB
	dw $7528
org $01CA85
	dw $7528
org $01CB1B
	dw $7528
org $01CD18
	dw $7528
org $01CD1B
	dw $7528
org $01CE6C
	dw $7528
org $01CEA6
	dw $7528
org $01CEC5
	dw $7528
org $01CF2A
	dw $7528
org $01D117
	dw $7528
org $01D212
	dw $7528
org $01D249
	dw $7528
org $01D2B7
	dw $7528
org $01D7BB
	dw $7528
org $01D8D7
	dw $7528
org $01DAEB
	dw $7528
org $01DAF2
	dw $7528
org $01DB41
	dw $7528
org $01E053
	dw $7528
org $01E0E6
	dw $7528
org $01E587
	dw $7528
org $01E58A
	dw $7528
org $01E58F
	dw $7528
org $02A0FD
	dw $7528
org $02A100
	dw $7528
org $02BBA5
	dw $7528
org $02BD37
	dw $7528
org $02BF62
	dw $7528
org $02BF6A
	dw $7528
org $02C0E6
	dw $7528
org $02C0EE
	dw $7528
org $02C7E9
	dw $7528
org $02C7EC
	dw $7528
org $02CDF2
	dw $7528
org $02CE18
	dw $7528
org $02CE89
	dw $7528
org $02CFCF
	dw $7528
org $02CFF8
	dw $7528
org $02D6F4
	dw $7528
org $02DBDE
	dw $7528
org $02E552
	dw $7528
org $03816D
	dw $7528
org $038180
	dw $7528
org $038647
	dw $7528
org $038DE1
	dw $7528
org $038DF8
	dw $7528
org $038EA1
	dw $7528
org $0392D7
	dw $7528
org $0399CD
	dw $7528
org $039F78
	dw $7528
org $03A024
	dw $7528
org $03A4A6
	dw $7528
org $03A4B9
	dw $7528
org $03A716
	dw $7528
org $03A732
	dw $7528
org $03A74D
	dw $7528
org $03CCCD
	dw $7528
org $03CDDF
	dw $7528
org $07F72E
	dw $7528
;============== REMAPPER FOR $1529
;============== REMAPPER FOR $152A
;============== REMAPPER FOR $152B
;============== REMAPPER FOR $152C
;============== REMAPPER FOR $152D
;============== REMAPPER FOR $152E
;============== REMAPPER FOR $152F
;============== REMAPPER FOR $1530
;============== REMAPPER FOR $1531
;============== REMAPPER FOR $1532
;============== REMAPPER FOR $1533
;============== REMAPPER FOR $1534
org $018384
	dw $7534
org $0183B8
	dw $7534
org $018548
	dw $7534
org $01856A
	dw $7534
org $018A16
	dw $7534
org $018A25
	dw $7534
org $018A71
	dw $7534
org $018AE6
	dw $7534
org $018BA4
	dw $7534
org $019639
	dw $7534
org $01A792
	dw $7534
org $01A7BE
	dw $7534
org $01ADCC
	dw $7534
org $01ADDF
	dw $7534
org $01C095
	dw $7534
org $01C0DF
	dw $7534
org $01C378
	dw $7534
org $01C572
	dw $7534
org $01CD8A
	dw $7534
org $01D177
	dw $7534
org $01D17D
	dw $7534
org $01D1A8
	dw $7534
org $01D772
	dw $7534
org $01D778
	dw $7534
org $01D785
	dw $7534
org $01D788
	dw $7534
org $01D8E1
	dw $7534
org $01E43F
	dw $7534
org $01E44C
	dw $7534
org $01E5FC
	dw $7534
org $01E9D1
	dw $7534
org $01E9E4
	dw $7534
org $01F5F8
	dw $7534
org $01F879
	dw $7534
org $01FB0C
	dw $7534
org $01FB0F
	dw $7534
org $02806E
	dw $7534
org $02B673
	dw $7534
org $02B879
	dw $7534
org $02C14B
	dw $7534
org $02C15C
	dw $7534
org $02C15F
	dw $7534
org $02C172
	dw $7534
org $02C3CC
	dw $7534
org $02C3E5
	dw $7534
org $02C45D
	dw $7534
org $02C67E
	dw $7534
org $02C69C
	dw $7534
org $02CDD6
	dw $7534
org $02CDDB
	dw $7534
org $02CDE2
	dw $7534
org $02CFE1
	dw $7534
org $02D6F1
	dw $7534
org $02D6F8
	dw $7534
org $02D8E9
	dw $7534
org $02D90F
	dw $7534
org $02D912
	dw $7534
org $02D91E
	dw $7534
org $02D96C
	dw $7534
org $02D975
	dw $7534
org $02D9F2
	dw $7534
org $02DBAC
	dw $7534
org $02DBBF
	dw $7534
org $02E4C0
	dw $7534
org $02E50D
	dw $7534
org $02E571
	dw $7534
org $02E574
	dw $7534
org $02E846
	dw $7534
org $02E84F
	dw $7534
org $02E869
	dw $7534
org $02E86F
	dw $7534
org $02ED28
	dw $7534
org $02F076
	dw $7534
org $02F079
	dw $7534
org $03819C
	dw $7534
org $03819F
	dw $7534
org $038603
	dw $7534
org $038606
	dw $7534
org $039301
	dw $7534
org $039304
	dw $7534
org $039F7E
	dw $7534
org $03A029
	dw $7534
org $03A4BC
	dw $7534
org $03A4CF
	dw $7534
org $03A719
	dw $7534
org $03A750
	dw $7534
org $03A76B
	dw $7534
org $03C4DD
	dw $7534
org $03C4FE
	dw $7534
org $03C7BF
	dw $7534
org $03C7F7
	dw $7534
org $03C7FC
	dw $7534
org $03C80D
	dw $7534
org $03C829
	dw $7534
org $03C84D
	dw $7534
org $03C872
	dw $7534
org $03C894
	dw $7534
org $03C8B2
	dw $7534
org $03C988
	dw $7534
org $03CA04
	dw $7534
org $03CE14
	dw $7534
org $03CE17
	dw $7534
org $03CED1
	dw $7534
org $07F731
	dw $7534
;============== REMAPPER FOR $1535
;============== REMAPPER FOR $1536
;============== REMAPPER FOR $1537
;============== REMAPPER FOR $1538
;============== REMAPPER FOR $1539
;============== REMAPPER FOR $153A
;============== REMAPPER FOR $153B
;============== REMAPPER FOR $153C
;============== REMAPPER FOR $153D
org $00F93A
	dw $753D
org $0283CF
	dw $753D
;============== REMAPPER FOR $153E
;============== REMAPPER FOR $153F
;============== REMAPPER FOR $1540
org $00FA7D
	dw $7540
org $00FABC
	dw $7540
org $00FBC9
	dw $7540
org $00FBE0
	dw $7540
org $0180EF
	dw $7540
org $0180F4
	dw $7540
org $01837A
	dw $7540
org $0184E6
	dw $7540
org $01850B
	dw $7540
org $018560
	dw $7540
org $018595
	dw $7540
org $01899E
	dw $7540
org $018A7E
	dw $7540
org $018A85
	dw $7540
org $018AEB
	dw $7540
org $018AF7
	dw $7540
org $018CFE
	dw $7540
org $018D25
	dw $7540
org $018D83
	dw $7540
org $018D9F
	dw $7540
org $018EB2
	dw $7540
org $018EEA
	dw $7540
org $018F2C
	dw $7540
org $018F41
	dw $7540
org $019024
	dw $7540
org $01962B
	dw $7540
org $01963E
	dw $7540
org $01965D
	dw $7540
org $01969D
	dw $7540
org $0196DE
	dw $7540
org $019724
	dw $7540
org $019727
	dw $7540
org $01983A
	dw $7540
org $019A53
	dw $7540
org $019A5E
	dw $7540
org $019AD3
	dw $7540
org $019AE9
	dw $7540
org $01A07E
	dw $7540
org $01A134
	dw $7540
org $01A156
	dw $7540
org $01A1D5
	dw $7540
org $01A72F
	dw $7540
org $01A984
	dw $7540
org $01A991
	dw $7540
org $01A9DB
	dw $7540
org $01A9FE
	dw $7540
org $01AA10
	dw $7540
org $01AA2B
	dw $7540
org $01AA9B
	dw $7540
org $01ADC1
	dw $7540
org $01ADE4
	dw $7540
org $01AF1F
	dw $7540
org $01AF25
	dw $7540
org $01AFE2
	dw $7540
org $01B004
	dw $7540
org $01B0BF
	dw $7540
org $01B0C6
	dw $7540
org $01B1D7
	dw $7540
org $01B1F8
	dw $7540
org $01B274
	dw $7540
org $01B2A3
	dw $7540
org $01B6C0
	dw $7540
org $01B6D5
	dw $7540
org $01B6F2
	dw $7540
org $01B707
	dw $7540
org $01B980
	dw $7540
org $01BA35
	dw $7540
org $01BAE5
	dw $7540
org $01BAF6
	dw $7540
org $01BB17
	dw $7540
org $01BB4A
	dw $7540
org $01BE04
	dw $7540
org $01BE7C
	dw $7540
org $01BE9F
	dw $7540
org $01BFE4
	dw $7540
org $01BFEB
	dw $7540
org $01BFFC
	dw $7540
org $01C005
	dw $7540
org $01C00C
	dw $7540
org $01C025
	dw $7540
org $01C0A8
	dw $7540
org $01C0AF
	dw $7540
org $01C11D
	dw $7540
org $01C176
	dw $7540
org $01C187
	dw $7540
org $01C1B5
	dw $7540
org $01C204
	dw $7540
org $01C2C3
	dw $7540
org $01C390
	dw $7540
org $01C48E
	dw $7540
org $01C4C0
	dw $7540
org $01CD4B
	dw $7540
org $01CE7D
	dw $7540
org $01CE94
	dw $7540
org $01CEAB
	dw $7540
org $01CEB7
	dw $7540
org $01CED0
	dw $7540
org $01CEFE
	dw $7540
org $01CF86
	dw $7540
org $01CFDD
	dw $7540
org $01CFE1
	dw $7540
org $01D040
	dw $7540
org $01D044
	dw $7540
org $01D0BA
	dw $7540
org $01D240
	dw $7540
org $01D2A1
	dw $7540
org $01D3A4
	dw $7540
org $01D456
	dw $7540
org $01D49F
	dw $7540
org $01D50A
	dw $7540
org $01D5B9
	dw $7540
org $01D646
	dw $7540
org $01D65A
	dw $7540
org $01D66F
	dw $7540
org $01D6B3
	dw $7540
org $01D6E1
	dw $7540
org $01D714
	dw $7540
org $01D751
	dw $7540
org $01D81A
	dw $7540
org $01D892
	dw $7540
org $01D8E8
	dw $7540
org $01DA8D
	dw $7540
org $01DB2F
	dw $7540
org $01DB4C
	dw $7540
org $01DE8A
	dw $7540
org $01DF1A
	dw $7540
org $01E078
	dw $7540
org $01E097
	dw $7540
org $01E0E0
	dw $7540
org $01E303
	dw $7540
org $01E30A
	dw $7540
org $01E3F3
	dw $7540
org $01E447
	dw $7540
org $01E490
	dw $7540
org $01E4E0
	dw $7540
org $01E503
	dw $7540
org $01E52E
	dw $7540
org $01E594
	dw $7540
org $01E5B4
	dw $7540
org $01E5E2
	dw $7540
org $01E601
	dw $7540
org $01E651
	dw $7540
org $01E684
	dw $7540
org $01E6EE
	dw $7540
org $01E7C3
	dw $7540
org $01E7C6
	dw $7540
org $01E927
	dw $7540
org $01F754
	dw $7540
org $01F79A
	dw $7540
org $01F8F6
	dw $7540
org $01F8FD
	dw $7540
org $02809D
	dw $7540
org $0280A6
	dw $7540
org $0280B3
	dw $7540
org $0280C5
	dw $7540
org $028658
	dw $7540
org $028A0B
	dw $7540
org $028A14
	dw $7540
org $02941C
	dw $7540
org $029446
	dw $7540
org $02B41F
	dw $7540
org $02B73C
	dw $7540
org $02B815
	dw $7540
org $02B88E
	dw $7540
org $02B8A8
	dw $7540
org $02B932
	dw $7540
org $02BD69
	dw $7540
org $02BD70
	dw $7540
org $02BD7C
	dw $7540
org $02BDA2
	dw $7540
org $02BDB4
	dw $7540
org $02BDE5
	dw $7540
org $02BDF8
	dw $7540
org $02C146
	dw $7540
org $02C157
	dw $7540
org $02C16B
	dw $7540
org $02C1F0
	dw $7540
org $02C3E2
	dw $7540
org $02C3EE
	dw $7540
org $02C3F3
	dw $7540
org $02C3FF
	dw $7540
org $02C40A
	dw $7540
org $02C40D
	dw $7540
org $02C429
	dw $7540
org $02C43B
	dw $7540
org $02C517
	dw $7540
org $02C51E
	dw $7540
org $02C551
	dw $7540
org $02C56A
	dw $7540
org $02C586
	dw $7540
org $02C5AC
	dw $7540
org $02C5FA
	dw $7540
org $02C615
	dw $7540
org $02C644
	dw $7540
org $02C663
	dw $7540
org $02C669
	dw $7540
org $02C6D2
	dw $7540
org $02C6D8
	dw $7540
org $02C6EA
	dw $7540
org $02C72C
	dw $7540
org $02C73A
	dw $7540
org $02C74E
	dw $7540
org $02C75E
	dw $7540
org $02C788
	dw $7540
org $02C802
	dw $7540
org $02C899
	dw $7540
org $02CD5A
	dw $7540
org $02CE10
	dw $7540
org $02CE37
	dw $7540
org $02CFD8
	dw $7540
org $02D423
	dw $7540
org $02D42C
	dw $7540
org $02D446
	dw $7540
org $02D47C
	dw $7540
org $02D482
	dw $7540
org $02D499
	dw $7540
org $02D997
	dw $7540
org $02DAA4
	dw $7540
org $02DAAB
	dw $7540
org $02DCF0
	dw $7540
org $02DCFA
	dw $7540
org $02DD00
	dw $7540
org $02DD1C
	dw $7540
org $02DD4E
	dw $7540
org $02DEB1
	dw $7540
org $02DED4
	dw $7540
org $02DFCA
	dw $7540
org $02DFD1
	dw $7540
org $02DFE0
	dw $7540
org $02DFF0
	dw $7540
org $02E13F
	dw $7540
org $02E172
	dw $7540
org $02E17B
	dw $7540
org $02E1A1
	dw $7540
org $02E221
	dw $7540
org $02E75A
	dw $7540
org $02E779
	dw $7540
org $02E781
	dw $7540
org $02E789
	dw $7540
org $02E7B2
	dw $7540
org $02E7C1
	dw $7540
org $02E7D5
	dw $7540
org $02E7EB
	dw $7540
org $02E96E
	dw $7540
org $02E981
	dw $7540
org $02E987
	dw $7540
org $02E9B5
	dw $7540
org $02E9BE
	dw $7540
org $02E9D6
	dw $7540
org $02F044
	dw $7540
org $02F28D
	dw $7540
org $02F397
	dw $7540
org $02F3B4
	dw $7540
org $02F44C
	dw $7540
org $02F578
	dw $7540
org $038022
	dw $7540
org $038050
	dw $7540
org $0380D0
	dw $7540
org $0380D6
	dw $7540
org $0380DD
	dw $7540
org $0380F7
	dw $7540
org $038107
	dw $7540
org $03818C
	dw $7540
org $038195
	dw $7540
org $0381BD
	dw $7540
org $0381C4
	dw $7540
org $0381D0
	dw $7540
org $03820D
	dw $7540
org $038463
	dw $7540
org $038487
	dw $7540
org $03870A
	dw $7540
org $038726
	dw $7540
org $038731
	dw $7540
org $0387A9
	dw $7540
org $0387AC
	dw $7540
org $03899D
	dw $7540
org $038AA7
	dw $7540
org $038AC4
	dw $7540
org $038C3A
	dw $7540
org $038C43
	dw $7540
org $038E81
	dw $7540
org $038E90
	dw $7540
org $039228
	dw $7540
org $03925F
	dw $7540
org $039263
	dw $7540
org $039442
	dw $7540
org $03944F
	dw $7540
org $039459
	dw $7540
org $039466
	dw $7540
org $03946C
	dw $7540
org $0395E6
	dw $7540
org $03973D
	dw $7540
org $03975B
	dw $7540
org $039762
	dw $7540
org $03977B
	dw $7540
org $039CB0
	dw $7540
org $039CBD
	dw $7540
org $039D44
	dw $7540
org $039D4D
	dw $7540
org $039F5B
	dw $7540
org $039F94
	dw $7540
org $039FA5
	dw $7540
org $039FAE
	dw $7540
org $039FC9
	dw $7540
org $039FD9
	dw $7540
org $039FF3
	dw $7540
org $03A036
	dw $7540
org $03A447
	dw $7540
org $03A462
	dw $7540
org $03A68F
	dw $7540
org $03A6EA
	dw $7540
org $03A6F9
	dw $7540
org $03A84E
	dw $7540
org $03A86B
	dw $7540
org $03ABB7
	dw $7540
org $03ABC6
	dw $7540
org $03ABE3
	dw $7540
org $03AC23
	dw $7540
org $03AD5F
	dw $7540
org $03ADB4
	dw $7540
org $03AE22
	dw $7540
org $03AE26
	dw $7540
org $03AE2F
	dw $7540
org $03AE33
	dw $7540
org $03AEB3
	dw $7540
org $03AEC5
	dw $7540
org $03AECD
	dw $7540
org $03AEE9
	dw $7540
org $03B35B
	dw $7540
org $03B370
	dw $7540
org $03C370
	dw $7540
org $03C377
	dw $7540
org $03CC05
	dw $7540
org $03CC8B
	dw $7540
org $03CCD4
	dw $7540
org $03CD22
	dw $7540
org $03CD29
	dw $7540
org $03CDCB
	dw $7540
org $03CDD2
	dw $7540
org $03CDF0
	dw $7540
org $03CE03
	dw $7540
org $03CE0F
	dw $7540
org $03CE7C
	dw $7540
org $03CE8A
	dw $7540
org $03CEEA
	dw $7540
org $07F1CB
	dw $7540
org $07F740
	dw $7540
;============== REMAPPER FOR $1541
;============== REMAPPER FOR $1542
;============== REMAPPER FOR $1543
;============== REMAPPER FOR $1544
;============== REMAPPER FOR $1545
;============== REMAPPER FOR $1546
;============== REMAPPER FOR $1547
;============== REMAPPER FOR $1548
;============== REMAPPER FOR $1549
org $029469
	dw $7549
;============== REMAPPER FOR $154A
;============== REMAPPER FOR $154B
;============== REMAPPER FOR $154C
org $00FB7B
	dw $754C
org $0180F7
	dw $754C
org $0180FC
	dw $754C
org $019760
	dw $754C
org $0197AA
	dw $754C
org $01A0A9
	dw $754C
org $01A882
	dw $754C
org $01A889
	dw $754C
org $01AAA7
	dw $754C
org $01AAB8
	dw $754C
org $01BAD1
	dw $754C
org $01BAF9
	dw $754C
org $01BB14
	dw $754C
org $01C4BB
	dw $754C
org $01C709
	dw $754C
org $01DA1D
	dw $754C
org $01DA3D
	dw $754C
org $01DF3E
	dw $754C
org $01E029
	dw $754C
org $01E02E
	dw $754C
org $01E033
	dw $754C
org $01E20C
	dw $754C
org $01E238
	dw $754C
org $01E6B6
	dw $754C
org $01E805
	dw $754C
org $01E893
	dw $754C
org $01E8C8
	dw $754C
org $01ECD7
	dw $754C
org $01FAF8
	dw $754C
org $01FBB3
	dw $754C
org $01FC0F
	dw $754C
org $01FCFB
	dw $754C
org $01FD02
	dw $754C
org $01FD48
	dw $754C
org $028A1D
	dw $754C
org $0293C7
	dw $754C
org $029407
	dw $754C
org $0294E5
	dw $754C
org $02D98E
	dw $754C
org $02EB20
	dw $754C
org $02F255
	dw $754C
org $02F25E
	dw $754C
org $02F382
	dw $754C
org $02F38C
	dw $754C
org $0387F2
	dw $754C
org $03881F
	dw $754C
org $039591
	dw $754C
org $039598
	dw $754C
org $039A38
	dw $754C
org $039A45
	dw $754C
org $03A442
	dw $754C
org $03A47F
	dw $754C
org $03ABDE
	dw $754C
org $03AC07
	dw $754C
org $03ACB6
	dw $754C
org $03ACBC
	dw $754C
org $03AE49
	dw $754C
org $03B08F
	dw $754C
org $03B0D9
	dw $754C
org $03C308
	dw $754C
org $03C323
	dw $754C
org $07F743
	dw $754C
;============== REMAPPER FOR $154D
;============== REMAPPER FOR $154E
;============== REMAPPER FOR $154F
;============== REMAPPER FOR $1550
;============== REMAPPER FOR $1551
;============== REMAPPER FOR $1552
;============== REMAPPER FOR $1553
;============== REMAPPER FOR $1554
;============== REMAPPER FOR $1555
;============== REMAPPER FOR $1556
;============== REMAPPER FOR $1557
;============== REMAPPER FOR $1558
org $0180FF
	dw $7558
org $018104
	dw $7558
org $018A9C
	dw $7558
org $018AD2
	dw $7558
org $018B9E
	dw $7558
org $018F9A
	dw $7558
org $018FA8
	dw $7558
org $019338
	dw $7558
org $019660
	dw $7558
org $019665
	dw $7558
org $019835
	dw $7558
org $019A2D
	dw $7558
org $019A3E
	dw $7558
org $019A7C
	dw $7558
org $01A54E
	dw $7558
org $01A551
	dw $7558
org $01A6EF
	dw $7558
org $01A6F2
	dw $7558
org $01A71C
	dw $7558
org $01A75A
	dw $7558
org $01A76D
	dw $7558
org $01AE02
	dw $7558
org $01B4F0
	dw $7558
org $01C47F
	dw $7558
org $01CED5
	dw $7558
org $01CF45
	dw $7558
org $01E13F
	dw $7558
org $01E14D
	dw $7558
org $01E3DB
	dw $7558
org $01E3E2
	dw $7558
org $01EA11
	dw $7558
org $01F12F
	dw $7558
org $01F252
	dw $7558
org $01F32B
	dw $7558
org $01F333
	dw $7558
org $01F607
	dw $7558
org $01F957
	dw $7558
org $01FCC1
	dw $7558
org $01FCC8
	dw $7558
org $029424
	dw $7558
org $029449
	dw $7558
org $02B7D7
	dw $7558
org $02B819
	dw $7558
org $02BCEC
	dw $7558
org $02BD3C
	dw $7558
org $02BF0D
	dw $7558
org $02BF80
	dw $7558
org $02C13B
	dw $7558
org $02C17B
	dw $7558
org $02C437
	dw $7558
org $02C467
	dw $7558
org $02DBE5
	dw $7558
org $02DC47
	dw $7558
org $02DD0F
	dw $7558
org $02DD2D
	dw $7558
org $0383AF
	dw $7558
org $038438
	dw $7558
org $03896C
	dw $7558
org $0389A0
	dw $7558
org $0389E0
	dw $7558
org $038D77
	dw $7558
org $038D83
	dw $7558
org $038D94
	dw $7558
org $039526
	dw $7558
org $0395BE
	dw $7558
org $03967F
	dw $7558
org $03971E
	dw $7558
org $039794
	dw $7558
org $039A0E
	dw $7558
org $039A1A
	dw $7558
org $039A96
	dw $7558
org $039AC1
	dw $7558
org $03A303
	dw $7558
org $03A313
	dw $7558
org $03ACDF
	dw $7558
org $03AE58
	dw $7558
org $03C201
	dw $7558
org $03C22C
	dw $7558
org $07F746
	dw $7558
;============== REMAPPER FOR $1559
;============== REMAPPER FOR $155A
;============== REMAPPER FOR $155B
;============== REMAPPER FOR $155C
;============== REMAPPER FOR $155D
;============== REMAPPER FOR $155E
;============== REMAPPER FOR $155F
;============== REMAPPER FOR $1560
;============== REMAPPER FOR $1561
;============== REMAPPER FOR $1562
;============== REMAPPER FOR $1563
;============== REMAPPER FOR $1564
org $018107
	dw $7564
org $01810C
	dw $7564
org $0183DD
	dw $7564
org $0189A6
	dw $7564
org $01971B
	dw $7564
org $01A42A
	dw $7564
org $01A42D
	dw $7564
org $01A721
	dw $7564
org $01A753
	dw $7564
org $01B4E5
	dw $7564
org $01E0FF
	dw $7564
org $01E116
	dw $7564
org $01E75C
	dw $7564
org $01EFFE
	dw $7564
org $01F010
	dw $7564
org $01F1C1
	dw $7564
org $01F1DC
	dw $7564
org $01F37B
	dw $7564
org $01FB18
	dw $7564
org $01FB83
	dw $7564
org $01FC2B
	dw $7564
org $02BCF7
	dw $7564
org $02BDD2
	dw $7564
org $02BE1B
	dw $7564
org $02C79E
	dw $7564
org $02C7D0
	dw $7564
org $02D0D5
	dw $7564
org $02D1DF
	dw $7564
org $039A60
	dw $7564
org $039AB5
	dw $7564
org $039BF8
	dw $7564
org $03A2AE
	dw $7564
org $03A3E6
	dw $7564
org $03ABF9
	dw $7564
org $03AC00
	dw $7564
org $03C797
	dw $7564
org $03C813
	dw $7564
org $03C838
	dw $7564
org $03C846
	dw $7564
org $07F749
	dw $7564
;============== REMAPPER FOR $1565
;============== REMAPPER FOR $1566
;============== REMAPPER FOR $1567
;============== REMAPPER FOR $1568
;============== REMAPPER FOR $1569
;============== REMAPPER FOR $156A
;============== REMAPPER FOR $156B
;============== REMAPPER FOR $156C
;============== REMAPPER FOR $156D
org $03C7A8
	dw $756D
org $03C883
	dw $756D
;============== REMAPPER FOR $156E
;============== REMAPPER FOR $156F
;============== REMAPPER FOR $1570
org $00FBF1
	dw $7570
org $018332
	dw $7570
org $01857A
	dw $7570
org $0189E7
	dw $7570
org $018A63
	dw $7570
org $018B62
	dw $7570
org $018B91
	dw $7570
org $018C7D
	dw $7570
org $018CED
	dw $7570
org $018D5A
	dw $7570
org $018D5D
	dw $7570
org $018D60
	dw $7570
org $018D80
	dw $7570
org $018DED
	dw $7570
org $018E60
	dw $7570
org $018E63
	dw $7570
org $019EC9
	dw $7570
org $01A2F5
	dw $7570
org $01A2F8
	dw $7570
org $01ADF6
	dw $7570
org $01B1EB
	dw $7570
org $01B1EE
	dw $7570
org $01BA3C
	dw $7570
org $01BA58
	dw $7570
org $01BE52
	dw $7570
org $01BFEE
	dw $7570
org $01BFF1
	dw $7570
org $01C00F
	dw $7570
org $01C012
	dw $7570
org $01C029
	dw $7570
org $01C253
	dw $7570
org $01C3C0
	dw $7570
org $01D52A
	dw $7570
org $01D531
	dw $7570
org $01D53E
	dw $7570
org $01D5E6
	dw $7570
org $01D605
	dw $7570
org $01D6A9
	dw $7570
org $01D78B
	dw $7570
org $01D793
	dw $7570
org $01D79A
	dw $7570
org $01D7A9
	dw $7570
org $01D8DE
	dw $7570
org $01DDEA
	dw $7570
org $01DE4C
	dw $7570
org $01DE4F
	dw $7570
org $01DE56
	dw $7570
org $01DE7F
	dw $7570
org $01DE85
	dw $7570
org $01DF6D
	dw $7570
org $01E00E
	dw $7570
org $01E558
	dw $7570
org $01E564
	dw $7570
org $01E5A8
	dw $7570
org $01EABC
	dw $7570
org $01EAC4
	dw $7570
org $01EAE0
	dw $7570
org $01F889
	dw $7570
org $01F94D
	dw $7570
org $01F950
	dw $7570
org $01F98A
	dw $7570
org $01FBF1
	dw $7570
org $01FBF8
	dw $7570
org $01FBFB
	dw $7570
org $02809A
	dw $7570
org $02B370
	dw $7570
org $02B6BF
	dw $7570
org $02B6C2
	dw $7570
org $02C007
	dw $7570
org $02C07E
	dw $7570
org $02C0BE
	dw $7570
org $02C14E
	dw $7570
org $02C164
	dw $7570
org $02C182
	dw $7570
org $02C74B
	dw $7570
org $02C753
	dw $7570
org $02C805
	dw $7570
org $02CC03
	dw $7570
org $02CCF3
	dw $7570
org $02CE3B
	dw $7570
org $02CE3E
	dw $7570
org $02CFFB
	dw $7570
org $02DA87
	dw $7570
org $02DA8A
	dw $7570
org $02DA98
	dw $7570
org $02DD21
	dw $7570
org $02DD24
	dw $7570
org $02DD30
	dw $7570
org $02DD37
	dw $7570
org $02DF12
	dw $7570
org $02DF15
	dw $7570
org $02DF1F
	dw $7570
org $02DF4E
	dw $7570
org $02E0D9
	dw $7570
org $02E167
	dw $7570
org $02E180
	dw $7570
org $02E1AB
	dw $7570
org $02E348
	dw $7570
org $02E3AE
	dw $7570
org $02E430
	dw $7570
org $02E433
	dw $7570
org $02E43C
	dw $7570
org $02E5C4
	dw $7570
org $02E5C9
	dw $7570
org $02E75F
	dw $7570
org $02E762
	dw $7570
org $02E7AD
	dw $7570
org $02E891
	dw $7570
org $02E894
	dw $7570
org $02E89C
	dw $7570
org $02EEC9
	dw $7570
org $02EED0
	dw $7570
org $02EEFA
	dw $7570
org $02EFAB
	dw $7570
org $02F06B
	dw $7570
org $02F073
	dw $7570
org $02F114
	dw $7570
org $02F369
	dw $7570
org $02F36E
	dw $7570
org $02F37E
	dw $7570
org $02F3A4
	dw $7570
org $02F3A9
	dw $7570
org $02F3D8
	dw $7570
org $02F435
	dw $7570
org $02F43A
	dw $7570
org $0380C4
	dw $7570
org $0380C7
	dw $7570
org $038110
	dw $7570
org $038DD0
	dw $7570
org $038DD5
	dw $7570
org $038DD8
	dw $7570
org $038E16
	dw $7570
org $0392F2
	dw $7570
org $039317
	dw $7570
org $039538
	dw $7570
org $03953B
	dw $7570
org $039730
	dw $7570
org $039733
	dw $7570
org $039883
	dw $7570
org $0399FF
	dw $7570
org $039A02
	dw $7570
org $039A09
	dw $7570
org $039DF0
	dw $7570
org $039DF3
	dw $7570
org $03A286
	dw $7570
org $03A44E
	dw $7570
org $03A479
	dw $7570
org $03A4E8
	dw $7570
org $03A5C4
	dw $7570
org $03A5E9
	dw $7570
org $03A6B8
	dw $7570
org $03A70F
	dw $7570
org $03A89A
	dw $7570
org $03B1CC
	dw $7570
org $03B1CF
	dw $7570
org $03B1D2
	dw $7570
org $03B265
	dw $7570
org $03B2FA
	dw $7570
org $03B2FD
	dw $7570
org $03B405
	dw $7570
org $03C09C
	dw $7570
org $03C09F
	dw $7570
org $03C8B5
	dw $7570
org $03C8BC
	dw $7570
org $03C8DE
	dw $7570
org $03C9EF
	dw $7570
org $03CC90
	dw $7570
org $03CCA1
	dw $7570
org $03CCBD
	dw $7570
org $03CCFD
	dw $7570
org $03CDF5
	dw $7570
org $03CE2B
	dw $7570
org $03CEC7
	dw $7570
org $03CEE3
	dw $7570
org $07F752
	dw $7570
;============== REMAPPER FOR $1571
;============== REMAPPER FOR $1572
;============== REMAPPER FOR $1573
;============== REMAPPER FOR $1574
;============== REMAPPER FOR $1575
;============== REMAPPER FOR $1576
;============== REMAPPER FOR $1577
;============== REMAPPER FOR $1578
;============== REMAPPER FOR $1579
org $01DE04
	dw $7579
;============== REMAPPER FOR $157A
;============== REMAPPER FOR $157B
org $02A497
	dw $757B
;============== REMAPPER FOR $157C
org $00FC6B
	dw $757C
org $00FCDF
	dw $757C
org $018315
	dw $757C
org $0183E4
	dw $757C
org $018516
	dw $757C
org $018581
	dw $757C
org $0188DD
	dw $757C
org $0188E0
	dw $757C
org $01898D
	dw $757C
org $018B16
	dw $757C
org $018B2F
	dw $757C
org $018B69
	dw $757C
org $018B71
	dw $757C
org $018BC4
	dw $757C
org $018BD9
	dw $757C
org $018BDC
	dw $757C
org $018C15
	dw $757C
org $018C52
	dw $757C
org $018CCB
	dw $757C
org $018CD3
	dw $757C
org $018DBE
	dw $757C
org $018DFD
	dw $757C
org $018FEA
	dw $757C
org $01908A
	dw $757C
org $0190AA
	dw $757C
org $0190AF
	dw $757C
org $019716
	dw $757C
org $01973B
	dw $757C
org $019759
	dw $757C
org $0197A5
	dw $757C
org $0198C0
	dw $757C
org $019A1F
	dw $757C
org $019D74
	dw $757C
org $019DB2
	dw $757C
org $019DDD
	dw $757C
org $019E4E
	dw $757C
org $019EC2
	dw $757C
org $019EC6
	dw $757C
org $019EED
	dw $757C
org $019EF4
	dw $757C
org $019F13
	dw $757C
org $019F38
	dw $757C
org $01A175
	dw $757C
org $01A21B
	dw $757C
org $01A325
	dw $757C
org $01A589
	dw $757C
org $01A58F
	dw $757C
org $01A593
	dw $757C
org $01A5A9
	dw $757C
org $01A5B1
	dw $757C
org $01A5B5
	dw $757C
org $01A70A
	dw $757C
org $01A788
	dw $757C
org $01A78B
	dw $757C
org $01A90F
	dw $757C
org $01AD65
	dw $757C
org $01AED2
	dw $757C
org $01B21A
	dw $757C
org $01BA54
	dw $757C
org $01BA60
	dw $757C
org $01BA7C
	dw $757C
org $01BE5C
	dw $757C
org $01BE79
	dw $757C
org $01BED6
	dw $757C
org $01BEF3
	dw $757C
org $01C25E
	dw $757C
org $01C351
	dw $757C
org $01C6BE
	dw $757C
org $01CD61
	dw $757C
org $01CDBB
	dw $757C
org $01CDF6
	dw $757C
org $01CDFE
	dw $757C
org $01CE02
	dw $757C
org $01D08D
	dw $757C
org $01D0AB
	dw $757C
org $01D0AE
	dw $757C
org $01D1B6
	dw $757C
org $01D1FB
	dw $757C
org $01D216
	dw $757C
org $01D225
	dw $757C
org $01D250
	dw $757C
org $01D491
	dw $757C
org $01D5F2
	dw $757C
org $01D640
	dw $757C
org $01D708
	dw $757C
org $01D76D
	dw $757C
org $01D875
	dw $757C
org $01D8ED
	dw $757C
org $01D90E
	dw $757C
org $01DB7C
	dw $757C
org $01DDE1
	dw $757C
org $01DE8D
	dw $757C
org $01DED8
	dw $757C
org $01DEDF
	dw $757C
org $01E3D3
	dw $757C
org $01E46E
	dw $757C
org $01E4CB
	dw $757C
org $01E999
	dw $757C
org $01EB4F
	dw $757C
org $01EB91
	dw $757C
org $01EC98
	dw $757C
org $01ECA7
	dw $757C
org $01ED81
	dw $757C
org $01EE74
	dw $757C
org $01EE7B
	dw $757C
org $01EF3A
	dw $757C
org $01F04D
	dw $757C
org $01F1FA
	dw $757C
org $01F207
	dw $757C
org $01F239
	dw $757C
org $01F23C
	dw $757C
org $01F2BA
	dw $757C
org $01F41B
	dw $757C
org $01F434
	dw $757C
org $01F455
	dw $757C
org $01F924
	dw $757C
org $01F977
	dw $757C
org $01F97C
	dw $757C
org $01FA5C
	dw $757C
org $01FA82
	dw $757C
org $01FB88
	dw $757C
org $01FB90
	dw $757C
org $01FC14
	dw $757C
org $01FC23
	dw $757C
org $01FC4B
	dw $757C
org $01FDCA
	dw $757C
org $01FDCD
	dw $757C
org $01FEC9
	dw $757C
org $0289CA
	dw $757C
org $02941F
	dw $757C
org $0294BE
	dw $757C
org $02A141
	dw $757C
org $02B079
	dw $757C
org $02B204
	dw $757C
org $02B24B
	dw $757C
org $02B418
	dw $757C
org $02B6CD
	dw $757C
org $02B6D0
	dw $757C
org $02B6FD
	dw $757C
org $02B702
	dw $757C
org $02B8C3
	dw $757C
org $02B90B
	dw $757C
org $02B974
	dw $757C
org $02BB3B
	dw $757C
org $02BC07
	dw $757C
org $02C0D2
	dw $757C
org $02C12F
	dw $757C
org $02C18B
	dw $757C
org $02C1AB
	dw $757C
org $02C499
	dw $757C
org $02C55B
	dw $757C
org $02C607
	dw $757C
org $02C66E
	dw $757C
org $02C673
	dw $757C
org $02C6CB
	dw $757C
org $02C6ED
	dw $757C
org $02C8B7
	dw $757C
org $02CAFF
	dw $757C
org $02CB57
	dw $757C
org $02CBC7
	dw $757C
org $02CE1D
	dw $757C
org $02CE52
	dw $757C
org $02CE6D
	dw $757C
org $02CE83
	dw $757C
org $02D103
	dw $757C
org $02D164
	dw $757C
org $02D935
	dw $757C
org $02D99E
	dw $757C
org $02DA5B
	dw $757C
org $02DA95
	dw $757C
org $02DAB0
	dw $757C
org $02DB01
	dw $757C
org $02DD14
	dw $757C
org $02DD82
	dw $757C
org $02DD87
	dw $757C
org $02DE42
	dw $757C
org $02E320
	dw $757C
org $02E474
	dw $757C
org $02E74F
	dw $757C
org $02E769
	dw $757C
org $02E76E
	dw $757C
org $02E990
	dw $757C
org $02E9B1
	dw $757C
org $02EA15
	dw $757C
org $02EABB
	dw $757C
org $02EACB
	dw $757C
org $02EB61
	dw $757C
org $02EB96
	dw $757C
org $02EBE8
	dw $757C
org $02ECE2
	dw $757C
org $02EFA6
	dw $757C
org $02F00D
	dw $757C
org $02F084
	dw $757C
org $02F087
	dw $757C
org $02F0B4
	dw $757C
org $02F0B9
	dw $757C
org $02F0D4
	dw $757C
org $02F1A9
	dw $757C
org $02F1CC
	dw $757C
org $02F343
	dw $757C
org $02F3C2
	dw $757C
org $02F3C7
	dw $757C
org $02F3F2
	dw $757C
org $038129
	dw $757C
org $038138
	dw $757C
org $03813D
	dw $757C
org $0383D5
	dw $757C
org $038517
	dw $757C
org $038549
	dw $757C
org $0385AD
	dw $757C
org $03861C
	dw $757C
org $03861F
	dw $757C
org $03877E
	dw $757C
org $0387C6
	dw $757C
org $0387CB
	dw $757C
org $0387D2
	dw $757C
org $0388F9
	dw $757C
org $03891C
	dw $757C
org $038962
	dw $757C
org $038973
	dw $757C
org $038980
	dw $757C
org $038A92
	dw $757C
org $038A97
	dw $757C
org $038AB7
	dw $757C
org $038AF4
	dw $757C
org $038B1F
	dw $757C
org $038B22
	dw $757C
org $038B50
	dw $757C
org $038EFB
	dw $757C
org $038F1F
	dw $757C
org $038F82
	dw $757C
org $039084
	dw $757C
org $0390F4
	dw $757C
org $039189
	dw $757C
org $0392BE
	dw $757C
org $03931D
	dw $757C
org $039384
	dw $757C
org $03955C
	dw $757C
org $03957A
	dw $757C
org $03957F
	dw $757C
org $0395D7
	dw $757C
org $03969C
	dw $757C
org $039746
	dw $757C
org $0397A5
	dw $757C
org $039A22
	dw $757C
org $039A2A
	dw $757C
org $039A2E
	dw $757C
org $039A7F
	dw $757C
org $039A8E
	dw $757C
org $039AAB
	dw $757C
org $039B85
	dw $757C
org $039C82
	dw $757C
org $039C87
	dw $757C
org $039CD8
	dw $757C
org $039CDF
	dw $757C
org $039DBE
	dw $757C
org $039E4D
	dw $757C
org $039FBA
	dw $757C
org $039FC5
	dw $757C
org $039FDC
	dw $757C
org $03A0A8
	dw $757C
org $03A28C
	dw $757C
org $03A4FA
	dw $757C
org $03A91D
	dw $757C
org $03A928
	dw $757C
org $03ACC2
	dw $757C
org $03ADC7
	dw $757C
org $03AE0B
	dw $757C
org $03AE19
	dw $757C
org $03AF5D
	dw $757C
org $03B2CD
	dw $757C
org $03B2E1
	dw $757C
org $03B2F2
	dw $757C
org $03B2F7
	dw $757C
org $03B394
	dw $757C
org $03B40E
	dw $757C
org $03C33C
	dw $757C
org $03C359
	dw $757C
org $03C394
	dw $757C
org $03C3A3
	dw $757C
org $03C3AA
	dw $757C
org $03C3E9
	dw $757C
org $03C3ED
	dw $757C
org $03C482
	dw $757C
org $03CBE0
	dw $757C
org $07F734
	dw $757C
org $0CA794
	dw $757C
;============== REMAPPER FOR $157D
;============== REMAPPER FOR $157E
;============== REMAPPER FOR $157F
;============== REMAPPER FOR $1580
;============== REMAPPER FOR $1581
;============== REMAPPER FOR $1582
;============== REMAPPER FOR $1583
;============== REMAPPER FOR $1584
;============== REMAPPER FOR $1585
;============== REMAPPER FOR $1586
;============== REMAPPER FOR $1587
;============== REMAPPER FOR $1588
org $018009
	dw $7588
org $01800F
	dw $7588
org $018015
	dw $7588
org $01804F
	dw $7588
org $018B34
	dw $7588
org $018C69
	dw $7588
org $019086
	dw $7588
org $01908E
	dw $7588
org $019144
	dw $7588
org $01919F
	dw $7588
org $0191C4
	dw $7588
org $0191E6
	dw $7588
org $0191EB
	dw $7588
org $0192B3
	dw $7588
org $0192B8
	dw $7588
org $019308
	dw $7588
org $01930D
	dw $7588
org $01941D
	dw $7588
org $019422
	dw $7588
org $019438
	dw $7588
org $01943E
	dw $7588
org $0195C0
	dw $7588
org $0197FF
	dw $7588
org $0199B8
	dw $7588
org $019A05
	dw $7588
org $01A4E3
	dw $7588
org $01A6E1
	dw $7588
org $01A73B
	dw $7588
org $01B0B4
	dw $7588
org $01B56B
	dw $7588
org $01BA05
	dw $7588
org $01C0B2
	dw $7588
org $01C0B5
	dw $7588
org $01C1BF
	dw $7588
org $01C3EB
	dw $7588
org $01C400
	dw $7588
org $01C414
	dw $7588
org $01C419
	dw $7588
org $01C464
	dw $7588
org $01C6F9
	dw $7588
org $01E136
	dw $7588
org $01E4E7
	dw $7588
org $0294D6
	dw $7588
org $02B6ED
	dw $7588
org $02B6F6
	dw $7588
org $02BD8B
	dw $7588
org $02BDC9
	dw $7588
org $02BE11
	dw $7588
org $02C00A
	dw $7588
org $02C013
	dw $7588
org $02C045
	dw $7588
org $02C23E
	dw $7588
org $02C26A
	dw $7588
org $02C275
	dw $7588
org $02C295
	dw $7588
org $02C2A7
	dw $7588
org $02C2E5
	dw $7588
org $02C2F8
	dw $7588
org $02C508
	dw $7588
org $02C542
	dw $7588
org $02C56F
	dw $7588
org $02C6A8
	dw $7588
org $02C6F6
	dw $7588
org $02D959
	dw $7588
org $02DCD1
	dw $7588
org $02DEC6
	dw $7588
org $02DFB4
	dw $7588
org $02E196
	dw $7588
org $02E7F0
	dw $7588
org $02E7FE
	dw $7588
org $02E809
	dw $7588
org $02EE2E
	dw $7588
org $02EE4D
	dw $7588
org $02F09C
	dw $7588
org $02F0A3
	dw $7588
org $02FFD2
	dw $7588
org $038032
	dw $7588
org $038040
	dw $7588
org $038049
	dw $7588
org $03878A
	dw $7588
org $038798
	dw $7588
org $0387B6
	dw $7588
org $0389A9
	dw $7588
org $038A60
	dw $7588
org $038A84
	dw $7588
org $038A9A
	dw $7588
org $038FCF
	dw $7588
org $038FDD
	dw $7588
org $03933C
	dw $7588
org $03937B
	dw $7588
org $039551
	dw $7588
org $039573
	dw $7588
org $039C7B
	dw $7588
org $039C8D
	dw $7588
org $039CA9
	dw $7588
org $039CF2
	dw $7588
org $03B2C4
	dw $7588
org $03B2E4
	dw $7588
org $03B810
	dw $7588
org $03C367
	dw $7588
org $07F737
	dw $7588
;============== REMAPPER FOR $1589
;============== REMAPPER FOR $158A
;============== REMAPPER FOR $158B
;============== REMAPPER FOR $158C
;============== REMAPPER FOR $158D
;============== REMAPPER FOR $158E
;============== REMAPPER FOR $158F
;============== REMAPPER FOR $1590
;============== REMAPPER FOR $1591
;============== REMAPPER FOR $1592
;============== REMAPPER FOR $1593
org $02A49F
	dw $7593
;============== REMAPPER FOR $1594
org $00FB67
	dw $7594
org $018AA3
	dw $7594
org $018ACD
	dw $7594
org $018E77
	dw $7594
org $018EA5
	dw $7594
org $018EDD
	dw $7594
org $018EE2
	dw $7594
org $01966E
	dw $7594
org $01A771
	dw $7594
org $01A775
	dw $7594
org $01ADA2
	dw $7594
org $01ADB5
	dw $7594
org $01C118
	dw $7594
org $01C602
	dw $7594
org $01D19B
	dw $7594
org $01D1C4
	dw $7594
org $01D1E4
	dw $7594
org $01D1F8
	dw $7594
org $01D219
	dw $7594
org $01D222
	dw $7594
org $01D256
	dw $7594
org $01D2ED
	dw $7594
org $01EFDC
	dw $7594
org $01F0C5
	dw $7594
org $01F134
	dw $7594
org $01F1D1
	dw $7594
org $01F257
	dw $7594
org $01F32E
	dw $7594
org $01F348
	dw $7594
org $01F602
	dw $7594
org $01F738
	dw $7594
org $02C684
	dw $7594
org $02C68F
	dw $7594
org $02C692
	dw $7594
org $02DB62
	dw $7594
org $02DB7B
	dw $7594
org $02DBF9
	dw $7594
org $039F83
	dw $7594
org $03A02F
	dw $7594
org $03A2B6
	dw $7594
org $03A2D3
	dw $7594
org $03A8BB
	dw $7594
org $07F1D2
	dw $7594
org $07F254
	dw $7594
org $07F77D
	dw $7594
;============== REMAPPER FOR $1595
;============== REMAPPER FOR $1596
;============== REMAPPER FOR $1597
;============== REMAPPER FOR $1598
;============== REMAPPER FOR $1599
;============== REMAPPER FOR $159A
;============== REMAPPER FOR $159B
;============== REMAPPER FOR $159C
;============== REMAPPER FOR $159D
;============== REMAPPER FOR $159E
;============== REMAPPER FOR $159F
;============== REMAPPER FOR $15A0
org $00FAAB
	dw $75A0
org $0180CC
	dw $75A0
org $018F08
	dw $75A0
org $0199A7
	dw $75A0
org $019DCD
	dw $75A0
org $019F52
	dw $75A0
org $01A369
	dw $75A0
org $01A377
	dw $75A0
org $01A7F1
	dw $75A0
org $01AEC9
	dw $75A0
org $01BC5B
	dw $75A0
org $01BDDC
	dw $75A0
org $01BE8E
	dw $75A0
org $01BF10
	dw $75A0
org $01D016
	dw $75A0
org $01DE2B
	dw $75A0
org $01E2ED
	dw $75A0
org $01E95F
	dw $75A0
org $01F3FF
	dw $75A0
org $01FB1B
	dw $75A0
org $01FCEE
	dw $75A0
org $0284A0
	dw $75A0
org $028954
	dw $75A0
org $02A9D0
	dw $75A0
org $02C0DD
	dw $75A0
org $02C27C
	dw $75A0
org $02CF5D
	dw $75A0
org $02D0CA
	dw $75A0
org $02D37C
	dw $75A0
org $02D38A
	dw $75A0
org $02DA9E
	dw $75A0
org $02DD58
	dw $75A0
org $02DED7
	dw $75A0
org $02E07A
	dw $75A0
org $02E1B2
	dw $75A0
org $02E45A
	dw $75A0
org $02E6C3
	dw $75A0
org $02E87B
	dw $75A0
org $0388E5
	dw $75A0
org $039F58
	dw $75A0
org $03A0F6
	dw $75A0
org $03B0E7
	dw $75A0
org $03B764
	dw $75A0
org $03B772
	dw $75A0
org $03B8FC
	dw $75A0
org $03C44F
	dw $75A0
org $07F788
	dw $75A0
;============== REMAPPER FOR $15A1
;============== REMAPPER FOR $15A2
;============== REMAPPER FOR $15A3
;============== REMAPPER FOR $15A4
;============== REMAPPER FOR $15A5
;============== REMAPPER FOR $15A6
;============== REMAPPER FOR $15A7
;============== REMAPPER FOR $15A8
;============== REMAPPER FOR $15A9
;============== REMAPPER FOR $15AA
;============== REMAPPER FOR $15AB
;============== REMAPPER FOR $15AC
org $018117
	dw $75AC
org $01811C
	dw $75AC
org $018B78
	dw $75AC
org $018BC8
	dw $75AC
org $018CDA
	dw $75AC
org $019099
	dw $75AC
org $0190A0
	dw $75AC
org $01927A
	dw $75AC
org $01A598
	dw $75AC
org $01A59F
	dw $75AC
org $01A5BA
	dw $75AC
org $01A5C1
	dw $75AC
org $01CDB6
	dw $75AC
org $01CE09
	dw $75AC
org $01CE8A
	dw $75AC
org $01D158
	dw $75AC
org $01D25B
	dw $75AC
org $01EAF1
	dw $75AC
org $01ED86
	dw $75AC
org $01ED93
	dw $75AC
org $01EE66
	dw $75AC
org $01EF5A
	dw $75AC
org $01F91E
	dw $75AC
org $01F92B
	dw $75AC
org $01FB97
	dw $75AC
org $01FC18
	dw $75AC
org $028A27
	dw $75AC
org $02C234
	dw $75AC
org $02C62B
	dw $75AC
org $02F0AF
	dw $75AC
org $02F0C1
	dw $75AC
org $02F318
	dw $75AC
org $02F3CC
	dw $75AC
org $038120
	dw $75AC
org $038130
	dw $75AC
org $0387B3
	dw $75AC
org $0387C3
	dw $75AC
org $039077
	dw $75AC
org $039090
	dw $75AC
org $039097
	dw $75AC
org $0399FA
	dw $75AC
org $039A1D
	dw $75AC
org $039A35
	dw $75AC
org $039A83
	dw $75AC
org $03C398
	dw $75AC
org $03C3E4
	dw $75AC
org $03C87E
	dw $75AC
org $03C88E
	dw $75AC
;============== REMAPPER FOR $15AD
;============== REMAPPER FOR $15AE
;============== REMAPPER FOR $15AF
;============== REMAPPER FOR $15B0
;============== REMAPPER FOR $15B1
;============== REMAPPER FOR $15B2
;============== REMAPPER FOR $15B3
;============== REMAPPER FOR $15B4
;============== REMAPPER FOR $15B5
;============== REMAPPER FOR $15B6
;============== REMAPPER FOR $15B7
;============== REMAPPER FOR $15B8
org $018B20
	dw $75B8
org $018B2A
	dw $75B8
org $018C58
	dw $75B8
org $018C62
	dw $75B8
org $019147
	dw $75B8
org $01936B
	dw $75B8
org $01994A
	dw $75B8
org $01995B
	dw $75B8
org $019A0C
	dw $75B8
org $01E4D1
	dw $75B8
org $01E4DB
	dw $75B8
org $02E81E
	dw $75B8
org $02FFD9
	dw $75B8
org $038069
	dw $75B8
org $0389C0
	dw $75B8
org $0389D5
	dw $75B8
org $03C1D0
	dw $75B8
;============== REMAPPER FOR $15B9
;============== REMAPPER FOR $15BA
;============== REMAPPER FOR $15BB
;============== REMAPPER FOR $15BC
;============== REMAPPER FOR $15BD
;============== REMAPPER FOR $15BE
;============== REMAPPER FOR $15BF
;============== REMAPPER FOR $15C0
;============== REMAPPER FOR $15C1
;============== REMAPPER FOR $15C2
;============== REMAPPER FOR $15C3
;============== REMAPPER FOR $15C4
org $01A391
	dw $75C4
org $01B853
	dw $75C4
org $01CA07
	dw $75C4
org $02D3A4
	dw $75C4
org $02D78C
	dw $75C4
org $03B78C
	dw $75C4
org $07F73A
	dw $75C4
;============== REMAPPER FOR $15C5
;============== REMAPPER FOR $15C6
;============== REMAPPER FOR $15C7
;============== REMAPPER FOR $15C8
;============== REMAPPER FOR $15C9
;============== REMAPPER FOR $15CA
;============== REMAPPER FOR $15CB
;============== REMAPPER FOR $15CC
;============== REMAPPER FOR $15CD
;============== REMAPPER FOR $15CE
;============== REMAPPER FOR $15CF
;============== REMAPPER FOR $15D0
org $018E7F
	dw $75D0
org $0191CC
	dw $75D0
org $019406
	dw $75D0
org $019671
	dw $75D0
org $01A430
	dw $75D0
org $01BDD9
	dw $75D0
org $01BE6F
	dw $75D0
org $01C31D
	dw $75D0
org $01E094
	dw $75D0
org $01E09C
	dw $75D0
org $01E30D
	dw $75D0
org $01F224
	dw $75D0
org $01F521
	dw $75D0
org $01F657
	dw $75D0
org $0293C4
	dw $75D0
org $0294E2
	dw $75D0
org $02A0CA
	dw $75D0
org $02F278
	dw $75D0
org $038822
	dw $75D0
org $03952B
	dw $75D0
org $07F762
	dw $75D0
;============== REMAPPER FOR $15D1
;============== REMAPPER FOR $15D2
;============== REMAPPER FOR $15D3
;============== REMAPPER FOR $15D4
;============== REMAPPER FOR $15D5
;============== REMAPPER FOR $15D6
;============== REMAPPER FOR $15D7
;============== REMAPPER FOR $15D8
;============== REMAPPER FOR $15D9
;============== REMAPPER FOR $15DA
;============== REMAPPER FOR $15DB
;============== REMAPPER FOR $15DC
org $01907D
	dw $75DC
org $02E60D
	dw $75DC
org $02E62A
	dw $75DC
org $02E631
	dw $75DC
org $07F75F
	dw $75DC
;============== REMAPPER FOR $15DD
;============== REMAPPER FOR $15DE
;============== REMAPPER FOR $15DF
;============== REMAPPER FOR $15E0
;============== REMAPPER FOR $15E1
;============== REMAPPER FOR $15E2
;============== REMAPPER FOR $15E3
;============== REMAPPER FOR $15E4
;============== REMAPPER FOR $15E5
;============== REMAPPER FOR $15E6
;============== REMAPPER FOR $15E7
;============== REMAPPER FOR $15E8
;============== REMAPPER FOR $15E9
org $0180AA
	dw $75E9
org $01846E
	dw $75E9
org $019528
	dw $75E9
org $0196FB
	dw $75E9
org $019D9C
	dw $75E9
org $019E00
	dw $75E9
org $019F2B
	dw $75E9
org $01A47C
	dw $75E9
org $01A4B7
	dw $75E9
org $01A586
	dw $75E9
org $01A5DB
	dw $75E9
org $01A7C6
	dw $75E9
org $01ABD5
	dw $75E9
org $01B300
	dw $75E9
org $01B327
	dw $75E9
org $01B3DE
	dw $75E9
org $01B41F
	dw $75E9
org $01B841
	dw $75E9
org $01BBF6
	dw $75E9
org $01BD72
	dw $75E9
org $01BDBB
	dw $75E9
org $01BEC4
	dw $75E9
org $01BF5D
	dw $75E9
org $01C05F
	dw $75E9
org $01C6DE
	dw $75E9
org $01C903
	dw $75E9
org $01C9A2
	dw $75E9
org $01C9E9
	dw $75E9
org $01D98E
	dw $75E9
org $01DCBF
	dw $75E9
org $01DE0E
	dw $75E9
org $01DF4B
	dw $75E9
org $01E03A
	dw $75E9
org $01E17A
	dw $75E9
org $01E91F
	dw $75E9
org $01E943
	dw $75E9
org $01EA7C
	dw $75E9
org $01EA81
	dw $75E9
org $01EA8C
	dw $75E9
org $01F56C
	dw $75E9
org $01F63C
	dw $75E9
org $02813C
	dw $75E9
org $0293B1
	dw $75E9
org $029634
	dw $75E9
org $0299D5
	dw $75E9
org $029B0D
	dw $75E9
org $029B8F
	dw $75E9
org $029E15
	dw $75E9
org $029EE3
	dw $75E9
org $02A0A6
	dw $75E9
org $02A0BB
	dw $75E9
org $02A14E
	dw $75E9
org $02A20E
	dw $75E9
org $02A251
	dw $75E9
org $02A3AB
	dw $75E9
org $02A3EA
	dw $75E9
org $02A5B9
	dw $75E9
org $02A6E0
	dw $75E9
org $02ADBB
	dw $75E9
org $02AE36
	dw $75E9
org $02B38E
	dw $75E9
org $02B517
	dw $75E9
org $02B55D
	dw $75E9
org $02BA93
	dw $75E9
org $02BFC1
	dw $75E9
org $02C906
	dw $75E9
org $02CA90
	dw $75E9
org $02CAF7
	dw $75E9
org $02CCF0
	dw $75E9
org $02CF38
	dw $75E9
org $02D1B2
	dw $75E9
org $02D291
	dw $75E9
org $02D687
	dw $75E9
org $02E5E4
	dw $75E9
org $02E5FA
	dw $75E9
org $02E613
	dw $75E9
org $02E61D
	dw $75E9
org $02EA5C
	dw $75E9
org $02ED25
	dw $75E9
org $02EDB4
	dw $75E9
org $02EE6E
	dw $75E9
org $02F19E
	dw $75E9
org $02F813
	dw $75E9
org $02FB7A
	dw $75E9
org $02FC3F
	dw $75E9
org $03827D
	dw $75E9
org $03842E
	dw $75E9
org $0384D9
	dw $75E9
org $038661
	dw $75E9
org $03884E
	dw $75E9
org $0399A5
	dw $75E9
org $03AAF4
	dw $75E9
org $03C4E4
	dw $75E9
org $07F24B
	dw $75E9
org $07FC59
	dw $75E9
org $0CA77B
	dw $75E9
;============== REMAPPER FOR $15EA
org $00FBE5
	dw $75EA
org $0180E3
	dw $75EA
org $0189F7
	dw $75EA
org $018DB0
	dw $75EA
org $018DB6
	dw $75EA
org $018E02
	dw $75EA
org $018E8B
	dw $75EA
org $018FAD
	dw $75EA
org $019809
	dw $75EA
org $019813
	dw $75EA
org $01981C
	dw $75EA
org $019823
	dw $75EA
org $019832
	dw $75EA
org $019A45
	dw $75EA
org $019A5B
	dw $75EA
org $019B08
	dw $75EA
org $019D18
	dw $75EA
org $019E4A
	dw $75EA
org $019EB8
	dw $75EA
org $019EBF
	dw $75EA
org $019EE4
	dw $75EA
org $019EEA
	dw $75EA
org $019EF8
	dw $75EA
org $019F21
	dw $75EA
org $019F84
	dw $75EA
org $019FD8
	dw $75EA
org $01A1C8
	dw $75EA
org $01A20D
	dw $75EA
org $01A223
	dw $75EA
org $01A27F
	dw $75EA
org $01A3CE
	dw $75EA
org $01AD74
	dw $75EA
org $01AD7E
	dw $75EA
org $01AD84
	dw $75EA
org $01AE66
	dw $75EA
org $01B422
	dw $75EA
org $01B72B
	dw $75EA
org $01B7C0
	dw $75EA
org $01BB36
	dw $75EA
org $01BEBD
	dw $75EA
org $01BEE2
	dw $75EA
org $01C195
	dw $75EA
org $01C35C
	dw $75EA
org $01C633
	dw $75EA
org $01C7CF
	dw $75EA
org $01C84E
	dw $75EA
org $01C928
	dw $75EA
org $01C9A5
	dw $75EA
org $01D49A
	dw $75EA
org $01D5FC
	dw $75EA
org $01D602
	dw $75EA
org $01DBD8
	dw $75EA
org $01DC81
	dw $75EA
org $01DF24
	dw $75EA
org $01E171
	dw $75EA
org $01E460
	dw $75EA
org $01E46A
	dw $75EA
org $01E948
	dw $75EA
org $01E955
	dw $75EA
org $01EE9C
	dw $75EA
org $01EF56
	dw $75EA
org $01EF64
	dw $75EA
org $01EF67
	dw $75EA
org $01EF70
	dw $75EA
org $01EF85
	dw $75EA
org $01F091
	dw $75EA
org $01F791
	dw $75EA
org $01F7AE
	dw $75EA
org $01FA20
	dw $75EA
org $01FA64
	dw $75EA
org $01FEC6
	dw $75EA
org $028106
	dw $75EA
org $02B686
	dw $75EA
org $02B746
	dw $75EA
org $02BE59
	dw $75EA
org $02BEBD
	dw $75EA
org $02BF16
	dw $75EA
org $02BF1C
	dw $75EA
org $02C8C3
	dw $75EA
org $02CBBC
	dw $75EA
org $02CCCC
	dw $75EA
org $02CEFA
	dw $75EA
org $02D3D6
	dw $75EA
org $02D791
	dw $75EA
org $02D8BC
	dw $75EA
org $02D8C2
	dw $75EA
org $02D8CC
	dw $75EA
org $02D9E7
	dw $75EA
org $02D9ED
	dw $75EA
org $02DC51
	dw $75EA
org $02DE4E
	dw $75EA
org $02DEF1
	dw $75EA
org $02E00F
	dw $75EA
org $02E062
	dw $75EA
org $02E068
	dw $75EA
org $02E0E9
	dw $75EA
org $02E0EF
	dw $75EA
org $02E24A
	dw $75EA
org $02E3C1
	dw $75EA
org $02E496
	dw $75EA
org $02E4A2
	dw $75EA
org $02E4EC
	dw $75EA
org $02E4F2
	dw $75EA
org $02E682
	dw $75EA
org $02E6C8
	dw $75EA
org $02E6EF
	dw $75EA
org $02EA26
	dw $75EA
org $02EDFB
	dw $75EA
org $02EE67
	dw $75EA
org $02EF1D
	dw $75EA
org $02EF24
	dw $75EA
org $02EF2B
	dw $75EA
org $02EF40
	dw $75EA
org $02F1A6
	dw $75EA
org $02F1C9
	dw $75EA
org $02F229
	dw $75EA
org $02F48E
	dw $75EA
org $02F4EC
	dw $75EA
org $02F947
	dw $75EA
org $03843D
	dw $75EA
org $0384CF
	dw $75EA
org $0386AC
	dw $75EA
org $0388A8
	dw $75EA
org $038969
	dw $75EA
org $038DAD
	dw $75EA
org $038F89
	dw $75EA
org $03900E
	dw $75EA
org $039219
	dw $75EA
org $039289
	dw $75EA
org $039791
	dw $75EA
org $0397B1
	dw $75EA
org $0397B7
	dw $75EA
org $039BEC
	dw $75EA
org $039BF2
	dw $75EA
org $03A072
	dw $75EA
org $03A3F4
	dw $75EA
org $03ACD0
	dw $75EA
org $03AF6C
	dw $75EA
org $03AFE1
	dw $75EA
org $03B224
	dw $75EA
org $03B262
	dw $75EA
org $03B3F8
	dw $75EA
org $03B3FE
	dw $75EA
org $03B7BE
	dw $75EA
org $03C245
	dw $75EA
org $03C4A6
	dw $75EA
org $0CA015
	dw $75EA
org $0CA289
	dw $75EA
;============== REMAPPER FOR $15EB
;============== REMAPPER FOR $15EC
;============== REMAPPER FOR $15ED
;============== REMAPPER FOR $15EE
;============== REMAPPER FOR $15EF
;============== REMAPPER FOR $15F0
;============== REMAPPER FOR $15F1
;============== REMAPPER FOR $15F2
;============== REMAPPER FOR $15F3
;============== REMAPPER FOR $15F4
;============== REMAPPER FOR $15F5
;============== REMAPPER FOR $15F6
org $00FBD9
	dw $75F6
org $00FC3C
	dw $75F6
org $00FC43
	dw $75F6
org $00FCC9
	dw $75F6
org $00FCD3
	dw $75F6
org $018323
	dw $75F6
org $018346
	dw $75F6
org $01845E
	dw $75F6
org $01859B
	dw $75F6
org $01859F
	dw $75F6
org $018FF6
	dw $75F6
org $019656
	dw $75F6
org $019659
	dw $75F6
org $01967D
	dw $75F6
org $019680
	dw $75F6
org $0196D1
	dw $75F6
org $0196D4
	dw $75F6
org $019859
	dw $75F6
org $019904
	dw $75F6
org $01990B
	dw $75F6
org $019B45
	dw $75F6
org $019B4A
	dw $75F6
org $019D11
	dw $75F6
org $019D68
	dw $75F6
org $019DB8
	dw $75F6
org $019F3E
	dw $75F6
org $01A17C
	dw $75F6
org $01A181
	dw $75F6
org $01A1DF
	dw $75F6
org $01A1E6
	dw $75F6
org $01A2D9
	dw $75F6
org $01A2E4
	dw $75F6
org $01A742
	dw $75F6
org $01A749
	dw $75F6
org $01A99E
	dw $75F6
org $01A9A9
	dw $75F6
org $01A9B0
	dw $75F6
org $01AB12
	dw $75F6
org $01AB15
	dw $75F6
org $01B087
	dw $75F6
org $01B08C
	dw $75F6
org $01B0AE
	dw $75F6
org $01B0B1
	dw $75F6
org $01B113
	dw $75F6
org $01B11A
	dw $75F6
org $01B123
	dw $75F6
org $01B127
	dw $75F6
org $01B35C
	dw $75F6
org $01B3E1
	dw $75F6
org $01B95E
	dw $75F6
org $01B9E2
	dw $75F6
org $01B9EA
	dw $75F6
org $01B9F1
	dw $75F6
org $01BCCB
	dw $75F6
org $01BD75
	dw $75F6
org $01BEFF
	dw $75F6
org $01C277
	dw $75F6
org $01C27A
	dw $75F6
org $01C4D4
	dw $75F6
org $01C658
	dw $75F6
org $01C6CA
	dw $75F6
org $01D5DB
	dw $75F6
org $01D5E3
	dw $75F6
org $01D5F9
	dw $75F6
org $01E0B8
	dw $75F6
org $01E0C9
	dw $75F6
org $01E36C
	dw $75F6
org $01E377
	dw $75F6
org $01E37C
	dw $75F6
org $01E433
	dw $75F6
org $01E437
	dw $75F6
org $01E744
	dw $75F6
org $01EA6B
	dw $75F6
org $01EB8B
	dw $75F6
org $01F176
	dw $75F6
org $01F186
	dw $75F6
org $01F26B
	dw $75F6
org $01F274
	dw $75F6
org $01F850
	dw $75F6
org $01F85D
	dw $75F6
org $01F864
	dw $75F6
org $028A3A
	dw $75F6
org $029486
	dw $75F6
org $02948A
	dw $75F6
org $02A9BE
	dw $75F6
org $02A9C5
	dw $75F6
org $02AC3B
	dw $75F6
org $02AC46
	dw $75F6
org $02B904
	dw $75F6
org $02B9EA
	dw $75F6
org $02B9F1
	dw $75F6
org $02BC76
	dw $75F6
org $02BD13
	dw $75F6
org $02BD1B
	dw $75F6
org $02C8BC
	dw $75F6
org $02E110
	dw $75F6
org $02E5A1
	dw $75F6
org $02E924
	dw $75F6
org $02ECE7
	dw $75F6
org $02F055
	dw $75F6
org $02F05C
	dw $75F6
org $02F119
	dw $75F6
org $038055
	dw $75F6
org $03805A
	dw $75F6
org $0381B1
	dw $75F6
org $0381B4
	dw $75F6
org $0383DA
	dw $75F6
org $038B4B
	dw $75F6
org $03B358
	dw $75F6
org $03B37D
	dw $75F6
org $03B383
	dw $75F6
org $03C080
	dw $75F6
org $03C08B
	dw $75F6
org $07F798
	dw $75F6
;============== REMAPPER FOR $15F7
;============== REMAPPER FOR $15F8
;============== REMAPPER FOR $15F9
;============== REMAPPER FOR $15FA
;============== REMAPPER FOR $15FB
;============== REMAPPER FOR $15FC
;============== REMAPPER FOR $15FD
;============== REMAPPER FOR $15FE
;============== REMAPPER FOR $15FF
;============== REMAPPER FOR $1600
;============== REMAPPER FOR $1601
;============== REMAPPER FOR $1602
org $0183D7
	dw $7602
org $018917
	dw $7602
org $01891D
	dw $7602
org $018A97
	dw $7602
org $018BCF
	dw $7602
org $018BED
	dw $7602
org $018D49
	dw $7602
org $018DF5
	dw $7602
org $018E6B
	dw $7602
org $018F12
	dw $7602
org $018FA2
	dw $7602
org $018FFC
	dw $7602
org $019810
	dw $7602
org $01982B
	dw $7602
org $019B1E
	dw $7602
org $019B40
	dw $7602
org $019B62
	dw $7602
org $019D07
	dw $7602
org $019D86
	dw $7602
org $019DEA
	dw $7602
org $019E30
	dw $7602
org $019F1A
	dw $7602
org $01A13E
	dw $7602
org $01A279
	dw $7602
org $01A2E9
	dw $7602
org $01A315
	dw $7602
org $01B09D
	dw $7602
org $01B0A3
	dw $7602
org $01B10B
	dw $7602
org $01B25F
	dw $7602
org $01B2E3
	dw $7602
org $01B9DA
	dw $7602
org $01BA69
	dw $7602
org $01BE63
	dw $7602
org $01BEAA
	dw $7602
org $01BEB0
	dw $7602
org $01BECF
	dw $7602
org $01C0A0
	dw $7602
org $01C102
	dw $7602
org $01C77F
	dw $7602
org $01CA0F
	dw $7602
org $01CA3A
	dw $7602
org $01CDAF
	dw $7602
org $01CDCC
	dw $7602
org $01CE91
	dw $7602
org $01CEFA
	dw $7602
org $01CF7A
	dw $7602
org $01CF9B
	dw $7602
org $01CFB4
	dw $7602
org $01D15F
	dw $7602
org $01D261
	dw $7602
org $01D2D9
	dw $7602
org $01D303
	dw $7602
org $01D422
	dw $7602
org $01D48B
	dw $7602
org $01D5EC
	dw $7602
org $01D635
	dw $7602
org $01D643
	dw $7602
org $01D64B
	dw $7602
org $01D64E
	dw $7602
org $01D6D9
	dw $7602
org $01DAA5
	dw $7602
org $01DAF7
	dw $7602
org $01E0C1
	dw $7602
org $01E0C4
	dw $7602
org $01E356
	dw $7602
org $01E371
	dw $7602
org $01E385
	dw $7602
org $01E3EC
	dw $7602
org $01E51A
	dw $7602
org $01E53D
	dw $7602
org $01E66A
	dw $7602
org $01E6E0
	dw $7602
org $01E6F1
	dw $7602
org $01EB46
	dw $7602
org $01EB62
	dw $7602
org $01EB7B
	dw $7602
org $01EC49
	dw $7602
org $01EE62
	dw $7602
org $01EE88
	dw $7602
org $01EEDA
	dw $7602
org $01EF19
	dw $7602
org $01EF22
	dw $7602
org $01EF95
	dw $7602
org $01F055
	dw $7602
org $01F3D4
	dw $7602
org $01F40A
	dw $7602
org $01F930
	dw $7602
org $01F939
	dw $7602
org $01F987
	dw $7602
org $01FA17
	dw $7602
org $01FA1D
	dw $7602
org $01FC06
	dw $7602
org $01FC28
	dw $7602
org $01FC38
	dw $7602
org $01FC55
	dw $7602
org $01FED5
	dw $7602
org $02AF71
	dw $7602
org $02BD10
	dw $7602
org $02BF73
	dw $7602
org $02BF7B
	dw $7602
org $02C087
	dw $7602
org $02C0C7
	dw $7602
org $02C188
	dw $7602
org $02C23B
	dw $7602
org $02C251
	dw $7602
org $02C359
	dw $7602
org $02C392
	dw $7602
org $02C416
	dw $7602
org $02C426
	dw $7602
org $02C451
	dw $7602
org $02C4BE
	dw $7602
org $02C4E0
	dw $7602
org $02C505
	dw $7602
org $02C514
	dw $7602
org $02C53F
	dw $7602
org $02C567
	dw $7602
org $02C5FF
	dw $7602
org $02C61B
	dw $7602
org $02C63E
	dw $7602
org $02C723
	dw $7602
org $02C729
	dw $7602
org $02C764
	dw $7602
org $02C88F
	dw $7602
org $02CBA8
	dw $7602
org $02D1DA
	dw $7602
org $02D645
	dw $7602
org $02D648
	dw $7602
org $02D659
	dw $7602
org $02DCED
	dw $7602
org $02DCF5
	dw $7602
org $02DD05
	dw $7602
org $02DD48
	dw $7602
org $02DD7E
	dw $7602
org $02DE51
	dw $7602
org $02DFDC
	dw $7602
org $02E005
	dw $7602
org $02E042
	dw $7602
org $02E0E2
	dw $7602
org $02E0FA
	dw $7602
org $02E156
	dw $7602
org $02E4C9
	dw $7602
org $02E947
	dw $7602
org $02E954
	dw $7602
org $02E9D2
	dw $7602
org $02EA04
	dw $7602
org $02EB46
	dw $7602
org $02EBC7
	dw $7602
org $02EBE4
	dw $7602
org $02EC03
	dw $7602
org $02ECEE
	dw $7602
org $02F0BC
	dw $7602
org $02F0C7
	dw $7602
org $02F0CA
	dw $7602
org $02F31F
	dw $7602
org $02F34B
	dw $7602
org $02F394
	dw $7602
org $02F3A0
	dw $7602
org $02F413
	dw $7602
org $0380C1
	dw $7602
org $038115
	dw $7602
org $03811A
	dw $7602
org $038148
	dw $7602
org $0381B9
	dw $7602
org $0383BB
	dw $7602
org $0383C6
	dw $7602
org $038431
	dw $7602
org $03860D
	dw $7602
org $038610
	dw $7602
org $038619
	dw $7602
org $03865C
	dw $7602
org $038673
	dw $7602
org $0388AC
	dw $7602
org $038933
	dw $7602
org $038A74
	dw $7602
org $038A7D
	dw $7602
org $038B41
	dw $7602
org $039074
	dw $7602
org $03907C
	dw $7602
org $0390F8
	dw $7602
org $039184
	dw $7602
org $03930F
	dw $7602
org $039325
	dw $7602
org $03954E
	dw $7602
org $039686
	dw $7602
org $039690
	dw $7602
org $039696
	dw $7602
org $03973A
	dw $7602
org $03975F
	dw $7602
org $0397AB
	dw $7602
org $039A7C
	dw $7602
org $039A93
	dw $7602
org $039AA4
	dw $7602
org $039B7E
	dw $7602
org $039C8A
	dw $7602
org $039D6E
	dw $7602
org $039DB7
	dw $7602
org $039DFB
	dw $7602
org $039E52
	dw $7602
org $039EAF
	dw $7602
org $039FF0
	dw $7602
org $03A042
	dw $7602
org $03A09E
	dw $7602
org $03A0A3
	dw $7602
org $03ACB9
	dw $7602
org $03AD1F
	dw $7602
org $03AD3A
	dw $7602
org $03ADE6
	dw $7602
org $03AE4E
	dw $7602
org $03B304
	dw $7602
org $03B36D
	dw $7602
org $03B38D
	dw $7602
org $03C090
	dw $7602
org $03C38D
	dw $7602
org $03C3F3
	dw $7602
org $03C3F8
	dw $7602
org $03C8EE
	dw $7602
org $03C963
	dw $7602
org $03C9F4
	dw $7602
org $03CCDD
	dw $7602
org $03CDEC
	dw $7602
org $03CE3F
	dw $7602
org $03CE53
	dw $7602
org $03D488
	dw $7602
org $03D48D
	dw $7602
org $03D490
	dw $7602
org $03D49C
	dw $7602
org $03D4E1
	dw $7602
org $07F73D
	dw $7602
org $0CA01B
	dw $7602
org $0CA782
	dw $7602
org $0CA78B
	dw $7602
org $0CA7A2
	dw $7602
org $0CA7A6
	dw $7602
org $0CA7AD
	dw $7602
;============== REMAPPER FOR $1603
;============== REMAPPER FOR $1604
;============== REMAPPER FOR $1605
;============== REMAPPER FOR $1606
;============== REMAPPER FOR $1607
;============== REMAPPER FOR $1608
;============== REMAPPER FOR $1609
;============== REMAPPER FOR $160A
;============== REMAPPER FOR $160B
;============== REMAPPER FOR $160C
;============== REMAPPER FOR $160D
;============== REMAPPER FOR $160E
org $00FCE2
	dw $760E
org $0183E1
	dw $760E
org $018573
	dw $760E
org $018970
	dw $760E
org $018993
	dw $760E
org $018A1B
	dw $760E
org $018AD7
	dw $760E
org $018CA6
	dw $760E
org $019683
	dw $760E
org $01A25B
	dw $760E
org $01A289
	dw $760E
org $01A296
	dw $760E
org $01A2EC
	dw $760E
org $01A32F
	dw $760E
org $01A725
	dw $760E
org $01A7B9
	dw $760E
org $01C10F
	dw $760E
org $01C12E
	dw $760E
org $01C354
	dw $760E
org $01C9DB
	dw $760E
org $01C9E0
	dw $760E
org $01CA16
	dw $760E
org $01CD8F
	dw $760E
org $01CECB
	dw $760E
org $01CF06
	dw $760E
org $01D17A
	dw $760E
org $01D188
	dw $760E
org $01D1AF
	dw $760E
org $01D872
	dw $760E
org $01D8A0
	dw $760E
org $01D8E5
	dw $760E
org $01E7ED
	dw $760E
org $01E996
	dw $760E
org $01E9A7
	dw $760E
org $01EA03
	dw $760E
org $01F15B
	dw $760E
org $01F1B3
	dw $760E
org $01F1BC
	dw $760E
org $01F1D9
	dw $760E
org $01F1F5
	dw $760E
org $01F25C
	dw $760E
org $01F34B
	dw $760E
org $01F380
	dw $760E
org $01F4B3
	dw $760E
org $01F4D7
	dw $760E
org $01F4E2
	dw $760E
org $01F571
	dw $760E
org $01F5FD
	dw $760E
org $01F637
	dw $760E
org $01FB42
	dw $760E
org $01FC69
	dw $760E
org $01FC82
	dw $760E
org $02BAED
	dw $760E
org $02C4EF
	dw $760E
org $02C50F
	dw $760E
org $02C534
	dw $760E
org $02D0DA
	dw $760E
org $02D727
	dw $760E
org $02D73E
	dw $760E
org $02D743
	dw $760E
org $02EA52
	dw $760E
org $02EAB8
	dw $760E
org $03C030
	dw $760E
org $03C03D
	dw $760E
org $03C093
	dw $760E
org $03CC9B
	dw $760E
org $03CC9E
	dw $760E
org $03CD05
	dw $760E
org $03CD08
	dw $760E
org $07F77A
	dw $760E
;============== REMAPPER FOR $160F
;============== REMAPPER FOR $1610
;============== REMAPPER FOR $1611
;============== REMAPPER FOR $1612
;============== REMAPPER FOR $1613
;============== REMAPPER FOR $1614
;============== REMAPPER FOR $1615
;============== REMAPPER FOR $1616
;============== REMAPPER FOR $1617
org $00F92D
	dw $7617
org $0283D7
	dw $7617
;============== REMAPPER FOR $1618
;============== REMAPPER FOR $1619
;============== REMAPPER FOR $161A
org $018154
	dw $761A
org $01AC96
	dw $761A
org $01AE2B
	dw $761A
org $02A99C
	dw $761A
org $02AC03
	dw $761A
org $02AF80
	dw $761A
org $02AFEF
	dw $761A
org $02D082
	dw $761A
org $038710
	dw $761A
org $03B8B4
	dw $761A
;============== REMAPPER FOR $161B
;============== REMAPPER FOR $161C
;============== REMAPPER FOR $161D
;============== REMAPPER FOR $161E
;============== REMAPPER FOR $161F
;============== REMAPPER FOR $1620
;============== REMAPPER FOR $1621
;============== REMAPPER FOR $1622
;============== REMAPPER FOR $1623
;============== REMAPPER FOR $1624
;============== REMAPPER FOR $1625
;============== REMAPPER FOR $1626
org $01A016
	dw $7626
org $01A602
	dw $7626
org $01A605
	dw $7626
org $01A64C
	dw $7626
org $01A650
	dw $7626
org $01A653
	dw $7626
org $01AA05
	dw $7626
org $01AB4C
	dw $7626
org $01CFC7
	dw $7626
org $01CFCA
	dw $7626
org $01D14A
	dw $7626
org $01D1D9
	dw $7626
org $01D3F9
	dw $7626
org $01D3FC
	dw $7626
org $01D6EA
	dw $7626
org $01D73F
	dw $7626
org $01D758
	dw $7626
org $01DA85
	dw $7626
org $01DA8A
	dw $7626
org $01DB27
	dw $7626
org $01DB2C
	dw $7626
org $01F227
	dw $7626
org $03962E
	dw $7626
org $07F74F
	dw $7626
;============== REMAPPER FOR $1627
;============== REMAPPER FOR $1628
;============== REMAPPER FOR $1629
;============== REMAPPER FOR $162A
;============== REMAPPER FOR $162B
;============== REMAPPER FOR $162C
;============== REMAPPER FOR $162D
;============== REMAPPER FOR $162E
;============== REMAPPER FOR $162F
;============== REMAPPER FOR $1630
;============== REMAPPER FOR $1631
;============== REMAPPER FOR $1632
org $019AA0
	dw $7632
org $019B3B
	dw $7632
org $019B50
	dw $7632
org $019B72
	dw $7632
org $01A433
	dw $7632
org $01A436
	dw $7632
org $01A820
	dw $7632
org $01B95B
	dw $7632
org $01B993
	dw $7632
org $01B998
	dw $7632
org $01B9C7
	dw $7632
org $01BA66
	dw $7632
org $01BA6C
	dw $7632
org $01C49D
	dw $7632
org $01F57D
	dw $7632
org $01F65A
	dw $7632
org $0293CF
	dw $7632
org $02A0CD
	dw $7632
org $02EAB2
	dw $7632
org $07F726
	dw $7632
;============== REMAPPER FOR $1633
;============== REMAPPER FOR $1634
;============== REMAPPER FOR $1635
;============== REMAPPER FOR $1636
;============== REMAPPER FOR $1637
;============== REMAPPER FOR $1638
;============== REMAPPER FOR $1639
;============== REMAPPER FOR $163A
;============== REMAPPER FOR $163B
;============== REMAPPER FOR $163C
;============== REMAPPER FOR $163D
org $02A47A
	dw $763D
;============== REMAPPER FOR $163E
org $01811F
	dw $763E
org $018124
	dw $763E
org $0188E9
	dw $763E
org $018909
	dw $763E
org $018953
	dw $763E
org $018969
	dw $763E
org $018A0D
	dw $763E
org $01993F
	dw $763E
org $01A1FE
	dw $763E
org $01A255
	dw $763E
org $01A30B
	dw $763E
org $01A31A
	dw $763E
org $01A719
	dw $763E
org $01AAB3
	dw $763E
org $01AB0F
	dw $763E
org $01AD6F
	dw $763E
org $01AE14
	dw $763E
org $01CDF1
	dw $763E
org $01CE9F
	dw $763E
org $01D9FF
	dw $763E
org $01DA04
	dw $763E
org $01DA1A
	dw $763E
org $01E4C3
	dw $763E
org $01ED6B
	dw $763E
org $01F623
	dw $763E
org $01F691
	dw $763E
org $01F716
	dw $763E
org $01FB1E
	dw $763E
org $01FB68
	dw $763E
org $02BF5D
	dw $763E
org $02BF67
	dw $763E
org $02C208
	dw $763E
org $02C20F
	dw $763E
org $02C6AF
	dw $763E
org $02C7E0
	dw $763E
org $02EA9C
	dw $763E
org $02EAAC
	dw $763E
org $02EACF
	dw $763E
org $0398D7
	dw $763E
org $039900
	dw $763E
org $07F765
	dw $763E
;============== REMAPPER FOR $163F
;============== REMAPPER FOR $1640
;============== REMAPPER FOR $1641
;============== REMAPPER FOR $1642
;============== REMAPPER FOR $1643
;============== REMAPPER FOR $1644
;============== REMAPPER FOR $1645
;============== REMAPPER FOR $1646
;============== REMAPPER FOR $1647
;============== REMAPPER FOR $1648
;============== REMAPPER FOR $1649
;============== REMAPPER FOR $164A
org $018400
	dw $764A
org $018432
	dw $764A
org $019038
	dw $764A
org $019061
	dw $764A
org $01914D
	dw $764A
org $019153
	dw $764A
org $0191EE
	dw $764A
org $01923C
	dw $764A
org $019259
	dw $764A
org $01971E
	dw $764A
org $019721
	dw $764A
org $019956
	dw $764A
org $01A762
	dw $764A
org $01B045
	dw $764A
org $01B0F3
	dw $764A
org $01B1B9
	dw $764A
org $01B1C2
	dw $764A
org $01B1DA
	dw $764A
org $01B23F
	dw $764A
org $01B589
	dw $764A
org $01CFC3
	dw $764A
org $01D162
	dw $764A
org $01D171
	dw $764A
org $01E06E
	dw $764A
org $01E0CF
	dw $764A
org $01F69F
	dw $764A
org $02BBC6
	dw $764A
org $02C01C
	dw $764A
org $02C305
	dw $764A
org $02C35C
	dw $764A
org $03857A
	dw $764A
org $03AC4E
	dw $764A
org $03AC58
	dw $764A
org $07F723
	dw $764A
;============== REMAPPER FOR $164B
;============== REMAPPER FOR $164C
;============== REMAPPER FOR $164D
;============== REMAPPER FOR $164E
;============== REMAPPER FOR $164F
;============== REMAPPER FOR $1650
;============== REMAPPER FOR $1651
;============== REMAPPER FOR $1652
;============== REMAPPER FOR $1653
;============== REMAPPER FOR $1654
;============== REMAPPER FOR $1655
;============== REMAPPER FOR $1656
org $01853A
	dw $7656
org $019444
	dw $7656
org $019AC5
	dw $7656
org $01A6E8
	dw $7656
org $01A8CA
	dw $7656
org $01A9CD
	dw $7656
org $01AA4F
	dw $7656
org $02808B
	dw $7656
org $029473
	dw $7656
org $02947A
	dw $7656
org $07F768
	dw $7656
org $07F7AA
	dw $7656
;============== REMAPPER FOR $1657
;============== REMAPPER FOR $1658
;============== REMAPPER FOR $1659
;============== REMAPPER FOR $165A
;============== REMAPPER FOR $165B
;============== REMAPPER FOR $165C
;============== REMAPPER FOR $165D
;============== REMAPPER FOR $165E
;============== REMAPPER FOR $165F
;============== REMAPPER FOR $1660
;============== REMAPPER FOR $1661
;============== REMAPPER FOR $1662
org $01853F
	dw $7662
org $019B28
	dw $7662
org $01A465
	dw $7662
org $01A481
	dw $7662
org $01A9E3
	dw $7662
org $01D6CE
	dw $7662
org $01D6DE
	dw $7662
org $01F4EC
	dw $7662
org $01F9E3
	dw $7662
org $01F9F2
	dw $7662
org $01F9FD
	dw $7662
org $028090
	dw $7662
org $02946C
	dw $7662
org $02B64F
	dw $7662
org $02BAF0
	dw $7662
org $02BAF7
	dw $7662
org $02D3AB
	dw $7662
org $0395C7
	dw $7662
org $039A5B
	dw $7662
org $03A830
	dw $7662
org $03B096
	dw $7662
org $03B0BE
	dw $7662
org $03B0CA
	dw $7662
org $03B0FD
	dw $7662
org $03B10A
	dw $7662
org $03B6A3
	dw $7662
org $03B6E9
	dw $7662
org $03B793
	dw $7662
org $03CC0D
	dw $7662
org $07F76B
	dw $7662
org $07F7B1
	dw $7662
;============== REMAPPER FOR $1663
;============== REMAPPER FOR $1664
;============== REMAPPER FOR $1665
;============== REMAPPER FOR $1666
;============== REMAPPER FOR $1667
;============== REMAPPER FOR $1668
;============== REMAPPER FOR $1669
;============== REMAPPER FOR $166A
;============== REMAPPER FOR $166B
;============== REMAPPER FOR $166C
;============== REMAPPER FOR $166D
;============== REMAPPER FOR $166E
org $0191F7
	dw $766E
org $01926B
	dw $766E
org $01968F
	dw $766E
org $019694
	dw $766E
org $0293BF
	dw $766E
org $0294DD
	dw $766E
org $02A0EF
	dw $766E
org $07F76E
	dw $766E
org $07F7B8
	dw $766E
;============== REMAPPER FOR $166F
;============== REMAPPER FOR $1670
;============== REMAPPER FOR $1671
;============== REMAPPER FOR $1672
;============== REMAPPER FOR $1673
;============== REMAPPER FOR $1674
;============== REMAPPER FOR $1675
;============== REMAPPER FOR $1676
;============== REMAPPER FOR $1677
;============== REMAPPER FOR $1678
;============== REMAPPER FOR $1679
;============== REMAPPER FOR $167A
org $01893D
	dw $767A
org $018941
	dw $767A
org $01894C
	dw $767A
org $01894F
	dw $767A
org $0189A9
	dw $767A
org $01924C
	dw $767A
org $01932A
	dw $767A
org $01991C
	dw $767A
org $019B14
	dw $767A
org $01A188
	dw $767A
org $01A7E5
	dw $767A
org $01A833
	dw $767A
org $01A841
	dw $767A
org $01AAF8
	dw $767A
org $01AAFB
	dw $767A
org $01AC4D
	dw $767A
org $01ACA6
	dw $767A
org $01C2C6
	dw $767A
org $01C2CB
	dw $767A
org $01F398
	dw $767A
org $01F39D
	dw $767A
org $01F3BE
	dw $767A
org $01F652
	dw $767A
org $01F9E7
	dw $767A
org $01F9ED
	dw $767A
org $01F9F9
	dw $767A
org $028162
	dw $767A
org $02942C
	dw $767A
org $02A0C5
	dw $767A
org $02A92B
	dw $767A
org $02BAFA
	dw $767A
org $02BAFF
	dw $767A
org $02D047
	dw $767A
org $02D092
	dw $767A
org $038A6A
	dw $767A
org $038A6D
	dw $767A
org $03B879
	dw $767A
org $03B8C4
	dw $767A
org $07F771
	dw $767A
org $07F7BF
	dw $767A
;============== REMAPPER FOR $167B
;============== REMAPPER FOR $167C
;============== REMAPPER FOR $167D
;============== REMAPPER FOR $167E
;============== REMAPPER FOR $167F
;============== REMAPPER FOR $1680
;============== REMAPPER FOR $1681
;============== REMAPPER FOR $1682
;============== REMAPPER FOR $1683
;============== REMAPPER FOR $1684
;============== REMAPPER FOR $1685
;============== REMAPPER FOR $1686
org $00FAB3
	dw $7686
org $018544
	dw $7686
org $01925C
	dw $7686
org $0193B9
	dw $7686
org $019646
	dw $7686
org $01964B
	dw $7686
org $01A422
	dw $7686
org $01A425
	dw $7686
org $01A57F
	dw $7686
org $01A5A2
	dw $7686
org $01A904
	dw $7686
org $01A963
	dw $7686
org $01C126
	dw $7686
org $01F2E5
	dw $7686
org $01F350
	dw $7686
org $01F59C
	dw $7686
org $02948D
	dw $7686
org $02EA7A
	dw $7686
org $03A828
	dw $7686
org $03A82B
	dw $7686
org $07F774
	dw $7686
org $07F7C6
	dw $7686
;============== REMAPPER FOR $1687
;============== REMAPPER FOR $1688
;============== REMAPPER FOR $1689
;============== REMAPPER FOR $168A
;============== REMAPPER FOR $168B
;============== REMAPPER FOR $168C
;============== REMAPPER FOR $168D
;============== REMAPPER FOR $168E
;============== REMAPPER FOR $168F
;============== REMAPPER FOR $1690
;============== REMAPPER FOR $1691
;============== REMAPPER FOR $1692
org $00FC89
	dw $7692
org $0180D5
	dw $7692
org $01D6C9
	dw $7692
org $01DC78
	dw $7692
org $01DCC8
	dw $7692
org $0288F3
	dw $7692
org $02A8E5
	dw $7692
org $02A9F0
	dw $7692
org $05D8FE
	dw $7692
org $05DA8F
	dw $7692
org $05DB64
	dw $7692
;============== REMAPPER FOR $1693
org $00EC5C
	dw $7693
org $00EC75
	dw $7693
org $00EC84
	dw $7693
org $00EC99
	dw $7693
org $00ED07
	dw $7693
org $00EE07
	dw $7693
org $00EE3B
	dw $7693
org $00EE5D
	dw $7693
org $00EFBD
	dw $7693
org $00F440
	dw $7693
org $00F4D6
	dw $7693
org $00F4E2
	dw $7693
org $00F549
	dw $7693
org $00F557
	dw $7693
org $00F574
	dw $7693
org $00F578
	dw $7693
org $00F590
	dw $7693
org $019222
	dw $7693
org $01922D
	dw $7693
org $019234
	dw $7693
org $01929A
	dw $7693
org $0192A8
	dw $7693
org $0192BB
	dw $7693
org $0192D8
	dw $7693
org $0192E1
	dw $7693
org $0192FD
	dw $7693
org $0193CF
	dw $7693
org $0194B9
	dw $7693
org $01952D
	dw $7693
org $01D840
	dw $7693
org $01D857
	dw $7693
org $01D993
	dw $7693
org $029324
	dw $7693
org $02932D
	dw $7693
org $029614
	dw $7693
org $029628
	dw $7693
org $02A5C2
	dw $7693
org $02A5F8
	dw $7693
org $02A6E5
	dw $7693
org $02A6F4
	dw $7693
org $02AC4E
	dw $7693
org $02BA9C
	dw $7693
org $02BAA5
	dw $7693
org $02D1B7
	dw $7693
org $02D1C0
	dw $7693
;============== REMAPPER FOR $1694
org $019141
	dw $7694
org $019360
	dw $7694
org $019410
	dw $7694
org $0194BC
	dw $7694
org $02A575
	dw $7694
org $02A71B
	dw $7694
;============== REMAPPER FOR $1695
org $019150
	dw $7695
org $0191F1
	dw $7695
org $01A43B
	dw $7695
org $01A499
	dw $7695
org $01A5DE
	dw $7695
org $01A7C3
	dw $7695
org $01D3BB
	dw $7695
org $01D7F7
	dw $7695
org $01D862
	dw $7695
org $01F569
	dw $7695
org $01F62C
	dw $7695
org $01F662
	dw $7695
org $01FD0D
	dw $7695
org $028938
	dw $7695
org $02B7E3
	dw $7695
org $02B850
	dw $7695
org $02EA61
	dw $7695
org $02EAAF
	dw $7695
org $02EAB5
	dw $7695
;============== REMAPPER FOR $1696
;============== REMAPPER FOR $1697
org $00EF96
	dw $7697
org $00EF9A
	dw $7697
org $01A8BC
	dw $7697
org $01AB48
	dw $7697
org $01AB4F
	dw $7697
org $01E5D3
	dw $7697
org $01ED6E
	dw $7697
org $0286C0
	dw $7697
org $02F261
	dw $7697
org $02F281
	dw $7697
org $02F284
	dw $7697
org $03962A
	dw $7697
org $039631
	dw $7697
;============== REMAPPER FOR $1698
org $028B6F
	dw $7698
org $028DBA
	dw $7698
org $028E73
	dw $7698
org $028F1F
	dw $7698
org $028F7B
	dw $7698
org $029006
	dw $7698
org $029021
	dw $7698
org $02903E
	dw $7698
org $029262
	dw $7698
org $02931F
	dw $7698
org $0293AA
	dw $7698
org $0293F8
	dw $7698
org $029401
	dw $7698
org $029990
	dw $7698
org $0299C3
	dw $7698
org $02B523
	dw $7698
org $02B5C5
	dw $7698
;============== REMAPPER FOR $1699
org $028795
	dw $7699
org $0287AA
	dw $7699
org $02882E
	dw $7699
org $02886F
	dw $7699
org $02904E
	dw $7699
org $0290CB
	dw $7699
org $029186
	dw $7699
org $02919A
	dw $7699
org $02924F
	dw $7699
;============== REMAPPER FOR $169A
;============== REMAPPER FOR $169B
;============== REMAPPER FOR $169C
;============== REMAPPER FOR $169D
org $028833
	dw $769D
org $02907B
	dw $769D
org $029080
	dw $769D
org $0290E6
	dw $769D
org $0290EB
	dw $769D
;============== REMAPPER FOR $169E
;============== REMAPPER FOR $169F
;============== REMAPPER FOR $16A0
;============== REMAPPER FOR $16A1
org $0287C7
	dw $76A1
org $028842
	dw $76A1
org $02908F
	dw $76A1
org $029097
	dw $76A1
org $029146
	dw $76A1
org $0291CE
	dw $76A1
org $029216
	dw $76A1
org $029231
	dw $76A1
org $029274
	dw $76A1
org $0292CB
	dw $76A1
org $029334
	dw $76A1
org $02933C
	dw $76A1
org $029353
	dw $76A1
org $029377
	dw $76A1
org $02B547
	dw $76A1
org $02B54A
	dw $76A1
;============== REMAPPER FOR $16A2
;============== REMAPPER FOR $16A3
;============== REMAPPER FOR $16A4
;============== REMAPPER FOR $16A5
org $0287BD
	dw $76A5
org $028838
	dw $76A5
org $0291BD
	dw $76A5
org $029222
	dw $76A5
org $02923C
	dw $76A5
org $02928D
	dw $76A5
org $0292E0
	dw $76A5
org $02936B
	dw $76A5
;============== REMAPPER FOR $16A6
;============== REMAPPER FOR $16A7
;============== REMAPPER FOR $16A8
;============== REMAPPER FOR $16A9
org $0287D1
	dw $76A9
org $028847
	dw $76A9
org $02909A
	dw $76A9
org $02909F
	dw $76A9
org $02914E
	dw $76A9
org $0291D8
	dw $76A9
org $02921B
	dw $76A9
org $02927E
	dw $76A9
org $0292D5
	dw $76A9
org $02933F
	dw $76A9
org $029345
	dw $76A9
org $02934F
	dw $76A9
org $02937D
	dw $76A9
org $02B54E
	dw $76A9
org $02B551
	dw $76A9
;============== REMAPPER FOR $16AA
;============== REMAPPER FOR $16AB
;============== REMAPPER FOR $16AC
;============== REMAPPER FOR $16AD
org $0287C2
	dw $76AD
org $02883D
	dw $76AD
org $0291C7
	dw $76AD
org $029227
	dw $76AD
org $029292
	dw $76AD
org $0292E5
	dw $76AD
org $029371
	dw $76AD
;============== REMAPPER FOR $16AE
;============== REMAPPER FOR $16AF
;============== REMAPPER FOR $16B0
;============== REMAPPER FOR $16B1
org $028856
	dw $76B1
org $0290AF
	dw $76B1
org $0290B6
	dw $76B1
org $029118
	dw $76B1
org $02911F
	dw $76B1
org $02B527
	dw $76B1
org $02B536
	dw $76B1
;============== REMAPPER FOR $16B2
;============== REMAPPER FOR $16B3
;============== REMAPPER FOR $16B4
;============== REMAPPER FOR $16B5
org $02885C
	dw $76B5
org $029122
	dw $76B5
org $029129
	dw $76B5
;============== REMAPPER FOR $16B6
;============== REMAPPER FOR $16B7
;============== REMAPPER FOR $16B8
;============== REMAPPER FOR $16B9
org $02B52F
	dw $76B9
org $02B532
	dw $76B9
;============== REMAPPER FOR $16BA
;============== REMAPPER FOR $16BB
;============== REMAPPER FOR $16BC
;============== REMAPPER FOR $16BD
;============== REMAPPER FOR $16BE
;============== REMAPPER FOR $16BF
;============== REMAPPER FOR $16C0
;============== REMAPPER FOR $16C1
org $0287D8
	dw $76C1
org $028867
	dw $76C1
org $0290C5
	dw $76C1
org $0291A0
	dw $76C1
;============== REMAPPER FOR $16C2
;============== REMAPPER FOR $16C3
;============== REMAPPER FOR $16C4
;============== REMAPPER FOR $16C5
org $02886C
	dw $76C5
org $029057
	dw $76C5
org $02905C
	dw $76C5
org $029086
	dw $76C5
org $02915F
	dw $76C5
;============== REMAPPER FOR $16C6
;============== REMAPPER FOR $16C7
;============== REMAPPER FOR $16C8
;============== REMAPPER FOR $16C9
org $028862
	dw $76C9
org $0290AC
	dw $76C9
org $0290F4
	dw $76C9
org $029112
	dw $76C9
org $02912C
	dw $76C9
org $029164
	dw $76C9
org $0291DF
	dw $76C9
org $0291FB
	dw $76C9
org $029268
	dw $76C9
org $029383
	dw $76C9
;============== REMAPPER FOR $16CA
;============== REMAPPER FOR $16CB
;============== REMAPPER FOR $16CC
;============== REMAPPER FOR $16CD
org $0286CD
	dw $76CD
org $0286F0
	dw $76CD
org $028732
	dw $76CD
org $029395
	dw $76CD
org $029399
	dw $76CD
org $029665
	dw $76CD
;============== REMAPPER FOR $16CE
;============== REMAPPER FOR $16CF
;============== REMAPPER FOR $16D0
;============== REMAPPER FOR $16D1
org $0286D2
	dw $76D1
org $0286FB
	dw $76D1
org $028717
	dw $76D1
org $029669
	dw $76D1
;============== REMAPPER FOR $16D2
;============== REMAPPER FOR $16D3
;============== REMAPPER FOR $16D4
;============== REMAPPER FOR $16D5
org $028700
	dw $76D5
org $02871E
	dw $76D5
org $029672
	dw $76D5
;============== REMAPPER FOR $16D6
;============== REMAPPER FOR $16D7
;============== REMAPPER FOR $16D8
;============== REMAPPER FOR $16D9
org $0286DF
	dw $76D9
org $028705
	dw $76D9
org $028726
	dw $76D9
org $02967F
	dw $76D9
;============== REMAPPER FOR $16DA
;============== REMAPPER FOR $16DB
;============== REMAPPER FOR $16DC
;============== REMAPPER FOR $16DD
org $0286D7
	dw $76DD
org $0286E6
	dw $76DD
org $02870A
	dw $76DD
org $02872D
	dw $76DD
org $029688
	dw $76DD
;============== REMAPPER FOR $16DE
;============== REMAPPER FOR $16DF
;============== REMAPPER FOR $16E0
;============== REMAPPER FOR $16E1
org $00F391
	dw $76E1
org $029AAF
	dw $76E1
org $02A444
	dw $76E1
org $02ACF7
	dw $76E1
org $02AD37
	dw $76E1
org $02ADBE
	dw $76E1
org $02ADD6
	dw $76E1
org $02ADEC
	dw $76E1
org $02AEC2
	dw $76E1
org $02AED4
	dw $76E1
org $02AEF5
	dw $76E1
org $02AF2A
	dw $76E1
org $02FF73
	dw $76E1
;============== REMAPPER FOR $16E2
;============== REMAPPER FOR $16E3
;============== REMAPPER FOR $16E4
;============== REMAPPER FOR $16E5
;============== REMAPPER FOR $16E6
;============== REMAPPER FOR $16E7
org $00F3A0
	dw $76E7
org $029AB5
	dw $76E7
org $02A44A
	dw $76E7
org $02ACFF
	dw $76E7
org $02AD13
	dw $76E7
org $02AD18
	dw $76E7
org $02AE48
	dw $76E7
org $02AE53
	dw $76E7
org $02AE90
	dw $76E7
org $02AEA6
	dw $76E7
org $02AF0B
	dw $76E7
org $02FF7C
	dw $76E7
;============== REMAPPER FOR $16E8
;============== REMAPPER FOR $16E9
;============== REMAPPER FOR $16EA
;============== REMAPPER FOR $16EB
;============== REMAPPER FOR $16EC
;============== REMAPPER FOR $16ED
org $00F396
	dw $76ED
org $029AC1
	dw $76ED
org $02A456
	dw $76ED
org $02AD25
	dw $76ED
org $02AE70
	dw $76ED
org $02AE84
	dw $76ED
org $02AEB2
	dw $76ED
org $02AEFF
	dw $76ED
org $02FF8A
	dw $76ED
;============== REMAPPER FOR $16EE
;============== REMAPPER FOR $16EF
;============== REMAPPER FOR $16F0
;============== REMAPPER FOR $16F1
;============== REMAPPER FOR $16F2
;============== REMAPPER FOR $16F3
org $00F39B
	dw $76F3
org $029AC7
	dw $76F3
org $02A45C
	dw $76F3
org $02AD2B
	dw $76F3
org $02AE7A
	dw $76F3
org $02AE89
	dw $76F3
org $02FF90
	dw $76F3
;============== REMAPPER FOR $16F4
;============== REMAPPER FOR $16F5
;============== REMAPPER FOR $16F6
;============== REMAPPER FOR $16F7
;============== REMAPPER FOR $16F8
;============== REMAPPER FOR $16F9
org $00F3A5
	dw $76F9
org $029ABB
	dw $76F9
org $02A450
	dw $76F9
org $02AD08
	dw $76F9
org $02AD1B
	dw $76F9
org $02AD20
	dw $76F9
org $02AE59
	dw $76F9
org $02AE95
	dw $76F9
org $02FF84
	dw $76F9
;============== REMAPPER FOR $16FA
;============== REMAPPER FOR $16FB
;============== REMAPPER FOR $16FC
;============== REMAPPER FOR $16FD
;============== REMAPPER FOR $16FE
;============== REMAPPER FOR $16FF
org $00F3AA
	dw $76FF
org $029ACC
	dw $76FF
org $02A461
	dw $76FF
org $02AD30
	dw $76FF
org $02ADD1
	dw $76FF
org $02ADE5
	dw $76FF
org $02AE39
	dw $76FF
org $02FF95
	dw $76FF
;============== REMAPPER FOR $1700
;============== REMAPPER FOR $1701
;============== REMAPPER FOR $1702
;============== REMAPPER FOR $1703
;============== REMAPPER FOR $1704
;============== REMAPPER FOR $1705
org $00F3AF
	dw $7705
org $029AD2
	dw $7705
org $02A466
	dw $7705
org $02AE5C
	dw $7705
;============== REMAPPER FOR $1706
;============== REMAPPER FOR $1707
;============== REMAPPER FOR $1708
;============== REMAPPER FOR $1709
;============== REMAPPER FOR $170A
;============== REMAPPER FOR $170B
org $00FAD9
	dw $770B
org $00FD1C
	dw $770B
org $00FD29
	dw $770B
org $00FE06
	dw $770B
org $00FE19
	dw $770B
org $00FEAB
	dw $770B
org $00FEC2
	dw $770B
org $018EF2
	dw $770B
org $018F8F
	dw $770B
org $01D3BE
	dw $770B
org $01D3EC
	dw $770B
org $01F29B
	dw $770B
org $01FD10
	dw $770B
org $01FD39
	dw $770B
org $028537
	dw $770B
org $028542
	dw $770B
org $029637
	dw $770B
org $02964A
	dw $770B
org $029B17
	dw $770B
org $029BDB
	dw $770B
org $029BF8
	dw $770B
org $029C03
	dw $770B
org $029C80
	dw $770B
org $029CCA
	dw $770B
org $029D21
	dw $770B
org $029D5B
	dw $770B
org $029D9A
	dw $770B
org $029E3A
	dw $770B
org $029EE7
	dw $770B
org $02A0E2
	dw $770B
org $02A214
	dw $770B
org $02A26B
	dw $770B
org $02A2C0
	dw $770B
org $02A30D
	dw $770B
org $02A40C
	dw $770B
org $02A41A
	dw $770B
org $02A4B6
	dw $770B
org $02A51A
	dw $770B
org $02B425
	dw $770B
org $02B430
	dw $770B
org $02C471
	dw $770B
org $02C47C
	dw $770B
org $02DABB
	dw $770B
org $02DAC6
	dw $770B
org $02E088
	dw $770B
org $02E093
	dw $770B
org $02E1C5
	dw $770B
org $02E1D0
	dw $770B
org $02EFB4
	dw $770B
org $02EFBF
	dw $770B
org $02F2DA
	dw $770B
org $02F2E5
	dw $770B
org $03990B
	dw $770B
org $039AFB
	dw $770B
org $039B0B
	dw $770B
org $03C459
	dw $770B
org $03C464
	dw $770B
org $07FC4A
	dw $770B
org $07FC55
	dw $770B
;============== REMAPPER FOR $170C
;============== REMAPPER FOR $170D
;============== REMAPPER FOR $170E
;============== REMAPPER FOR $170F
;============== REMAPPER FOR $1710
;============== REMAPPER FOR $1711
;============== REMAPPER FOR $1712
;============== REMAPPER FOR $1713
;============== REMAPPER FOR $1714
;============== REMAPPER FOR $1715
org $00FD4D
	dw $7715
org $00FE2A
	dw $7715
org $00FEF7
	dw $7715
org $018F82
	dw $7715
org $01D3CF
	dw $7715
org $01F2AB
	dw $7715
org $01FD21
	dw $7715
org $028547
	dw $7715
org $029B64
	dw $7715
org $029C0B
	dw $7715
org $029CF9
	dw $7715
org $029DD4
	dw $7715
org $029EB5
	dw $7715
org $029EFD
	dw $7715
org $029F00
	dw $7715
org $029F2B
	dw $7715
org $029FB4
	dw $7715
org $02A000
	dw $7715
org $02A007
	dw $7715
org $02A068
	dw $7715
org $02A1C1
	dw $7715
org $02A290
	dw $7715
org $02A37A
	dw $7715
org $02A3C2
	dw $7715
org $02A433
	dw $7715
org $02A447
	dw $7715
org $02A4CE
	dw $7715
org $02A4D4
	dw $7715
org $02A532
	dw $7715
org $02A55B
	dw $7715
org $02A58D
	dw $7715
org $02A5A4
	dw $7715
org $02A5E0
	dw $7715
org $02A5E7
	dw $7715
org $02A602
	dw $7715
org $02A619
	dw $7715
org $02A67A
	dw $7715
org $02A73E
	dw $7715
org $02A744
	dw $7715
org $02B44A
	dw $7715
org $02B581
	dw $7715
org $02B584
	dw $7715
org $02C48D
	dw $7715
org $02DAD6
	dw $7715
org $02E0A8
	dw $7715
org $02E1E5
	dw $7715
org $02EFD4
	dw $7715
org $02F2FA
	dw $7715
org $039B29
	dw $7715
org $03C46C
	dw $7715
org $07FC61
	dw $7715
;============== REMAPPER FOR $1716
;============== REMAPPER FOR $1717
;============== REMAPPER FOR $1718
;============== REMAPPER FOR $1719
;============== REMAPPER FOR $171A
;============== REMAPPER FOR $171B
;============== REMAPPER FOR $171C
;============== REMAPPER FOR $171D
;============== REMAPPER FOR $171E
;============== REMAPPER FOR $171F
org $00FD34
	dw $771F
org $00FE39
	dw $771F
org $00FEE6
	dw $771F
org $018F72
	dw $771F
org $01D3C5
	dw $771F
org $01F2A0
	dw $771F
org $01FD17
	dw $771F
org $028555
	dw $771F
org $029B55
	dw $771F
org $029C1D
	dw $771F
org $029D05
	dw $771F
org $029D16
	dw $771F
org $029DC8
	dw $771F
org $029EA1
	dw $771F
org $02A01D
	dw $771F
org $02A020
	dw $771F
org $02A05B
	dw $771F
org $02A1B2
	dw $771F
org $02A272
	dw $771F
org $02A36D
	dw $771F
org $02A3B5
	dw $771F
org $02A42D
	dw $771F
org $02A453
	dw $771F
org $02A4BD
	dw $771F
org $02A4C3
	dw $771F
org $02A51D
	dw $771F
org $02A548
	dw $771F
org $02A593
	dw $771F
org $02A5CD
	dw $771F
org $02A5D4
	dw $771F
org $02A60A
	dw $771F
org $02A632
	dw $771F
org $02A698
	dw $771F
org $02B439
	dw $771F
org $02C4A3
	dw $771F
org $02DACB
	dw $771F
org $02E09B
	dw $771F
org $02E1D8
	dw $771F
org $02EFC7
	dw $771F
org $02F2EF
	dw $771F
org $039B14
	dw $771F
org $03C479
	dw $771F
org $07FC71
	dw $771F
;============== REMAPPER FOR $1720
;============== REMAPPER FOR $1721
;============== REMAPPER FOR $1722
;============== REMAPPER FOR $1723
;============== REMAPPER FOR $1724
;============== REMAPPER FOR $1725
;============== REMAPPER FOR $1726
;============== REMAPPER FOR $1727
;============== REMAPPER FOR $1728
;============== REMAPPER FOR $1729
org $00FD54
	dw $7729
org $00FE31
	dw $7729
org $00FEFE
	dw $7729
org $018F8A
	dw $7729
org $01D3D4
	dw $7729
org $01F2B1
	dw $7729
org $02854D
	dw $7729
org $029B6C
	dw $7729
org $029C12
	dw $7729
org $029F06
	dw $7729
org $029F30
	dw $7729
org $029FB9
	dw $7729
org $02A00C
	dw $7729
org $02A1C9
	dw $7729
org $02A298
	dw $7729
org $02A44D
	dw $7729
org $02A4D7
	dw $7729
org $02A4DC
	dw $7729
org $02A53B
	dw $7729
org $02A563
	dw $7729
org $02A5AD
	dw $7729
org $02A5EA
	dw $7729
org $02A5F0
	dw $7729
org $02A5FE
	dw $7729
org $02A625
	dw $7729
org $02A686
	dw $7729
org $02A747
	dw $7729
org $02A74C
	dw $7729
org $02B452
	dw $7729
org $02B588
	dw $7729
org $02B58B
	dw $7729
org $02C495
	dw $7729
org $02DADC
	dw $7729
org $02E0AE
	dw $7729
org $02E1EB
	dw $7729
org $02EFDA
	dw $7729
org $02F2FF
	dw $7729
org $039B32
	dw $7729
org $03C474
	dw $7729
org $07FC69
	dw $7729
;============== REMAPPER FOR $172A
;============== REMAPPER FOR $172B
;============== REMAPPER FOR $172C
;============== REMAPPER FOR $172D
;============== REMAPPER FOR $172E
;============== REMAPPER FOR $172F
;============== REMAPPER FOR $1730
;============== REMAPPER FOR $1731
;============== REMAPPER FOR $1732
;============== REMAPPER FOR $1733
org $00FD3B
	dw $7733
org $00FE40
	dw $7733
org $00FEEE
	dw $7733
org $018F7A
	dw $7733
org $01D3CA
	dw $7733
org $01F2A6
	dw $7733
org $02855D
	dw $7733
org $029B5D
	dw $7733
org $029C25
	dw $7733
org $029D0A
	dw $7733
org $029EA9
	dw $7733
org $02A024
	dw $7733
org $02A027
	dw $7733
org $02A1BA
	dw $7733
org $02A27A
	dw $7733
org $02A459
	dw $7733
org $02A4C6
	dw $7733
org $02A4CB
	dw $7733
org $02A526
	dw $7733
org $02A550
	dw $7733
org $02A59C
	dw $7733
org $02A5D7
	dw $7733
org $02A5DD
	dw $7733
org $02A606
	dw $7733
org $02A63C
	dw $7733
org $02A6A2
	dw $7733
org $02B441
	dw $7733
org $02C4AB
	dw $7733
org $02DAD1
	dw $7733
org $02E0A3
	dw $7733
org $02E1E0
	dw $7733
org $02EFCF
	dw $7733
org $02F2F5
	dw $7733
org $039B1E
	dw $7733
org $03C47F
	dw $7733
org $07FC79
	dw $7733
;============== REMAPPER FOR $1734
;============== REMAPPER FOR $1735
;============== REMAPPER FOR $1736
;============== REMAPPER FOR $1737
;============== REMAPPER FOR $1738
;============== REMAPPER FOR $1739
;============== REMAPPER FOR $173A
;============== REMAPPER FOR $173B
;============== REMAPPER FOR $173C
;============== REMAPPER FOR $173D
org $00FEC7
	dw $773D
org $01F2CE
	dw $773D
org $028579
	dw $773D
org $029BB9
	dw $773D
org $029BC0
	dw $773D
org $029BC3
	dw $773D
org $029CBD
	dw $773D
org $029CC7
	dw $773D
org $029CF0
	dw $773D
org $029E57
	dw $773D
org $029E91
	dw $773D
org $029E97
	dw $773D
org $029FC9
	dw $773D
org $029FD0
	dw $773D
org $029FD6
	dw $773D
org $029FFD
	dw $773D
org $02A2FA
	dw $773D
org $02A301
	dw $773D
org $02A304
	dw $773D
org $02B561
	dw $773D
org $02B572
	dw $773D
org $02DAE1
	dw $773D
org $02E0BD
	dw $773D
org $02E1F0
	dw $773D
org $02EFDF
	dw $773D
org $02F304
	dw $773D
org $039B49
	dw $773D
org $07FC88
	dw $773D
;============== REMAPPER FOR $173E
;============== REMAPPER FOR $173F
;============== REMAPPER FOR $1740
;============== REMAPPER FOR $1741
;============== REMAPPER FOR $1742
;============== REMAPPER FOR $1743
;============== REMAPPER FOR $1744
;============== REMAPPER FOR $1745
;============== REMAPPER FOR $1746
;============== REMAPPER FOR $1747
org $00FECF
	dw $7747
org $01F2C8
	dw $7747
org $02856C
	dw $7747
org $029BD7
	dw $7747
org $029C2B
	dw $7747
org $029C75
	dw $7747
org $029C79
	dw $7747
org $029CDC
	dw $7747
org $029DA1
	dw $7747
org $029F83
	dw $7747
org $029FE8
	dw $7747
org $02A016
	dw $7747
org $02A053
	dw $7747
org $02A1A8
	dw $7747
org $02A281
	dw $7747
org $02B460
	dw $7747
org $02C4B1
	dw $7747
org $02DAE6
	dw $7747
org $02E0B7
	dw $7747
org $02E1F5
	dw $7747
org $02EFE4
	dw $7747
org $02F30C
	dw $7747
org $039B4E
	dw $7747
org $03C48C
	dw $7747
org $07FC81
	dw $7747
;============== REMAPPER FOR $1748
;============== REMAPPER FOR $1749
;============== REMAPPER FOR $174A
;============== REMAPPER FOR $174B
;============== REMAPPER FOR $174C
;============== REMAPPER FOR $174D
;============== REMAPPER FOR $174E
;============== REMAPPER FOR $174F
;============== REMAPPER FOR $1750
;============== REMAPPER FOR $1751
org $02B569
	dw $7751
org $02B56C
	dw $7751
;============== REMAPPER FOR $1752
;============== REMAPPER FOR $1753
;============== REMAPPER FOR $1754
;============== REMAPPER FOR $1755
;============== REMAPPER FOR $1756
;============== REMAPPER FOR $1757
;============== REMAPPER FOR $1758
;============== REMAPPER FOR $1759
;============== REMAPPER FOR $175A
;============== REMAPPER FOR $175B
org $029FDE
	dw $775B
org $029FE1
	dw $775B
org $02A011
	dw $775B
;============== REMAPPER FOR $175C
;============== REMAPPER FOR $175D
;============== REMAPPER FOR $175E
;============== REMAPPER FOR $175F
;============== REMAPPER FOR $1760
;============== REMAPPER FOR $1761
;============== REMAPPER FOR $1762
;============== REMAPPER FOR $1763
;============== REMAPPER FOR $1764
;============== REMAPPER FOR $1765
org $00FE22
	dw $7765
org $029CE4
	dw $7765
org $029CF3
	dw $7765
org $029DBF
	dw $7765
org $029DF7
	dw $7765
org $029EF3
	dw $7765
org $029EF6
	dw $7765
org $029F3A
	dw $7765
org $029FC3
	dw $7765
org $02A07A
	dw $7765
org $02A21E
	dw $7765
org $02A239
	dw $7765
org $02A25C
	dw $7765
org $02A265
	dw $7765
org $02A30A
	dw $7765
org $02A31E
	dw $7765
org $02EFE7
	dw $7765
org $02F2EA
	dw $7765
;============== REMAPPER FOR $1766
;============== REMAPPER FOR $1767
;============== REMAPPER FOR $1768
;============== REMAPPER FOR $1769
;============== REMAPPER FOR $176A
;============== REMAPPER FOR $176B
;============== REMAPPER FOR $176C
;============== REMAPPER FOR $176D
;============== REMAPPER FOR $176E
;============== REMAPPER FOR $176F
org $00FD57
	dw $776F
org $00FE45
	dw $776F
org $018F94
	dw $776F
org $01D3F1
	dw $776F
org $01F2D3
	dw $776F
org $01FD3E
	dw $776F
org $028587
	dw $776F
org $029B20
	dw $776F
org $029B25
	dw $776F
org $029C30
	dw $776F
org $029C45
	dw $776F
org $029C6C
	dw $776F
org $029C84
	dw $776F
org $029C9D
	dw $776F
org $029DAB
	dw $776F
org $029E40
	dw $776F
org $029EC2
	dw $776F
org $02A221
	dw $776F
org $02A350
	dw $776F
org $02A387
	dw $776F
org $02A3CF
	dw $776F
org $02A4E1
	dw $776F
org $02B457
	dw $776F
org $07FC8D
	dw $776F
;============== REMAPPER FOR $1770
;============== REMAPPER FOR $1771
;============== REMAPPER FOR $1772
;============== REMAPPER FOR $1773
;============== REMAPPER FOR $1774
;============== REMAPPER FOR $1775
;============== REMAPPER FOR $1776
;============== REMAPPER FOR $1777
;============== REMAPPER FOR $1778
;============== REMAPPER FOR $1779
org $00FF04
	dw $7779
org $01F2B6
	dw $7779
org $02A075
	dw $7779
org $02A0D0
	dw $7779
org $02A1DE
	dw $7779
org $02A3FA
	dw $7779
;============== REMAPPER FOR $177A
;============== REMAPPER FOR $177B
;============== REMAPPER FOR $177C
;============== REMAPPER FOR $177D
;============== REMAPPER FOR $177E
;============== REMAPPER FOR $177F
;============== REMAPPER FOR $1780
;============== REMAPPER FOR $1781
;============== REMAPPER FOR $1782
;============== REMAPPER FOR $1783
org $02AB82
	dw $7783
org $02ABA6
	dw $7783
org $02B391
	dw $7783
;============== REMAPPER FOR $1784
;============== REMAPPER FOR $1785
;============== REMAPPER FOR $1786
;============== REMAPPER FOR $1787
;============== REMAPPER FOR $1788
;============== REMAPPER FOR $1789
;============== REMAPPER FOR $178A
;============== REMAPPER FOR $178B
org $02ABBE
	dw $778B
org $02ABCD
	dw $778B
org $02B3C1
	dw $778B
org $02B402
	dw $778B
org $02B444
	dw $778B
org $02B471
	dw $778B
org $02B4C3
	dw $778B
org $02B4F1
	dw $778B
;============== REMAPPER FOR $178C
;============== REMAPPER FOR $178D
;============== REMAPPER FOR $178E
;============== REMAPPER FOR $178F
;============== REMAPPER FOR $1790
;============== REMAPPER FOR $1791
;============== REMAPPER FOR $1792
;============== REMAPPER FOR $1793
org $02ABC3
	dw $7793
org $02ABD3
	dw $7793
org $02B3C6
	dw $7793
org $02B408
	dw $7793
org $02B44D
	dw $7793
org $02B476
	dw $7793
org $02B4CC
	dw $7793
;============== REMAPPER FOR $1794
;============== REMAPPER FOR $1795
;============== REMAPPER FOR $1796
;============== REMAPPER FOR $1797
;============== REMAPPER FOR $1798
;============== REMAPPER FOR $1799
;============== REMAPPER FOR $179A
;============== REMAPPER FOR $179B
org $02ABB3
	dw $779B
org $02ABD8
	dw $779B
org $02B3CD
	dw $779B
org $02B3D9
	dw $779B
org $02B3F6
	dw $779B
org $02B433
	dw $779B
org $02B47D
	dw $779B
org $02B489
	dw $779B
org $02B498
	dw $779B
org $02B4B7
	dw $779B
org $02B4FC
	dw $779B
org $02B502
	dw $779B
;============== REMAPPER FOR $179C
;============== REMAPPER FOR $179D
;============== REMAPPER FOR $179E
;============== REMAPPER FOR $179F
;============== REMAPPER FOR $17A0
;============== REMAPPER FOR $17A1
;============== REMAPPER FOR $17A2
;============== REMAPPER FOR $17A3
org $02ABB9
	dw $77A3
org $02ABDD
	dw $77A3
org $02B3D2
	dw $77A3
org $02B3FC
	dw $77A3
org $02B43C
	dw $77A3
org $02B482
	dw $77A3
org $02B4BD
	dw $77A3
org $02B507
	dw $77A3
;============== REMAPPER FOR $17A4
;============== REMAPPER FOR $17A5
;============== REMAPPER FOR $17A6
;============== REMAPPER FOR $17A7
;============== REMAPPER FOR $17A8
;============== REMAPPER FOR $17A9
;============== REMAPPER FOR $17AA
;============== REMAPPER FOR $17AB
org $02ABE7
	dw $77AB
org $02B396
	dw $77AB
org $02B3A1
	dw $77AB
org $02B3B7
	dw $77AB
org $02B3BE
	dw $77AB
org $02B467
	dw $77AB
org $02B46E
	dw $77AB
;============== REMAPPER FOR $17AC
;============== REMAPPER FOR $17AD
;============== REMAPPER FOR $17AE
;============== REMAPPER FOR $17AF
;============== REMAPPER FOR $17B0
;============== REMAPPER FOR $17B1
;============== REMAPPER FOR $17B2
;============== REMAPPER FOR $17B3
org $02AB97
	dw $77B3
org $02ABE2
	dw $77B3
;============== REMAPPER FOR $17B4
;============== REMAPPER FOR $17B5
;============== REMAPPER FOR $17B6
;============== REMAPPER FOR $17B7
;============== REMAPPER FOR $17B8
;============== REMAPPER FOR $17B9
;============== REMAPPER FOR $17BA
;============== REMAPPER FOR $17BB
org $00FF1B
	dw $77BB
org $05D7C1
	dw $77BB
org $05D7E8
	dw $77BB
org $05D8AA
	dw $77BB
;============== REMAPPER FOR $17BC
org $00F7D4
	dw $77BC
org $00FF0A
	dw $77BC
org $02CC30
	dw $77BC
org $05BC21
	dw $77BC
org $05BC24
	dw $77BC
;============== REMAPPER FOR $17BD
org $00F7CB
	dw $77BD
org $00FBB7
	dw $77BD
org $01E9EF
	dw $77BD
org $02CC12
	dw $77BD
org $02D3F8
	dw $77BD
org $038562
	dw $77BD
org $0390D2
	dw $77BD
org $05BC14
	dw $77BD
org $05BC17
	dw $77BD
org $05C477
	dw $77BD
org $05C4F0
	dw $77BD
org $05C7D9
	dw $77BD
;============== REMAPPER FOR $17BE
org $00EF46
	dw $77BE
org $00F7E6
	dw $77BE
org $05BC3D
	dw $77BE
;============== REMAPPER FOR $17BF
org $00F7DD
	dw $77BF
org $0191AA
	dw $77BF
org $05BC34
	dw $77BF
;============== REMAPPER FOR $17C0
org $00FB85
	dw $77C0
org $00FB90
	dw $77C0
org $00FD63
	dw $77C0
org $00FD6E
	dw $77C0
org $00FE6A
	dw $77C0
org $00FE75
	dw $77C0
org $01806B
	dw $77C0
org $018076
	dw $77C0
org $01AB7B
	dw $77C0
org $01AB86
	dw $77C0
org $01ABA2
	dw $77C0
org $01ABAD
	dw $77C0
org $01BD9B
	dw $77C0
org $01BDA6
	dw $77C0
org $01C4F3
	dw $77C0
org $01C4FE
	dw $77C0
org $01C5C0
	dw $77C0
org $01C5D7
	dw $77C0
org $01D01D
	dw $77C0
org $028A48
	dw $77C0
org $028A53
	dw $77C0
org $0296C1
	dw $77C0
org $0296E0
	dw $77C0
org $0296E9
	dw $77C0
org $029794
	dw $77C0
org $0298BF
	dw $77C0
org $029ADD
	dw $77C0
org $029AE8
	dw $77C0
org $02A41F
	dw $77C0
org $02A42A
	dw $77C0
org $02B4E1
	dw $77C0
org $02B4EE
	dw $77C0
org $02B955
	dw $77C0
org $02B992
	dw $77C0
org $038A19
	dw $77C0
org $038A24
	dw $77C0
;============== REMAPPER FOR $17C1
;============== REMAPPER FOR $17C2
;============== REMAPPER FOR $17C3
;============== REMAPPER FOR $17C4
org $00FB96
	dw $77C4
org $00FD7C
	dw $77C4
org $00FD95
	dw $77C4
org $00FE8B
	dw $77C4
org $018084
	dw $77C4
org $01AB90
	dw $77C4
org $01ABC3
	dw $77C4
org $01BDB0
	dw $77C4
org $01C508
	dw $77C4
org $01C5E4
	dw $77C4
org $01D02B
	dw $77C4
org $028A58
	dw $77C4
org $029712
	dw $77C4
org $02975B
	dw $77C4
org $0297CE
	dw $77C4
org $029854
	dw $77C4
org $0298F7
	dw $77C4
org $02994D
	dw $77C4
org $029979
	dw $77C4
org $0299AC
	dw $77C4
org $029B02
	dw $77C4
org $02A436
	dw $77C4
org $02B4F4
	dw $77C4
org $02B99C
	dw $77C4
org $038A34
	dw $77C4
;============== REMAPPER FOR $17C5
;============== REMAPPER FOR $17C6
;============== REMAPPER FOR $17C7
;============== REMAPPER FOR $17C8
org $00FB9C
	dw $77C8
org $00FD75
	dw $77C8
org $00FD8B
	dw $77C8
org $00FE7C
	dw $77C8
org $01807D
	dw $77C8
org $01AB8B
	dw $77C8
org $01ABB2
	dw $77C8
org $01BDAB
	dw $77C8
org $01C503
	dw $77C8
org $01C5E9
	dw $77C8
org $01D024
	dw $77C8
org $028A5D
	dw $77C8
org $029705
	dw $77C8
org $02974E
	dw $77C8
org $0297B5
	dw $77C8
org $02983B
	dw $77C8
org $0298FC
	dw $77C8
org $029970
	dw $77C8
org $0299A3
	dw $77C8
org $029AF7
	dw $77C8
org $02A430
	dw $77C8
org $02B514
	dw $77C8
org $02B997
	dw $77C8
org $038A2C
	dw $77C8
;============== REMAPPER FOR $17C9
;============== REMAPPER FOR $17CA
;============== REMAPPER FOR $17CB
;============== REMAPPER FOR $17CC
org $00FBA1
	dw $77CC
org $00FD9A
	dw $77CC
org $00FE91
	dw $77CC
org $018089
	dw $77CC
org $01AB95
	dw $77CC
org $01ABC8
	dw $77CC
org $01BDB5
	dw $77CC
org $01C50D
	dw $77CC
org $01C5DC
	dw $77CC
org $01D030
	dw $77CC
org $028A62
	dw $77CC
org $0296E4
	dw $77CC
org $0296F2
	dw $77CC
org $02971F
	dw $77CC
org $029733
	dw $77CC
org $029768
	dw $77CC
org $02977C
	dw $77CC
org $029798
	dw $77CC
org $0297A1
	dw $77CC
org $0297E3
	dw $77CC
org $0297FD
	dw $77CC
org $029869
	dw $77CC
org $029883
	dw $77CC
org $0298CB
	dw $77CC
org $0298D4
	dw $77CC
org $029901
	dw $77CC
org $029928
	dw $77CC
org $029946
	dw $77CC
org $029987
	dw $77CC
org $0299BA
	dw $77CC
org $029B07
	dw $77CC
org $02A43B
	dw $77CC
org $02B4F9
	dw $77CC
org $02B9A1
	dw $77CC
org $038A39
	dw $77CC
;============== REMAPPER FOR $17CD
;============== REMAPPER FOR $17CE
;============== REMAPPER FOR $17CF
;============== REMAPPER FOR $17D0
org $028A69
	dw $77D0
org $028A82
	dw $77D0
org $029359
	dw $77D0
org $029364
	dw $77D0
org $0299D8
	dw $77D0
org $0299E6
	dw $77D0
;============== REMAPPER FOR $17D1
;============== REMAPPER FOR $17D2
;============== REMAPPER FOR $17D3
;============== REMAPPER FOR $17D4
org $028A94
	dw $77D4
org $02937A
	dw $77D4
org $029A1E
	dw $77D4
org $029A36
	dw $77D4
org $029AB2
	dw $77D4
org $029AFA
	dw $77D4
org $02B5AF
	dw $77D4
org $02B5B2
	dw $77D4
;============== REMAPPER FOR $17D5
;============== REMAPPER FOR $17D6
;============== REMAPPER FOR $17D7
;============== REMAPPER FOR $17D8
org $028AA6
	dw $77D8
org $02938F
	dw $77D8
org $0299F9
	dw $77D8
org $0299FF
	dw $77D8
org $02B58F
	dw $77D8
org $02B5A0
	dw $77D8
;============== REMAPPER FOR $17D9
;============== REMAPPER FOR $17DA
;============== REMAPPER FOR $17DB
;============== REMAPPER FOR $17DC
org $02B597
	dw $77DC
org $02B59A
	dw $77DC
;============== REMAPPER FOR $17DD
;============== REMAPPER FOR $17DE
;============== REMAPPER FOR $17DF
;============== REMAPPER FOR $17E0
org $028A87
	dw $77E0
org $02936E
	dw $77E0
org $029A2A
	dw $77E0
org $029ABE
	dw $77E0
org $029AF0
	dw $77E0
;============== REMAPPER FOR $17E1
;============== REMAPPER FOR $17E2
;============== REMAPPER FOR $17E3
;============== REMAPPER FOR $17E4
org $028AA1
	dw $77E4
org $02938A
	dw $77E4
org $029A09
	dw $77E4
org $029ACF
	dw $77E4
org $029AEB
	dw $77E4
;============== REMAPPER FOR $17E5
;============== REMAPPER FOR $17E6
;============== REMAPPER FOR $17E7
;============== REMAPPER FOR $17E8
org $028A9B
	dw $77E8
org $029380
	dw $77E8
org $029A23
	dw $77E8
org $029AB8
	dw $77E8
org $02B5B6
	dw $77E8
org $02B5B9
	dw $77E8
;============== REMAPPER FOR $17E9
;============== REMAPPER FOR $17EA
;============== REMAPPER FOR $17EB
;============== REMAPPER FOR $17EC
org $028A8C
	dw $77EC
org $029374
	dw $77EC
org $029AC4
	dw $77EC
;============== REMAPPER FOR $17ED
;============== REMAPPER FOR $17EE
;============== REMAPPER FOR $17EF
;============== REMAPPER FOR $17F0
org $00FDAC
	dw $77F0
org $00FDEB
	dw $77F0
org $01F7E0
	dw $77F0
org $01F7F7
	dw $77F0
org $0284E0
	dw $77F0
org $028508
	dw $77F0
org $0285BD
	dw $77F0
org $0285C8
	dw $77F0
org $0285E7
	dw $77F0
org $0285F6
	dw $77F0
org $02866B
	dw $77F0
org $028687
	dw $77F0
org $028B6A
	dw $77F0
org $028BC3
	dw $77F0
org $028BCE
	dw $77F0
org $028C33
	dw $77F0
org $028C3E
	dw $77F0
org $028C67
	dw $77F0
org $028D63
	dw $77F0
org $028E03
	dw $77F0
org $028E50
	dw $77F0
org $028E77
	dw $77F0
org $028EFF
	dw $77F0
org $028F88
	dw $77F0
org $0298DD
	dw $77F0
org $0298F4
	dw $77F0
org $02C0F3
	dw $77F0
org $02C109
	dw $77F0
org $039023
	dw $77F0
org $03903A
	dw $77F0
org $03AD6C
	dw $77F0
org $03AD77
	dw $77F0
;============== REMAPPER FOR $17F1
;============== REMAPPER FOR $17F2
;============== REMAPPER FOR $17F3
;============== REMAPPER FOR $17F4
;============== REMAPPER FOR $17F5
;============== REMAPPER FOR $17F6
;============== REMAPPER FOR $17F7
;============== REMAPPER FOR $17F8
;============== REMAPPER FOR $17F9
;============== REMAPPER FOR $17FA
;============== REMAPPER FOR $17FB
;============== REMAPPER FOR $17FC
org $00FDD0
	dw $77FC
org $01F809
	dw $77FC
org $0284F3
	dw $77FC
org $0285D2
	dw $77FC
org $02861F
	dw $77FC
org $0286A0
	dw $77FC
org $028BDB
	dw $77FC
org $028C50
	dw $77FC
org $028C53
	dw $77FC
org $028C81
	dw $77FC
org $028CD8
	dw $77FC
org $028D17
	dw $77FC
org $028D73
	dw $77FC
org $028D9F
	dw $77FC
org $028E1E
	dw $77FC
org $028E35
	dw $77FC
org $028E98
	dw $77FC
org $028EF2
	dw $77FC
org $028F5A
	dw $77FC
org $028FB5
	dw $77FC
org $028FB8
	dw $77FC
org $028FCB
	dw $77FC
org $029919
	dw $77FC
org $02B5E6
	dw $77FC
org $02B5E9
	dw $77FC
org $02C119
	dw $77FC
org $03904A
	dw $77FC
org $03AD9E
	dw $77FC
;============== REMAPPER FOR $17FD
;============== REMAPPER FOR $17FE
;============== REMAPPER FOR $17FF
;============== REMAPPER FOR $1800
;============== REMAPPER FOR $1801
;============== REMAPPER FOR $1802
;============== REMAPPER FOR $1803
;============== REMAPPER FOR $1804
;============== REMAPPER FOR $1805
;============== REMAPPER FOR $1806
;============== REMAPPER FOR $1807
;============== REMAPPER FOR $1808
org $00FDE1
	dw $7808
org $01F800
	dw $7808
org $0284FB
	dw $7808
org $0285D7
	dw $7808
org $028609
	dw $7808
org $028690
	dw $7808
org $028BFD
	dw $7808
org $028C44
	dw $7808
org $028C47
	dw $7808
org $028C72
	dw $7808
org $028CC9
	dw $7808
org $028D03
	dw $7808
org $028D50
	dw $7808
org $028D8F
	dw $7808
org $028E24
	dw $7808
org $028EA5
	dw $7808
org $028EE5
	dw $7808
org $028F30
	dw $7808
org $028F51
	dw $7808
org $028F9F
	dw $7808
org $028FA2
	dw $7808
org $028FE1
	dw $7808
org $029910
	dw $7808
org $02C111
	dw $7808
org $03903F
	dw $7808
org $03AD8C
	dw $7808
;============== REMAPPER FOR $1809
;============== REMAPPER FOR $180A
;============== REMAPPER FOR $180B
;============== REMAPPER FOR $180C
;============== REMAPPER FOR $180D
;============== REMAPPER FOR $180E
;============== REMAPPER FOR $180F
;============== REMAPPER FOR $1810
;============== REMAPPER FOR $1811
;============== REMAPPER FOR $1812
;============== REMAPPER FOR $1813
;============== REMAPPER FOR $1814
org $00FDDB
	dw $7814
org $01F80E
	dw $7814
org $028627
	dw $7814
org $0286A7
	dw $7814
org $028BE3
	dw $7814
org $028C56
	dw $7814
org $028C59
	dw $7814
org $028C89
	dw $7814
org $028CE0
	dw $7814
org $028FBC
	dw $7814
org $028FBF
	dw $7814
org $028FD3
	dw $7814
org $039050
	dw $7814
org $03ADA6
	dw $7814
;============== REMAPPER FOR $1815
;============== REMAPPER FOR $1816
;============== REMAPPER FOR $1817
;============== REMAPPER FOR $1818
;============== REMAPPER FOR $1819
;============== REMAPPER FOR $181A
;============== REMAPPER FOR $181B
;============== REMAPPER FOR $181C
;============== REMAPPER FOR $181D
;============== REMAPPER FOR $181E
;============== REMAPPER FOR $181F
;============== REMAPPER FOR $1820
org $01F814
	dw $7820
org $0285CD
	dw $7820
org $0285FB
	dw $7820
org $0286AD
	dw $7820
org $028C41
	dw $7820
org $028E8F
	dw $7820
org $028E92
	dw $7820
org $028F4B
	dw $7820
org $028FAE
	dw $7820
org $028FC8
	dw $7820
org $02B5C9
	dw $7820
org $02B5D8
	dw $7820
org $03ADAB
	dw $7820
;============== REMAPPER FOR $1821
;============== REMAPPER FOR $1822
;============== REMAPPER FOR $1823
;============== REMAPPER FOR $1824
;============== REMAPPER FOR $1825
;============== REMAPPER FOR $1826
;============== REMAPPER FOR $1827
;============== REMAPPER FOR $1828
;============== REMAPPER FOR $1829
;============== REMAPPER FOR $182A
;============== REMAPPER FOR $182B
;============== REMAPPER FOR $182C
org $01F81A
	dw $782C
org $0286B3
	dw $782C
org $028BF4
	dw $782C
org $028C15
	dw $782C
org $028C24
	dw $782C
org $028D2A
	dw $782C
org $028DF2
	dw $782C
org $028DF9
	dw $782C
org $028DFC
	dw $782C
org $028DFF
	dw $782C
org $028E0D
	dw $782C
org $028E14
	dw $782C
org $028F98
	dw $782C
org $02C123
	dw $782C
org $03905A
	dw $782C
;============== REMAPPER FOR $182D
;============== REMAPPER FOR $182E
;============== REMAPPER FOR $182F
;============== REMAPPER FOR $1830
;============== REMAPPER FOR $1831
;============== REMAPPER FOR $1832
;============== REMAPPER FOR $1833
;============== REMAPPER FOR $1834
;============== REMAPPER FOR $1835
;============== REMAPPER FOR $1836
;============== REMAPPER FOR $1837
;============== REMAPPER FOR $1838
org $02B5D1
	dw $7838
org $02B5D4
	dw $7838
;============== REMAPPER FOR $1839
;============== REMAPPER FOR $183A
;============== REMAPPER FOR $183B
;============== REMAPPER FOR $183C
;============== REMAPPER FOR $183D
;============== REMAPPER FOR $183E
;============== REMAPPER FOR $183F
;============== REMAPPER FOR $1840
;============== REMAPPER FOR $1841
;============== REMAPPER FOR $1842
;============== REMAPPER FOR $1843
;============== REMAPPER FOR $1844
;============== REMAPPER FOR $1845
;============== REMAPPER FOR $1846
;============== REMAPPER FOR $1847
;============== REMAPPER FOR $1848
;============== REMAPPER FOR $1849
;============== REMAPPER FOR $184A
;============== REMAPPER FOR $184B
;============== REMAPPER FOR $184C
;============== REMAPPER FOR $184D
;============== REMAPPER FOR $184E
;============== REMAPPER FOR $184F
;============== REMAPPER FOR $1850
org $00FDF0
	dw $7850
org $01F826
	dw $7850
org $02850D
	dw $7850
org $0285DC
	dw $7850
org $02862C
	dw $7850
org $0286B8
	dw $7850
org $028BD3
	dw $7850
org $028C10
	dw $7850
org $028C5E
	dw $7850
org $028C62
	dw $7850
org $028C9B
	dw $7850
org $028CFB
	dw $7850
org $028D5C
	dw $7850
org $028D76
	dw $7850
org $028DAC
	dw $7850
org $028DD4
	dw $7850
org $028DE0
	dw $7850
org $028DE5
	dw $7850
org $028DE8
	dw $7850
org $028DEF
	dw $7850
org $028E17
	dw $7850
org $028E49
	dw $7850
org $028E59
	dw $7850
org $028E7F
	dw $7850
org $028E82
	dw $7850
org $028EB7
	dw $7850
org $028ED3
	dw $7850
org $028EDF
	dw $7850
org $028F03
	dw $7850
org $028F3C
	dw $7850
org $028F45
	dw $7850
org $028F67
	dw $7850
org $028FFE
	dw $7850
org $02991F
	dw $7850
org $02C11E
	dw $7850
org $039055
	dw $7850
org $03ADB0
	dw $7850
;============== REMAPPER FOR $1851
;============== REMAPPER FOR $1852
;============== REMAPPER FOR $1853
;============== REMAPPER FOR $1854
;============== REMAPPER FOR $1855
;============== REMAPPER FOR $1856
;============== REMAPPER FOR $1857
;============== REMAPPER FOR $1858
;============== REMAPPER FOR $1859
;============== REMAPPER FOR $185A
;============== REMAPPER FOR $185B
;============== REMAPPER FOR $185C
org $00E92F
	dw $785C
org $02E5DE
	dw $785C
org $02E5ED
	dw $785C
org $02E5F3
	dw $785C
;============== REMAPPER FOR $185D
org $01F7E8
	dw $785D
org $01F7EF
	dw $785D
org $01F7F2
	dw $785D
org $028673
	dw $785D
org $02867A
	dw $785D
org $02867D
	dw $785D
org $0298E5
	dw $785D
org $0298EC
	dw $785D
org $0298EF
	dw $785D
org $02C0FB
	dw $785D
org $02C102
	dw $785D
org $02C105
	dw $785D
org $03902B
	dw $785D
org $039032
	dw $785D
;============== REMAPPER FOR $185E
org $01914A
	dw $785E
org $01915D
	dw $785E
org $019261
	dw $785E
org $0192AE
	dw $785E
org $019303
	dw $785E
org $019418
	dw $785E
org $01944E
	dw $785E
org $019492
	dw $785E
org $0194A4
	dw $785E
org $019505
	dw $785E
org $019517
	dw $785E
org $01AE49
	dw $785E
org $01B5BC
	dw $785E
org $01B5DB
	dw $785E
org $01B5E8
	dw $785E
org $01B5F3
	dw $785E
org $01B625
	dw $785E
org $01D5B4
	dw $785E
org $01D5C1
	dw $785E
org $01D621
	dw $785E
org $01D9E7
	dw $785E
org $01DA42
	dw $785E
org $01EF1C
	dw $785E
org $01EF73
	dw $785E
org $01EF8F
	dw $785E
org $01F410
	dw $785E
org $01F503
	dw $785E
org $01F54D
	dw $785E
org $01F5AF
	dw $785E
org $01F5EC
	dw $785E
org $028923
	dw $785E
org $02A0B6
	dw $785E
org $02A144
	dw $785E
org $02C5B4
	dw $785E
org $02C5BA
	dw $785E
org $02C5E9
	dw $785E
org $02E4A9
	dw $785E
org $02E4E4
	dw $785E
org $02E4FC
	dw $785E
org $02E504
	dw $785E
org $02E691
	dw $785E
org $02E6F5
	dw $785E
org $02E8BE
	dw $785E
org $02E8C7
	dw $785E
org $02F841
	dw $785E
org $02F8C9
	dw $785E
org $02F931
	dw $785E
org $02F96F
	dw $785E
org $02F9D0
	dw $785E
;============== REMAPPER FOR $185F
org $0192DB
	dw $785F
org $01BA15
	dw $785F
org $01BC68
	dw $785F
org $02E2EC
	dw $785F
;============== REMAPPER FOR $1860
org $0192BE
	dw $7860
org $019976
	dw $7860
org $01BA28
	dw $7860
org $02E2F9
	dw $7860
;============== REMAPPER FOR $1861
org $028022
	dw $7861
org $028029
	dw $7861
org $02802C
	dw $7861
org $028912
	dw $7861
org $028919
	dw $7861
org $02891C
	dw $7861
;============== REMAPPER FOR $1862
org $019295
	dw $7862
org $01BE4B
	dw $7862
org $02E2F4
	dw $7862
;============== REMAPPER FOR $1863
org $01C5C8
	dw $7863
org $01C5CF
	dw $7863
org $01C5D2
	dw $7863
;============== REMAPPER FOR $1864
;============== REMAPPER FOR $1865
org $028A71
	dw $7865
org $028A78
	dw $7865
;============== REMAPPER FOR $1866
org $01CB23
	dw $7866
org $01CB8E
	dw $7866
org $01CBF6
	dw $7866
;============== REMAPPER FOR $1867
org $01CB4F
	dw $7867
org $01CB65
	dw $7867
org $01CBCD
	dw $7867
;============== REMAPPER FOR $1868
org $019300
	dw $7868
org $0195D0
	dw $7868
;============== REMAPPER FOR $1869
;============== REMAPPER FOR $186A
;============== REMAPPER FOR $186B
org $028894
	dw $786B
org $02889B
	dw $786B
org $02902E
	dw $786B
org $029039
	dw $786B
org $0291AB
	dw $786B
org $0291B2
	dw $786B
;============== REMAPPER FOR $186C
org $00FAAE
	dw $786C
org $0180CF
	dw $786C
org $019E38
	dw $786C
org $01A366
	dw $786C
org $01A3BE
	dw $786C
org $01A3C4
	dw $786C
org $01A3E0
	dw $786C
org $01AEC4
	dw $786C
org $01B153
	dw $786C
org $01E8CE
	dw $786C
org $01F402
	dw $786C
org $0284A3
	dw $786C
org $02852C
	dw $786C
org $02C0E0
	dw $786C
org $02C27F
	dw $786C
org $02C46A
	dw $786C
org $02CF60
	dw $786C
org $02D0CD
	dw $786C
org $02D379
	dw $786C
org $02D3CA
	dw $786C
org $02D3D0
	dw $786C
org $02DAA1
	dw $786C
org $02DD5B
	dw $786C
org $02DEDA
	dw $786C
org $02E07D
	dw $786C
org $02E1B5
	dw $786C
org $038FB5
	dw $786C
org $03B761
	dw $786C
org $03B7B2
	dw $786C
org $03B7B8
	dw $786C
org $03B8FF
	dw $786C
org $03C452
	dw $786C
;============== REMAPPER FOR $186D
;============== REMAPPER FOR $186E
;============== REMAPPER FOR $186F
;============== REMAPPER FOR $1870
;============== REMAPPER FOR $1871
;============== REMAPPER FOR $1872
;============== REMAPPER FOR $1873
;============== REMAPPER FOR $1874
;============== REMAPPER FOR $1875
;============== REMAPPER FOR $1876
;============== REMAPPER FOR $1877
;============== REMAPPER FOR $1878
org $00DB27
	dw $7878
org $00DB37
	dw $7878
org $00DB49
	dw $7878
org $00DB70
	dw $7878
org $01BAF3
	dw $7878
;============== REMAPPER FOR $1879
;============== REMAPPER FOR $187A
org $00A770
	dw $787A
org $00C8DB
	dw $787A
org $00CA34
	dw $787A
org $00CD52
	dw $787A
org $00CD90
	dw $787A
org $00D06F
	dw $787A
org $00D088
	dw $787A
org $00D1A9
	dw $787A
org $00D20C
	dw $787A
org $00D657
	dw $787A
org $00D7F1
	dw $787A
org $00D8D4
	dw $787A
org $00EAFF
	dw $787A
org $00EB84
	dw $787A
org $00EF7F
	dw $787A
org $00F020
	dw $787A
org $00F122
	dw $787A
org $00F273
	dw $787A
org $00F402
	dw $787A
org $00F84B
	dw $787A
org $00FB0A
	dw $787A
org $00FC46
	dw $787A
org $00FCD6
	dw $787A
org $00FDBD
	dw $787A
org $00FE84
	dw $787A
org $00FED2
	dw $787A
org $0180C4
	dw $787A
org $01854E
	dw $787A
org $01A08A
	dw $787A
org $01A8D4
	dw $787A
org $01A8FF
	dw $787A
org $01A920
	dw $787A
org $01A92D
	dw $787A
org $01AA46
	dw $787A
org $01AA62
	dw $787A
org $01AADB
	dw $787A
org $01ABB5
	dw $787A
org $01AD77
	dw $787A
org $01B0FD
	dw $787A
org $01B482
	dw $787A
org $01B4C7
	dw $787A
org $01B888
	dw $787A
org $01CA3F
	dw $787A
org $01DA13
	dw $787A
org $01E1DC
	dw $787A
org $01E658
	dw $787A
org $01E6D6
	dw $787A
org $01E817
	dw $787A
org $01E85D
	dw $787A
org $01EB2F
	dw $787A
org $01EB83
	dw $787A
org $01EB9B
	dw $787A
org $01EBEF
	dw $787A
org $01EC05
	dw $787A
org $01EC51
	dw $787A
org $01ED40
	dw $787A
org $01EDC4
	dw $787A
org $01EEE7
	dw $787A
org $01F727
	dw $787A
org $02913D
	dw $787A
org $02A46F
	dw $787A
org $02A48B
	dw $787A
org $02C811
	dw $787A
org $02CF6C
	dw $787A
org $02CFA9
	dw $787A
org $02D72D
	dw $787A
org $02EE7A
	dw $787A
org $02F241
	dw $787A
org $02F9F6
	dw $787A
org $0387F9
	dw $787A
org $038C8E
	dw $787A
org $038CA8
	dw $787A
org $038CFA
	dw $787A
org $0395AF
	dw $787A
org $0395CE
	dw $787A
org $03B682
	dw $787A
org $0491D3
	dw $787A
org $049DF5
	dw $787A
org $05B1D6
	dw $787A
;============== REMAPPER FOR $187B
org $018349
	dw $787B
org $01839D
	dw $787B
org $0184F6
	dw $787B
org $01968C
	dw $787B
org $019914
	dw $787B
org $01A783
	dw $787B
org $01A94B
	dw $787B
org $01C08D
	dw $787B
org $01C0E8
	dw $787B
org $01C322
	dw $787B
org $01C325
	dw $787B
org $01CD73
	dw $787B
org $01CDEA
	dw $787B
org $01CE1F
	dw $787B
org $01D2B0
	dw $787B
org $01D6EE
	dw $787B
org $01D77B
	dw $787B
org $01D79F
	dw $787B
org $01F16D
	dw $787B
org $01F266
	dw $787B
org $01F3A7
	dw $787B
org $01F765
	dw $787B
org $01F77B
	dw $787B
org $02C1F9
	dw $787B
org $02C203
	dw $787B
org $02C284
	dw $787B
org $02C404
	dw $787B
org $02C641
	dw $787B
org $02C65A
	dw $787B
org $02C6D5
	dw $787B
org $02C6FD
	dw $787B
org $02C716
	dw $787B
org $02C78F
	dw $787B
org $02D68F
	dw $787B
org $02D6B2
	dw $787B
org $02D87D
	dw $787B
org $03A10D
	dw $787B
org $03A677
	dw $787B
org $03A685
	dw $787B
org $03B136
	dw $787B
org $07F777
	dw $787B
;============== REMAPPER FOR $187C
;============== REMAPPER FOR $187D
;============== REMAPPER FOR $187E
;============== REMAPPER FOR $187F
;============== REMAPPER FOR $1880
;============== REMAPPER FOR $1881
;============== REMAPPER FOR $1882
;============== REMAPPER FOR $1883
;============== REMAPPER FOR $1884
org $0282C7
	dw $7884
org $02832D
	dw $7884
org $02837C
	dw $7884
;============== REMAPPER FOR $1885
;============== REMAPPER FOR $1886
;============== REMAPPER FOR $1887
org $00A2B6
	dw $7887
org $00A2BB
	dw $7887
org $00FA48
	dw $7887
org $01AB22
	dw $7887
org $01AF15
	dw $7887
org $01D28E
	dw $7887
org $028412
	dw $7887
org $0294C4
	dw $7887
org $029BE7
	dw $7887
org $02D472
	dw $7887
org $02DD62
	dw $7887
org $03AB9C
	dw $7887
org $03B1AB
	dw $7887
org $05C767
	dw $7887
org $05C9C9
	dw $7887
;============== REMAPPER FOR $1888
org $008254
	dw $7888
org $0083D9
	dw $7888
org $00842E
	dw $7888
org $0097CE
	dw $7888
org $00A2B0
	dw $7888
org $00A2C4
	dw $7888
org $00FF8C
	dw $7888
org $0282F3
	dw $7888
org $02844D
	dw $7888
org $05C1A7
	dw $7888
;============== REMAPPER FOR $1889
org $00825C
	dw $7889
org $00A2B3
	dw $7889
org $00A2CF
	dw $7889
;============== REMAPPER FOR $188A
org $00F626
	dw $788A
org $03AE3A
	dw $788A
;============== REMAPPER FOR $188B
org $00E347
	dw $788B
org $0180C7
	dw $788B
org $01EA76
	dw $788B
org $01EB76
	dw $788B
org $01EC58
	dw $788B
org $03AE3D
	dw $788B
;============== REMAPPER FOR $188C
org $028308
	dw $788C
org $028379
	dw $788C
;============== REMAPPER FOR $188D
org $028280
	dw $788D
org $02828B
	dw $788D
org $02828F
	dw $788D
org $028299
	dw $788D
org $02829C
	dw $788D
org $0282A2
	dw $788D
;============== REMAPPER FOR $188E
;============== REMAPPER FOR $188F
org $01DDF0
	dw $788F
org $01DE3C
	dw $788F
org $01DED1
	dw $788F
;============== REMAPPER FOR $1890
org $01DDF3
	dw $7890
org $01E022
	dw $7890
org $01E03F
	dw $7890
org $01E271
	dw $7890
org $01E276
	dw $7890
;============== REMAPPER FOR $1891
org $00FA84
	dw $7891
org $019FA8
	dw $7891
org $019FAD
	dw $7891
org $01C307
	dw $7891
;============== REMAPPER FOR $1892
org $01E284
	dw $7892
org $01E28F
	dw $7892
org $02AA3E
	dw $7892
org $02AA76
	dw $7892
org $02AA95
	dw $7892
org $02AAE0
	dw $7892
org $02AB29
	dw $7892
org $02AB30
	dw $7892
org $02DF38
	dw $7892
org $02DF88
	dw $7892
org $02F816
	dw $7892
org $02F85F
	dw $7892
org $02F93D
	dw $7892
org $02F9A7
	dw $7892
org $02FAA1
	dw $7892
org $02FCE7
	dw $7892
org $02FD92
	dw $7892
org $02FE39
	dw $7892
org $02FF1B
	dw $7892
;============== REMAPPER FOR $1893
;============== REMAPPER FOR $1894
;============== REMAPPER FOR $1895
;============== REMAPPER FOR $1896
;============== REMAPPER FOR $1897
;============== REMAPPER FOR $1898
;============== REMAPPER FOR $1899
;============== REMAPPER FOR $189A
;============== REMAPPER FOR $189B
;============== REMAPPER FOR $189C
;============== REMAPPER FOR $189D
;============== REMAPPER FOR $189E
;============== REMAPPER FOR $189F
;============== REMAPPER FOR $18A0
;============== REMAPPER FOR $18A1
;============== REMAPPER FOR $18A2
;============== REMAPPER FOR $18A3
;============== REMAPPER FOR $18A4
;============== REMAPPER FOR $18A5
;============== REMAPPER FOR $18A6
org $01CF9F
	dw $78A6
;============== REMAPPER FOR $18A7
org $0192AB
	dw $78A7
org $0199C7
	dw $78A7
org $02C29C
	dw $78A7
;============== REMAPPER FOR $18A8
org $01CE29
	dw $78A8
org $0283E3
	dw $78A8
org $028409
	dw $78A8
org $02840D
	dw $78A8
;============== REMAPPER FOR $18A9
org $02841E
	dw $78A9
org $028423
	dw $78A9
;============== REMAPPER FOR $18AA
org $01CE2C
	dw $78AA
org $0283F9
	dw $78AA
org $028402
	dw $78AA
org $028436
	dw $78AA
org $028446
	dw $78AA
;============== REMAPPER FOR $18AB
org $028426
	dw $78AB
;============== REMAPPER FOR $18AC
org $01A2B6
	dw $78AC
org $01F001
	dw $78AC
org $01F156
	dw $78AC
org $01F1A9
	dw $78AC
org $01F1AE
	dw $78AC
org $01F1EA
	dw $78AC
org $01F1F2
	dw $78AC
org $01F35E
	dw $78AC
org $03C05D
	dw $78AC
;============== REMAPPER FOR $18AD
org $01EAC7
	dw $78AD
org $01EACE
	dw $78AD
org $01EAD1
	dw $78AD
;============== REMAPPER FOR $18AE
org $01EFF4
	dw $78AE
org $01F0BB
	dw $78AE
org $01F0C2
	dw $78AE
org $01F1C7
	dw $78AE
org $01F1CC
	dw $78AE
org $01F73E
	dw $78AE
org $02A4A5
	dw $78AE
;============== REMAPPER FOR $18AF
org $01EB0D
	dw $78AF
org $01EB12
	dw $78AF
org $01ED54
	dw $78AF
;============== REMAPPER FOR $18B0
org $02D16F
	dw $78B0
org $02D1F4
	dw $78B0
;============== REMAPPER FOR $18B1
org $02D17C
	dw $78B1
org $02D1F9
	dw $78B1
;============== REMAPPER FOR $18B2
org $02D14F
	dw $78B2
org $02D1FE
	dw $78B2
;============== REMAPPER FOR $18B3
org $02BA57
	dw $78B3
org $02D161
	dw $78B3
org $02D203
	dw $78B3
;============== REMAPPER FOR $18B4
;============== REMAPPER FOR $18B5
org $00EF69
	dw $78B5
org $02CC25
	dw $78B5
org $02CCAC
	dw $78B5
;============== REMAPPER FOR $18B6
org $01D9F1
	dw $78B6
org $01DA6B
	dw $78B6
org $01E8E5
	dw $78B6
org $01E952
	dw $78B6
org $01F8E2
	dw $78B6
org $01F9A7
	dw $78B6
org $02AC78
	dw $78B6
org $02AC8E
	dw $78B6
org $02AC91
	dw $78B6
org $02ACB8
	dw $78B6
org $02ACCE
	dw $78B6
org $02ACD1
	dw $78B6
org $02E69F
	dw $78B6
org $02E6FB
	dw $78B6
org $02E704
	dw $78B6
org $02E8C4
	dw $78B6
org $02E8E2
	dw $78B6
;============== REMAPPER FOR $18B7
;============== REMAPPER FOR $18B8
org $0180B6
	dw $78B8
org $01E27E
	dw $78B8
org $02AAC3
	dw $78B8
org $02DF0C
	dw $78B8
;============== REMAPPER FOR $18B9
org $00FA8A
	dw $78B9
org $01848E
	dw $78B9
org $02A8B9
	dw $78B9
org $02AFFF
	dw $78B9
org $02B033
	dw $78B9
org $02B0E5
	dw $78B9
org $02B273
	dw $78B9
org $02B2B5
	dw $78B9
org $02B341
	dw $78B9
org $02C3AD
	dw $78B9
;============== REMAPPER FOR $18BA
org $02AB0E
	dw $78BA
org $02AB12
	dw $78BA
org $02AB33
	dw $78BA
org $02AB4B
	dw $78BA
org $02AB75
	dw $78BA
org $02F84E
	dw $78BA
org $02F862
	dw $78BA
org $02F870
	dw $78BA
org $02FAEE
	dw $78BA
;============== REMAPPER FOR $18BB
;============== REMAPPER FOR $18BC
org $02ED8B
	dw $78BC
org $02EE3A
	dw $78BC
org $02EE64
	dw $78BC
;============== REMAPPER FOR $18BD
org $00CCD1
	dw $78BD
org $00CCD6
	dw $78BD
org $01D297
	dw $78BD
;============== REMAPPER FOR $18BE
org $00CD42
	dw $78BE
org $01DA07
	dw $78BE
org $01DA22
	dw $78BE
org $01DA2D
	dw $78BE
org $01DA38
	dw $78BE
;============== REMAPPER FOR $18BF
org $01848B
	dw $78BF
org $01BDD3
	dw $78BF
org $01BDF3
	dw $78BF
org $01E9A0
	dw $78BF
org $01E9EA
	dw $78BF
org $028B2C
	dw $78BF
org $02B02C
	dw $78BF
org $02D41A
	dw $78BF
org $02F85A
	dw $78BF
org $03909A
	dw $78BF
org $0390CD
	dw $78BF
;============== REMAPPER FOR $18C0
org $00FA87
	dw $78C0
org $018488
	dw $78C0
org $01AC8C
	dw $78C0
org $01E7D3
	dw $78C0
org $028B21
	dw $78C0
org $028B31
	dw $78C0
org $02B02F
	dw $78C0
;============== REMAPPER FOR $18C1
org $01AC87
	dw $78C1
org $01E7D8
	dw $78C1
org $028B42
	dw $78C1
;============== REMAPPER FOR $18C2
org $00C919
	dw $78C2
org $00CF99
	dw $78C2
org $00F840
	dw $78C2
org $01809C
	dw $78C2
org $01E884
	dw $78C2
;============== REMAPPER FOR $18C3
org $018493
	dw $78C3
org $028B57
	dw $78C3
;============== REMAPPER FOR $18C4
org $018499
	dw $78C4
org $028B5C
	dw $78C4
;============== REMAPPER FOR $18C5
;============== REMAPPER FOR $18C6
;============== REMAPPER FOR $18C7
;============== REMAPPER FOR $18C8
;============== REMAPPER FOR $18C9
;============== REMAPPER FOR $18CA
;============== REMAPPER FOR $18CB
;============== REMAPPER FOR $18CC
;============== REMAPPER FOR $18CD
org $02879D
	dw $78CD
org $0287A4
	dw $78CD
org $0287A7
	dw $78CD
;============== REMAPPER FOR $18CE
org $028878
	dw $78CE
org $0290BC
	dw $78CE
org $0290C1
	dw $78CE
;============== REMAPPER FOR $18CF
;============== REMAPPER FOR $18D0
;============== REMAPPER FOR $18D1
;============== REMAPPER FOR $18D2
org $01A84C
	dw $78D2
org $01A84F
	dw $78D2
org $01A858
	dw $78D2
org $01A85F
	dw $78D2
org $01A87F
	dw $78D2
org $02F2A7
	dw $78D2
org $02F2AA
	dw $78D2
org $02F2B3
	dw $78D2
org $02F2BA
	dw $78D2
org $039604
	dw $78D2
org $039607
	dw $78D2
org $039610
	dw $78D2
org $039617
	dw $78D2
;============== REMAPPER FOR $18D3
org $028AEC
	dw $78D3
org $028AF1
	dw $78D3
;============== REMAPPER FOR $18D4
org $01F0E9
	dw $78D4
org $01F0EC
	dw $78D4
org $01F0F3
	dw $78D4
;============== REMAPPER FOR $18D5
org $01F117
	dw $78D5
org $01F11A
	dw $78D5
org $01F121
	dw $78D5
;============== REMAPPER FOR $18D6
org $01C365
	dw $78D6
org $01F0DD
	dw $78D6
org $01F0E2
	dw $78D6
org $02BAB3
	dw $78D6
org $02D1CE
	dw $78D6
;============== REMAPPER FOR $18D7
org $0192D4
	dw $78D7
org $02E2E7
	dw $78D7
;============== REMAPPER FOR $18D8
;============== REMAPPER FOR $18D9
org $00C8CF
	dw $78D9
org $02F66F
	dw $78D9
org $02F674
	dw $78D9
org $02F75A
	dw $78D9
org $02F75F
	dw $78D9
;============== REMAPPER FOR $18DA
org $01ECDA
	dw $78DA
org $01F126
	dw $78DA
;============== REMAPPER FOR $18DB
org $00CDD7
	dw $78DB
;============== REMAPPER FOR $18DC
org $00FED9
	dw $78DC
org $01EA9B
	dw $78DC
org $01EB1F
	dw $78DC
org $01ED8C
	dw $78DC
org $01F22A
	dw $78DC
org $01F3CE
	dw $78DC
org $02D1D4
	dw $78DC
;============== REMAPPER FOR $18DD
org $00FA8D
	dw $78DD
org $00FC06
	dw $78DD
org $00FC13
	dw $78DD
org $00FC19
	dw $78DD
org $01C4E1
	dw $78DD
org $01C4E4
	dw $78DD
org $02B9C0
	dw $78DD
;============== REMAPPER FOR $18DE
org $01EC0F
	dw $78DE
org $01EC66
	dw $78DE
org $01EC6E
	dw $78DE
org $01F12B
	dw $78DE
;============== REMAPPER FOR $18DF
org $00FCE6
	dw $78DF
org $01809F
	dw $78DF
org $0180A5
	dw $78DF
org $0180BF
	dw $78DF
org $01EBEC
	dw $78DF
org $02A475
	dw $78DF
;============== REMAPPER FOR $18E0
org $0184CC
	dw $78E0
org $019AB2
	dw $78E0
org $01E7AC
	dw $78E0
org $01E7B7
	dw $78E0
org $01E7BC
	dw $78E0
;============== REMAPPER FOR $18E1
org $0184A2
	dw $78E1
org $01A9F9
	dw $78E1
;============== REMAPPER FOR $18E2
org $00FCE9
	dw $78E2
org $0180A2
	dw $78E2
org $01EA71
	dw $78E2
org $01F784
	dw $78E2
org $02892E
	dw $78E2
org $0289F7
	dw $78E2
org $0CA208
	dw $78E2
org $0CA6C2
	dw $78E2
org $0CA7B2
	dw $78E2
;============== REMAPPER FOR $18E3
org $00F5C7
	dw $78E3
org $02A417
	dw $78E3
org $02EEBC
	dw $78E3
org $02EF68
	dw $78E3
;============== REMAPPER FOR $18E4
org $008F30
	dw $78E4
org $028AB5
	dw $78E4
org $028AC4
	dw $78E4
org $02AE08
	dw $78E4
org $02AE0B
	dw $78E4
org $05CC82
	dw $78E4
;============== REMAPPER FOR $18E5
org $028ABA
	dw $78E5
org $028ABF
	dw $78E5
org $028ACB
	dw $78E5
org $02AE0E
	dw $78E5
;============== REMAPPER FOR $18E6
;============== REMAPPER FOR $18E7
org $00EF88
	dw $78E7
org $01EBD7
	dw $78E7
org $01F19F
	dw $78E7
;============== REMAPPER FOR $18E8
org $01A2F1
	dw $78E8
org $01EA90
	dw $78E8
org $01EC14
	dw $78E8
org $01EC19
	dw $78E8
org $02EA7F
	dw $78E8
org $02EAA5
	dw $78E8
org $03C098
	dw $78E8
;============== REMAPPER FOR $18E9
org $02B95D
	dw $78E9
org $02B964
	dw $78E9
org $02B967
	dw $78E9
;============== REMAPPER FOR $18EA
org $00FDE6
	dw $78EA
org $028503
	dw $78EA
org $028611
	dw $78EA
org $028697
	dw $78EA
org $028C05
	dw $78EA
org $028C4A
	dw $78EA
org $028C4D
	dw $78EA
org $028C7A
	dw $78EA
org $028CD1
	dw $78EA
org $028D0B
	dw $78EA
org $028D55
	dw $78EA
org $028F35
	dw $78EA
org $028FA6
	dw $78EA
org $028FA9
	dw $78EA
org $028FE9
	dw $78EA
org $039045
	dw $78EA
org $03AD94
	dw $78EA
;============== REMAPPER FOR $18EB
;============== REMAPPER FOR $18EC
;============== REMAPPER FOR $18ED
;============== REMAPPER FOR $18EE
;============== REMAPPER FOR $18EF
;============== REMAPPER FOR $18F0
;============== REMAPPER FOR $18F1
;============== REMAPPER FOR $18F2
;============== REMAPPER FOR $18F3
;============== REMAPPER FOR $18F4
;============== REMAPPER FOR $18F5
;============== REMAPPER FOR $18F6
;============== REMAPPER FOR $18F7
org $02AD3F
	dw $78F7
org $02AD46
	dw $78F7
org $02AD49
	dw $78F7
;============== REMAPPER FOR $18F8
org $028737
	dw $78F8
org $02939E
	dw $78F8
org $0293A3
	dw $78F8
;============== REMAPPER FOR $18F9
;============== REMAPPER FOR $18FA
;============== REMAPPER FOR $18FB
;============== REMAPPER FOR $18FC
org $018EFA
	dw $78FC
org $018F01
	dw $78FC
org $018F04
	dw $78FC
;============== REMAPPER FOR $18FD
org $02C058
	dw $78FD
org $02C3B0
	dw $78FD
;============== REMAPPER FOR $18FE
org $02B0D3
	dw $78FE
org $02B0D6
	dw $78FE
org $02B0DD
	dw $78FE
;============== REMAPPER FOR $18FF
org $02AB8A
	dw $78FF
org $02AB91
	dw $78FF
org $02AB94
	dw $78FF
;============== REMAPPER FOR $1900
org $05CD77
	dw $7900
org $05CD9A
	dw $7900
org $05CDAF
	dw $7900
org $05CDDB
	dw $7900
org $05CF06
	dw $7900
org $05CF1F
	dw $7900
org $05CF23
	dw $7900
org $05CF2C
	dw $7900
org $05CF32
	dw $7900
org $05CF3C
	dw $7900
org $05CFAF
	dw $7900
org $05CFC4
	dw $7900
org $07F25E
	dw $7900
;============== REMAPPER FOR $1901
org $028814
	dw $7901
org $028828
	dw $7901
org $029247
	dw $7901
;============== REMAPPER FOR $1902
;============== REMAPPER FOR $1903
;============== REMAPPER FOR $1904
;============== REMAPPER FOR $1905
org $03C137
	dw $7905
org $03C161
	dw $7905
;============== REMAPPER FOR $1906
org $03C126
	dw $7906
org $03C12B
	dw $7906
org $03C132
	dw $7906
org $03C166
	dw $7906
;============== REMAPPER FOR $1907
org $03C13D
	dw $7907
org $03C169
	dw $7907
org $03C16C
	dw $7907
org $03C173
	dw $7907
;============== REMAPPER FOR $1908
;============== REMAPPER FOR $1909
org $00EE7D
	dw $7909
org $0184D9
	dw $7909
org $0392AA
	dw $7909
org $0392DE
	dw $7909
;============== REMAPPER FOR $190A
org $02AA8E
	dw $790A
org $02F83E
	dw $790A
org $02F847
	dw $790A
org $02F853
	dw $790A
;============== REMAPPER FOR $190B
org $02F8EC
	dw $790B
org $0380E0
	dw $790B
org $0380E3
	dw $790B
org $0381C7
	dw $790B
org $03823E
	dw $790B
;============== REMAPPER FOR $190C
org $00A63C
	dw $790C
org $00A65B
	dw $790C
org $00C548
	dw $790C
org $00E2FF
	dw $790C
org $028970
	dw $790C
org $02E26D
	dw $790C
org $02E272
	dw $790C
;============== REMAPPER FOR $190D
org $03AC12
	dw $790D
org $03B450
	dw $790D
org $03B4B2
	dw $790D
org $03DFE5
	dw $790D
;============== REMAPPER FOR $190E
org $019212
	dw $790E
org $019266
	dw $790E
org $01B05A
	dw $790E
org $01B22F
	dw $790E
org $05D905
	dw $790E
org $05DA96
	dw $790E
org $05DB6B
	dw $790E
;============== REMAPPER FOR $190F
org $00FAC6
	dw $790F
org $0191BF
	dw $790F
org $019273
	dw $790F
org $019A85
	dw $790F
org $019A88
	dw $790F
org $019B21
	dw $790F
org $01A39F
	dw $790F
org $01A8B5
	dw $790F
org $01A8EC
	dw $790F
org $01B4B5
	dw $790F
org $01F4F3
	dw $790F
org $028A20
	dw $790F
org $02A0F6
	dw $790F
org $02B9CC
	dw $790F
org $07F7CD
	dw $790F
;============== REMAPPER FOR $1910
;============== REMAPPER FOR $1911
;============== REMAPPER FOR $1912
;============== REMAPPER FOR $1913
;============== REMAPPER FOR $1914
;============== REMAPPER FOR $1915
;============== REMAPPER FOR $1916
;============== REMAPPER FOR $1917
;============== REMAPPER FOR $1918
;============== REMAPPER FOR $1919
;============== REMAPPER FOR $191A
;============== REMAPPER FOR $191B
org $01EBDA
	dw $791B
;============== REMAPPER FOR $191C
org $01E1E1
	dw $791C
org $01EA79
	dw $791C
org $01F165
	dw $791C
;============== REMAPPER FOR $191D
org $02DF40
	dw $791D
org $02DF47
	dw $791D
org $02DF4A
	dw $791D
;============== REMAPPER FOR $191E
org $00EEBC
	dw $791E
org $02CD88
	dw $791E
;============== REMAPPER FOR $191F
;============== REMAPPER FOR $1920
org $01E042
	dw $7920
org $02FE3F
	dw $7920
;============== REMAPPER FOR $1921
org $03AEB8
	dw $7921
org $03AEBF
	dw $7921
org $03D678
	dw $7921
;============== REMAPPER FOR $1922
;============== REMAPPER FOR $1923
;============== REMAPPER FOR $1924
;============== REMAPPER FOR $1925
org $00BF05
	dw $7925
org $04D734
	dw $7925
org $04DC24
	dw $7925
org $0583B9
	dw $7925
org $0583D5
	dw $7925
org $0584FC
	dw $7925
org $058667
	dw $7925
org $05881D
	dw $7925
org $058886
	dw $7925
org $0588EF
	dw $7925
org $058958
	dw $7925
org $0589D2
	dw $7925
org $058A9F
	dw $7925
org $058B91
	dw $7925
org $058C75
	dw $7925
;============== REMAPPER FOR $1926
;============== REMAPPER FOR $1927
;============== REMAPPER FOR $1928
org $058037
	dw $7928
org $05808A
	dw $7928
org $0580A2
	dw $7928
org $0580FC
	dw $7928
org $0580FF
	dw $7928
org $05840D
	dw $7928
org $058693
	dw $7928
org $058696
	dw $7928
org $05869E
	dw $7928
org $058D7E
	dw $7928
org $058D89
	dw $7928
org $058DA7
	dw $7928
org $058DCF
	dw $7928
org $0C93E0
	dw $7928
org $0C93E3
	dw $7928
org $0C9429
	dw $7928
org $0C942C
	dw $7928
org $0C943D
	dw $7928
org $0C94DE
	dw $7928
org $0C9587
	dw $7928
org $0C95B2
	dw $7928
org $0CA409
	dw $7928
org $0CAB27
	dw $7928
org $0CAB5D
	dw $7928
org $0CABC9
	dw $7928
org $0DA542
	dw $7928
org $0DA6C7
	dw $7928
;============== REMAPPER FOR $1929
;============== REMAPPER FOR $192A
org $00A6D6
	dw $792A
org $05D839
	dw $792A
org $05D97F
	dw $792A
org $05DA7C
	dw $792A
;============== REMAPPER FOR $192B
org $00947C
	dw $792B
org $0094AE
	dw $792B
org $009593
	dw $792B
org $0095DC
	dw $792B
org $0095E7
	dw $792B
org $00964C
	dw $792B
org $00983E
	dw $792B
org $00A9E2
	dw $792B
org $02BE5C
	dw $792B
org $04DC1F
	dw $792B
org $058547
	dw $792B
;============== REMAPPER FOR $192C
;============== REMAPPER FOR $192D
org $009490
	dw $792D
org $00AC47
	dw $792D
org $00AE1D
	dw $792D
org $058595
	dw $792D
;============== REMAPPER FOR $192E
org $0093D5
	dw $792E
org $00948B
	dw $792E
org $00AC70
	dw $792E
org $00AE18
	dw $792E
org $05859F
	dw $792E
;============== REMAPPER FOR $192F
org $009482
	dw $792F
org $009651
	dw $792F
org $00AC34
	dw $792F
org $05853C
	dw $792F
;============== REMAPPER FOR $1930
org $009488
	dw $7930
org $009656
	dw $7930
org $00AC99
	dw $7930
org $0584F4
	dw $7930
;============== REMAPPER FOR $1931
org $009477
	dw $7931
org $0094AB
	dw $7931
org $0097D6
	dw $7931
org $0097FD
	dw $7931
org $009FB9
	dw $7931
org $009FBE
	dw $7931
org $009FF0
	dw $7931
org $00A695
	dw $7931
org $00AA1A
	dw $7931
org $00AA23
	dw $7931
org $00AA86
	dw $7931
org $00AD35
	dw $7931
org $00C874
	dw $7931
org $00C8C5
	dw $7931
org $00C8E2
	dw $7931
org $00EBE2
	dw $7931
org $00ED87
	dw $7931
org $00EDFC
	dw $7931
org $00EE3E
	dw $7931
org $00F135
	dw $7931
org $00F14E
	dw $7931
org $00F16A
	dw $7931
org $00F1E6
	dw $7931
org $019319
	dw $7931
org $0193E5
	dw $7931
org $04DBAC
	dw $7931
org $04DC1A
	dw $7931
org $058068
	dw $7931
org $0581FE
	dw $7931
org $058279
	dw $7931
org $0585A7
	dw $7931
org $058A3F
	dw $7931
org $058B1B
	dw $7931
org $058B9E
	dw $7931
org $058C0D
	dw $7931
org $058C82
	dw $7931
org $058D00
	dw $7931
org $05BB82
	dw $7931
org $05C417
	dw $7931
org $05DAD5
	dw $7931
org $0DA418
	dw $7931
;============== REMAPPER FOR $1932
org $058065
	dw $7932
org $0585AA
	dw $7932
;============== REMAPPER FOR $1933
org $00BED0
	dw $7933
org $00BEF2
	dw $7933
org $00BF8B
	dw $7933
org $00BFA5
	dw $7933
org $00C100
	dw $7933
org $00C1E4
	dw $7933
org $00E94F
	dw $7933
org $00E985
	dw $7933
org $00FD7F
	dw $7933
org $0195CB
	dw $7933
org $0199C2
	dw $7933
org $02870D
	dw $7933
org $02884A
	dw $7933
org $028985
	dw $7933
org $028A9E
	dw $7933
org $0291E6
	dw $7933
org $029625
	dw $7933
org $0583B0
	dw $7933
org $0583F2
	dw $7933
org $0583F5
	dw $7933
org $058413
	dw $7933
org $058632
	dw $7933
org $058653
	dw $7933
;============== REMAPPER FOR $1934
;============== REMAPPER FOR $1935
org $00A437
	dw $7935
org $00A43C
	dw $7935
org $00A8C0
	dw $7935
;============== REMAPPER FOR $1936
;============== REMAPPER FOR $1937
;============== REMAPPER FOR $1938
org $01AC9F
	dw $7938
org $02A857
	dw $7938
org $02A85E
	dw $7938
org $02A8BC
	dw $7938
org $02A939
	dw $7938
org $02AB9C
	dw $7938
org $02ABF5
	dw $7938
org $02D08B
	dw $7938
org $02FAEA
	dw $7938
org $02FF18
	dw $7938
org $038715
	dw $7938
org $03B8BD
	dw $7938
;============== REMAPPER FOR $1939
;============== REMAPPER FOR $193A
;============== REMAPPER FOR $193B
;============== REMAPPER FOR $193C
;============== REMAPPER FOR $193D
;============== REMAPPER FOR $193E
;============== REMAPPER FOR $193F
;============== REMAPPER FOR $1940
;============== REMAPPER FOR $1941
;============== REMAPPER FOR $1942
;============== REMAPPER FOR $1943
;============== REMAPPER FOR $1944
;============== REMAPPER FOR $1945
;============== REMAPPER FOR $1946
;============== REMAPPER FOR $1947
;============== REMAPPER FOR $1948
;============== REMAPPER FOR $1949
;============== REMAPPER FOR $194A
;============== REMAPPER FOR $194B
;============== REMAPPER FOR $194C
;============== REMAPPER FOR $194D
;============== REMAPPER FOR $194E
;============== REMAPPER FOR $194F
;============== REMAPPER FOR $1950
;============== REMAPPER FOR $1951
;============== REMAPPER FOR $1952
;============== REMAPPER FOR $1953
;============== REMAPPER FOR $1954
;============== REMAPPER FOR $1955
;============== REMAPPER FOR $1956
;============== REMAPPER FOR $1957
;============== REMAPPER FOR $1958
;============== REMAPPER FOR $1959
;============== REMAPPER FOR $195A
;============== REMAPPER FOR $195B
;============== REMAPPER FOR $195C
;============== REMAPPER FOR $195D
;============== REMAPPER FOR $195E
;============== REMAPPER FOR $195F
;============== REMAPPER FOR $1960
;============== REMAPPER FOR $1961
;============== REMAPPER FOR $1962
;============== REMAPPER FOR $1963
;============== REMAPPER FOR $1964
;============== REMAPPER FOR $1965
;============== REMAPPER FOR $1966
;============== REMAPPER FOR $1967
;============== REMAPPER FOR $1968
;============== REMAPPER FOR $1969
;============== REMAPPER FOR $196A
;============== REMAPPER FOR $196B
;============== REMAPPER FOR $196C
;============== REMAPPER FOR $196D
;============== REMAPPER FOR $196E
;============== REMAPPER FOR $196F
;============== REMAPPER FOR $1970
;============== REMAPPER FOR $1971
;============== REMAPPER FOR $1972
;============== REMAPPER FOR $1973
;============== REMAPPER FOR $1974
;============== REMAPPER FOR $1975
;============== REMAPPER FOR $1976
;============== REMAPPER FOR $1977
;============== REMAPPER FOR $1978
;============== REMAPPER FOR $1979
;============== REMAPPER FOR $197A
;============== REMAPPER FOR $197B
;============== REMAPPER FOR $197C
;============== REMAPPER FOR $197D
;============== REMAPPER FOR $197E
;============== REMAPPER FOR $197F
;============== REMAPPER FOR $1980
;============== REMAPPER FOR $1981
;============== REMAPPER FOR $1982
;============== REMAPPER FOR $1983
;============== REMAPPER FOR $1984
;============== REMAPPER FOR $1985
;============== REMAPPER FOR $1986
;============== REMAPPER FOR $1987
;============== REMAPPER FOR $1988
;============== REMAPPER FOR $1989
;============== REMAPPER FOR $198A
;============== REMAPPER FOR $198B
;============== REMAPPER FOR $198C
;============== REMAPPER FOR $198D
;============== REMAPPER FOR $198E
;============== REMAPPER FOR $198F
;============== REMAPPER FOR $1990
;============== REMAPPER FOR $1991
;============== REMAPPER FOR $1992
;============== REMAPPER FOR $1993
;============== REMAPPER FOR $1994
;============== REMAPPER FOR $1995
;============== REMAPPER FOR $1996
;============== REMAPPER FOR $1997
;============== REMAPPER FOR $1998
;============== REMAPPER FOR $1999
;============== REMAPPER FOR $199A
;============== REMAPPER FOR $199B
;============== REMAPPER FOR $199C
;============== REMAPPER FOR $199D
;============== REMAPPER FOR $199E
;============== REMAPPER FOR $199F
;============== REMAPPER FOR $19A0
;============== REMAPPER FOR $19A1
;============== REMAPPER FOR $19A2
;============== REMAPPER FOR $19A3
;============== REMAPPER FOR $19A4
;============== REMAPPER FOR $19A5
;============== REMAPPER FOR $19A6
;============== REMAPPER FOR $19A7
;============== REMAPPER FOR $19A8
;============== REMAPPER FOR $19A9
;============== REMAPPER FOR $19AA
;============== REMAPPER FOR $19AB
;============== REMAPPER FOR $19AC
;============== REMAPPER FOR $19AD
;============== REMAPPER FOR $19AE
;============== REMAPPER FOR $19AF
;============== REMAPPER FOR $19B0
;============== REMAPPER FOR $19B1
;============== REMAPPER FOR $19B2
;============== REMAPPER FOR $19B3
;============== REMAPPER FOR $19B4
;============== REMAPPER FOR $19B5
;============== REMAPPER FOR $19B6
;============== REMAPPER FOR $19B7
;============== REMAPPER FOR $19B8
org $05D7BE
	dw $79B8
org $05DBC3
	dw $79B8
org $0DA52D
	dw $79B8
;============== REMAPPER FOR $19B9
;============== REMAPPER FOR $19BA
;============== REMAPPER FOR $19BB
;============== REMAPPER FOR $19BC
;============== REMAPPER FOR $19BD
;============== REMAPPER FOR $19BE
;============== REMAPPER FOR $19BF
;============== REMAPPER FOR $19C0
;============== REMAPPER FOR $19C1
;============== REMAPPER FOR $19C2
;============== REMAPPER FOR $19C3
;============== REMAPPER FOR $19C4
;============== REMAPPER FOR $19C5
;============== REMAPPER FOR $19C6
;============== REMAPPER FOR $19C7
;============== REMAPPER FOR $19C8
;============== REMAPPER FOR $19C9
;============== REMAPPER FOR $19CA
;============== REMAPPER FOR $19CB
;============== REMAPPER FOR $19CC
;============== REMAPPER FOR $19CD
;============== REMAPPER FOR $19CE
;============== REMAPPER FOR $19CF
;============== REMAPPER FOR $19D0
;============== REMAPPER FOR $19D1
;============== REMAPPER FOR $19D2
;============== REMAPPER FOR $19D3
;============== REMAPPER FOR $19D4
;============== REMAPPER FOR $19D5
;============== REMAPPER FOR $19D6
;============== REMAPPER FOR $19D7
;============== REMAPPER FOR $19D8
org $0DA534
	dw $79D8
;============== REMAPPER FOR $19D9
;============== REMAPPER FOR $19DA
;============== REMAPPER FOR $19DB
;============== REMAPPER FOR $19DC
;============== REMAPPER FOR $19DD
;============== REMAPPER FOR $19DE
;============== REMAPPER FOR $19DF
;============== REMAPPER FOR $19E0
;============== REMAPPER FOR $19E1
;============== REMAPPER FOR $19E2
;============== REMAPPER FOR $19E3
;============== REMAPPER FOR $19E4
;============== REMAPPER FOR $19E5
;============== REMAPPER FOR $19E6
;============== REMAPPER FOR $19E7
;============== REMAPPER FOR $19E8
;============== REMAPPER FOR $19E9
;============== REMAPPER FOR $19EA
;============== REMAPPER FOR $19EB
;============== REMAPPER FOR $19EC
;============== REMAPPER FOR $19ED
;============== REMAPPER FOR $19EE
;============== REMAPPER FOR $19EF
;============== REMAPPER FOR $19F0
;============== REMAPPER FOR $19F1
;============== REMAPPER FOR $19F2
;============== REMAPPER FOR $19F3
;============== REMAPPER FOR $19F4
;============== REMAPPER FOR $19F5
;============== REMAPPER FOR $19F6
;============== REMAPPER FOR $19F7
;============== REMAPPER FOR $19F8
org $00C059
	dw $79F8
org $00C060
	dw $79F8
;============== REMAPPER FOR $19F9
;============== REMAPPER FOR $19FA
;============== REMAPPER FOR $19FB
;============== REMAPPER FOR $19FC
;============== REMAPPER FOR $19FD
;============== REMAPPER FOR $19FE
;============== REMAPPER FOR $19FF
;============== REMAPPER FOR $1A00
;============== REMAPPER FOR $1A01
;============== REMAPPER FOR $1A02
;============== REMAPPER FOR $1A03
;============== REMAPPER FOR $1A04
;============== REMAPPER FOR $1A05
;============== REMAPPER FOR $1A06
;============== REMAPPER FOR $1A07
;============== REMAPPER FOR $1A08
;============== REMAPPER FOR $1A09
;============== REMAPPER FOR $1A0A
;============== REMAPPER FOR $1A0B
;============== REMAPPER FOR $1A0C
;============== REMAPPER FOR $1A0D
;============== REMAPPER FOR $1A0E
;============== REMAPPER FOR $1A0F
;============== REMAPPER FOR $1A10
;============== REMAPPER FOR $1A11
;============== REMAPPER FOR $1A12
;============== REMAPPER FOR $1A13
;============== REMAPPER FOR $1A14
;============== REMAPPER FOR $1A15
;============== REMAPPER FOR $1A16
;============== REMAPPER FOR $1A17
;============== REMAPPER FOR $1A18
;============== REMAPPER FOR $1A19
;============== REMAPPER FOR $1A1A
;============== REMAPPER FOR $1A1B
;============== REMAPPER FOR $1A1C
;============== REMAPPER FOR $1A1D
;============== REMAPPER FOR $1A1E
;============== REMAPPER FOR $1A1F
;============== REMAPPER FOR $1A20
;============== REMAPPER FOR $1A21
;============== REMAPPER FOR $1A22
;============== REMAPPER FOR $1A23
;============== REMAPPER FOR $1A24
;============== REMAPPER FOR $1A25
;============== REMAPPER FOR $1A26
;============== REMAPPER FOR $1A27
;============== REMAPPER FOR $1A28
;============== REMAPPER FOR $1A29
;============== REMAPPER FOR $1A2A
;============== REMAPPER FOR $1A2B
;============== REMAPPER FOR $1A2C
;============== REMAPPER FOR $1A2D
;============== REMAPPER FOR $1A2E
;============== REMAPPER FOR $1A2F
;============== REMAPPER FOR $1A30
;============== REMAPPER FOR $1A31
;============== REMAPPER FOR $1A32
;============== REMAPPER FOR $1A33
;============== REMAPPER FOR $1A34
;============== REMAPPER FOR $1A35
;============== REMAPPER FOR $1A36
;============== REMAPPER FOR $1A37
;============== REMAPPER FOR $1A38
;============== REMAPPER FOR $1A39
;============== REMAPPER FOR $1A3A
;============== REMAPPER FOR $1A3B
;============== REMAPPER FOR $1A3C
;============== REMAPPER FOR $1A3D
;============== REMAPPER FOR $1A3E
;============== REMAPPER FOR $1A3F
;============== REMAPPER FOR $1A40
;============== REMAPPER FOR $1A41
;============== REMAPPER FOR $1A42
;============== REMAPPER FOR $1A43
;============== REMAPPER FOR $1A44
;============== REMAPPER FOR $1A45
;============== REMAPPER FOR $1A46
;============== REMAPPER FOR $1A47
;============== REMAPPER FOR $1A48
;============== REMAPPER FOR $1A49
;============== REMAPPER FOR $1A4A
;============== REMAPPER FOR $1A4B
;============== REMAPPER FOR $1A4C
;============== REMAPPER FOR $1A4D
;============== REMAPPER FOR $1A4E
;============== REMAPPER FOR $1A4F
;============== REMAPPER FOR $1A50
;============== REMAPPER FOR $1A51
;============== REMAPPER FOR $1A52
;============== REMAPPER FOR $1A53
;============== REMAPPER FOR $1A54
;============== REMAPPER FOR $1A55
;============== REMAPPER FOR $1A56
;============== REMAPPER FOR $1A57
;============== REMAPPER FOR $1A58
;============== REMAPPER FOR $1A59
;============== REMAPPER FOR $1A5A
;============== REMAPPER FOR $1A5B
;============== REMAPPER FOR $1A5C
;============== REMAPPER FOR $1A5D
;============== REMAPPER FOR $1A5E
;============== REMAPPER FOR $1A5F
;============== REMAPPER FOR $1A60
;============== REMAPPER FOR $1A61
;============== REMAPPER FOR $1A62
;============== REMAPPER FOR $1A63
;============== REMAPPER FOR $1A64
;============== REMAPPER FOR $1A65
;============== REMAPPER FOR $1A66
;============== REMAPPER FOR $1A67
;============== REMAPPER FOR $1A68
;============== REMAPPER FOR $1A69
;============== REMAPPER FOR $1A6A
;============== REMAPPER FOR $1A6B
;============== REMAPPER FOR $1A6C
;============== REMAPPER FOR $1A6D
;============== REMAPPER FOR $1A6E
;============== REMAPPER FOR $1A6F
;============== REMAPPER FOR $1A70
;============== REMAPPER FOR $1A71
;============== REMAPPER FOR $1A72
;============== REMAPPER FOR $1A73
;============== REMAPPER FOR $1A74
;============== REMAPPER FOR $1A75
;============== REMAPPER FOR $1A76
;============== REMAPPER FOR $1A77
;============== REMAPPER FOR $1A78
;============== REMAPPER FOR $1A79
;============== REMAPPER FOR $1A7A
;============== REMAPPER FOR $1A7B
;============== REMAPPER FOR $1A7C
;============== REMAPPER FOR $1A7D
;============== REMAPPER FOR $1A7E
;============== REMAPPER FOR $1A7F
;============== REMAPPER FOR $1A80
;============== REMAPPER FOR $1A81
;============== REMAPPER FOR $1A82
;============== REMAPPER FOR $1A83
;============== REMAPPER FOR $1A84
;============== REMAPPER FOR $1A85
;============== REMAPPER FOR $1A86
;============== REMAPPER FOR $1A87
;============== REMAPPER FOR $1A88
;============== REMAPPER FOR $1A89
;============== REMAPPER FOR $1A8A
;============== REMAPPER FOR $1A8B
;============== REMAPPER FOR $1A8C
;============== REMAPPER FOR $1A8D
;============== REMAPPER FOR $1A8E
;============== REMAPPER FOR $1A8F
;============== REMAPPER FOR $1A90
;============== REMAPPER FOR $1A91
;============== REMAPPER FOR $1A92
;============== REMAPPER FOR $1A93
;============== REMAPPER FOR $1A94
;============== REMAPPER FOR $1A95
;============== REMAPPER FOR $1A96
;============== REMAPPER FOR $1A97
;============== REMAPPER FOR $1A98
;============== REMAPPER FOR $1A99
;============== REMAPPER FOR $1A9A
;============== REMAPPER FOR $1A9B
;============== REMAPPER FOR $1A9C
;============== REMAPPER FOR $1A9D
;============== REMAPPER FOR $1A9E
;============== REMAPPER FOR $1A9F
;============== REMAPPER FOR $1AA0
;============== REMAPPER FOR $1AA1
;============== REMAPPER FOR $1AA2
;============== REMAPPER FOR $1AA3
;============== REMAPPER FOR $1AA4
;============== REMAPPER FOR $1AA5
;============== REMAPPER FOR $1AA6
;============== REMAPPER FOR $1AA7
;============== REMAPPER FOR $1AA8
;============== REMAPPER FOR $1AA9
;============== REMAPPER FOR $1AAA
;============== REMAPPER FOR $1AAB
;============== REMAPPER FOR $1AAC
;============== REMAPPER FOR $1AAD
;============== REMAPPER FOR $1AAE
;============== REMAPPER FOR $1AAF
;============== REMAPPER FOR $1AB0
;============== REMAPPER FOR $1AB1
;============== REMAPPER FOR $1AB2
;============== REMAPPER FOR $1AB3
;============== REMAPPER FOR $1AB4
;============== REMAPPER FOR $1AB5
;============== REMAPPER FOR $1AB6
;============== REMAPPER FOR $1AB7
;============== REMAPPER FOR $1AB8
;============== REMAPPER FOR $1AB9
;============== REMAPPER FOR $1ABA
;============== REMAPPER FOR $1ABB
;============== REMAPPER FOR $1ABC
;============== REMAPPER FOR $1ABD
;============== REMAPPER FOR $1ABE
;============== REMAPPER FOR $1ABF
;============== REMAPPER FOR $1AC0
;============== REMAPPER FOR $1AC1
;============== REMAPPER FOR $1AC2
;============== REMAPPER FOR $1AC3
;============== REMAPPER FOR $1AC4
;============== REMAPPER FOR $1AC5
;============== REMAPPER FOR $1AC6
;============== REMAPPER FOR $1AC7
;============== REMAPPER FOR $1AC8
;============== REMAPPER FOR $1AC9
;============== REMAPPER FOR $1ACA
;============== REMAPPER FOR $1ACB
;============== REMAPPER FOR $1ACC
;============== REMAPPER FOR $1ACD
;============== REMAPPER FOR $1ACE
;============== REMAPPER FOR $1ACF
;============== REMAPPER FOR $1AD0
;============== REMAPPER FOR $1AD1
;============== REMAPPER FOR $1AD2
;============== REMAPPER FOR $1AD3
;============== REMAPPER FOR $1AD4
;============== REMAPPER FOR $1AD5
;============== REMAPPER FOR $1AD6
;============== REMAPPER FOR $1AD7
;============== REMAPPER FOR $1AD8
;============== REMAPPER FOR $1AD9
;============== REMAPPER FOR $1ADA
;============== REMAPPER FOR $1ADB
;============== REMAPPER FOR $1ADC
;============== REMAPPER FOR $1ADD
;============== REMAPPER FOR $1ADE
;============== REMAPPER FOR $1ADF
;============== REMAPPER FOR $1AE0
;============== REMAPPER FOR $1AE1
;============== REMAPPER FOR $1AE2
;============== REMAPPER FOR $1AE3
;============== REMAPPER FOR $1AE4
;============== REMAPPER FOR $1AE5
;============== REMAPPER FOR $1AE6
;============== REMAPPER FOR $1AE7
;============== REMAPPER FOR $1AE8
;============== REMAPPER FOR $1AE9
;============== REMAPPER FOR $1AEA
;============== REMAPPER FOR $1AEB
;============== REMAPPER FOR $1AEC
;============== REMAPPER FOR $1AED
;============== REMAPPER FOR $1AEE
;============== REMAPPER FOR $1AEF
;============== REMAPPER FOR $1AF0
;============== REMAPPER FOR $1AF1
;============== REMAPPER FOR $1AF2
;============== REMAPPER FOR $1AF3
;============== REMAPPER FOR $1AF4
;============== REMAPPER FOR $1AF5
;============== REMAPPER FOR $1AF6
;============== REMAPPER FOR $1AF7
;============== REMAPPER FOR $1AF8
;============== REMAPPER FOR $1AF9
;============== REMAPPER FOR $1AFA
;============== REMAPPER FOR $1AFB
;============== REMAPPER FOR $1AFC
;============== REMAPPER FOR $1AFD
;============== REMAPPER FOR $1AFE
;============== REMAPPER FOR $1AFF
;============== REMAPPER FOR $1B00
;============== REMAPPER FOR $1B01
;============== REMAPPER FOR $1B02
;============== REMAPPER FOR $1B03
;============== REMAPPER FOR $1B04
;============== REMAPPER FOR $1B05
;============== REMAPPER FOR $1B06
;============== REMAPPER FOR $1B07
;============== REMAPPER FOR $1B08
;============== REMAPPER FOR $1B09
;============== REMAPPER FOR $1B0A
;============== REMAPPER FOR $1B0B
;============== REMAPPER FOR $1B0C
;============== REMAPPER FOR $1B0D
;============== REMAPPER FOR $1B0E
;============== REMAPPER FOR $1B0F
;============== REMAPPER FOR $1B10
;============== REMAPPER FOR $1B11
;============== REMAPPER FOR $1B12
;============== REMAPPER FOR $1B13
;============== REMAPPER FOR $1B14
;============== REMAPPER FOR $1B15
;============== REMAPPER FOR $1B16
;============== REMAPPER FOR $1B17
;============== REMAPPER FOR $1B18
;============== REMAPPER FOR $1B19
;============== REMAPPER FOR $1B1A
;============== REMAPPER FOR $1B1B
;============== REMAPPER FOR $1B1C
;============== REMAPPER FOR $1B1D
;============== REMAPPER FOR $1B1E
;============== REMAPPER FOR $1B1F
;============== REMAPPER FOR $1B20
;============== REMAPPER FOR $1B21
;============== REMAPPER FOR $1B22
;============== REMAPPER FOR $1B23
;============== REMAPPER FOR $1B24
;============== REMAPPER FOR $1B25
;============== REMAPPER FOR $1B26
;============== REMAPPER FOR $1B27
;============== REMAPPER FOR $1B28
;============== REMAPPER FOR $1B29
;============== REMAPPER FOR $1B2A
;============== REMAPPER FOR $1B2B
;============== REMAPPER FOR $1B2C
;============== REMAPPER FOR $1B2D
;============== REMAPPER FOR $1B2E
;============== REMAPPER FOR $1B2F
;============== REMAPPER FOR $1B30
;============== REMAPPER FOR $1B31
;============== REMAPPER FOR $1B32
;============== REMAPPER FOR $1B33
;============== REMAPPER FOR $1B34
;============== REMAPPER FOR $1B35
;============== REMAPPER FOR $1B36
;============== REMAPPER FOR $1B37
;============== REMAPPER FOR $1B38
;============== REMAPPER FOR $1B39
;============== REMAPPER FOR $1B3A
;============== REMAPPER FOR $1B3B
;============== REMAPPER FOR $1B3C
;============== REMAPPER FOR $1B3D
;============== REMAPPER FOR $1B3E
;============== REMAPPER FOR $1B3F
;============== REMAPPER FOR $1B40
;============== REMAPPER FOR $1B41
;============== REMAPPER FOR $1B42
;============== REMAPPER FOR $1B43
;============== REMAPPER FOR $1B44
;============== REMAPPER FOR $1B45
;============== REMAPPER FOR $1B46
;============== REMAPPER FOR $1B47
;============== REMAPPER FOR $1B48
;============== REMAPPER FOR $1B49
;============== REMAPPER FOR $1B4A
;============== REMAPPER FOR $1B4B
;============== REMAPPER FOR $1B4C
;============== REMAPPER FOR $1B4D
;============== REMAPPER FOR $1B4E
;============== REMAPPER FOR $1B4F
;============== REMAPPER FOR $1B50
;============== REMAPPER FOR $1B51
;============== REMAPPER FOR $1B52
;============== REMAPPER FOR $1B53
;============== REMAPPER FOR $1B54
;============== REMAPPER FOR $1B55
;============== REMAPPER FOR $1B56
;============== REMAPPER FOR $1B57
;============== REMAPPER FOR $1B58
;============== REMAPPER FOR $1B59
;============== REMAPPER FOR $1B5A
;============== REMAPPER FOR $1B5B
;============== REMAPPER FOR $1B5C
;============== REMAPPER FOR $1B5D
;============== REMAPPER FOR $1B5E
;============== REMAPPER FOR $1B5F
;============== REMAPPER FOR $1B60
;============== REMAPPER FOR $1B61
;============== REMAPPER FOR $1B62
;============== REMAPPER FOR $1B63
;============== REMAPPER FOR $1B64
;============== REMAPPER FOR $1B65
;============== REMAPPER FOR $1B66
;============== REMAPPER FOR $1B67
;============== REMAPPER FOR $1B68
;============== REMAPPER FOR $1B69
;============== REMAPPER FOR $1B6A
;============== REMAPPER FOR $1B6B
;============== REMAPPER FOR $1B6C
;============== REMAPPER FOR $1B6D
;============== REMAPPER FOR $1B6E
;============== REMAPPER FOR $1B6F
;============== REMAPPER FOR $1B70
;============== REMAPPER FOR $1B71
;============== REMAPPER FOR $1B72
;============== REMAPPER FOR $1B73
;============== REMAPPER FOR $1B74
;============== REMAPPER FOR $1B75
;============== REMAPPER FOR $1B76
;============== REMAPPER FOR $1B77
;============== REMAPPER FOR $1B78
org $049302
	dw $7B78
org $04936A
	dw $7B78
org $049528
	dw $7B78
org $0495AC
	dw $7B78
;============== REMAPPER FOR $1B79
;============== REMAPPER FOR $1B7A
org $049305
	dw $7B7A
org $049358
	dw $7B7A
org $0495B3
	dw $7B7A
org $0495C1
	dw $7B7A
;============== REMAPPER FOR $1B7B
;============== REMAPPER FOR $1B7C
org $04832C
	dw $7B7C
org $04832F
	dw $7B7C
;============== REMAPPER FOR $1B7D
;============== REMAPPER FOR $1B7E
org $049560
	dw $7B7E
org $0496E8
	dw $7B7E
;============== REMAPPER FOR $1B7F
;============== REMAPPER FOR $1B80
org $0494A9
	dw $7B80
org $0494DF
	dw $7B80
org $049600
	dw $7B80
;============== REMAPPER FOR $1B81
;============== REMAPPER FOR $1B82
org $04E64F
	dw $7B82
org $04E733
	dw $7B82
org $04EC68
	dw $7B82
org $04ECC2
	dw $7B82
;============== REMAPPER FOR $1B83
org $04E655
	dw $7B83
org $04E72A
	dw $7B83
org $04EC70
	dw $7B83
org $04ECCB
	dw $7B83
;============== REMAPPER FOR $1B84
org $04E65A
	dw $7B84
org $04E70D
	dw $7B84
org $04E742
	dw $7B84
org $04EAD5
	dw $7B84
org $04EBEC
	dw $7B84
org $04EBF5
	dw $7B84
org $04ECD0
	dw $7B84
;============== REMAPPER FOR $1B85
;============== REMAPPER FOR $1B86
org $04DAA5
	dw $7B86
org $04E571
	dw $7B86
org $04E641
	dw $7B86
org $04E669
	dw $7B86
org $04E687
	dw $7B86
org $04E6D4
	dw $7B86
org $04E6F3
	dw $7B86
org $04E6F6
	dw $7B86
org $04E769
	dw $7B86
org $04E9FD
	dw $7B86
org $04EA02
	dw $7B86
org $04EAAC
	dw $7B86
org $04EAC6
	dw $7B86
org $04EBF1
	dw $7B86
org $04EBF8
	dw $7B86
org $04ECA5
	dw $7B86
org $04ECB0
	dw $7B86
;============== REMAPPER FOR $1B87
org $009C14
	dw $7B87
org $00A0C5
	dw $7B87
org $048282
	dw $7B87
org $048373
	dw $7B87
org $049052
	dw $7B87
org $04F405
	dw $7B87
org $04F430
	dw $7B87
org $04F433
	dw $7B87
org $04F443
	dw $7B87
;============== REMAPPER FOR $1B88
org $009C17
	dw $7B88
org $00C5D4
	dw $7B88
org $04F424
	dw $7B88
org $04F446
	dw $7B88
org $05B110
	dw $7B88
org $05B121
	dw $7B88
org $05B18C
	dw $7B88
org $05B251
	dw $7B88
org $0C9FBC
	dw $7B88
org $0C9FC4
	dw $7B88
org $0CAB20
	dw $7B88
org $0CAB4C
	dw $7B88
;============== REMAPPER FOR $1B89
org $04F427
	dw $7B89
org $04F451
	dw $7B89
org $04F46B
	dw $7B89
org $04F46F
	dw $7B89
org $04F479
	dw $7B89
org $05B113
	dw $7B89
org $05B254
	dw $7B89
org $05B25B
	dw $7B89
org $05B265
	dw $7B89
org $05B26E
	dw $7B89
org $0CA08B
	dw $7B89
org $0CA1F1
	dw $7B89
org $0CA406
	dw $7B89
org $0CAB3E
	dw $7B89
org $0CAB69
	dw $7B89
org $0CAB75
	dw $7B89
;============== REMAPPER FOR $1B8A
org $04F421
	dw $7B8A
org $04F542
	dw $7B8A
org $04F54C
	dw $7B8A
org $04F5DC
	dw $7B8A
;============== REMAPPER FOR $1B8B
org $04F549
	dw $7B8B
org $04F5D2
	dw $7B8B
org $04F5D5
	dw $7B8B
;============== REMAPPER FOR $1B8C
org $049629
	dw $7B8C
org $04DB1B
	dw $7B8C
org $04DB58
	dw $7B8C
;============== REMAPPER FOR $1B8D
org $049634
	dw $7B8D
org $04DB1E
	dw $7B8D
org $04DB25
	dw $7B8D
org $04DB47
	dw $7B8D
;============== REMAPPER FOR $1B8E
org $04DB68
	dw $7B8E
org $04DB72
	dw $7B8E
;============== REMAPPER FOR $1B8F
org $04963A
	dw $7B8F
org $04DB31
	dw $7B8F
org $04DB38
	dw $7B8F
org $04DB4D
	dw $7B8F
;============== REMAPPER FOR $1B90
org $04DB62
	dw $7B90
;============== REMAPPER FOR $1B91
org $009AD1
	dw $7B91
org $009AFF
	dw $7B91
org $009E8A
	dw $7B91
;============== REMAPPER FOR $1B92
org $0093E4
	dw $7B92
org $009AD7
	dw $7B92
org $009B14
	dw $7B92
org $009B6E
	dw $7B92
org $009E83
	dw $7B92
;============== REMAPPER FOR $1B93
org $05D7D5
	dw $7B93
org $05D94D
	dw $7B93
org $0DA53A
	dw $7B93
;============== REMAPPER FOR $1B94
org $00FC82
	dw $7B94
org $01DDAD
	dw $7B94
org $01DE0B
	dw $7B94
;============== REMAPPER FOR $1B95
org $00A705
	dw $7B95
org $00C82D
	dw $7B95
org $00C840
	dw $7B95
org $00F5AB
	dw $7B95
org $00FCCC
	dw $7B95
org $01EBFC
	dw $7B95
org $01F14C
	dw $7B95
org $05D79F
	dw $7B95
org $05DBAF
	dw $7B95
;============== REMAPPER FOR $1B96
org $00E98D
	dw $7B96
org $02F4D8
	dw $7B96
;============== REMAPPER FOR $1B97
org $05C6C9
	dw $7B97
;============== REMAPPER FOR $1B98
;============== REMAPPER FOR $1B99
org $00C96F
	dw $7B99
org $00C996
	dw $7B99
;============== REMAPPER FOR $1B9A
org $01B552
	dw $7B9A
org $0385FE
	dw $7B9A
org $03863E
	dw $7B9A
org $038650
	dw $7B9A
org $038657
	dw $7B9A
org $05C7BD
	dw $7B9A
;============== REMAPPER FOR $1B9B
org $00C90D
	dw $7B9B
org $00D0D1
	dw $7B9B
org $02A769
	dw $7B9B
;============== REMAPPER FOR $1B9C
org $00A08B
	dw $7B9C
org $04918E
	dw $7B9C
;============== REMAPPER FOR $1B9D
org $05C4AB
	dw $7B9D
org $05C4BE
	dw $7B9D
;============== REMAPPER FOR $1B9E
org $048D95
	dw $7B9E
org $04915C
	dw $7B9E
org $049623
	dw $7B9E
org $04DBE3
	dw $7B9E
org $04DBFF
	dw $7B9E
;============== REMAPPER FOR $1B9F
org $03D71F
	dw $7B9F
org $03D746
	dw $7B9F
;============== REMAPPER FOR $1BA0
org $0483C4
	dw $7BA0
org $0483FF
	dw $7BA0
org $04983B
	dw $7BA0
org $04E666
	dw $7BA0
;============== REMAPPER FOR $1BA1
org $03DF59
	dw $7BA1
org $058699
	dw $7BA1
org $0DA545
	dw $7BA1
org $0DA609
	dw $7BA1
org $0DA6CA
	dw $7BA1
org $0DA8F5
	dw $7BA1
org $0DA975
	dw $7BA1
org $0DA9EC
	dw $7BA1
org $0DAA05
	dw $7BA1
org $0DB2F5
	dw $7BA1
org $0DB363
	dw $7BA1
;============== REMAPPER FOR $1BA2
org $01CDD6
	dw $7BA2
org $0398BC
	dw $7BA2
org $03A28F
	dw $7BA2
org $03DF2F
	dw $7BA2
org $03DF49
	dw $7BA2
org $03DF6E
	dw $7BA2
;============== REMAPPER FOR $1BA3
org $03DDFC
	dw $7BA3
org $03DE05
	dw $7BA3
org $03DE1B
	dw $7BA3
org $03DE44
	dw $7BA3
;============== REMAPPER FOR $1BA4
;============== REMAPPER FOR $1BA5
;============== REMAPPER FOR $1BA6
;============== REMAPPER FOR $1BA7
;============== REMAPPER FOR $1BA8
;============== REMAPPER FOR $1BA9
;============== REMAPPER FOR $1BAA
;============== REMAPPER FOR $1BAB
;============== REMAPPER FOR $1BAC
;============== REMAPPER FOR $1BAD
;============== REMAPPER FOR $1BAE
;============== REMAPPER FOR $1BAF
;============== REMAPPER FOR $1BB0
;============== REMAPPER FOR $1BB1
;============== REMAPPER FOR $1BB2
org $00AAD8
	dw $7BB2
org $00AAEE
	dw $7BB2
org $00AB18
	dw $7BB2
org $00AB2E
	dw $7BB2
;============== REMAPPER FOR $1BB3
;============== REMAPPER FOR $1BB4
;============== REMAPPER FOR $1BB5
;============== REMAPPER FOR $1BB6
;============== REMAPPER FOR $1BB7
;============== REMAPPER FOR $1BB8
;============== REMAPPER FOR $1BB9
;============== REMAPPER FOR $1BBA
;============== REMAPPER FOR $1BBB
;============== REMAPPER FOR $1BBC
org $00AAAA
	dw $7BBC
org $00AAAF
	dw $7BBC
;============== REMAPPER FOR $1BBD
;============== REMAPPER FOR $1BBE
;============== REMAPPER FOR $1BBF
;============== REMAPPER FOR $1BC0
;============== REMAPPER FOR $1BC1
;============== REMAPPER FOR $1BC2
;============== REMAPPER FOR $1BC3
;============== REMAPPER FOR $1BC4
;============== REMAPPER FOR $1BC5
;============== REMAPPER FOR $1BC6
;============== REMAPPER FOR $1BC7
;============== REMAPPER FOR $1BC8
;============== REMAPPER FOR $1BC9
;============== REMAPPER FOR $1BCA
;============== REMAPPER FOR $1BCB
;============== REMAPPER FOR $1BCC
;============== REMAPPER FOR $1BCD
;============== REMAPPER FOR $1BCE
;============== REMAPPER FOR $1BCF
;============== REMAPPER FOR $1BD0
;============== REMAPPER FOR $1BD1
;============== REMAPPER FOR $1BD2
;============== REMAPPER FOR $1BD3
;============== REMAPPER FOR $1BD4
;============== REMAPPER FOR $1BD5
;============== REMAPPER FOR $1BD6
;============== REMAPPER FOR $1BD7
;============== REMAPPER FOR $1BD8
;============== REMAPPER FOR $1BD9
;============== REMAPPER FOR $1BDA
;============== REMAPPER FOR $1BDB
;============== REMAPPER FOR $1BDC
;============== REMAPPER FOR $1BDD
;============== REMAPPER FOR $1BDE
;============== REMAPPER FOR $1BDF
;============== REMAPPER FOR $1BE0
;============== REMAPPER FOR $1BE1
;============== REMAPPER FOR $1BE2
;============== REMAPPER FOR $1BE3
org $009FC3
	dw $7BE3
org $00A020
	dw $7BE3
org $05D932
	dw $7BE3
org $05DAA8
	dw $7BE3
;============== REMAPPER FOR $1BE4
org $0087B0
	dw $7BE4
org $0087CC
	dw $7BE4
org $0087EB
	dw $7BE4
org $00880E
	dw $7BE4
org $00882E
	dw $7BE4
org $008855
	dw $7BE4
org $008874
	dw $7BE4
org $00889E
	dw $7BE4
org $0088C0
	dw $7BE4
org $0088E0
	dw $7BE4
org $058A12
	dw $7BE4
org $058AE1
	dw $7BE4
;============== REMAPPER FOR $1BE5
org $0087C6
	dw $7BE5
org $0087E5
	dw $7BE5
org $008807
	dw $7BE5
org $008827
	dw $7BE5
org $00884F
	dw $7BE5
org $00886E
	dw $7BE5
org $008895
	dw $7BE5
org $0088B7
	dw $7BE5
org $058A02
	dw $7BE5
org $058AEE
	dw $7BE5
;============== REMAPPER FOR $1BE6
org $058A71
	dw $7BE6
org $058B51
	dw $7BE6
org $058B61
	dw $7BE6
;============== REMAPPER FOR $1BE7
;============== REMAPPER FOR $1BE8
org $058A78
	dw $7BE8
;============== REMAPPER FOR $1BE9
;============== REMAPPER FOR $1BEA
;============== REMAPPER FOR $1BEB
;============== REMAPPER FOR $1BEC
;============== REMAPPER FOR $1BED
;============== REMAPPER FOR $1BEE
;============== REMAPPER FOR $1BEF
;============== REMAPPER FOR $1BF0
;============== REMAPPER FOR $1BF1
;============== REMAPPER FOR $1BF2
;============== REMAPPER FOR $1BF3
;============== REMAPPER FOR $1BF4
;============== REMAPPER FOR $1BF5
;============== REMAPPER FOR $1BF6
;============== REMAPPER FOR $1BF7
;============== REMAPPER FOR $1BF8
;============== REMAPPER FOR $1BF9
;============== REMAPPER FOR $1BFA
;============== REMAPPER FOR $1BFB
;============== REMAPPER FOR $1BFC
;============== REMAPPER FOR $1BFD
;============== REMAPPER FOR $1BFE
;============== REMAPPER FOR $1BFF
;============== REMAPPER FOR $1C00
;============== REMAPPER FOR $1C01
;============== REMAPPER FOR $1C02
;============== REMAPPER FOR $1C03
;============== REMAPPER FOR $1C04
;============== REMAPPER FOR $1C05
;============== REMAPPER FOR $1C06
;============== REMAPPER FOR $1C07
;============== REMAPPER FOR $1C08
;============== REMAPPER FOR $1C09
;============== REMAPPER FOR $1C0A
;============== REMAPPER FOR $1C0B
;============== REMAPPER FOR $1C0C
;============== REMAPPER FOR $1C0D
;============== REMAPPER FOR $1C0E
;============== REMAPPER FOR $1C0F
;============== REMAPPER FOR $1C10
;============== REMAPPER FOR $1C11
;============== REMAPPER FOR $1C12
;============== REMAPPER FOR $1C13
;============== REMAPPER FOR $1C14
;============== REMAPPER FOR $1C15
;============== REMAPPER FOR $1C16
;============== REMAPPER FOR $1C17
;============== REMAPPER FOR $1C18
;============== REMAPPER FOR $1C19
;============== REMAPPER FOR $1C1A
;============== REMAPPER FOR $1C1B
;============== REMAPPER FOR $1C1C
;============== REMAPPER FOR $1C1D
;============== REMAPPER FOR $1C1E
;============== REMAPPER FOR $1C1F
;============== REMAPPER FOR $1C20
;============== REMAPPER FOR $1C21
;============== REMAPPER FOR $1C22
;============== REMAPPER FOR $1C23
;============== REMAPPER FOR $1C24
;============== REMAPPER FOR $1C25
;============== REMAPPER FOR $1C26
;============== REMAPPER FOR $1C27
;============== REMAPPER FOR $1C28
;============== REMAPPER FOR $1C29
;============== REMAPPER FOR $1C2A
;============== REMAPPER FOR $1C2B
;============== REMAPPER FOR $1C2C
;============== REMAPPER FOR $1C2D
;============== REMAPPER FOR $1C2E
;============== REMAPPER FOR $1C2F
;============== REMAPPER FOR $1C30
;============== REMAPPER FOR $1C31
;============== REMAPPER FOR $1C32
;============== REMAPPER FOR $1C33
;============== REMAPPER FOR $1C34
;============== REMAPPER FOR $1C35
;============== REMAPPER FOR $1C36
;============== REMAPPER FOR $1C37
;============== REMAPPER FOR $1C38
;============== REMAPPER FOR $1C39
;============== REMAPPER FOR $1C3A
;============== REMAPPER FOR $1C3B
;============== REMAPPER FOR $1C3C
;============== REMAPPER FOR $1C3D
;============== REMAPPER FOR $1C3E
;============== REMAPPER FOR $1C3F
;============== REMAPPER FOR $1C40
;============== REMAPPER FOR $1C41
;============== REMAPPER FOR $1C42
;============== REMAPPER FOR $1C43
;============== REMAPPER FOR $1C44
;============== REMAPPER FOR $1C45
;============== REMAPPER FOR $1C46
;============== REMAPPER FOR $1C47
;============== REMAPPER FOR $1C48
;============== REMAPPER FOR $1C49
;============== REMAPPER FOR $1C4A
;============== REMAPPER FOR $1C4B
;============== REMAPPER FOR $1C4C
;============== REMAPPER FOR $1C4D
;============== REMAPPER FOR $1C4E
;============== REMAPPER FOR $1C4F
;============== REMAPPER FOR $1C50
;============== REMAPPER FOR $1C51
;============== REMAPPER FOR $1C52
;============== REMAPPER FOR $1C53
;============== REMAPPER FOR $1C54
;============== REMAPPER FOR $1C55
;============== REMAPPER FOR $1C56
;============== REMAPPER FOR $1C57
;============== REMAPPER FOR $1C58
;============== REMAPPER FOR $1C59
;============== REMAPPER FOR $1C5A
;============== REMAPPER FOR $1C5B
;============== REMAPPER FOR $1C5C
;============== REMAPPER FOR $1C5D
;============== REMAPPER FOR $1C5E
;============== REMAPPER FOR $1C5F
;============== REMAPPER FOR $1C60
;============== REMAPPER FOR $1C61
;============== REMAPPER FOR $1C62
;============== REMAPPER FOR $1C63
;============== REMAPPER FOR $1C64
;============== REMAPPER FOR $1C65
;============== REMAPPER FOR $1C66
org $058A7F
	dw $7C66
org $058B58
	dw $7C66
org $058B68
	dw $7C66
;============== REMAPPER FOR $1C67
;============== REMAPPER FOR $1C68
org $058A86
	dw $7C68
;============== REMAPPER FOR $1C69
;============== REMAPPER FOR $1C6A
;============== REMAPPER FOR $1C6B
;============== REMAPPER FOR $1C6C
;============== REMAPPER FOR $1C6D
;============== REMAPPER FOR $1C6E
;============== REMAPPER FOR $1C6F
;============== REMAPPER FOR $1C70
;============== REMAPPER FOR $1C71
;============== REMAPPER FOR $1C72
;============== REMAPPER FOR $1C73
;============== REMAPPER FOR $1C74
;============== REMAPPER FOR $1C75
;============== REMAPPER FOR $1C76
;============== REMAPPER FOR $1C77
;============== REMAPPER FOR $1C78
;============== REMAPPER FOR $1C79
;============== REMAPPER FOR $1C7A
;============== REMAPPER FOR $1C7B
;============== REMAPPER FOR $1C7C
;============== REMAPPER FOR $1C7D
;============== REMAPPER FOR $1C7E
;============== REMAPPER FOR $1C7F
;============== REMAPPER FOR $1C80
;============== REMAPPER FOR $1C81
;============== REMAPPER FOR $1C82
;============== REMAPPER FOR $1C83
;============== REMAPPER FOR $1C84
;============== REMAPPER FOR $1C85
;============== REMAPPER FOR $1C86
;============== REMAPPER FOR $1C87
;============== REMAPPER FOR $1C88
;============== REMAPPER FOR $1C89
;============== REMAPPER FOR $1C8A
;============== REMAPPER FOR $1C8B
;============== REMAPPER FOR $1C8C
;============== REMAPPER FOR $1C8D
;============== REMAPPER FOR $1C8E
;============== REMAPPER FOR $1C8F
;============== REMAPPER FOR $1C90
;============== REMAPPER FOR $1C91
;============== REMAPPER FOR $1C92
;============== REMAPPER FOR $1C93
;============== REMAPPER FOR $1C94
;============== REMAPPER FOR $1C95
;============== REMAPPER FOR $1C96
;============== REMAPPER FOR $1C97
;============== REMAPPER FOR $1C98
;============== REMAPPER FOR $1C99
;============== REMAPPER FOR $1C9A
;============== REMAPPER FOR $1C9B
;============== REMAPPER FOR $1C9C
;============== REMAPPER FOR $1C9D
;============== REMAPPER FOR $1C9E
;============== REMAPPER FOR $1C9F
;============== REMAPPER FOR $1CA0
;============== REMAPPER FOR $1CA1
;============== REMAPPER FOR $1CA2
;============== REMAPPER FOR $1CA3
;============== REMAPPER FOR $1CA4
;============== REMAPPER FOR $1CA5
;============== REMAPPER FOR $1CA6
;============== REMAPPER FOR $1CA7
;============== REMAPPER FOR $1CA8
;============== REMAPPER FOR $1CA9
;============== REMAPPER FOR $1CAA
;============== REMAPPER FOR $1CAB
;============== REMAPPER FOR $1CAC
;============== REMAPPER FOR $1CAD
;============== REMAPPER FOR $1CAE
;============== REMAPPER FOR $1CAF
;============== REMAPPER FOR $1CB0
;============== REMAPPER FOR $1CB1
;============== REMAPPER FOR $1CB2
;============== REMAPPER FOR $1CB3
;============== REMAPPER FOR $1CB4
;============== REMAPPER FOR $1CB5
;============== REMAPPER FOR $1CB6
;============== REMAPPER FOR $1CB7
;============== REMAPPER FOR $1CB8
;============== REMAPPER FOR $1CB9
;============== REMAPPER FOR $1CBA
;============== REMAPPER FOR $1CBB
;============== REMAPPER FOR $1CBC
;============== REMAPPER FOR $1CBD
;============== REMAPPER FOR $1CBE
;============== REMAPPER FOR $1CBF
;============== REMAPPER FOR $1CC0
;============== REMAPPER FOR $1CC1
;============== REMAPPER FOR $1CC2
;============== REMAPPER FOR $1CC3
;============== REMAPPER FOR $1CC4
;============== REMAPPER FOR $1CC5
;============== REMAPPER FOR $1CC6
;============== REMAPPER FOR $1CC7
;============== REMAPPER FOR $1CC8
;============== REMAPPER FOR $1CC9
;============== REMAPPER FOR $1CCA
;============== REMAPPER FOR $1CCB
;============== REMAPPER FOR $1CCC
;============== REMAPPER FOR $1CCD
;============== REMAPPER FOR $1CCE
;============== REMAPPER FOR $1CCF
;============== REMAPPER FOR $1CD0
;============== REMAPPER FOR $1CD1
;============== REMAPPER FOR $1CD2
;============== REMAPPER FOR $1CD3
;============== REMAPPER FOR $1CD4
;============== REMAPPER FOR $1CD5
;============== REMAPPER FOR $1CD6
;============== REMAPPER FOR $1CD7
;============== REMAPPER FOR $1CD8
;============== REMAPPER FOR $1CD9
;============== REMAPPER FOR $1CDA
;============== REMAPPER FOR $1CDB
;============== REMAPPER FOR $1CDC
;============== REMAPPER FOR $1CDD
;============== REMAPPER FOR $1CDE
;============== REMAPPER FOR $1CDF
;============== REMAPPER FOR $1CE0
;============== REMAPPER FOR $1CE1
;============== REMAPPER FOR $1CE2
;============== REMAPPER FOR $1CE3
;============== REMAPPER FOR $1CE4
;============== REMAPPER FOR $1CE5
;============== REMAPPER FOR $1CE6
org $0088E3
	dw $7CE6
org $0088FF
	dw $7CE6
org $00891E
	dw $7CE6
org $008941
	dw $7CE6
org $008961
	dw $7CE6
org $008988
	dw $7CE6
org $0089A7
	dw $7CE6
org $0089D1
	dw $7CE6
org $0089F3
	dw $7CE6
org $008A13
	dw $7CE6
org $058BE0
	dw $7CE6
org $058CC6
	dw $7CE6
org $058D93
	dw $7CE6
;============== REMAPPER FOR $1CE7
org $0088F9
	dw $7CE7
org $008918
	dw $7CE7
org $00893A
	dw $7CE7
org $00895A
	dw $7CE7
org $008982
	dw $7CE7
org $0089A1
	dw $7CE7
org $0089C8
	dw $7CE7
org $0089EA
	dw $7CE7
org $058BD0
	dw $7CE7
org $058CD3
	dw $7CE7
org $058D84
	dw $7CE7
;============== REMAPPER FOR $1CE8
org $058C41
	dw $7CE8
org $058D38
	dw $7CE8
org $058D4C
	dw $7CE8
org $058DEF
	dw $7CE8
;============== REMAPPER FOR $1CE9
;============== REMAPPER FOR $1CEA
org $058C4A
	dw $7CEA
org $058DF6
	dw $7CEA
;============== REMAPPER FOR $1CEB
;============== REMAPPER FOR $1CEC
;============== REMAPPER FOR $1CED
;============== REMAPPER FOR $1CEE
;============== REMAPPER FOR $1CEF
;============== REMAPPER FOR $1CF0
;============== REMAPPER FOR $1CF1
;============== REMAPPER FOR $1CF2
;============== REMAPPER FOR $1CF3
;============== REMAPPER FOR $1CF4
;============== REMAPPER FOR $1CF5
;============== REMAPPER FOR $1CF6
;============== REMAPPER FOR $1CF7
;============== REMAPPER FOR $1CF8
;============== REMAPPER FOR $1CF9
;============== REMAPPER FOR $1CFA
;============== REMAPPER FOR $1CFB
;============== REMAPPER FOR $1CFC
;============== REMAPPER FOR $1CFD
;============== REMAPPER FOR $1CFE
;============== REMAPPER FOR $1CFF
;============== REMAPPER FOR $1D00
;============== REMAPPER FOR $1D01
;============== REMAPPER FOR $1D02
;============== REMAPPER FOR $1D03
;============== REMAPPER FOR $1D04
;============== REMAPPER FOR $1D05
;============== REMAPPER FOR $1D06
;============== REMAPPER FOR $1D07
;============== REMAPPER FOR $1D08
;============== REMAPPER FOR $1D09
;============== REMAPPER FOR $1D0A
;============== REMAPPER FOR $1D0B
;============== REMAPPER FOR $1D0C
;============== REMAPPER FOR $1D0D
;============== REMAPPER FOR $1D0E
;============== REMAPPER FOR $1D0F
;============== REMAPPER FOR $1D10
;============== REMAPPER FOR $1D11
;============== REMAPPER FOR $1D12
;============== REMAPPER FOR $1D13
;============== REMAPPER FOR $1D14
;============== REMAPPER FOR $1D15
;============== REMAPPER FOR $1D16
;============== REMAPPER FOR $1D17
;============== REMAPPER FOR $1D18
;============== REMAPPER FOR $1D19
;============== REMAPPER FOR $1D1A
;============== REMAPPER FOR $1D1B
;============== REMAPPER FOR $1D1C
;============== REMAPPER FOR $1D1D
;============== REMAPPER FOR $1D1E
;============== REMAPPER FOR $1D1F
;============== REMAPPER FOR $1D20
;============== REMAPPER FOR $1D21
;============== REMAPPER FOR $1D22
;============== REMAPPER FOR $1D23
;============== REMAPPER FOR $1D24
;============== REMAPPER FOR $1D25
;============== REMAPPER FOR $1D26
;============== REMAPPER FOR $1D27
;============== REMAPPER FOR $1D28
;============== REMAPPER FOR $1D29
;============== REMAPPER FOR $1D2A
;============== REMAPPER FOR $1D2B
;============== REMAPPER FOR $1D2C
;============== REMAPPER FOR $1D2D
;============== REMAPPER FOR $1D2E
;============== REMAPPER FOR $1D2F
;============== REMAPPER FOR $1D30
;============== REMAPPER FOR $1D31
;============== REMAPPER FOR $1D32
;============== REMAPPER FOR $1D33
;============== REMAPPER FOR $1D34
;============== REMAPPER FOR $1D35
;============== REMAPPER FOR $1D36
;============== REMAPPER FOR $1D37
;============== REMAPPER FOR $1D38
;============== REMAPPER FOR $1D39
;============== REMAPPER FOR $1D3A
;============== REMAPPER FOR $1D3B
;============== REMAPPER FOR $1D3C
;============== REMAPPER FOR $1D3D
;============== REMAPPER FOR $1D3E
;============== REMAPPER FOR $1D3F
;============== REMAPPER FOR $1D40
;============== REMAPPER FOR $1D41
;============== REMAPPER FOR $1D42
;============== REMAPPER FOR $1D43
;============== REMAPPER FOR $1D44
;============== REMAPPER FOR $1D45
;============== REMAPPER FOR $1D46
;============== REMAPPER FOR $1D47
;============== REMAPPER FOR $1D48
;============== REMAPPER FOR $1D49
;============== REMAPPER FOR $1D4A
;============== REMAPPER FOR $1D4B
;============== REMAPPER FOR $1D4C
;============== REMAPPER FOR $1D4D
;============== REMAPPER FOR $1D4E
;============== REMAPPER FOR $1D4F
;============== REMAPPER FOR $1D50
;============== REMAPPER FOR $1D51
;============== REMAPPER FOR $1D52
;============== REMAPPER FOR $1D53
;============== REMAPPER FOR $1D54
;============== REMAPPER FOR $1D55
;============== REMAPPER FOR $1D56
;============== REMAPPER FOR $1D57
;============== REMAPPER FOR $1D58
;============== REMAPPER FOR $1D59
;============== REMAPPER FOR $1D5A
;============== REMAPPER FOR $1D5B
;============== REMAPPER FOR $1D5C
;============== REMAPPER FOR $1D5D
;============== REMAPPER FOR $1D5E
;============== REMAPPER FOR $1D5F
;============== REMAPPER FOR $1D60
;============== REMAPPER FOR $1D61
;============== REMAPPER FOR $1D62
;============== REMAPPER FOR $1D63
;============== REMAPPER FOR $1D64
;============== REMAPPER FOR $1D65
;============== REMAPPER FOR $1D66
;============== REMAPPER FOR $1D67
;============== REMAPPER FOR $1D68
org $058C53
	dw $7D68
org $058D41
	dw $7D68
org $058D55
	dw $7D68
org $058DFD
	dw $7D68
;============== REMAPPER FOR $1D69
;============== REMAPPER FOR $1D6A
org $058C5C
	dw $7D6A
org $058E04
	dw $7D6A
;============== REMAPPER FOR $1D6B
;============== REMAPPER FOR $1D6C
;============== REMAPPER FOR $1D6D
;============== REMAPPER FOR $1D6E
;============== REMAPPER FOR $1D6F
;============== REMAPPER FOR $1D70
;============== REMAPPER FOR $1D71
;============== REMAPPER FOR $1D72
;============== REMAPPER FOR $1D73
;============== REMAPPER FOR $1D74
;============== REMAPPER FOR $1D75
;============== REMAPPER FOR $1D76
;============== REMAPPER FOR $1D77
;============== REMAPPER FOR $1D78
;============== REMAPPER FOR $1D79
;============== REMAPPER FOR $1D7A
;============== REMAPPER FOR $1D7B
;============== REMAPPER FOR $1D7C
;============== REMAPPER FOR $1D7D
;============== REMAPPER FOR $1D7E
;============== REMAPPER FOR $1D7F
;============== REMAPPER FOR $1D80
;============== REMAPPER FOR $1D81
;============== REMAPPER FOR $1D82
;============== REMAPPER FOR $1D83
;============== REMAPPER FOR $1D84
;============== REMAPPER FOR $1D85
;============== REMAPPER FOR $1D86
;============== REMAPPER FOR $1D87
;============== REMAPPER FOR $1D88
;============== REMAPPER FOR $1D89
;============== REMAPPER FOR $1D8A
;============== REMAPPER FOR $1D8B
;============== REMAPPER FOR $1D8C
;============== REMAPPER FOR $1D8D
;============== REMAPPER FOR $1D8E
;============== REMAPPER FOR $1D8F
;============== REMAPPER FOR $1D90
;============== REMAPPER FOR $1D91
;============== REMAPPER FOR $1D92
;============== REMAPPER FOR $1D93
;============== REMAPPER FOR $1D94
;============== REMAPPER FOR $1D95
;============== REMAPPER FOR $1D96
;============== REMAPPER FOR $1D97
;============== REMAPPER FOR $1D98
;============== REMAPPER FOR $1D99
;============== REMAPPER FOR $1D9A
;============== REMAPPER FOR $1D9B
;============== REMAPPER FOR $1D9C
;============== REMAPPER FOR $1D9D
;============== REMAPPER FOR $1D9E
;============== REMAPPER FOR $1D9F
;============== REMAPPER FOR $1DA0
;============== REMAPPER FOR $1DA1
;============== REMAPPER FOR $1DA2
;============== REMAPPER FOR $1DA3
;============== REMAPPER FOR $1DA4
;============== REMAPPER FOR $1DA5
;============== REMAPPER FOR $1DA6
;============== REMAPPER FOR $1DA7
;============== REMAPPER FOR $1DA8
;============== REMAPPER FOR $1DA9
;============== REMAPPER FOR $1DAA
;============== REMAPPER FOR $1DAB
;============== REMAPPER FOR $1DAC
;============== REMAPPER FOR $1DAD
;============== REMAPPER FOR $1DAE
;============== REMAPPER FOR $1DAF
;============== REMAPPER FOR $1DB0
;============== REMAPPER FOR $1DB1
;============== REMAPPER FOR $1DB2
;============== REMAPPER FOR $1DB3
;============== REMAPPER FOR $1DB4
;============== REMAPPER FOR $1DB5
;============== REMAPPER FOR $1DB6
;============== REMAPPER FOR $1DB7
;============== REMAPPER FOR $1DB8
;============== REMAPPER FOR $1DB9
;============== REMAPPER FOR $1DBA
;============== REMAPPER FOR $1DBB
;============== REMAPPER FOR $1DBC
;============== REMAPPER FOR $1DBD
;============== REMAPPER FOR $1DBE
;============== REMAPPER FOR $1DBF
;============== REMAPPER FOR $1DC0
;============== REMAPPER FOR $1DC1
;============== REMAPPER FOR $1DC2
;============== REMAPPER FOR $1DC3
;============== REMAPPER FOR $1DC4
;============== REMAPPER FOR $1DC5
;============== REMAPPER FOR $1DC6
;============== REMAPPER FOR $1DC7
;============== REMAPPER FOR $1DC8
;============== REMAPPER FOR $1DC9
;============== REMAPPER FOR $1DCA
;============== REMAPPER FOR $1DCB
;============== REMAPPER FOR $1DCC
;============== REMAPPER FOR $1DCD
;============== REMAPPER FOR $1DCE
;============== REMAPPER FOR $1DCF
;============== REMAPPER FOR $1DD0
;============== REMAPPER FOR $1DD1
;============== REMAPPER FOR $1DD2
;============== REMAPPER FOR $1DD3
;============== REMAPPER FOR $1DD4
;============== REMAPPER FOR $1DD5
;============== REMAPPER FOR $1DD6
;============== REMAPPER FOR $1DD7
;============== REMAPPER FOR $1DD8
;============== REMAPPER FOR $1DD9
;============== REMAPPER FOR $1DDA
;============== REMAPPER FOR $1DDB
;============== REMAPPER FOR $1DDC
;============== REMAPPER FOR $1DDD
;============== REMAPPER FOR $1DDE
;============== REMAPPER FOR $1DDF
;============== REMAPPER FOR $1DE0
;============== REMAPPER FOR $1DE1
;============== REMAPPER FOR $1DE2
;============== REMAPPER FOR $1DE3
;============== REMAPPER FOR $1DE4
;============== REMAPPER FOR $1DE5
;============== REMAPPER FOR $1DE6
;============== REMAPPER FOR $1DE7
;============== REMAPPER FOR $1DE8
org $00822A
	dw $7DE8
org $04DAF2
	dw $7DE8
org $04DB50
	dw $7DE8
org $04DBC5
	dw $7DE8
org $04DBD0
	dw $7DE8
org $04DCCA
	dw $7DE8
org $04DD3C
	dw $7DE8
org $04F88C
	dw $7DE8
;============== REMAPPER FOR $1DE9
org $0095D3
	dw $7DE9
org $0095FB
	dw $7DE9
org $00A282
	dw $7DE9
org $00CA29
	dw $7DE9
org $04E5F9
	dw $7DE9
org $04EA22
	dw $7DE9
org $05B151
	dw $7DE9
org $0C93BD
	dw $7DE9
org $0CAD90
	dw $7DE9
org $0CAD95
	dw $7DE9
org $0CADFA
	dw $7DE9
org $0CAE01
	dw $7DE9
org $0CAE14
	dw $7DE9
org $0CAE6D
	dw $7DE9
org $0CAEB0
	dw $7DE9
org $0CAF01
	dw $7DE9
org $0CB5C2
	dw $7DE9
;============== REMAPPER FOR $1DEA
org $04E5F6
	dw $7DEA
org $04E5FE
	dw $7DEA
org $04E605
	dw $7DEA
org $04E60B
	dw $7DEA
org $04E644
	dw $7DEA
org $04E6D7
	dw $7DEA
org $04E9ED
	dw $7DEA
org $04EA08
	dw $7DEA
org $04EA0E
	dw $7DEA
org $04EC84
	dw $7DEA
org $04ECB3
	dw $7DEA
org $04ED8F
	dw $7DEA
org $04EDB0
	dw $7DEA
org $05D9D0
	dw $7DEA
;============== REMAPPER FOR $1DEB
org $04E475
	dw $7DEB
org $04E47F
	dw $7DEB
org $04E489
	dw $7DEB
org $04E48C
	dw $7DEB
org $04E499
	dw $7DEB
org $04E6E2
	dw $7DEB
org $04E6EC
	dw $7DEB
org $04E703
	dw $7DEB
org $04EAB7
	dw $7DEB
org $04EABA
	dw $7DEB
org $04EE39
	dw $7DEB
;============== REMAPPER FOR $1DEC
;============== REMAPPER FOR $1DED
org $04E47C
	dw $7DED
org $04E48F
	dw $7DED
org $04E6E9
	dw $7DED
org $04EABD
	dw $7DED
;============== REMAPPER FOR $1DEE
;============== REMAPPER FOR $1DEF
;============== REMAPPER FOR $1DF0
org $0482B6
	dw $7DF0
org $0482D8
	dw $7DF0
org $048391
	dw $7DF0
;============== REMAPPER FOR $1DF1
;============== REMAPPER FOR $1DF2
org $0482A1
	dw $7DF2
org $0482DF
	dw $7DF2
org $048396
	dw $7DF2
;============== REMAPPER FOR $1DF3
;============== REMAPPER FOR $1DF4
org $009C70
	dw $7DF4
org $009C80
	dw $7DF4
;============== REMAPPER FOR $1DF5
org $0093C8
	dw $7DF5
org $009410
	dw $7DF5
org $00942F
	dw $7DF5
org $009434
	dw $7DF5
org $009AC3
	dw $7DF5
org $009C73
	dw $7DF5
org $009C7B
	dw $7DF5
org $00A09E
	dw $7DF5
org $00C965
	dw $7DF5
org $05B13B
	dw $7DF5
org $05B146
	dw $7DF5
;============== REMAPPER FOR $1DF6
org $048536
	dw $7DF6
org $048544
	dw $7DF6
;============== REMAPPER FOR $1DF7
org $04916B
	dw $7DF7
org $049E53
	dw $7DF7
org $049E6A
	dw $7DF7
org $049E6D
	dw $7DF7
org $049E76
	dw $7DF7
org $049E7B
	dw $7DF7
;============== REMAPPER FOR $1DF8
org $04916E
	dw $7DF8
org $049E58
	dw $7DF8
org $049E5B
	dw $7DF8
;============== REMAPPER FOR $1DF9
org $00812B
	dw $7DF9
org $008190
	dw $7DF9
org $0081A2
	dw $7DF9
org $008E5E
	dw $7DF9
org $009BBE
	dw $7DF9
org $00A240
	dw $7DF9
org $00C735
	dw $7DF9
org $00C762
	dw $7DF9
org $00C79B
	dw $7DF9
org $00C7AF
	dw $7DF9
org $00D257
	dw $7DF9
org $00D8AB
	dw $7DF9
org $00DAAC
	dw $7DF9
org $00DBB5
	dw $7DF9
org $00ED42
	dw $7DF9
org $00ED48
	dw $7DF9
org $00F2EB
	dw $7DF9
org $00F35B
	dw $7DF9
org $00F43C
	dw $7DF9
org $00F5E5
	dw $7DF9
org $00F5F6
	dw $7DF9
org $00F91C
	dw $7DF9
org $00FB80
	dw $7DF9
org $0199A1
	dw $7DF9
org $01A293
	dw $7DF9
org $01A60F
	dw $7DF9
org $01A65D
	dw $7DF9
org $01A72B
	dw $7DF9
org $01A869
	dw $7DF9
org $01A8DB
	dw $7DF9
org $01A942
	dw $7DF9
org $01AB00
	dw $7DF9
org $01AB5B
	dw $7DF9
org $01AFFF
	dw $7DF9
org $01B132
	dw $7DF9
org $01B4F5
	dw $7DF9
org $01BADA
	dw $7DF9
org $01BC62
	dw $7DF9
org $01BF2B
	dw $7DF9
org $01C30C
	dw $7DF9
org $01C57D
	dw $7DF9
org $01C59F
	dw $7DF9
org $01CFD3
	dw $7DF9
org $01D300
	dw $7DF9
org $01D321
	dw $7DF9
org $01D337
	dw $7DF9
org $01D3F6
	dw $7DF9
org $01DE7A
	dw $7DF9
org $01E5F5
	dw $7DF9
org $01F0D6
	dw $7DF9
org $01F2E2
	dw $7DF9
org $01F5A4
	dw $7DF9
org $01FD43
	dw $7DF9
org $01FDB5
	dw $7DF9
org $028821
	dw $7DF9
org $02918F
	dw $7DF9
org $02A048
	dw $7DF9
org $02A109
	dw $7DF9
org $02A127
	dw $7DF9
org $02C5B1
	dw $7DF9
org $02C6B8
	dw $7DF9
org $02C70A
	dw $7DF9
org $02C7BB
	dw $7DF9
org $02C7D5
	dw $7DF9
org $02F26E
	dw $7DF9
org $02F2C4
	dw $7DF9
org $0380EC
	dw $7DF9
org $0381E1
	dw $7DF9
org $0395EF
	dw $7DF9
org $039621
	dw $7DF9
org $03963D
	dw $7DF9
org $039A69
	dw $7DF9
org $039ABE
	dw $7DF9
org $039B06
	dw $7DF9
org $039FFD
	dw $7DF9
org $03A8B5
	dw $7DF9
org $03A8E6
	dw $7DF9
org $03B0BB
	dw $7DF9
org $03B1B4
	dw $7DF9
org $03C03A
	dw $7DF9
org $03C20C
	dw $7DF9
org $03C853
	dw $7DF9
org $03C89A
	dw $7DF9
org $03CE27
	dw $7DF9
org $03CEC4
	dw $7DF9
org $0483CF
	dw $7DF9
org $048406
	dw $7DF9
org $049173
	dw $7DF9
org $04FA7B
	dw $7DF9
org $0CCD6B
	dw $7DF9
org $0CCF2F
	dw $7DF9
org $0CD2B5
	dw $7DF9
org $0CD7DB
	dw $7DF9
;============== REMAPPER FOR $1DFA
org $008196
	dw $7DFA
org $0081A5
	dw $7DFA
org $00C912
	dw $7DFA
org $00D661
	dw $7DFA
org $00DBA8
	dw $7DFA
org $00FC7D
	dw $7DFA
org $01D748
	dw $7DFA
org $01DB73
	dw $7DFA
org $01ED5D
	dw $7DFA
org $01EDA8
	dw $7DFA
org $01F71B
	dw $7DFA
org $02A47F
	dw $7DFA
org $0392BB
	dw $7DFA
;============== REMAPPER FOR $1DFB
org $00817A
	dw $7DFB
org $00818D
	dw $7DFB
org $0094B5
	dw $7DFB
org $0096C9
	dw $7DFB
org $009739
	dw $7DFB
org $009E1A
	dw $7DFB
org $00C528
	dw $7DFB
org $00C54D
	dw $7DFB
org $00C9BF
	dw $7DFB
org $00D0E0
	dw $7DFB
org $00E306
	dw $7DFB
org $00EEC5
	dw $7DFB
org $00F60D
	dw $7DFB
org $018786
	dw $7DFB
org $01AB0A
	dw $7DFB
org $01C0F2
	dw $7DFB
org $01C588
	dw $7DFB
org $01D051
	dw $7DFB
org $01E218
	dw $7DFB
org $01FB30
	dw $7DFB
org $02896A
	dw $7DFB
org $02E285
	dw $7DFB
org $03809F
	dw $7DFB
org $0398E9
	dw $7DFB
org $03A704
	dw $7DFB
org $03A7AA
	dw $7DFB
org $03A7C4
	dw $7DFB
org $03A88F
	dw $7DFB
org $03ABF6
	dw $7DFB
org $03AC55
	dw $7DFB
org $03CE9C
	dw $7DFB
org $0483D4
	dw $7DFB
org $048E45
	dw $7DFB
org $0491E3
	dw $7DFB
org $04DBFC
	dw $7DFB
org $0C9449
	dw $7DFB
org $0CA40E
	dw $7DFB
org $0CA5C4
	dw $7DFB
;============== REMAPPER FOR $1DFC
org $00819C
	dw $7DFC
org $0081A8
	dw $7DFC
org $0093C3
	dw $7DFC
org $009AE6
	dw $7DFC
org $009AFC
	dw $7DFC
org $009BB9
	dw $7DFC
org $00C55A
	dw $7DFC
org $00C723
	dw $7DFC
org $00C7D4
	dw $7DFC
org $00CE42
	dw $7DFC
org $00D07E
	dw $7DFC
org $00D2A8
	dw $7DFC
org $00D64C
	dw $7DFC
org $00EA90
	dw $7DFC
org $00EC13
	dw $7DFC
org $00EF93
	dw $7DFC
org $00EFB9
	dw $7DFC
org $00F027
	dw $7DFC
org $00F239
	dw $7DFC
org $00FEB8
	dw $7DFC
org $018393
	dw $7DFC
org $018587
	dw $7DFC
org $019634
	dw $7DFC
org $01A2C8
	dw $7DFC
org $01AF1A
	dw $7DFC
org $01C10C
	dw $7DFC
org $01C54B
	dw $7DFC
org $01CF0D
	dw $7DFC
org $01D05C
	dw $7DFC
org $01D29C
	dw $7DFC
org $01D3AE
	dw $7DFC
org $01E04D
	dw $7DFC
org $01E0A4
	dw $7DFC
org $01E6AC
	dw $7DFC
org $01ED62
	dw $7DFC
org $01EF11
	dw $7DFC
org $01F100
	dw $7DFC
org $01F292
	dw $7DFC
org $01F311
	dw $7DFC
org $01F3EF
	dw $7DFC
org $01F6CB
	dw $7DFC
org $01F720
	dw $7DFC
org $01F759
	dw $7DFC
org $01FB63
	dw $7DFC
org $01FCD1
	dw $7DFC
org $028015
	dw $7DFC
org $028417
	dw $7DFC
org $028682
	dw $7DFC
org $02894D
	dw $7DFC
org $028AD0
	dw $7DFC
org $029180
	dw $7DFC
org $029BEC
	dw $7DFC
org $02A484
	dw $7DFC
org $02B046
	dw $7DFC
org $02B08B
	dw $7DFC
org $02B0E2
	dw $7DFC
org $02B4AA
	dw $7DFC
org $02C384
	dw $7DFC
org $02C4FB
	dw $7DFC
org $02C539
	dw $7DFC
org $02C7F9
	dw $7DFC
org $02CDEF
	dw $7DFC
org $02D477
	dw $7DFC
org $02D91B
	dw $7DFC
org $02DD67
	dw $7DFC
org $02DECF
	dw $7DFC
org $02F67D
	dw $7DFC
org $02F686
	dw $7DFC
org $02F768
	dw $7DFC
org $02F771
	dw $7DFC
org $038236
	dw $7DFC
org $038902
	dw $7DFC
org $038ADD
	dw $7DFC
org $038D80
	dw $7DFC
org $039D58
	dw $7DFC
org $03A5D3
	dw $7DFC
org $03A606
	dw $7DFC
org $03A7F9
	dw $7DFC
org $03A83E
	dw $7DFC
org $03AB8F
	dw $7DFC
org $03B12C
	dw $7DFC
org $03B1A6
	dw $7DFC
org $03C06F
	dw $7DFC
org $03C345
	dw $7DFC
org $03C833
	dw $7DFC
org $03C859
	dw $7DFC
org $03C8A0
	dw $7DFC
org $03CE36
	dw $7DFC
org $03CE49
	dw $7DFC
org $03CE81
	dw $7DFC
org $03CECE
	dw $7DFC
org $03D755
	dw $7DFC
org $03E019
	dw $7DFC
org $0496A3
	dw $7DFC
org $04E672
	dw $7DFC
org $04E766
	dw $7DFC
org $04ECAD
	dw $7DFC
org $04F2A7
	dw $7DFC
org $04F402
	dw $7DFC
org $04F56A
	dw $7DFC
org $04F739
	dw $7DFC
org $05B32D
	dw $7DFC
org $05B350
	dw $7DFC
org $05C761
	dw $7DFC
org $05C9C4
	dw $7DFC
org $05CDE6
	dw $7DFC
org $05CF4B
	dw $7DFC
org $0CA5B2
	dw $7DFC
org $0CD12D
	dw $7DFC
org $0CD298
	dw $7DFC
org $0CD2C0
	dw $7DFC
org $0CD2DB
	dw $7DFC
org $0CD3EA
	dw $7DFC
;============== REMAPPER FOR $1DFD
org $00812E
	dw $7DFD
;============== REMAPPER FOR $1DFE
;============== REMAPPER FOR $1DFF
org $008182
	dw $7DFF
org $00818A
	dw $7DFF
;============== REMAPPER FOR $1E00
;============== REMAPPER FOR $1E01
org $00CC75
	dw $7E01
org $00CC78
	dw $7E01
org $00CC7F
	dw $7E01
org $00CC82
	dw $7E01
;============== REMAPPER FOR $1E02
org $01E294
	dw $7E02
org $02AA5C
	dw $7E02
org $02AA81
	dw $7E02
org $02AB01
	dw $7E02
org $02DF69
	dw $7E02
org $02F895
	dw $7E02
org $02F8B6
	dw $7E02
org $02F8BD
	dw $7E02
org $02F955
	dw $7E02
org $02F9D3
	dw $7E02
org $02FA38
	dw $7E02
org $02FBA3
	dw $7E02
org $02FC0F
	dw $7E02
org $02FC16
	dw $7E02
org $02FC79
	dw $7E02
org $02FCAF
	dw $7E02
org $02FD39
	dw $7E02
org $02FD3C
	dw $7E02
org $02FD57
	dw $7E02
org $02FDD2
	dw $7E02
org $02FDDB
	dw $7E02
org $02FE2F
	dw $7E02
org $02FE55
	dw $7E02
org $02FE97
	dw $7E02
org $02FED4
	dw $7E02
org $02FF31
	dw $7E02
org $02FF76
	dw $7E02
org $02FFC4
	dw $7E02
org $02FFC7
	dw $7E02
;============== REMAPPER FOR $1E03
;============== REMAPPER FOR $1E04
;============== REMAPPER FOR $1E05
;============== REMAPPER FOR $1E06
;============== REMAPPER FOR $1E07
;============== REMAPPER FOR $1E08
;============== REMAPPER FOR $1E09
;============== REMAPPER FOR $1E0A
;============== REMAPPER FOR $1E0B
;============== REMAPPER FOR $1E0C
;============== REMAPPER FOR $1E0D
;============== REMAPPER FOR $1E0E
;============== REMAPPER FOR $1E0F
;============== REMAPPER FOR $1E10
;============== REMAPPER FOR $1E11
;============== REMAPPER FOR $1E12
;============== REMAPPER FOR $1E13
;============== REMAPPER FOR $1E14
;============== REMAPPER FOR $1E15
;============== REMAPPER FOR $1E16
org $01E29E
	dw $7E16
org $02AA48
	dw $7E16
org $02AA7C
	dw $7E16
org $02AAEA
	dw $7E16
org $02DF58
	dw $7E16
org $02DF7A
	dw $7E16
org $02F886
	dw $7E16
org $02F94A
	dw $7E16
org $02F9BD
	dw $7E16
org $02FA2F
	dw $7E16
org $02FB8C
	dw $7E16
org $02FBF3
	dw $7E16
org $02FBFD
	dw $7E16
org $02FC8E
	dw $7E16
org $02FCC2
	dw $7E16
org $02FD4E
	dw $7E16
org $02FDF0
	dw $7E16
org $02FDF3
	dw $7E16
org $02FDF6
	dw $7E16
org $02FDFE
	dw $7E16
org $02FE14
	dw $7E16
org $02FE4C
	dw $7E16
org $02FE7C
	dw $7E16
org $02FEF2
	dw $7E16
org $02FF87
	dw $7E16
;============== REMAPPER FOR $1E17
;============== REMAPPER FOR $1E18
;============== REMAPPER FOR $1E19
;============== REMAPPER FOR $1E1A
;============== REMAPPER FOR $1E1B
;============== REMAPPER FOR $1E1C
;============== REMAPPER FOR $1E1D
;============== REMAPPER FOR $1E1E
;============== REMAPPER FOR $1E1F
;============== REMAPPER FOR $1E20
;============== REMAPPER FOR $1E21
;============== REMAPPER FOR $1E22
;============== REMAPPER FOR $1E23
;============== REMAPPER FOR $1E24
;============== REMAPPER FOR $1E25
;============== REMAPPER FOR $1E26
;============== REMAPPER FOR $1E27
;============== REMAPPER FOR $1E28
;============== REMAPPER FOR $1E29
;============== REMAPPER FOR $1E2A
org $01E299
	dw $7E2A
org $02AA62
	dw $7E2A
org $02AB08
	dw $7E2A
org $02DF72
	dw $7E2A
org $02F89C
	dw $7E2A
org $02F8C0
	dw $7E2A
org $02F8C6
	dw $7E2A
org $02F95A
	dw $7E2A
org $02F9E0
	dw $7E2A
org $02FBAB
	dw $7E2A
org $02FC24
	dw $7E2A
org $02FCB8
	dw $7E2A
org $02FD41
	dw $7E2A
org $02FD44
	dw $7E2A
org $02FDCD
	dw $7E2A
org $02FE9E
	dw $7E2A
org $02FEDA
	dw $7E2A
org $02FF3E
	dw $7E2A
org $02FF7F
	dw $7E2A
org $02FFCB
	dw $7E2A
org $02FFCE
	dw $7E2A
;============== REMAPPER FOR $1E2B
;============== REMAPPER FOR $1E2C
;============== REMAPPER FOR $1E2D
;============== REMAPPER FOR $1E2E
;============== REMAPPER FOR $1E2F
;============== REMAPPER FOR $1E30
;============== REMAPPER FOR $1E31
;============== REMAPPER FOR $1E32
;============== REMAPPER FOR $1E33
;============== REMAPPER FOR $1E34
;============== REMAPPER FOR $1E35
;============== REMAPPER FOR $1E36
;============== REMAPPER FOR $1E37
;============== REMAPPER FOR $1E38
;============== REMAPPER FOR $1E39
;============== REMAPPER FOR $1E3A
;============== REMAPPER FOR $1E3B
;============== REMAPPER FOR $1E3C
;============== REMAPPER FOR $1E3D
;============== REMAPPER FOR $1E3E
org $01E2A3
	dw $7E3E
org $02AA52
	dw $7E3E
org $02AAF4
	dw $7E3E
org $02DF60
	dw $7E3E
org $02DF7F
	dw $7E3E
org $02F88D
	dw $7E3E
org $02F94F
	dw $7E3E
org $02F9C5
	dw $7E3E
org $02FB94
	dw $7E3E
org $02FC09
	dw $7E3E
org $02FC93
	dw $7E3E
org $02FCC7
	dw $7E3E
org $02FE81
	dw $7E3E
org $02FEFE
	dw $7E3E
org $02FF8D
	dw $7E3E
;============== REMAPPER FOR $1E3F
;============== REMAPPER FOR $1E40
;============== REMAPPER FOR $1E41
;============== REMAPPER FOR $1E42
;============== REMAPPER FOR $1E43
;============== REMAPPER FOR $1E44
;============== REMAPPER FOR $1E45
;============== REMAPPER FOR $1E46
;============== REMAPPER FOR $1E47
;============== REMAPPER FOR $1E48
;============== REMAPPER FOR $1E49
;============== REMAPPER FOR $1E4A
;============== REMAPPER FOR $1E4B
;============== REMAPPER FOR $1E4C
;============== REMAPPER FOR $1E4D
;============== REMAPPER FOR $1E4E
;============== REMAPPER FOR $1E4F
;============== REMAPPER FOR $1E50
;============== REMAPPER FOR $1E51
;============== REMAPPER FOR $1E52
org $01E2AD
	dw $7E52
org $02AAA6
	dw $7E52
org $02F86B
	dw $7E52
org $02FC37
	dw $7E52
org $02FC6F
	dw $7E52
org $02FC76
	dw $7E52
org $02FC83
	dw $7E52
org $02FDC0
	dw $7E52
org $02FDCA
	dw $7E52
org $02FDDE
	dw $7E52
org $02FDE7
	dw $7E52
org $02FFA4
	dw $7E52
org $02FFB3
	dw $7E52
;============== REMAPPER FOR $1E53
;============== REMAPPER FOR $1E54
;============== REMAPPER FOR $1E55
;============== REMAPPER FOR $1E56
;============== REMAPPER FOR $1E57
;============== REMAPPER FOR $1E58
;============== REMAPPER FOR $1E59
;============== REMAPPER FOR $1E5A
;============== REMAPPER FOR $1E5B
;============== REMAPPER FOR $1E5C
;============== REMAPPER FOR $1E5D
;============== REMAPPER FOR $1E5E
;============== REMAPPER FOR $1E5F
;============== REMAPPER FOR $1E60
;============== REMAPPER FOR $1E61
;============== REMAPPER FOR $1E62
;============== REMAPPER FOR $1E63
;============== REMAPPER FOR $1E64
;============== REMAPPER FOR $1E65
;============== REMAPPER FOR $1E66
org $01E2A8
	dw $7E66
org $02AA36
	dw $7E66
org $02AA9E
	dw $7E66
org $02AAD8
	dw $7E66
org $02F866
	dw $7E66
org $02FC3C
	dw $7E66
org $02FC8B
	dw $7E66
org $02FCFF
	dw $7E66
org $02FD06
	dw $7E66
org $02FD78
	dw $7E66
org $02FDEC
	dw $7E66
org $02FDF9
	dw $7E66
org $02FE08
	dw $7E66
org $02FE0E
	dw $7E66
;============== REMAPPER FOR $1E67
;============== REMAPPER FOR $1E68
;============== REMAPPER FOR $1E69
;============== REMAPPER FOR $1E6A
;============== REMAPPER FOR $1E6B
;============== REMAPPER FOR $1E6C
;============== REMAPPER FOR $1E6D
;============== REMAPPER FOR $1E6E
;============== REMAPPER FOR $1E6F
;============== REMAPPER FOR $1E70
;============== REMAPPER FOR $1E71
;============== REMAPPER FOR $1E72
;============== REMAPPER FOR $1E73
;============== REMAPPER FOR $1E74
;============== REMAPPER FOR $1E75
;============== REMAPPER FOR $1E76
;============== REMAPPER FOR $1E77
;============== REMAPPER FOR $1E78
;============== REMAPPER FOR $1E79
;============== REMAPPER FOR $1E7A
org $02AAB7
	dw $7E7A
org $02F87C
	dw $7E7A
org $02FFAC
	dw $7E7A
org $02FFAF
	dw $7E7A
;============== REMAPPER FOR $1E7B
;============== REMAPPER FOR $1E7C
;============== REMAPPER FOR $1E7D
;============== REMAPPER FOR $1E7E
;============== REMAPPER FOR $1E7F
;============== REMAPPER FOR $1E80
;============== REMAPPER FOR $1E81
;============== REMAPPER FOR $1E82
;============== REMAPPER FOR $1E83
;============== REMAPPER FOR $1E84
;============== REMAPPER FOR $1E85
;============== REMAPPER FOR $1E86
;============== REMAPPER FOR $1E87
;============== REMAPPER FOR $1E88
;============== REMAPPER FOR $1E89
;============== REMAPPER FOR $1E8A
;============== REMAPPER FOR $1E8B
;============== REMAPPER FOR $1E8C
;============== REMAPPER FOR $1E8D
;============== REMAPPER FOR $1E8E
org $02AAAF
	dw $7E8E
org $02F877
	dw $7E8E
;============== REMAPPER FOR $1E8F
;============== REMAPPER FOR $1E90
;============== REMAPPER FOR $1E91
;============== REMAPPER FOR $1E92
;============== REMAPPER FOR $1E93
;============== REMAPPER FOR $1E94
;============== REMAPPER FOR $1E95
;============== REMAPPER FOR $1E96
;============== REMAPPER FOR $1E97
;============== REMAPPER FOR $1E98
;============== REMAPPER FOR $1E99
;============== REMAPPER FOR $1E9A
;============== REMAPPER FOR $1E9B
;============== REMAPPER FOR $1E9C
;============== REMAPPER FOR $1E9D
;============== REMAPPER FOR $1E9E
;============== REMAPPER FOR $1E9F
;============== REMAPPER FOR $1EA0
;============== REMAPPER FOR $1EA1
;============== REMAPPER FOR $1EA2
org $00A19E
	dw $7EA2
org $00A265
	dw $7EA2
org $048E1B
	dw $7EA2
org $048F4E
	dw $7EA2
org $048F54
	dw $7EA2
org $048F6C
	dw $7EA2
org $048F75
	dw $7EA2
org $049044
	dw $7EA2
org $0492A3
	dw $7EA2
org $0496CC
	dw $7EA2
org $0496CF
	dw $7EA2
org $04995C
	dw $7EA2
org $04995F
	dw $7EA2
org $05D9D8
	dw $7EA2
;============== REMAPPER FOR $1EA3
;============== REMAPPER FOR $1EA4
;============== REMAPPER FOR $1EA5
;============== REMAPPER FOR $1EA6
;============== REMAPPER FOR $1EA7
;============== REMAPPER FOR $1EA8
;============== REMAPPER FOR $1EA9
;============== REMAPPER FOR $1EAA
;============== REMAPPER FOR $1EAB
;============== REMAPPER FOR $1EAC
;============== REMAPPER FOR $1EAD
;============== REMAPPER FOR $1EAE
;============== REMAPPER FOR $1EAF
;============== REMAPPER FOR $1EB0
;============== REMAPPER FOR $1EB1
;============== REMAPPER FOR $1EB2
;============== REMAPPER FOR $1EB3
;============== REMAPPER FOR $1EB4
;============== REMAPPER FOR $1EB5
;============== REMAPPER FOR $1EB6
;============== REMAPPER FOR $1EB7
;============== REMAPPER FOR $1EB8
;============== REMAPPER FOR $1EB9
;============== REMAPPER FOR $1EBA
;============== REMAPPER FOR $1EBB
;============== REMAPPER FOR $1EBC
;============== REMAPPER FOR $1EBD
;============== REMAPPER FOR $1EBE
;============== REMAPPER FOR $1EBF
;============== REMAPPER FOR $1EC0
;============== REMAPPER FOR $1EC1
;============== REMAPPER FOR $1EC2
;============== REMAPPER FOR $1EC3
;============== REMAPPER FOR $1EC4
;============== REMAPPER FOR $1EC5
;============== REMAPPER FOR $1EC6
;============== REMAPPER FOR $1EC7
;============== REMAPPER FOR $1EC8
;============== REMAPPER FOR $1EC9
;============== REMAPPER FOR $1ECA
;============== REMAPPER FOR $1ECB
;============== REMAPPER FOR $1ECC
;============== REMAPPER FOR $1ECD
;============== REMAPPER FOR $1ECE
;============== REMAPPER FOR $1ECF
;============== REMAPPER FOR $1ED0
;============== REMAPPER FOR $1ED1
;============== REMAPPER FOR $1ED2
;============== REMAPPER FOR $1ED3
;============== REMAPPER FOR $1ED4
;============== REMAPPER FOR $1ED5
;============== REMAPPER FOR $1ED6
;============== REMAPPER FOR $1ED7
;============== REMAPPER FOR $1ED8
;============== REMAPPER FOR $1ED9
;============== REMAPPER FOR $1EDA
;============== REMAPPER FOR $1EDB
;============== REMAPPER FOR $1EDC
;============== REMAPPER FOR $1EDD
;============== REMAPPER FOR $1EDE
;============== REMAPPER FOR $1EDF
;============== REMAPPER FOR $1EE0
;============== REMAPPER FOR $1EE1
;============== REMAPPER FOR $1EE2
;============== REMAPPER FOR $1EE3
;============== REMAPPER FOR $1EE4
;============== REMAPPER FOR $1EE5
;============== REMAPPER FOR $1EE6
;============== REMAPPER FOR $1EE7
;============== REMAPPER FOR $1EE8
;============== REMAPPER FOR $1EE9
;============== REMAPPER FOR $1EEA
org $00AD2B
	dw $7EEA
;============== REMAPPER FOR $1EEB
org $00AA74
	dw $7EEB
org $019826
	dw $7EEB
org $01B9CD
	dw $7EEB
org $02A986
	dw $7EEB
org $0CAE0F
	dw $7EEB
;============== REMAPPER FOR $1EEC
;============== REMAPPER FOR $1EED
;============== REMAPPER FOR $1EEE
;============== REMAPPER FOR $1EEF
;============== REMAPPER FOR $1EF0
;============== REMAPPER FOR $1EF1
;============== REMAPPER FOR $1EF2
;============== REMAPPER FOR $1EF3
;============== REMAPPER FOR $1EF4
;============== REMAPPER FOR $1EF5
;============== REMAPPER FOR $1EF6
;============== REMAPPER FOR $1EF7
;============== REMAPPER FOR $1EF8
;============== REMAPPER FOR $1EF9
;============== REMAPPER FOR $1EFA
;============== REMAPPER FOR $1EFB
;============== REMAPPER FOR $1EFC
;============== REMAPPER FOR $1EFD
;============== REMAPPER FOR $1EFE
;============== REMAPPER FOR $1EFF
;============== REMAPPER FOR $1F00
;============== REMAPPER FOR $1F01
;============== REMAPPER FOR $1F02
org $048F97
	dw $7F02
org $04DA5D
	dw $7F02
org $04E461
	dw $7F02
org $04E612
	dw $7F02
org $04EA15
	dw $7F02
org $04EA1C
	dw $7F02
org $05B36D
	dw $7F02
;============== REMAPPER FOR $1F03
;============== REMAPPER FOR $1F04
;============== REMAPPER FOR $1F05
;============== REMAPPER FOR $1F06
;============== REMAPPER FOR $1F07
org $04FD86
	dw $7F07
;============== REMAPPER FOR $1F08
;============== REMAPPER FOR $1F09
;============== REMAPPER FOR $1F0A
;============== REMAPPER FOR $1F0B
;============== REMAPPER FOR $1F0C
;============== REMAPPER FOR $1F0D
;============== REMAPPER FOR $1F0E
;============== REMAPPER FOR $1F0F
;============== REMAPPER FOR $1F10
;============== REMAPPER FOR $1F11
org $0096D3
	dw $7F11
org $00A0A1
	dw $7F11
org $00A12E
	dw $7F11
org $00A54C
	dw $7F11
org $00C9DC
	dw $7F11
org $01E2F7
	dw $7F11
org $01E763
	dw $7F11
org $01EC2D
	dw $7F11
org $02DA7D
	dw $7F11
org $0392FC
	dw $7F11
org $048379
	dw $7F11
org $04850D
	dw $7F11
org $0486FE
	dw $7F11
org $048E3E
	dw $7F11
org $048EF7
	dw $7F11
org $04933C
	dw $7F11
org $049853
	dw $7F11
org $0498B6
	dw $7F11
org $049A2D
	dw $7F11
org $049A9D
	dw $7F11
org $049AA6
	dw $7F11
org $049E0C
	dw $7F11
org $04D703
	dw $7F11
org $04D761
	dw $7F11
org $04DBA4
	dw $7F11
org $04DBEC
	dw $7F11
org $04DBEF
	dw $7F11
org $04DBF4
	dw $7F11
org $04DC12
	dw $7F11
org $04DCDD
	dw $7F11
org $04EB3E
	dw $7F11
org $04F899
	dw $7F11
org $04FC4D
	dw $7F11
org $04FD7D
	dw $7F11
org $05D7CC
	dw $7F11
org $05D88C
	dw $7F11
org $05D8AF
	dw $7F11
;============== REMAPPER FOR $1F12
org $04870A
	dw $7F12
;============== REMAPPER FOR $1F13
org $0486AE
	dw $7F13
org $048722
	dw $7F13
org $048966
	dw $7F13
org $048CED
	dw $7F13
org $048D9F
	dw $7F13
org $048DAC
	dw $7F13
org $0491A9
	dw $7F13
org $0491B3
	dw $7F13
org $04927E
	dw $7F13
org $049285
	dw $7F13
org $0493FB
	dw $7F13
org $049403
	dw $7F13
org $04966C
	dw $7F13
org $049672
	dw $7F13
org $04967F
	dw $7F13
org $049685
	dw $7F13
org $0496DB
	dw $7F13
org $04979B
	dw $7F13
org $0498C7
	dw $7F13
;============== REMAPPER FOR $1F14
;============== REMAPPER FOR $1F15
org $048DB1
	dw $7F15
org $048DBE
	dw $7F15
;============== REMAPPER FOR $1F16
;============== REMAPPER FOR $1F17
org $04854E
	dw $7F17
org $048634
	dw $7F17
org $04865A
	dw $7F17
org $048DF6
	dw $7F17
org $048EC1
	dw $7F17
org $048EFE
	dw $7F17
org $048F19
	dw $7F17
org $04900B
	dw $7F17
org $0491EF
	dw $7F17
org $04932D
	dw $7F17
org $0493DE
	dw $7F17
org $0493EC
	dw $7F17
org $04947A
	dw $7F17
org $0497AF
	dw $7F17
org $049826
	dw $7F17
org $049829
	dw $7F17
org $049845
	dw $7F17
org $049918
	dw $7F17
org $049A48
	dw $7F17
org $049A64
	dw $7F17
org $04F2B4
	dw $7F17
org $04FF01
	dw $7F17
;============== REMAPPER FOR $1F18
org $04F2BB
	dw $7F18
;============== REMAPPER FOR $1F19
org $04855B
	dw $7F19
org $048643
	dw $7F19
org $048669
	dw $7F19
org $048DFF
	dw $7F19
org $048EC7
	dw $7F19
org $048F05
	dw $7F19
org $048F22
	dw $7F19
org $049014
	dw $7F19
org $0491FB
	dw $7F19
org $049325
	dw $7F19
org $0497C6
	dw $7F19
org $04984A
	dw $7F19
org $0498E0
	dw $7F19
org $0498E3
	dw $7F19
org $0498ED
	dw $7F19
org $049924
	dw $7F19
org $049A40
	dw $7F19
org $049A5E
	dw $7F19
org $049E86
	dw $7F19
org $049E8C
	dw $7F19
org $04F2C2
	dw $7F19
org $04F9DB
	dw $7F19
org $04FF21
	dw $7F19
org $05B15E
	dw $7F19
;============== REMAPPER FOR $1F1A
org $0498E7
	dw $7F1A
org $0498EA
	dw $7F1A
org $04F2C9
	dw $7F1A
org $04F9E1
	dw $7F1A
;============== REMAPPER FOR $1F1B
;============== REMAPPER FOR $1F1C
;============== REMAPPER FOR $1F1D
;============== REMAPPER FOR $1F1E
;============== REMAPPER FOR $1F1F
org $048525
	dw $7F1F
org $048555
	dw $7F1F
org $048E66
	dw $7F1F
org $0491F8
	dw $7F1F
org $04952E
	dw $7F1F
org $049586
	dw $7F1F
org $049608
	dw $7F1F
org $049921
	dw $7F1F
org $049A81
	dw $7F1F
org $05D851
	dw $7F1F
org $05D865
	dw $7F1F
;============== REMAPPER FOR $1F20
;============== REMAPPER FOR $1F21
org $04852A
	dw $7F21
org $048562
	dw $7F21
org $048E6B
	dw $7F21
org $049204
	dw $7F21
org $049533
	dw $7F21
org $04958B
	dw $7F21
org $04960D
	dw $7F21
org $04992D
	dw $7F21
org $049A78
	dw $7F21
org $05D859
	dw $7F21
org $05D873
	dw $7F21
;============== REMAPPER FOR $1F22
;============== REMAPPER FOR $1F23
;============== REMAPPER FOR $1F24
;============== REMAPPER FOR $1F25
;============== REMAPPER FOR $1F26
;============== REMAPPER FOR $1F27
org $00EEAF
	dw $7F27
org $00EEB5
	dw $7F27
org $0DB590
	dw $7F27
;============== REMAPPER FOR $1F28
;============== REMAPPER FOR $1F29
org $0DB941
	dw $7F29
;============== REMAPPER FOR $1F2A
;============== REMAPPER FOR $1F2B
;============== REMAPPER FOR $1F2C
;============== REMAPPER FOR $1F2D
;============== REMAPPER FOR $1F2E
org $00A0F7
	dw $7F2E
org $04EA1F
	dw $7F2E
;============== REMAPPER FOR $1F2F
org $00977A
	dw $7F2F
org $00F352
	dw $7F2F
org $00F355
	dw $7F2F
org $0DB2D8
	dw $7F2F
;============== REMAPPER FOR $1F30
;============== REMAPPER FOR $1F31
;============== REMAPPER FOR $1F32
;============== REMAPPER FOR $1F33
;============== REMAPPER FOR $1F34
;============== REMAPPER FOR $1F35
;============== REMAPPER FOR $1F36
;============== REMAPPER FOR $1F37
;============== REMAPPER FOR $1F38
;============== REMAPPER FOR $1F39
;============== REMAPPER FOR $1F3A
;============== REMAPPER FOR $1F3B
;============== REMAPPER FOR $1F3C
org $00F2B9
	dw $7F3C
org $00F2BC
	dw $7F3C
org $0DA5A8
	dw $7F3C
;============== REMAPPER FOR $1F3D
;============== REMAPPER FOR $1F3E
;============== REMAPPER FOR $1F3F
;============== REMAPPER FOR $1F40
;============== REMAPPER FOR $1F41
;============== REMAPPER FOR $1F42
;============== REMAPPER FOR $1F43
;============== REMAPPER FOR $1F44
;============== REMAPPER FOR $1F45
;============== REMAPPER FOR $1F46
;============== REMAPPER FOR $1F47
;============== REMAPPER FOR $1F48
org $009F09
	dw $7F48
;============== REMAPPER FOR $1F49
org $009BDF
	dw $7F49
org $009D19
	dw $7F49
org $009F17
	dw $7F49
org $00A19B
	dw $7F49
org $049047
	dw $7F49
;============== REMAPPER FOR $1F4A
;============== REMAPPER FOR $1F4B
;============== REMAPPER FOR $1F4C
;============== REMAPPER FOR $1F4D
;============== REMAPPER FOR $1F4E
;============== REMAPPER FOR $1F4F
;============== REMAPPER FOR $1F50
;============== REMAPPER FOR $1F51
;============== REMAPPER FOR $1F52
;============== REMAPPER FOR $1F53
;============== REMAPPER FOR $1F54
;============== REMAPPER FOR $1F55
;============== REMAPPER FOR $1F56
;============== REMAPPER FOR $1F57
;============== REMAPPER FOR $1F58
;============== REMAPPER FOR $1F59
;============== REMAPPER FOR $1F5A
;============== REMAPPER FOR $1F5B
;============== REMAPPER FOR $1F5C
;============== REMAPPER FOR $1F5D
;============== REMAPPER FOR $1F5E
;============== REMAPPER FOR $1F5F
;============== REMAPPER FOR $1F60
;============== REMAPPER FOR $1F61
;============== REMAPPER FOR $1F62
;============== REMAPPER FOR $1F63
;============== REMAPPER FOR $1F64
;============== REMAPPER FOR $1F65
;============== REMAPPER FOR $1F66
;============== REMAPPER FOR $1F67
;============== REMAPPER FOR $1F68
;============== REMAPPER FOR $1F69
;============== REMAPPER FOR $1F6A
;============== REMAPPER FOR $1F6B
;============== REMAPPER FOR $1F6C
;============== REMAPPER FOR $1F6D
;============== REMAPPER FOR $1F6E
;============== REMAPPER FOR $1F6F
;============== REMAPPER FOR $1F70
;============== REMAPPER FOR $1F71
;============== REMAPPER FOR $1F72
;============== REMAPPER FOR $1F73
;============== REMAPPER FOR $1F74
;============== REMAPPER FOR $1F75
;============== REMAPPER FOR $1F76
;============== REMAPPER FOR $1F77
;============== REMAPPER FOR $1F78
;============== REMAPPER FOR $1F79
;============== REMAPPER FOR $1F7A
;============== REMAPPER FOR $1F7B
;============== REMAPPER FOR $1F7C
;============== REMAPPER FOR $1F7D
;============== REMAPPER FOR $1F7E
;============== REMAPPER FOR $1F7F
;============== REMAPPER FOR $1F80
;============== REMAPPER FOR $1F81
;============== REMAPPER FOR $1F82
;============== REMAPPER FOR $1F83
;============== REMAPPER FOR $1F84
;============== REMAPPER FOR $1F85
;============== REMAPPER FOR $1F86
;============== REMAPPER FOR $1F87
;============== REMAPPER FOR $1F88
;============== REMAPPER FOR $1F89
;============== REMAPPER FOR $1F8A
;============== REMAPPER FOR $1F8B
;============== REMAPPER FOR $1F8C
;============== REMAPPER FOR $1F8D
;============== REMAPPER FOR $1F8E
;============== REMAPPER FOR $1F8F
;============== REMAPPER FOR $1F90
;============== REMAPPER FOR $1F91
;============== REMAPPER FOR $1F92
;============== REMAPPER FOR $1F93
;============== REMAPPER FOR $1F94
;============== REMAPPER FOR $1F95
;============== REMAPPER FOR $1F96
;============== REMAPPER FOR $1F97
;============== REMAPPER FOR $1F98
;============== REMAPPER FOR $1F99
;============== REMAPPER FOR $1F9A
;============== REMAPPER FOR $1F9B
;============== REMAPPER FOR $1F9C
;============== REMAPPER FOR $1F9D
;============== REMAPPER FOR $1F9E
;============== REMAPPER FOR $1F9F
;============== REMAPPER FOR $1FA0
;============== REMAPPER FOR $1FA1
;============== REMAPPER FOR $1FA2
;============== REMAPPER FOR $1FA3
;============== REMAPPER FOR $1FA4
;============== REMAPPER FOR $1FA5
;============== REMAPPER FOR $1FA6
;============== REMAPPER FOR $1FA7
;============== REMAPPER FOR $1FA8
;============== REMAPPER FOR $1FA9
org $048F9A
	dw $7FA9
;============== REMAPPER FOR $1FAA
;============== REMAPPER FOR $1FAB
;============== REMAPPER FOR $1FAC
;============== REMAPPER FOR $1FAD
;============== REMAPPER FOR $1FAE
;============== REMAPPER FOR $1FAF
;============== REMAPPER FOR $1FB0
;============== REMAPPER FOR $1FB1
;============== REMAPPER FOR $1FB2
;============== REMAPPER FOR $1FB3
;============== REMAPPER FOR $1FB4
;============== REMAPPER FOR $1FB5
;============== REMAPPER FOR $1FB6
;============== REMAPPER FOR $1FB7
;============== REMAPPER FOR $1FB8
org $009F23
	dw $7FB8
org $01E766
	dw $7FB8
org $048FD7
	dw $7FB8
org $048FDA
	dw $7FB8
;============== REMAPPER FOR $1FB9
;============== REMAPPER FOR $1FBA
org $048FC9
	dw $7FBA
org $048FCC
	dw $7FBA
;============== REMAPPER FOR $1FBB
;============== REMAPPER FOR $1FBC
;============== REMAPPER FOR $1FBD
;============== REMAPPER FOR $1FBE
org $048FAA
	dw $7FBE
org $048FAD
	dw $7FBE
;============== REMAPPER FOR $1FBF
;============== REMAPPER FOR $1FC0
org $048FB0
	dw $7FC0
org $048FB3
	dw $7FC0
;============== REMAPPER FOR $1FC1
;============== REMAPPER FOR $1FC2
;============== REMAPPER FOR $1FC3
;============== REMAPPER FOR $1FC4
;============== REMAPPER FOR $1FC5
;============== REMAPPER FOR $1FC6
org $048FB6
	dw $7FC6
org $048FB9
	dw $7FC6
;============== REMAPPER FOR $1FC7
;============== REMAPPER FOR $1FC8
org $048FBC
	dw $7FC8
org $048FBF
	dw $7FC8
;============== REMAPPER FOR $1FC9
;============== REMAPPER FOR $1FCA
;============== REMAPPER FOR $1FCB
;============== REMAPPER FOR $1FCC
;============== REMAPPER FOR $1FCD
;============== REMAPPER FOR $1FCE
;============== REMAPPER FOR $1FCF
;============== REMAPPER FOR $1FD0
;============== REMAPPER FOR $1FD1
;============== REMAPPER FOR $1FD2
;============== REMAPPER FOR $1FD3
;============== REMAPPER FOR $1FD4
;============== REMAPPER FOR $1FD5
;============== REMAPPER FOR $1FD6
org $07F783
	dw $7FD6
;============== REMAPPER FOR $1FD7
;============== REMAPPER FOR $1FD8
;============== REMAPPER FOR $1FD9
;============== REMAPPER FOR $1FDA
;============== REMAPPER FOR $1FDB
;============== REMAPPER FOR $1FDC
;============== REMAPPER FOR $1FDD
;============== REMAPPER FOR $1FDE
;============== REMAPPER FOR $1FDF
;============== REMAPPER FOR $1FE0
;============== REMAPPER FOR $1FE1
;============== REMAPPER FOR $1FE2
org $00FCC3
	dw $7FE2
org $01810F
	dw $7FE2
org $018114
	dw $7FE2
org $0191FC
	dw $7FE2
org $0195D9
	dw $7FE2
org $0199D0
	dw $7FE2
org $01D2CB
	dw $7FE2
org $01D2D2
	dw $7FE2
org $01EDA1
	dw $7FE2
org $0293CA
	dw $7FE2
org $02A9D5
	dw $7FE2
org $02C4F4
	dw $7FE2
org $02C500
	dw $7FE2
org $02DDC2
	dw $7FE2
org $02DEBD
	dw $7FE2
org $03956A
	dw $7FE2
org $0395C4
	dw $7FE2
org $039689
	dw $7FE2
org $07F74C
	dw $7FE2
;============== REMAPPER FOR $1FE3
;============== REMAPPER FOR $1FE4
;============== REMAPPER FOR $1FE5
;============== REMAPPER FOR $1FE6
;============== REMAPPER FOR $1FE7
;============== REMAPPER FOR $1FE8
;============== REMAPPER FOR $1FE9
;============== REMAPPER FOR $1FEA
;============== REMAPPER FOR $1FEB
org $03AED5
	dw $7FEB
org $03C7BA
	dw $7FEB
org $03C803
	dw $7FEB
;============== REMAPPER FOR $1FEC
;============== REMAPPER FOR $1FED
;============== REMAPPER FOR $1FEE
org $009780
	dw $7FEE
org $00F323
	dw $7FEE
org $00F326
	dw $7FEE
org $0DA59D
	dw $7FEE
;============== REMAPPER FOR $1FEF
;============== REMAPPER FOR $1FF0
;============== REMAPPER FOR $1FF1
;============== REMAPPER FOR $1FF2
;============== REMAPPER FOR $1FF3
;============== REMAPPER FOR $1FF4
;============== REMAPPER FOR $1FF5
;============== REMAPPER FOR $1FF6
;============== REMAPPER FOR $1FF7
;============== REMAPPER FOR $1FF8
;============== REMAPPER FOR $1FF9
;============== REMAPPER FOR $1FFA
;============== REMAPPER FOR $1FFB
org $03DFE0
	dw $7FFB
org $03E00E
	dw $7FFB
org $03E021
	dw $7FFB
org $04F710
	dw $7FFB
org $04F72F
	dw $7FFB
org $04F741
	dw $7FFB
;============== REMAPPER FOR $1FFC
org $03DFF6
	dw $7FFC
org $03E007
	dw $7FFC
org $04F71A
	dw $7FFC
org $04F729
	dw $7FFC
;============== REMAPPER FOR $1FFD
org $03E014
	dw $7FFD
org $03E01C
	dw $7FFD
org $03E026
	dw $7FFD
org $04F734
	dw $7FFD
org $04F73C
	dw $7FFD
org $04F746
	dw $7FFD
;============== REMAPPER FOR $1FFE
org $0081FF
	dw $7FFE
org $0C95C3
	dw $7FFE
org $0CAB5A
	dw $7FFE

endif