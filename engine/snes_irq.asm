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
; Note that the excess of HDMA channels and transfers can make even the H-DMA itself run
; out of H-Blank time!

irq_wram_copy:					; Upload address
base $1D00					; Base WRAM address

!sa1_status_cpy = snes_irq_not_ppu+1		; Self modifiable address.

snes_irq_mem:
	db $00					; $1D00: Bit 7 -- next IRQ is NMI-on-IRQ V-Blank (clears on V-Blank end).
						; $1D00: Bit 0 -- enable NMI-on-IRQ V-Blank.
	db $00					; $1D01: Which scanline to run NMI-on-IRQ execute ptr.
	db $00					; $1D02: Flag to enable Custom Timer IRQ ptr.
	db $00					; $1D03: SA-1 reg $2224 mirror.
	dl $000000				; $1D04-$1D06: Custom timer IRQ execute pointer.
	db $00					; $1D07: Reserved for future expansion.

fire_nmi_irq:					; Routine to fire IRQ-as-NMI.
	LDA.w snes_irq_mem+0			; \ IRQ-as-NMI enabled?
	BEQ .no_irq_as_nmi			;  | Set up next IRQ so it fires it.
	ORA #$80				;  |
	STA.w snes_irq_mem+0			; /
	LDA.w snes_irq_mem+1			; \ Set V-Count fire position
	STA $4209				;  |
	STZ $420A				; /
	LDA #$21				; \ Enable IRQ but no NMI.
	STA $4200				; / Keep joypad.
						;
.no_irq_as_nmi:					; \ Return
	RTS					; /
	
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
						;
	LDA $2300				; \ Get SA-1 status, copy
	STA.w !sa1_status_cpy			; / to the other variable
	AND #%10100000				; \ Mask IRQ flags and clear all IRQ
	STA $2202				; / from SA-1.
						;
						; $4211 not just tells if there's a H- or V-IRQ
						; only, but also connects to the external /IRQ
						; line responsible for the SA-1 IRQs. After clearing
						; all IRQs from SA-1, we should now know with $4211
						; if it's a timer IRQ or not.
						;
	LDA $4211				; \ If it's not a timer IRQ, branch.
	BPL .not_ppu				; /
						;
	LDA.w snes_irq_mem+0			; \ Otherwise, check if it's a IRQ-as-NMI.
	BMI .maybe_nmi				; / If so, branch.

.ppu_irq:					; Else, it's a regular timer IRQ.
	LDA.w snes_irq_mem+2			; \ If it's not a custom IRQ, branch
	BEQ .regular_ppu			; / to the normal SMW IRQ code.
	
.custom_ppu:					; If a custom IRQ...
	PHK					; \ Call the custom IRQ routine.
	PEA.w .not_ppu-1			;  |
	JML.w [snes_irq_mem+4]			; /
	
.regular_ppu:					; \ If it's a normal SMW IRQ...
	JSL irq_ppu_main			; / call the normal IRQ routine instead.

.not_ppu:					; After executing the PPU IRQ,
	LDA #$00				; This address gets stored with the SA-1 flags.
	BIT #$20				; \ If bit 5 is not set, it's not a CC1 IRQ.
	BEQ .not_cc1				; /
						;
	STA $318D				; Otherwise, set the CC1 IRQ flag.
	
.not_cc1:					; \ If bit 7 is not set, skip this.
	BPL .not_sa1				; /
						;
	CLI					; Enable interrupts
						;
	PHK					; \ Jump to the requested SA-1 pointer
	PEA.w .return-1				;  |
	JML [$3183]				; /

.maybe_nmi:					;
	ASL					; \ If bit 0-7 are unset, this is not an
	BEQ .ppu_irq				; / IRQ-as-NMI execution.

.yes_nmi:					; \ Otherwise, jump
	JML snes_nmi_main			; / to the NMI routine.
	
.return:					;
	SEP #$34				; Disable interrupts and make sure A/X/Y is 8-bit
	INC $318A				; Set ready flag.
	
.not_sa1:					; We're done
	PLA					; \ Restore BW-RAM Mapping
	STA $2224				;  |
	STA.w snes_irq_mem+3			; /
	
	REP #$30				; \ Restore all internal registers and
	PLB					;  | finish IRQ.
	PLD					;  |
	PLY					;  |
	PLX					;  |
	PLA					;  |
	RTI					; /
	
warnpc $001E00					; WRAM Memory Limit
base off

irq_wram_copy_end:

; SMW's PPU IRQ code goes below.

wait_for_hblank:				; Terrible as the original.
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
	
	JSR.w fire_nmi_irq
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
	INC $11

	LDA #$AE
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
