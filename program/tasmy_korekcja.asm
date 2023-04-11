jmp start

start:
	setb P0.7	;wybranie dekodera
	jmp select1

select1:	;wybranie segmentu, na którym ma siê wyœwietlaæ licznik
	setb P3.3
	setb P3.4	;ustawienie bitu na P3.3 i P3.4, aby by³ 1. wyœwietlac
	call defineA
	call define10
	call count
	call delay		;¿eby przerwa przy zmianie taœm by³a d³u¿sza

select2:		;analigicznie jak wczeœniej
	clr P3.3
	setb P3.4
	call defineA
	call define10
	call count
	call delay

select3:
	setb P3.3
	clr P3.4
	call defineA
	call define10
	call count
	call delay

select4:
	clr P3.3
	clr P3.4
	call defineA
	call define10
	call count
	call delay
	jmp start

defineA:
	mov A, #0
	ret 

define10:
	mov R0, #10
	ret

count:
	call display0
	inc A
	;call delay
	djnz R0, count
	add A, #6
	cjne A, #64, define10
	ret

display0:
	cjne A, #0, display1
	mov R1, #0c0h	;0
	mov P1, R1
	call delay
	ret
display1:
	cjne A, #1, display2
	mov R1, #0f9h	;1
	mov P1, R1
	call delay
	ret
display2:
	cjne A, #2, display3
	mov R1, #0a4h	;2
	mov P1, R1
	call delay
	ret
display3:
	cjne A, #3, display4
	mov R1, #0b0h	;3
	mov P1, R1
	call delay
	ret
display4:
	cjne A, #4, display5
	mov R1, #099h	;4
	mov P1, R1
	call delay
	ret
display5:
	cjne A, #5, display6
	mov R1, #092h	;5
	mov P1, R1
	call delay
	ret
display6:
	cjne A, #6, display7
	mov R1, #082h	;6
	mov P1, R1
	call delay
	ret
display7:
	cjne A, #7, display8
	mov R1, #0f8h	;7
	mov P1, R1
	call delay
	ret
display8:
	cjne A, #8, display9
	mov R1, #080h	;8
	mov P1, R1
	call delay
	ret
display9:
	cjne A, #9, display10
	mov R1, #090h	;9
	mov P1, R1
	call delay
	mov P1, #0ffh
	call delay
	ret
display10:
	cjne A, #10, display11
	mov R1, #090h	;10
	mov P1, R1
	call delay
	ret
display11:
	cjne A, #11, display12
	mov R1, #090h	;10
	mov P1, R1
	call delay
	ret
display12:
	cjne A, #12, display13
	mov R1, #090h	;10
	mov P1, R1
	call delay
	ret
display13:
	cjne A, #13, display14
	mov R1, #090h	;10
	mov P1, R1
	call delay
	ret
display14:
	cjne A, #14, display15
	mov R1, #090h	;10
	mov P1, R1
	call delay
	ret
display15:
	mov R1, #090h	;10
	mov P1, R1
	call delay
	ret

delay:
	mov R5, #5
	dly2: mov R7, #090h
	dly1: mov R6, #050h
	djnz R6, $
	djnz R7, dly1
	djnz R5, dly2
	ret
END
