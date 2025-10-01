asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$7E-1 nspc
  db SoundPuyoHurt
endspcblock

spcblock !p_sounds2High+$7E-1 nspc
  db SoundPuyoHurt>>8
endspcblock

spcblock 6*$3E+!p_instrumentTable nspc
  db $3E,$FF,$E0,$00,$02,$84
endspcblock

spcblock 4*$3E+!p_sampleTable nspc
  dw Sample3E,0
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400-filesize("puyo_hurt_10512_noloop.brr")-8-filesize("owtch_hurt_10512_noloop.brr")-8 nspc
SoundPuyoHurt:
  db $01 : dw .voice0
.voice0
  db $3E
  !c5,255,11
  db $FF

  Sample3E: incbin "puyo_hurt_10512_noloop.brr"
endspcblock

dw $0000
