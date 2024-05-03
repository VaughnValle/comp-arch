my_data:

section .text
  global _start

_start:
  mov eax, my_data
  mov ebx, 0x0123456
  mov[eax], ebx
  add eax, 2
  mov bh, 0xff
  add [eax], bh
  add eax, 1
  mov ecx, 0xabcdabcd
  mov [eax], ecx

end:
    mov eax, 1
    mov ebx, 0
    int 80h
