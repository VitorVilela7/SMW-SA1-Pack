!ZSNES = 1 ; choose 1 for ZSNES support (eats 128 KB) or 0 to not (eats 64 bytes)

sa1rom

org $8A60 ; Change bank switch
db $04,$05,$06,$07


norom ; pc address mode

org $5FFFFF
db $00 ; expand ROM to 6MB

if !ZSNES == 0
	org $407FB8
	db "S","T","A","R"
	dw $003F
	dw $FFC0
else
	org $400000
	fillbyte $55 : fill $010000
	org $410000
	fillbyte $55 : fill $010000

	org $400000
	db "S","T","A","R"
	dw $FFF7
	dw $0008
	org $410000
	db "S","T","A","R"
	dw $FFF7
	dw $0008
	org $410000
endif

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

