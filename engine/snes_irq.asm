;===============================================;
; S-CPU IRQ System                              ;
;===============================================;

; Note:
; H-Blank is not just short, but you also need to take in account that seven HDMA channels
; may be hunting for H-blank time as well.

irq_wram_copy:

base $1200

!sa1_status_cpy = snes_irq_not_ppu+1

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
	LDA $1024				; \ Preserve BW-RAM Mapping and
	STZ $1024				;  | reset to default value.
	STZ $2224				;  |
	PHA					; /
	
	LDA $2300
	STA !sa1_status_cpy
	AND #%10100000
	STA $2202
	
	LDA $4211
	BPL .not_ppu
	
	JSL $008380

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

.return:
	SEP #$34				; Disable interrupts and make sure A/X/Y is 8-bit
	INC $318A				; Set ready flag.
	
.not_sa1:
	PLA
	STA $2224
	STA $1024
	
	REP #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	RTI
	
base off

irq_wram_copy_end:

