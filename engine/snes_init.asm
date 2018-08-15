;===============================================;
; S-CPU Initialization System                   ;
;===============================================;

macro init_block_ram_copy(label)
	LDA.w #<label>_end-<label>-1
	LDX.w #<label>
	MVN $00,<label>>>16
endmacro

snes_init_swap_bug:
	REP #$28				; \ Disable decimal mode, A = 16-bit
	SEP #$50				; / X/Y = 8-bit, set overflow.
	BRA snes_init_continue			; Return to initialization code.

snes_init:					; SNES reset vector
	SEI					; \ Disable interrupts and emulation mode
	CLC					;  |
	XCE					; /
	
	BCC .swap_bug				; \ If emulation mode is already disabled,
						; / this means the game already booted.
	
	REP #$68				; \ Disable decimal mode, A = 16-bit
	SEP #$10				; / X/Y = 8-bit, clear overflow.
.continue:

	; If overflow flag is set, it means that the game was booted before and had its
	; emulation mode disabled. Usually that happens when the game is booted on another
	; position and it had to jump back to the correct initialization vector. This is
	; the procedure done for the Snes9x 8MB swap bug.
	
	LDA #$3000				; \ Set up Direct Page and Stack pointer.
	TCD					;  |
	LDA #$1FFF				;  |
	TCS					; /
						;
	LDA #$0020				; \ Set SA-1 to sleep/reset state.
	STA $2200				; /
						;
	LDA #Reset				; \ Set up SA-1 Vectors
	STA $2203				;  |
	LDA #NMI				;  |
	STA $2205				;  |
	LDA #IRQ				;  |
	STA $2207				; /
						;
	SEP #$20				; A = 8-bit
						;
	JSL mmc_rom_reset_direct		; Reset SA-1 bank switching.
						;
	LDA #$80				; \ Disable BW-RAM write protection (S-CPU)
	STA $2226				; /
						;
	STZ $2224				; \ Map $6000-$7FFF to $40:0000-$40:1FFF (S-CPU)
	;STZ.w snes_irq_mem+3			; / <-- no initialization required because of the block copy.
						;
	STZ $2228				; Disable BW-RAM write protection area.
						;
	LDA #$FF				; \ Enable I-RAM Write (S-CPU)
	STA $2229				; /
						;
	LDA #$A0				; \ Allows IRQs from SA-1 CPU
	STA $2201				;  | and IRQs from Character Conversion 1.
	STA $2202				; /
						;
	STZ $2200				; Enable and reset SA-1.
						;
	STZ $318E				; Clear miscellaneous flags
	STZ $3189				; Clear initialization flag
						;
	BVC +					; \ Set swap flag if overflow is set.
	LDA #$40				;  |
	TSB $318E				;  |
+						; /
						;
	SED					; \ Detect ZSNES
	LDA #$FF				;  |
	CLC					;  |	
	ADC #$FF				;  |
	CLD					;  |
	CMP #$64				;  |
	BNE +					;  |
	LDA #$80				;  |
	TSB $318E				;  |
+						; /

	REP #$30				; 16-bit A/X/Y
	LDY #$1E80				; Set base write W-RAM address
						;
	%init_block_ram_copy(wram_copy)		; Copy SA-1 call routine to $1E80.
						;
	;LDY #$1000				; Copy new WRAM content starting $1000.
	;%init_block_ram_copy(wram_copy1)	;
	LDY #$1D00				; \ Copy IRQ
	%init_block_ram_copy(irq_wram_copy)	; /
	
	LDA $318D
	BPL +
	LDY #$1D00
	%init_block_ram_copy(zsnes_irq_wram_copy)
+
	
	SEP #$30				;
						;
	JSR $1E85				; Wait for SA-1.
						;
	JML $008000				; Don't re-enable emulation mode to don't reset Stack and Direct Page.
	
	
wram_copy:
	
base $1E80					; Base to WRAM address

ram_sa1_call:					; SA-1 call
	LDA #$80				; \ Send IRQ to SA-1
	STA $2200				; / with message 00h
						;
-	LDA $3189				; \ Wait until SA-1 finishes processing.
	BEQ -					; /
						;
	STZ $3189				; \ Clear finish flag from SA-1 and
	RTS					; / return.
.end:

ram_main_loop:					; Main loop wait.
	WAI					; Wait for an interrupt.
.start:						;
	LDA $10					; \ If game video update wasn't executed
	BEQ ram_main_loop			; / yet, wait for the next interrupt.
						;
	JMP $806F				; Return to the main loop.
.end:

base off

wram_copy_end:

base $1000

wram_copy1:

; REP #$20
; LDA #pointer
; LDY #pointer>>16
; JSR $1000
; return: 8-bit A/X/Y

ram_fast_sa1_call:
	STA $3180				; \ Store pointer to SA-1 ptr.
	STY $3182				; /
	LDY #$80				; \ Call SA-1
	STY $2200				; /
	SEP #$20				; 8-bit A
.wait:
	LDA $3189				; \ Wait until C-CPU is done.
	BEQ .wait				; /
	
	STZ $3189				; \ Clear status and return.
	RTS					; /

wram_copy1_end:
base off
