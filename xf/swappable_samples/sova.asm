asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db SoundSovaHurt
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db SoundSovaHurt>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$00,$01,$2F
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16,0
endspcblock

spcblock !p_sampleDataEnd nspc
SoundSovaHurt:
  db $01 : dw .voice0
.voice0
  db $16
  !a4,255,4-1
  !e5,200,4-1
  db $F5,0 : !b7 ; enable legato
  db $F9,$FF,$F6
  !c5,200,14
  db $FF

  Sample16: incbin "sova_hurt_4953.705_0.brr"
endspcblock

dw $0000
