SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
    prompt:
        db "Please enter your name: "
    prompt_len equ $ - prompt
    response:
        db "Nice to meet you, "
    response_len equ $ - response

section .bss
    input_len equ 20
    input: resb input_len

section .text
    global _start

_start:
    ; display prompt
    mov edx, prompt_len
    mov ecx, prompt
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 80h


    ; get input
    mov edx, input_len
    mov ecx, input
    mov ebx, STDIN
    mov eax, SYS_READ
    int 80h


    ; display Nice meeting you
    mov edx, response_len
    mov ecx, response
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 80h

    ; display name after above
    mov eax, SYS_WRITE
    mov ecx, input
    int 80h

end:
    mov eax, 1
    mov ebx, 0
    int 80h
