
macro remap_memory()
	!ptr #= $070000|read2(!count*2+$05EC00)
	
	org !ptr
		db read1(!ptr)&$E0|$08
	
	!count #= !count+1
endmacro

; Change all sprite memory to $08 only if it's a clean ROM.
if read1($0DA691+2) != $7E
	!count = 0
	rep 512 : %remap_memory()
endif
