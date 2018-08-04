sa1rom

org $8A60 ; Change bank switch
db $04,$05,$06,$07


norom ; pc address mode

org $7FFFFF
db $00 ; expand ROM to 8MB

org $407FB8
db "S","T","A","R"
dw $003F
dw $FFC0

org $407FC0 ; copy header
dd read4($7FC0)
dd read4($7FC4)
dd read4($7FC8)
dd read4($7FCC)
dd read4($7FD0)
dd read4($7FD4)
dd read4($7FD8)
dd read4($7FDC)
dd read4($7FE0)
dd read4($7FE4)
dd read4($7FE8)
dd read4($7FEC)
dd read4($7FF0)
dd read4($7FF4)
dd read4($7FF8)
dd read4($7FFC)

org $7FD7
db $0D ; 33Mbit~64Mbit
org $407FD7
db $0D ; 33MBit~64Mbit

