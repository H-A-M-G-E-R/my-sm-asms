asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample04 nspc
  Sample04: incbin "Sample_5f74c5d215a1aca668891bb0e7b6e877.brr"
endspcblock

dw $0000
