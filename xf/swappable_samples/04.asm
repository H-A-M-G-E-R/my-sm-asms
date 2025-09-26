asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample04 nspc
  Sample04: incbin "Sample_226c6efb10e6bde2c57c808a480a36f6.brr"
endspcblock

dw $0000
