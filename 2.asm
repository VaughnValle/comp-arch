section . data
arr :
  dw 5 , 50 , 20 , 30 , 0
d :
  dd 0
  section . text
  global _start
_start :
  mov ecx , arr ; store the address of the array
  xor edx , edx
  xor eax , eax
loop :
  mov dx , [ ecx ] ; read word value
  add ecx , 2
  sub eax , edx
  jns L1 ; jump if sign bit is not set
  neg eax ; 2 s complement negate
L1 :
  add [ d ] , eax
  mov eax , edx
  cmp edx , 0
  jne loop
