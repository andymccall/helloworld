	MACRO ClearULA
		ld hl,$4000
		ld de,$4001
		ld bc,$1800
		ld (hl),l
		ldir
	ENDM

	MACRO SetBorder
		out (254),a
	ENDM