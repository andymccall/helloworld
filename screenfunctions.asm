; ************************************************************************
;
;	Function:	Clear the 256 colour screen to a set colour
;	In:		A = colour to clear to ($E3 makes it transparent)
;
; ************************************************************************
Cls256:
		ld d,a			; byte to clear to
        ld e,3			; number of blocks
        ld a,1		; first bank... (bank 0 with write enable bit set)

        ld bc, LAYER2_ACCESS_PORT
@LoadAll:
        out	(c),a			; bank in first bank

        ; Fill lower 16K with the desired byte
        ld hl,0
@ClearLoop:
        ld (hl),d
        inc	l
        jr nz,@ClearLoop
        inc	h
		bit 6,h
        jr z,@ClearLoop

        add	a,$40
        dec	e			; loops 3 times
        jr nz,@LoadAll

        ld bc, LAYER2_ACCESS_PORT		; switch off background (should probably do an IN to get the original value)
        ld a,2	; changed to 2 not 0 in case clear colour is not E3
        out	(c),a
        ret