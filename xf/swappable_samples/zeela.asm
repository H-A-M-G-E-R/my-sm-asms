asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db SoundZeelaHurt
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db SoundZeelaHurt>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$00,$02,$84
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16,0
endspcblock

spcblock !p_sampleDataEnd nspc
SoundZeelaHurt:
  db $01 : dw .voice0
.voice0
  db $16
  !c5,255,16
  db $FF

  Sample16: incbin "zeela_hurt_10512_noloop.brr"
endspcblock

dw $0000
