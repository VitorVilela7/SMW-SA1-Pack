@includefrom sa1.asm
; DP Remapper
; Changes all $00-$FF to $3000-$30FF.

if read1($00977C) == $9D

org $00977C
    STZ $3006,X

endif

if read1($05C42A) != $30

org $05C428
	LDY $309D

endif

if read1($864C) != $30

org $801F
	LDA #$3000	
org $80EA
	STA $3000
org $80EF
	STA $3001
org $80F4
	STA $3002
org $80FF
	STA $3000
org $8104
	STA $3001
org $8109
	STA $3002
org $8110
	STA $3000
org $8115
	STA $3001
org $811A
	STA $3002
org $814A
	STA $3000
org $814F
	STA $3001
org $8154
	STA $3002
org $815B
	STA $3000
org $8160
	STA $3001
org $8165
	STA $3002
org $86F7
	JML [$3000]
org $871B
	JML [$3000]
org $0CAE1B
	STA $3000
ORG $0CAE21
	STA $3001
ORG $0CAE26
	STA $3002
ORG $008649
	db $08,$18,$00,$30,$00,$00,$10
ORG $05B20A
	BIT $3003
ORG $05B212
	STA $3003
ORG $0CAE1B
	STA $3000
ORG $0CAE21
	STA $3001
ORG $0CAE26
	STA $3002
org $00977C
	STZ $3006,X
org $05C393
	STA $3045,X
org $05C399
	STA $3047,X
org $01ACDD+2 ; OR high byte value of opcode.
	db $30
org $02D0AD+2
	db $30
org $02FF34+2
	db $30
org $0384D1+2
	db $30
org $03B8DF+2
	db $30
org $0485BD+2
	db $30
org $05BC79+2
	db $30
org $05BCAF+2
	db $30
org $05C39C+2
	db $30
org $05C497+2
	db $30
org $0C9FFE+2
	db $30
org $0CA267+2
	db $30
org $029201 ; I missed these, lucky that I played the entire SMW just for testing :)
	LDA $301C,y
org $01A2BD
	STA $309E,x
org $01DDBE
	STA $309E,x
	
