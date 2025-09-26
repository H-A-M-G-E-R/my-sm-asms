asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample0B nspc
  Sample0B: incbin "Sample_9627c398491daab5ce467701ce77a68c.brr"
endspcblock

dw $0000
