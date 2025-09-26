asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample0B nspc
  Sample0B: incbin "Sample_e5b4f260ea4c284faffe97ef41129d44.brr"
endspcblock

dw $0000