; This part are done with tool. Don't afraid: it's 100% safe.
org $00AFE2 : db $30 ; 	LDA.w $0006,Y				;$00AFE0	|
org $01B725 : db $30 ; 	STA.w $0000,Y				;$01B723	|
org $01B729 : db $30 ; 	STA.w $0001,Y				;$01B727	|
org $01D1BE+2 : db $30 ;	LDA.w $0005,Y
org $048325 : db $30 ; 	LDA.w $0001,Y				;$048323	|
org $048333 : db $30 ; 	LDA.w $0001,Y				;$048331	|
org $04F3DF : db $30 ; 	STA.w $0000,Y				;$04F3DD	|
org $04FE8C : db $30 ; 	STA.w $0000,Y				;$04FE8A	|
org $04FF7D : db $30 ; 	LDA.w $0006,Y				;$04FF7B	|
org $05C3C0 : db $30 ; 	STA.w $0055,Y				;$05C3BE	|
org $92F5+2 : db $30 ;  LDA.w $1A,Y
org $00FA50 : db $30 ; 	STA.w $9E,Y				;$00FA4E	|
org $00FA5C : db $30 ; 	STA.w $E4,Y				;$00FA5A	|
org $00FA6B : db $30 ; 	STA.w $D8,Y				;$00FA69	|
org $FAA3+2 : db $30 ;	LDA.w $9E,Y
org $FB10+2 : db $30 ;	LDA.w $9E,Y
org $FB55+2 : db $30 ;	STA.w $9E,Y
org $00FB72 : db $30 ; 	STA.w $AA,Y				;$00FB70	|
org $00FB77 : db $30 ; 	STA.w $B6,Y				;$00FB75	|
org $00FB94 : db $30 ; 	LDA.w $D8,Y				;$00FB92	|
org $00FB9A : db $30 ; 	LDA.w $E4,Y				;$00FB98	|
org $00FC2E : db $30 ; 	LDA.w $9E,Y				;$00FC2C	|
org $00FC51 : db $30 ; 	STA.w $E4,Y				;$00FC4F	|
org $00FC5D : db $30 ; 	STA.w $D8,Y				;$00FC5B	|
org $00FC67 : db $30 ; 	STA.w $C2,Y				;$00FC65	|
org $00FC71 : db $30 ; 	STA.w $B6,Y				;$00FC6F	|
org $01847B : db $30 ; 	LDA.w $9E,Y				;$018479	|
org $0184A8 : db $30 ; 	STA.w $9E,Y				;$0184A6	|
org $0184B2 : db $30 ; 	STA.w $E4,Y				;$0184B0	|
org $0184BD : db $30 ; 	STA.w $D8,Y				;$0184BB	|
org $0188AC+2 : db $30 ;LDA.w $E4,Y
org $0188C1 : db $30 ; 	LDA.w $D8,Y				;$0188BF	|
org $01897E : db $30 ; 	SBC.w $E4,Y				;$01897C	|
org $018997 : db $30 ; 	STA.w $B6,Y				;$018995	|
org $0189A2 : db $30 ; 	STA.w $C2,Y				;$0189A0	|
org $0189B3 : db $30 ; 	STA.w $AA,Y				;$0189B1	|
org $018A35 : db $30 ; 	STA.w $B6,Y				;$018A33	|
org $018A4A : db $30 ; 	LDA.w $B6,Y				;$018A48	|
org $018A5C : db $30 ; 	STA.w $B6,Y				;$018A5A	|
org $018A6F : db $30 ; 	STA.w $B6,Y				;$018A6D	|
org $018AAE : db $30 ; 	LDA.w $AA,Y				;$018AAC	|
org $018AB3 : db $30 ; 	LDA.w $9E,Y				;$018AB1	|
org $0196F4 : db $30 ; 	STA.w $9E,Y				;$0196F2	|
org $019701 : db $30 ; 	STA.w $E4,Y				;$0196FF	|
org $01970C : db $30 ; 	STA.w $D8,Y				;$01970A	|
org $019731 : db $30 ; 	STA.w $AA,Y				;$01972F	|
org $019744 : db $30 ; 	STA.w $B6,Y				;$019742	|
org $019753 : db $30 ; 	STA.w $B6,Y				;$019751	|
org $01977F : db $30 ; 	STA.w $9E,Y				;$01977D	|
org $019784 : db $30 ; 	STA.w $E4,Y				;$019782	|
org $01978F : db $30 ; 	STA.w $D8,Y				;$01978D	|
org $0197A1 : db $30 ; 	STA.w $AA,Y				;$01979F	|
org $01A0E2+2 : db $30 ;LDA.w $94,Y
org $01A0E9 : db $30 ; 	LDA.w $95,Y				;$01A0E7	|
org $01A0EE : db $30 ; 	LDA.w $96,Y				;$01A0EC	|
org $01A0F3 : db $30 ; 	LDA.w $97,Y				;$01A0F1	|
org $01A29C : db $30 ; 	LDA.w $9E,Y				;$01A29A	|
org $01A336 : db $30 ; 	STA.w $E4,Y				;$01A334	|
org $01A346 : db $30 ; 	STA.w $D8,Y				;$01A344	|
org $01A448 : db $30 ; 	LDA.w $E4,Y				;$01A446	|
org $01A488+2 : db $30 ;LDA.w $D8,Y
org $01A4EB : db $30 ; 	LDA.w $9E,Y				;$01A4E9	|
org $01A572 : db $30 ; 	SBC.w $E4,Y				;$01A570	|
org $01A5C4+2 : db $30 ;LDA.w $9E,Y
org $01A5F8+2 : db $30 ;STA.w $B6,Y
org $01A5FF : db $30 ; 	STA.w $AA,Y				;$01A5FD	|
org $01A638 : db $30 ; 	STA.w $AA,Y				;$01A636	|
org $01A676 : db $30 ; 	LDA.w $B6,Y				;$01A674	|
org $01A69D+2 : db $30 ;LDA.w $9E,Y
org $01A6B5 : db $30 ; 	STA.w $AA,Y				;$01A6B3	|
org $01A6D5 : db $30 ; 	STA.w $B6,Y				;$01A6D3	|
org $01A6FD : db $30 ; 	SBC.w $E4,Y				;$01A6FB	|
org $01A735 : db $30 ; 	LDA.w $9E,Y				;$01A733	|
org $01A74F : db $30 ; 	STA.w $AA,Y				;$01A74D	|
org $01A7A9 : db $30 ; 	STA.w $E4,Y				;$01A7A7	|
org $01AE52 : db $30 ; 	LDA.w $9E,Y				;$01AE50	|
org $01AE5B : db $30 ; 	STA.w $C2,Y				;$01AE59	|
org $01BDC6 : db $30 ; 	LDA.w $9E,Y				;$01BDC4	|
org $01BF36 : db $30 ; 	STA.w $9E,Y				;$01BF34	|
org $01BF3B : db $30 ; 	STA.w $E4,Y				;$01BF39	|
org $01BF49 : db $30 ; 	STA.w $D8,Y				;$01BF47	|
org $01BF63 : db $30 ; 	STA.w $AA,Y				;$01BF61	|
org $01BF68 : db $30 ; 	STA.w $B6,Y				;$01BF66	|
org $01C2DE : db $30 ; 	LDA.w $9E,Y				;$01C2DC	|
org $01D072 : db $30 ; 	STA.w $9E,Y				;$01D070	|
org $01D083 : db $30 ; 	STA.w $D8,Y				;$01D081	|
org $01D099 : db $30 ; 	STA.w $E4,Y				;$01D097	|
org $01D0B6 : db $30 ; 	STA.w $B6,Y				;$01D0B4	|
org $01DEB2+2 : db $30 ;LDA.w $C2,Y
org $01DEB9 : db $30 ; 	LDA.w $D8,Y				;$01DEB7	|
org $01DEC1 : db $30 ; 	STA.w $D8,Y				;$01DEBF	|
org $01DEC4 : db $30 ; 	LDA.w $E4,Y				;$01DEC2	|
org $01DECC : db $30 ; 	STA.w $E4,Y				;$01DECA	|
org $01DFFA+2 : db $30 ;LDA.w $D8,Y
org $01E003 : db $30 ; 	LDA.w $E4,Y				;$01E001	|
org $01E1D3 : db $30 ; 	LDA.w $9E,Y				;$01E1D1	|
org $01E7E6 : db $30 ; 	LDA.w $9E,Y				;$01E7E4	|
org $01E8AE : db $30 ; 	STA.w $E4,Y				;$01E8AC	|
org $01E8BC : db $30 ; 	STA.w $D8,Y				;$01E8BA	|
org $01EA37+2 : db $30 ;STA.w $9E,Y
org $01EA3E : db $30 ; 	STA.w $E4,Y				;$01EA3C	|
org $01EA49 : db $30 ; 	STA.w $D8,Y				;$01EA47	|
org $01EC94 : db $30 ; 	STA.w $9E,Y				;$01EC92	|
org $01ECA5 : db $30 ; 	STA.w $E4,Y				;$01ECA3	|
org $01ECBA : db $30 ; 	STA.w $D8,Y				;$01ECB8	|
org $01F15F : db $30 ; 	LDA.w $9E,Y				;$01F15D	|
org $01F205 : db $30 ; 	STA.w $E4,Y				;$01F203	|
org $01F217 : db $30 ; 	STA.w $D8,Y				;$01F215	|
org $01F222 : db $30 ; 	STA.w $C2,Y				;$01F220	|
org $01F248 : db $30 ; 	STA.w $B6,Y				;$01F246	|
org $01F24D : db $30 ; 	STA.w $AA,Y				;$01F24B	|
org $01F260 : db $30 ; 	LDA.w $9E,Y				;$01F25E	|
org $01F2EE : db $30 ; 	LDX.w $9E,Y				;$01F2EC	|
org $01F2F6 : db $30 ; 	STA.w $9E,Y				;$01F2F4	|
org $01F362 : db $30 ; 	LDA.w $9E,Y				;$01F360	|
org $01F36E : db $30 ; 	STA.w $9E,Y				;$01F36C	|
org $01F386 : db $30 ; 	LDA.w $9E,Y				;$01F384	|
org $01F38D : db $30 ; 	LDA.w $C2,Y				;$01F38B	|
org $01F396 : db $30 ; 	STA.w $9E,Y				;$01F394	|
org $01F39F+2 : db $30 ;	LDA.w $9E,Y
org $01F3B9 : db $30 ; 	STA.w $9E,Y				;$01F3B7	|
org $01F3E1 : db $30 ; 	LDA.w $C2,Y				;$01F3DF	|
org $01F4DB : db $30 ; 	STA.w $E4,Y				;$01F4D9	|
org $01F50E : db $30 ; 	STA.w $D8,Y				;$01F50C	|
org $01F51B : db $30 ; 	STA.w $AA,Y				;$01F519	|
org $01F51E : db $30 ; 	STA.w $B6,Y				;$01F51C	|
org $01F5A7+2 : db $30 ;	LDA.w $9E,Y
org $01F5B6 : db $30 ; 	SBC.w $D8,Y				;$01F5B4	|
org $01F5D0 : db $30 ; 	STA.w $9E,Y				;$01F5CE	|
org $01F5D5 : db $30 ; 	STA.w $E4,Y				;$01F5D3	|
org $01F5DF : db $30 ; 	STA.w $D8,Y				;$01F5DD	|
org $01F5F4 : db $30 ; 	STA.w $C2,Y				;$01F5F2	|
org $01F649 : db $30 ; 	LDA.w $9E,Y				;$01F647	|
org $01F67B : db $30 ; 	LDA.w $9E,Y				;$01F679	|
org $01F6A3+2 : db $30 ;	LDA.w $9E,Y
org $01F6AF : db $30 ; 	SBC.w $D8,Y				;$01F6AD	|
org $01F6B4+2 : db $30 ;	LDA.w $9E,Y
org $01F6BD : db $30 ; 	LDA.w $C2,Y				;$01F6BB	|
	;LDA.w $C2,Y
