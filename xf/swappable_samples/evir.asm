asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db SoundEvirHurt
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db SoundEvirHurt>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$00,$01,$32
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16,0
endspcblock

spcblock !p_sampleDataEnd nspc
SoundEvirHurt:
  db $01 : dw .voice0
.voice0
  db $14
  !g3,200*200/255,4-1
  !g3,0,2-1
  db $16
  !g4,160*200/255,6-1
  !a4,160*200/255,7-1
  !e5,160*200/255,4
  db $FF

  Sample16: incbin "evir_small_bubble_5000_noloop_fixed.brr"
endspcblock

dw $0000
