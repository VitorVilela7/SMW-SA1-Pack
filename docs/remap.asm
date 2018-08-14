
; Global multi-purpose defines for anything.

!sa1 = 0			; SA-1 flag
!dp = $0000			; Direct Page remap ($0000 - LoROM/FastROM, $3000 - SA-1 ROM)
!addr = $0000			; Address remap ($0000 - LoROM/FastROM, $6000 - SA-1 ROM)
!bank = $800000			; Long address remap ($800000 - FastROM, $000000 - SA-1 ROM)
!bank8 = $80			; Bank byte remap ($80 - FastROM, $00 - SA-1 ROM)

!sprites_max = 12		; Maximum amount of sprites allowed.

; If you're not in an Asar environment or don't have access to the ROM,
; set these flags directly if you're sure about using SA-1.

if read1($00FFD5) == $23	; SA-1 detection code
	sa1rom
	!sa1 = 1		; SA-1 Pack v1.10+ identifier
	!dp = $3000
	!addr = $6000
	!bank = $000000
	!bank8 = $00
	
	!sprites_max = 22
endif

; Sets a couple of defines for tables with proper SA-1 remapping if needed.
; example remap: LDA $14C8,x => LDA !14C8,x or LDA !sprite_status,x

macro define_ram_addr(name, name2, addr, addr_sa1)
if !sa1 == 0
    !<name> = <addr>
else
    !<name> = <addr_sa1>
endif
    !<name2> = !<name>
endmacro

; Regular sprite tables
%define_ram_addr(sprite_num, "9E", $9E, $3200)
%define_ram_addr(sprite_speed_y, "AA", $AA, $9E)
%define_ram_addr(sprite_speed_x, "B6", $B6, $B6)
%define_ram_addr(sprite_misc_c2, "C2", $C2, $D8)
%define_ram_addr(sprite_y_low, "D8", $D8, $3216)
%define_ram_addr(sprite_x_low, "E4", $E4, $322C)
%define_ram_addr(sprite_status, "14C8", $14C8, $3242)
%define_ram_addr(sprite_y_high, "14D4", $14D4, $3258)
%define_ram_addr(sprite_x_high, "14E0", $14E0, $326E)
%define_ram_addr(sprite_speed_y_frac, "14EC", $14EC, $74C8)
%define_ram_addr(sprite_speed_x_frac, "14F8", $14F8, $74DE)
%define_ram_addr(sprite_misc_1504, "1504", $1504, $74F4)
%define_ram_addr(sprite_misc_1510, "1510", $1510, $750A)
%define_ram_addr(sprite_misc_151c, "151C", $151C, $3284)
%define_ram_addr(sprite_misc_1528, "1528", $1528, $329A)
%define_ram_addr(sprite_misc_1534, "1534", $1534, $32B0)
%define_ram_addr(sprite_misc_1540, "1540", $1540, $32C6)
%define_ram_addr(sprite_misc_154c, "154C", $154C, $32DC)
%define_ram_addr(sprite_misc_1558, "1558", $1558, $32F2)
%define_ram_addr(sprite_misc_1564, "1564", $1564, $3308)
%define_ram_addr(sprite_misc_1570, "1570", $1570, $331E)
%define_ram_addr(sprite_misc_157c, "157C", $157C, $3334)
%define_ram_addr(sprite_blocked_status, "1588", $1588, $334A)
%define_ram_addr(sprite_misc_1594, "1594", $1594, $3360)
%define_ram_addr(sprite_off_screen_horz, "15A0", $15A0, $3376)
%define_ram_addr(sprite_misc_15ac, "15AC", $15AC, $338C)
%define_ram_addr(sprite_slope, "15B8", $15B8, $7520)
%define_ram_addr(sprite_off_screen, "15C4", $15C4, $7536)
%define_ram_addr(sprite_being_eaten, "15D0", $15D0, $754C)
%define_ram_addr(sprite_obj_interact, "15DC", $15DC, $7562)
%define_ram_addr(sprite_oam_index, "15EA", $15EA, $33A2)
%define_ram_addr(sprite_oam_properties, "15F6", $15F6, $33B8)
%define_ram_addr(sprite_misc_1602, "1602", $1602, $33CE)
%define_ram_addr(sprite_misc_160e, "160E", $160E, $33E4)
%define_ram_addr(sprite_index_in_level, "161A", $161A, $7578)
%define_ram_addr(sprite_misc_1626, "1626", $1626, $758E)
%define_ram_addr(sprite_behind_scenery, "1632", $1632, $75A4)
%define_ram_addr(sprite_misc_163e, "163E", $163E, $33FA)
%define_ram_addr(sprite_in_water, "164A", $164A, $75BA)
%define_ram_addr(sprite_tweaker_1656, "1656", $1656, $75D0)
%define_ram_addr(sprite_tweaker_1662, "1662", $1662, $75EA)
%define_ram_addr(sprite_tweaker_166e, "166E", $166E, $7600)
%define_ram_addr(sprite_tweaker_167a, "167A", $167A, $7616)
%define_ram_addr(sprite_tweaker_1686, "1686", $1686, $762C)
%define_ram_addr(sprite_off_screen_vert, "186C", $186C, $7642)
%define_ram_addr(sprite_misc_187b, "187B", $187B, $3410)
%define_ram_addr(sprite_tweaker_190f, "190F", $190F, $7658)
%define_ram_addr(sprite_misc_1fd6, "1FD6", $1FD6, $766E)
%define_ram_addr(sprite_cape_disable_time, "1FE2", $1FE2, $7FD6)

; Map 16
%define_ram_addr(map16_lo, "7EC800", $7EC800, $40C800)
%define_ram_addr(map16_hi, "7FC800", $7FC800, $41C800)

; Other
%define_ram_addr(sprite_load_list, "1938", $1938, $418A00)
%define_ram_addr(sprite_wiggler_mem, "7F9A7B", $7F9A7B, $418800)
%define_ram_addr(sram_index, "700000", $700000, $41C000)

; Romi's Sprite Tool defines.
%define_ram_addr(sprite_extra_bits, "7FAB10", $7FAB10, $6040)
%define_ram_addr(sprite_new_code_flag, "7FAB1C", $7FAB1C, $6056) ;note that this is not a flag at all.
%define_ram_addr(sprite_extra_prop1, "7FAB28", $7FAB28, $6057)
%define_ram_addr(sprite_extra_prop2, "7FAB34", $7FAB34, $606D)
%define_ram_addr(sprite_custom_num, "7FAB9E", $7FAB9E, $6083)

; PIXI and GIEPY memory defines are not included. Updating this document would be appreciated.

