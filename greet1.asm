section .data
    input_msg: db "Please enter your name: "
    output_msg: db "Nice to meet you, "

section .bss
    name: resb 20

section .text
    global _start

_start:
prompt: ; get user input
    mov eax, 4           ; 4 is sys_write         
    mov ebx, 1           ; file descriptor 1: stdout       
    mov ecx, input_msg   ; prompt input msg 
    mov edx, 24          ; 24 is the length of input_msg 
    int 80h

read:  ; read user input
    mov eax, 3         ; 3 is sys_read
    mov ebx, 0         ; file descriptor 0: stdin
    mov ecx, name      ; get inputted name  
    mov edx, 20        ; 20 is the max name length 
    int 80h

write: ; display user input 
    mov eax, 4           ; 4 is sys_write
    mov ebx, 1           ; file descriptor 1: stdout  
    mov ecx, output_msg  ; display output msg
    mov edx, 18          ; 18 is the length of output_msg 
    int 80h

    mov eax, 4        ; 4 is sys_write
    mov ecx, name     ; display name
    int 80h
    
exit:
    mov eax, 1   ; 1 is sys_exit
    mov ebx, 0
    int 80h
