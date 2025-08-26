asar 1.91

lorom
dpbase 0
optimize dp always
optimize address mirrors

incsrc "src/labels.asm"
incsrc "src/memory.asm"

org $A2F498 ; bank $A2 freespace
bank $A2
incsrc "src/enemies/Geruboss.asm"
