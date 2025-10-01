asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$7D-1 nspc
  db SoundOwtchHurt
endspcblock

spcblock !p_sounds2High+$7D-1 nspc
  db SoundOwtchHurt>>8
endspcblock

spcblock 6*$3F+!p_instrumentTable nspc
  db $3F,$FF,$E0,$00,$02,$84
endspcblock

spcblock 4*$3F+!p_sampleTable nspc
  dw Sample3F,0
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400-filesize("owtch_hurt_10512_noloop.brr")-8 nspc
SoundOwtchHurt:
  db $01 : dw .voice0
.voice0
  db $3F
  !c5,100,9
  db $FF

  Sample3F: incbin "owtch_hurt_10512_noloop.brr"
endspcblock

dw $0000
