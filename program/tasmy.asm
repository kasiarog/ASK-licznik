org 0
jmp start

start:
	setb P0.7	;wybranie dekodera
	jmp select1

select1:	;wybranie segmentu, na którym ma siê wyœwietlaæ licznik
	setb P3.3
	setb P3.4	;ustawienie bitu na P3.3 i P3.4, aby by³ 1. wyœwietlac
	call display
	call delay		;¿eby przerwa przy zmianie taœm by³a d³u¿sza

select2:		;analigicznie jak wczeœniej
	clr P3.3
	setb P3.4
	call display
	call delay

select3:
	setb P3.3
	clr P3.4
	call display
	call delay

select4:
	clr P3.3
	clr P3.4
	call display
	call delay
	jmp start

display:
	mov R1, #0c0h	;0
	mov P1, R1
	call delay
	mov R1, #0f9h	;1
	mov P1, R1
	call delay
	mov R1, #0a4h	;2
	mov P1, R1
	call delay
	mov R1, #0b0h	;3
	mov P1, R1
	call delay
	mov R1, #099h	;4
	mov P1, R1
	call delay
	mov R1, #092h	;5
	mov P1, R1
	call delay
	mov R1, #082h	;6
	mov P1, R1
	call delay
	mov R1, #0f8h	;7
	mov P1, R1
	call delay
	mov R1, #080h	;8
	mov P1, R1
	call delay
	mov R1, #090h	;9
	mov P1, R1
	call delay
	mov P1, #0ffh
	reti

delay:
	mov R5, #5
	dly2: mov R7, #090h
	dly1: mov R6, #050h
	djnz R6, $
	djnz R7, dly1
	djnz R5, dly2
	ret
END
