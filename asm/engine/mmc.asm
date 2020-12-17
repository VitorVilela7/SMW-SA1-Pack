;===============================================;
; Super MMC Routines                            ;
;===============================================;

mmc_rom_reset:
	BIT $318E				; Set overflow if the ROM is swapped.
.direct:
	LDX #$03				; For each Super MMC register
						;
-	LDA.l bank_switch,x			; \ Load bank switch value and set
	BVC +					;  | the correct value to the
	EOR #$04				;  | bank switch register.
+	STA $2220,x				; /
						;
	DEX					; \ Loop though each register.
	BPL -					; /
						;
	RTL					; Return
	



	