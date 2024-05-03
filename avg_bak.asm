	section .data
numbers_size:
	dd 1
numbers:
	dd 15, 34, 55, 106, 44, 0, 45, 400

	section .text
	global _start
_start:
; Your code here
	mov eax, [numbers_size]

	; set both to 0
	xor edx, edx
	xor ecx, ecx
	xor ebx, ebx
loop:
	; jump to done if we reach numbers_size
	cmp ecx, eax
	je done

	; add current number and numbers + 1
	add edx, 15
	inc ecx
	jmp loop
done:
	;idiv eax
	jz exit

	mov ebx, eax

exit:
	mov eax,1
	int 0x80