org $01FDC0 : db $30 ; 	STA.w $9E,Y				;$01FDBE	|
org $01FDDB : db $30 ; 	STA.w $E4,Y				;$01FDD9	|
org $01FDE9 : db $30 ; 	STA.w $D8,Y				;$01FDE7	|
org $028171 : db $30 ; 	STA.w $AA,Y				;$02816F	|
org $028176 : db $30 ; 	STA.w $B6,Y				;$028174	|
org $0289EA : db $30 ; 	LDA.w $9E,Y				;$0289E8	|
ORG $01F6E5+2 : db $30 ;	LDA.w $1C,Y
org $029208 : db $30 ; 	LDA.w $1A,Y				;$029206	|
org $02920D : db $30 ; 	LDA.w $1D,Y				;$02920B	|
org $029212 : db $30 ; 	LDA.w $1B,Y				;$029210	|
org $029A10 : db $30 ; 	LDA.w $1C,Y				;$029A0E	|
org $029A15 : db $30 ; 	LDA.w $1A,Y				;$029A13	|
org $029A1A : db $30 ; 	LDA.w $1D,Y				;$029A18	|
org $02AE65 : db $30 ; 	LDA.w $1C,Y				;$02AE63	|
org $02AE6A : db $30 ; 	LDA.w $1A,Y				;$02AE68	|
org $02B11F : db $30 ; 	STA.w $9E,Y				;$02B11D	|
org $02B134 : db $30 ; 	STA.w $E4,Y				;$02B132	|
org $02B144 : db $30 ; 	STA.w $D8,Y				;$02B142	|
org $02B151 : db $30 ; 	STA.w $C2,Y				;$02B14F	|
org $02B3F4 : db $30 ; 	STA.w $9E,Y				;$02B3F2	|
org $02B3FA : db $30 ; 	STA.w $E4,Y				;$02B3F8	|
org $02B406 : db $30 ; 	STA.w $D8,Y				;$02B404	|
org $02B4B5 : db $30 ; 	STA.w $9E,Y				;$02B4B3	|
org $02B4BB : db $30 ; 	STA.w $E4,Y				;$02B4B9	|
org $02B4CA : db $30 ; 	STA.w $D8,Y				;$02B4C8	|
org $02B7DD : db $30 ; 	LDA.w $D8,Y				;$02B7DB	|
org $02B83D : db $30 ; 	STA.w $9E,Y				;$02B83B	|
org $02B842 : db $30 ; 	STA.w $E4,Y				;$02B840	|
org $02B856 : db $30 ; 	STA.w $D8,Y				;$02B854	|
org $02B868 : db $30 ; 	STA.w $B6,Y				;$02B866	|
org $02B86D : db $30 ; 	STA.w $AA,Y				;$02B86B	|
org $02B875 : db $30 ; 	STA.w $C2,Y				;$02B873	|
org $02B9DD : db $30 ; 	STA.w $9E,Y				;$02B9DB	|
org $02BAC9 : db $30 ; 	STA.w $9E,Y				;$02BAC7	|
org $02BACE : db $30 ; 	STA.w $E4,Y				;$02BACC	|
org $02BADC : db $30 ; 	STA.w $D8,Y				;$02BADA	|
org $02C1A9 : db $30 ; 	STA.w $9E,Y				;$02C1A7	|
org $02C1C8 : db $30 ; 	STA.w $E4,Y				;$02C1C6	|
org $02C1D6 : db $30 ; 	STA.w $B6,Y				;$02C1D4	|
org $02C1DF : db $30 ; 	STA.w $D8,Y				;$02C1DD	|
org $02C1EC : db $30 ; 	STA.w $AA,Y				;$02C1EA	|
org $02C5CB : db $30 ; 	STA.w $9E,Y				;$02C5C9	|
org $02C5D0 : db $30 ; 	STA.w $E4,Y				;$02C5CE	|
org $02C5DB : db $30 ; 	STA.w $D8,Y				;$02C5D9	|
org $02C5F0 : db $30 ; 	STA.w $B6,Y				;$02C5EE	|
org $02C5F6 : db $30 ; 	STA.w $AA,Y				;$02C5F4	|
org $02D2D7 : db $30 ; 	LDA.w $E4,Y				;$02D2D5	|
org $02D2E1 : db $30 ; 	LDA.w $D8,Y				;$02D2DF	|
org $02DB6F : db $30 ; 	LDA.w $9E,Y				;$02DB6D	|
org $02DB81 : db $30 ; 	STA.w $E4,Y				;$02DB7F	|
org $02DB8F : db $30 ; 	STA.w $D8,Y				;$02DB8D	|
org $02DC06 : db $30 ; 	STA.w $AA,Y				;$02DC04	|
org $02DD99 : db $30 ; 	STA.w $9E,Y				;$02DD97	|
org $02DDA5 : db $30 ; 	STA.w $E4,Y				;$02DDA3	|
org $02DDB2 : db $30 ; 	STA.w $D8,Y				;$02DDB0	|
org $02EA6C : db $30 ; 	LDA.w $9E,Y				;$02EA6A	|
org $02EAC1 : db $30 ; 	CMP.w $E4,Y				;$02EABF	|
org $02EB01 : db $30 ; 	STA.w $9E,Y				;$02EAFF	|
org $02EB06 : db $30 ; 	STA.w $E4,Y				;$02EB04	|
org $02EB11 : db $30 ; 	STA.w $D8,Y				;$02EB0F	|
org $02EDA2 : db $30 ; 	STA.w $9E,Y				;$02EDA0	|
org $02EDA7 : db $30 ; 	STA.w $D8,Y				;$02EDA5	|
org $02EDBB : db $30 ; 	STA.w $E4,Y				;$02EDB9	|
org $02EDE6+2 : db $30 ;	LDA.w $9E,Y
org $02EE28 : db $30 ; 	LDA.w $9E,Y				;$02EE26	|
org $02EF84 : db $30 ; 	STA.w $9E,Y				;$02EF82	|
org $02EF89 : db $30 ; 	STA.w $E4,Y				;$02EF87	|
org $02EF94 : db $30 ; 	STA.w $D8,Y				;$02EF92	|
org $02F557 : db $30 ; 	STA.w $9E,Y				;$02F555	|
org $038667 : db $30 ; 	LDA.w $9E,Y				;$038665	|
org $038AE8 : db $30 ; 	STA.w $9E,Y				;$038AE6	|
org $038AFF : db $30 ; 	STA.w $E4,Y				;$038AFD	|
org $038B15 : db $30 ; 	STA.w $D8,Y				;$038B13	|
org $039AD5 : db $30 ; 	STA.w $9E,Y				;$039AD3	|
org $039ADA : db $30 ; 	STA.w $E4,Y				;$039AD8	|
org $039AE5 : db $30 ; 	STA.w $D8,Y				;$039AE3	|
org $03A6D1 : db $30 ; 	LDA.w $9E,Y				;$03A6CF	|
org $03A804 : db $30 ; 	STA.w $9E,Y				;$03A802	|
org $03A80B : db $30 ; 	STA.w $E4,Y				;$03A809	|
org $03A81B : db $30 ; 	STA.w $D8,Y				;$03A819	|
org $03A8F1 : db $30 ; 	STA.w $9E,Y				;$03A8EF	|
org $03A8F9 : db $30 ; 	STA.w $E4,Y				;$03A8F7	|
org $03A909 : db $30 ; 	STA.w $D8,Y				;$03A907	|
org $03B034 : db $30 ; 	STA.w $9E,Y				;$03B032	|
org $03B03C : db $30 ; 	STA.w $D8,Y				;$03B03A	|
org $03B059 : db $30 ; 	STA.w $E4,Y				;$03B057	|
org $03B146 : db $30 ; 	STA.w $B6,Y				;$03B144	|
org $03B14C : db $30 ; 	LDA.w $AA,Y				;$03B14A	|
org $03B154 : db $30 ; 	STA.w $AA,Y				;$03B152	|
org $03B6B5 : db $30 ; 	ADC.w $E4,Y				;$03B6B3	|
org $03B6D2 : db $30 ; 	ADC.w $D8,Y				;$03B6D0	|
org $03B6FB : db $30 ; 	ADC.w $E4,Y				;$03B6F9	|
org $03B718 : db $30 ; 	ADC.w $D8,Y				;$03B716	|
org $03C043 : db $30 ; 	LDA.w $9E,Y				;$03C041	|
org $03C21A : db $30 ; 	LDA.w $9E,Y				;$03C218	|
org $03C221 : db $30 ; 	LDA.w $C2,Y				;$03C21F	|
org $03C226 : db $30 ; 	STA.w $C2,Y				;$03C224	|
org $03C4F1 : db $30 ; 	LDA.w $9E,Y				;$03C4EF	|
org $03C7D9 : db $30 ; 	STA.w $9E,Y				;$03C7D7	|
org $03C7E6 : db $30 ; 	STA.w $D8,Y				;$03C7E4	|
org $03C80A : db $30 ; 	STA.w $E4,Y				;$03C808	|
org $03CBBD : db $30 ; 	STA.w $9E,Y				;$03CBBB	|
org $03CBCE : db $30 ; 	STA.w $D8,Y				;$03CBCC	|
org $03CBEC : db $30 ; 	STA.w $E4,Y				;$03CBEA	|
org $03CBFC : db $30 ; 	STA.w $B6,Y				;$03CBFA	|
org $03CC01 : db $30 ; 	STA.w $AA,Y				;$03CBFF	|
org $03CCF1 : db $30 ; 	STA.w $9E,Y				;$03CCEF	|
org $03CD03 : db $30 ; 	STA.w $C2,Y				;$03CD01	|
org $03CD0E : db $30 ; 	STA.w $E4,Y				;$03CD0C	|
org $03CD19 : db $30 ; 	STA.w $D8,Y				;$03CD17	|
org $04F3D8 : db $30 ; 	SBC.w $1A,Y				;$04F3D6	|
org $04FE89 : db $30 ; 	SBC.w $1A,Y				;$04FE87	|
	
endif