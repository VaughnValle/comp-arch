section .data
numbers_size: 
    dd 8
numbers: 
    dd 10, 34, 55, 106, 44, 0, 45, 400

section .text
global _start
_start:
    xor ebx, ebx ; sum
    xor ecx, ecx ; loop counter up to numbers_size

loop:
    add ebx, [numbers + ecx*4]  ; ebx += numbers[ecx]
    inc ecx			; ecx += 1
    cmp ecx, [numbers_size]     ; if ecx == numbers.size()
    jl loop                     ; loop if neq

div:
    xor edx, edx   ; set edx to 0 for div op
    mov eax, ebx   ; move sum to eax
    div ecx        ; divide by numbers_size in ecx, result in eax
    mov ebx, eax   ; store average in ebx

end:
    mov eax, 1
    int 80h
