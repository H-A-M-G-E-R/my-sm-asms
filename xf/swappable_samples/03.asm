asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample04 nspc
  Sample04: incbin "Sample_c44f260e1e8645bcd48603e4dcedc28a.brr"
endspcblock

dw $0000
