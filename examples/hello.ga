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
  push str_0000
  call puts
  push str_0001
  call puts
  push str_0002
  call puts
  hlt
str_0000: bytes $48 $65 $6C $6C $6F $2C $20 $57 $6F $72 $6C $64 $21 $A $0

str_0001: bytes $48 $65 $6C $6C $6F $2C $20 $47 $6F $76 $6E $50 $6F $72 $74 $68 $21 $A $0

str_0002: bytes $42 $79 $65 $2E $A $0
