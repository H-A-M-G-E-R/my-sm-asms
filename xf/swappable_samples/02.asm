asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample0B nspc
  Sample0B: incbin "Sample_2859fda82591d7c25616c06afbecefcf.brr"
endspcblock

dw $0000
