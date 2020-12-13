
macro remap_memory()
	!ptr #= $070000|read2(!count*2+$05EC00)
    
    !spr_bit #= read1(!ptr)
    !spr_mask = !spr_bit&$E0
    !spr_mem = !spr_bit&$1F
    
    !level_mode #= read1(read3(!count*3+$05E000)+1)&$1F
    
    ; Sprite memory $12 and $10 is used on bosses battles and cannot be changed due of hardcoded-specific code.
    ; Sprite memory $0A is used on wigglers and cannot be changed to avoid memory corruption.
    
    if !spr_mem != $12 && !spr_mem != $10 && !spr_mem != $0A && !level_mode != $10 && !level_mode != $0B && !level_mode != $09 && !count != 0 && !count != $0100
        org !ptr
            db !spr_mask|$08
    ; else
    ;    print "Skipping level ",hex(!count)," with memory ",hex(!spr_mem)
    endif
	
	!count #= !count+1
endmacro

; Change all sprite memory to $08 only if it's a clean ROM.
if read1($0DA691+2) != $7E
	!count = 0
	rep 512 : %remap_memory()
endif
