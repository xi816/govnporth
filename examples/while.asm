jmp _porth_start
write:
  dex %cx
.loop:
  lodb %si %ax
  push %ax
  int $02
  loop .loop
  ret
puti:
  mov %gi puti_buf
  add %gi 7
.loop:
  div %ax 10
  add %dx 48
  stob %gi %dx
  sub %gi 2
  cmp %ax $00
  jne .loop
  mov %si puti_buf
  mov %cx 8
  call write
  push $0A
  int 2
  call puti_clr
  ret
puti_clr:
  mov %si puti_buf
  mov %ax $00
  mov %cx 8
.loop:
  stob %si %ax
  loop .loop
  ret
puti_buf: reserve 8 bytes
puts:
  pop %ax
  pop %si
  push %ax
.loop:
  lodb %si %ax
  cmp %ax $00 
  re
  push %ax
  int 2
  jmp .loop
_porth_start:
  ; push 100
  push 100
  ; dup
  pop %ax
  push %ax
  push %ax
  pop %ax
  cmp %ax $00
  jne while_2
  jmp wend_7
while_2:
  ; dup
  pop %ax
  push %ax
  push %ax
  ; dump
  pop %ax
  call puti
  ; push 1
  push 1
  ; minus
  pop %ax
  pop %bx
  sub %bx %ax
  push %bx
wend_7:
  pop %ax
  push %ax
  push %ax
  cmp %ax $00
  jne while_2
  hlt
