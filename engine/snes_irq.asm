;===============================================;
; S-CPU IRQ System                              ;
;===============================================;

; H-Blank is not just short, but you also need to take in account that seven HDMA channels
; may be hunting for H-blank time as well.
;
;
; "The actual HDMA transfer begins at dot 278 of the scanline (or just after, the current
; CPU cycle is completed before pausing), for every visible scanline (0-224 or 0-239,
; depending on $2133 bit 3). For each scanline during which HDMA is active (i.e. at least
; one channel has not yet terminated for the frame), there are ~18 master cycles overhead.
; Each active channel incurs another 8 master cycles overhead for every scanline, whether
; or not a transfer actually occurs. If a new indirect address is required, 16 master
; cycles are taken to load it. Then 8 cycles per byte transferred are used."
;
; 7 * 


irq_wram_copy:

base $1D00

!sa1_status_cpy = snes_irq_not_ppu+1

snes_irq_mem:
	db $00					; $1D00: Bit 7 -- next IRQ is NMI-on-IRQ V-Blank (clears on V-Blank end).
						; $1D00: Bit 0 -- enable NMI-on-IRQ V-Blank.
	db $00					; $1D01: Which scanline to run NMI-on-IRQ execute ptr.
	db $00					; $1D02: Flag to enable Custom Timer IRQ ptr.
	db $00					; $1D03: SA-1 reg $2224 mirror.
	dl $000000				; $1D04-$1D06: Custom timer IRQ execute pointer.
	db $00					; $1D07: Reserved for future expansion.

snes_irq:					; IRQ Start
	REP #$30				; \ Preserve A/X/Y/D/B
	PHA					;  |
	PHX					;  |
	PHY					;  |
	PHD					;  |
	PHB					;  |
	PHK					;  |
	PLB					;  |
	LDA.w #$3000				;  |
	TCD					; /
	SEP #$30				; 8-bit A/X/Y
						;
	LDA.w snes_irq_mem+3			; \ Preserve BW-RAM Mapping and
	STZ.w snes_irq_mem+3			;  | reset to default value.
	STZ $2224				;  |
	PHA					; /
	
	LDA $2300
	STA !sa1_status_cpy
	AND #%10100000
	STA $2202
	
	LDA $4211
	BPL .not_ppu
	
	LDA.w snes_irq_mem+0
	BMI .maybe_nmi
	
.ppu_irq:
	LDA.w snes_irq_mem+2
	BEQ .regular_ppu
	
.custom_ppu:
	PHK
	PEA.w .not_ppu-1
	JML.w [snes_irq_mem+4]
	
.regular_ppu:
	JSL irq_ppu_main

.not_ppu:
	LDA #$00
	BIT #$20
	BEQ .not_cc1
	STA $318D
	
.not_cc1:
	BPL .not_sa1
	
	CLI					; Enable interrupts
						;
	PHK					; \ Jump to the requested SA-1 pointer
	PEA.w .return-1				;  |
	JML [$3183]				; /

.maybe_nmi:
	AND #$7F
	BEQ .ppu_irq	
.yes_nmi:
	STA.w snes_irq_mem+0
	JMP .not_sa1				; do nothing
	
.return:
	SEP #$34				; Disable interrupts and make sure A/X/Y is 8-bit
	INC $318A				; Set ready flag.
	
.not_sa1:
	PLA
	STA $2224
	STA.w snes_irq_mem+3
	
	REP #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	RTI
	
print "pointer ", pc
	
base off

irq_wram_copy_end:

; SMW's PPU IRQ code goes below.

print pc

wait_for_hblank:			; Terrible as the original.
-	BIT $4212
	BVC -
-	BIT $4212
	BVS -
	
	; dot counter will be ~12
	; each dot is 14 master cycles.
	; we want to each somewhere ~256 dots - a few to discount the RTS.
	; so we go with one around that is a multiple of 14 (minus 40) to leave everything nice.
	; 12 + (x * 14 + 40) / 4 = 256
	; 22 + (x * 14) / 4 = 256
	; (x * 14) / 4 = 234. Let's go with 224, a nice multiplier.
	; x = 224 * 4 / 14 = 64
	
	NOP #64
	; At this spot, H should be 246 dots.
	; It's okay to have some minor difference, but the
	; key is in the first PPU store is to the H counter be larger
	; than 256 dots.
	
	RTS

irq_ppu_main:
	LDA #$81

	BIT $6D9B
	BMI .mode_7
	
	STA $4200

	LDA $25
	XBA
	LDA $22
	LDX $23
	LDY $24
	
	PEA $2100
	PLD
	
	JSR wait_for_hblank
		
	STA $11
	STX $11
	STY $12
	XBA
	STA $12
	LDA $303E
	STA $05
	LDA $3040
	STA $31
	
	PEA $3000
	PLD
	RTL
	
.mode_7:
	BVC .platform
	
	LDY $11
	BEQ .first_irq

.normal:	
	STA $4200
	
	LDX $1A
	LDY $1B
	LDA $1D
	XBA
	LDA $1C
	CLC
	ADC $7888
	
	PEA $2100
	PLD
	
	JSR wait_for_hblank
	
	STX $0D
	STY $0D
	STA $0E
	XBA
	STA $0E
	
	LDA #$59
	STA $07
	LDA #$07
	STA $0B
	
	LDA $303E
	STA $05
	LDA $3040
	STA $31
	
	PEA $3000
	PLD
	RTL

.first_irq:
	INC $11					;$0083D0	 | Set first IRQ as triggered

	LDA.b #$AE
	SEC
	SBC $7888
	STA $4209
	STZ $420A
	
	LDA #$A1
	
.platform:
	LDY $7493
	BEQ .apply
	
	LDY $7495
	CPY #$40
	BCC .apply
	
	LDA #$81
	BRA .normal
	
.apply:
	STA $4200
	
	LDA $3A
	LDX $3B
	LDY $3C

	PEA $2100
	PLD
	
	JSR wait_for_hblank
	
	STA $0D
	STX $0D
	STY $0E
	LDA $303D
	STA $0E
	LDA #$07
	STA $05
	
	PEA $3000
	PLD
	RTL
