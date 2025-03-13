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
_porth_start:
  ; push 34
  push 34
  ; push 33
  push 33
  ; minus
  pop %ax
  pop %bx
  sub %bx %ax
  push %bx
  pop %ax
  cmp %ax $00
  jne if_3
  jmp end_6
if_3:
  ; push 100
  push 100
  ; dump
  pop %ax
  call puti
end_6:
  hlt
