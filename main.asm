	device zxspectrum48

	org	$6000
start
	di
	ld sp,StackSpace			; set stack
	jp Initialise

;Includes
;-------------------------------
	INCLUDE "macros.asm"
	INCLUDE "defines.asm"
	INCLUDE "screenfunctions.asm"
;-------------------------------

;-------------------------------
Initialise
	di

	ClearULA				; clear ula

	ld a,BLACK:SetBorder			; set border to black
	ld a,$e3:call Cls256

	ei

;-------------------------------
StackSpace		db 0

;-------------------------------
	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	savebin "helloworld.bin",start,$-start

;---- Output snap file
	savesna "helloworld.sna",start