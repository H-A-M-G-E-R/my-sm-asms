asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sample04 nspc
  Sample04: incbin "Sample_a732862e665a4c5b77823c3d2e9db306.brr"
endspcblock

dw $0000
