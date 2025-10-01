asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db SoundGenesisHurt
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db SoundGenesisHurt>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$00,$02,$84
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16,0
endspcblock

spcblock !p_sampleDataEnd nspc
SoundGenesisHurt:
  db $01 : dw .voice0
.voice0
  db $16
  !c5,255,14
  db $FF

  Sample16: incbin "genesis_hurt_10512_noloop.brr"
endspcblock

dw $0000
