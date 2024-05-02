_start:
  mov eax , my_data
  mov ebx , 0 x0123456
  mov [ eax ] , ebx
  add eax , 2
  mov bh , 0 xff
  add [ eax ] , bh
  add eax , 1
  mov ecx , 0 xabcdabcd
  mov [ eax ] , ecx
