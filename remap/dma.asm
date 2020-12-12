; DMA remap v3.0 by Vitor Vilela, based on wiiqwertyuiop's DMA remap

; ch 0 -> reserved for logic DMA
; ch 1 -> windowing HDMA
; ch 2 -> reserved for blanking DMA
; ch 3 to 7 -> HDMA channels

; recommended to use early channels for H-blanking sensitive DMAs
; and latter channels for other cases.

; Use channel 1 for windowing HDMA.
!window_hdma_channel 		= 1

!window_hdma_offset			= (!window_hdma_channel<<4)
!window_hdma_enable_bit		= (1<<(!window_hdma_channel))

print hex(!window_hdma_offset)
print hex(!window_hdma_enable_bit)

org $0092D7
STA.w $4300|!window_hdma_offset,x

org $0092E5
STA.w $4307|!window_hdma_offset

org $009255
STA.w $4300|!window_hdma_offset,x

org $00925D
STA.w $4307|!window_hdma_offset

org $0092E8
LDA.b #$60|!window_hdma_enable_bit ; use channels 5, 6 and 1 for credits!

org $05B294
LDA.b #$00|!window_hdma_enable_bit

org $00CB0A
LDA.b #$00|!window_hdma_enable_bit

org $03C50F
LDA.b #$00|!window_hdma_enable_bit

org $04DB97
LDA.b #$00|!window_hdma_enable_bit

org $0CAB96
LDA.b #$00|!window_hdma_enable_bit

org $0092A0
LDA.b #$00|!window_hdma_enable_bit

; NMI-DMA goes to channel 2.

; Logic DMA does not matter if it goes to channel 0 or 2,
; as long interrupts are disabled.

org $008449
STZ $4320

org $008454
STA $4321

org $00845A
STA $4323

org $008460
STA $4325

org $008463
LDY #$04               

org $00923D
STA $4320,x

org $009243
LDA #$04

org $0098C0
STA $4320

org $0098CD
STA $4322

org $0098D2
STA $4324

org $0098D8
STA $4325

org $0098DB
LDY #$04

org $0098FC
STA $4320

org $009901
STA $4324

org $00990E
STA $4322

org $009918
STA $4325

org $009904
LDX #$04

org $00A311
STA $4320

org $00A317
STA $4322

org $00A31C
STY $4324

org $00A322
STA $4325

org $00A302
LDX #$04

org $00A330
STA $4320

org $00A33C
STA $4322

org $00A341
STY $4324

org $00A347
STA $4325

org $00A358
STA $4322               

org $00A35E
STA $4325               

org $00A361
LDY #$04                

org $00A378
STA $4322               

org $00A37E
STA $4325               

org $00A381
LDY #$04                

org $00A39A
STA $4320               

org $00A39F
STY $4324               

org $00A3A2
LDX #$04                

org $00A3AF
STA $4322               

org $00A3B5
STA $4325               

org $00A3C6
STA $4322               

org $00A3CC
STA $4325               

org $00A3E2
STA $4322               

org $00A3E8
STA $4325               

org $00A3F3
STA $4322               

org $00A3F9
STA $4325               

org $00A40C
STA $4322               

org $00A412
STA $4325               

org $00A44E
STA $4320               

org $00A454
STA $4322               

org $00A459
STY $4324               

org $00A45F
STA $4325               

org $00A462
LDX #$04                

org $00A470
STA $4322               

org $00A476
STA $4325               

org $00A4A4
STX $4324               

org $00A4A7
STA $4325               

org $00A4AC
STZ $4326               

org $00A4BA
STA $4320               

org $00A4BF
STA $4322               

org $00A4C8
LDA #$04                

org $00A4F3
STY $4320               

org $00A4F9
STY $4322               

org $00A4FC
STZ $4324               

org $00A502
STY $4325               

org $00A505
LDA #$04               

org $00A7D2
STA $4320               

org $00A7D8
STA $4322               

org $00A7DD
STX $4324               

org $00A7E3
STA $4325               

org $00A7E6
LDX #$04                

org $00A7F4
STA $4322               

org $00A7FA
STA $4325               

org $00A809
STA $4322               

org $00A80F
STA $4325               

org $00A81E
STA $4322               

org $00A824
STA $4325               

org $008611
STA $4320,x

org $008617
LDY #$04

org $008632
STA $4320,x

org $00863A
STA $4321

org $00874E
STA $4320               

org $008766
STA $4322               

org $008769
STX $4325               

org $008777
LDA #$04

org $00877E
STA $4321               

org $00878C
STA $4322               

org $00878F
STX $4325               

org $0087A5
LDA #$04

org $0087D6
STA $4320,X   

org $0087DC
LDA #$04                

org $0087F8
STA $4320,X 

org $0087FE
LDA #$04


org $008818
STA $4320,X 

org $00881E
LDA #$04                


org $00883B
STA $4320,X  

org $008841
LDA #$04                


org $00885F
STA $4320,X            

org $008865
LDA #$04 


org $008881
STA $4320,X

org $008889
STA $4325               

org $00888C
LDA #$04  


org $0088A8
STA $4320,X

org $0088AE
LDA #$04 


org $0088CD
STA $4320,X 

org $0088D5
STA $4325               

org $0088D8
LDA #$04                


org $008909
STA $4320,X 

org $00890F
LDA #$04                


org $00892B
STA $4320,X 

org $008931
LDA #$04 


org $00894B
STA $4320,X  

org $008951
LDA #$04


org $00896E
STA $4320,X  

org $008974
LDA #$04


org $008992
STA $4320,X 

org $008998
LDA #$04


org $0089B4
STA $4320,X 

org $0089BC
STA $4325               

org $0089BF
LDA #$04    


org $0089DB
STA $4320,X  

org $0089E1
LDA #$04


org $008A00
STA $4320,X 

org $008A08
STA $4325               

org $008A0B
LDA #$04 


org $008D13
STA $4320,X             

org $008D19
LDA #$04 


org $008D32
STA $4320,X 

org $008D38
LDA #$04


org $008D51
STA $4320,X             

org $008D57
LDA #$04


org $008D70
STA $4320,X 

org $008D76
LDA #$04                

; status bar already optimized
org $008DBE
STA $4320,X             

org $008DC4
LDA #$04                


org $008DDB
STA $4320,X             

org $008DE1
LDA #$04                


org $00A53F
STA $4320,X  

org $00A552
STA $4323               

org $00A555
LDA $4323               

org $00A55C
STA $4323               

org $00A55F
LDA #$04  


org $00A57A
STA $4320,X 

org $00A580
LDA #$04  


org $04D754
STA $4320,x

org $04D76A
LDA #$04 


org $0C9580
STA $4320,Y   


org $0C958C
ORA $4323               

org $0C958F
STA $4323               

org $0C9592
LDA #$04 

org $0C95AB
STA $4320,Y  

org $0C95B7
ORA $4323               

org $0C95BA
STA $4323               

org $0C95BD
LDA #$04

org $008720
STA $4324               

org $00873E
STA $4321

org $04D767
STA $4323               


