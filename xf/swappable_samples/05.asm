asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample04 nspc
  Sample04: incbin "Sample_264f6154d67767c4304d6f4f564b7848.brr"
endspcblock

dw $0000
