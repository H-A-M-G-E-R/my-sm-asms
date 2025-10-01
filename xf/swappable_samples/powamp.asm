asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$73-1 nspc
  db SoundPowampHurt
endspcblock

spcblock !p_sounds2High+$73-1 nspc
  db SoundPowampHurt>>8
endspcblock

spcblock 6*$17+!p_instrumentTable nspc
  db $17,$FF,$E0,$00,$02,$84
endspcblock

spcblock 4*$17+!p_sampleTable nspc
  dw Sample17,0
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400-filesize("powamp_hurt_10512_noloop.brr")-8-filesize("owtch_hurt_10512_noloop.brr")-8 nspc
SoundPowampHurt:
  db $01 : dw .voice0
.voice0
  db $17
  !c5,200,11
  db $FF

  Sample17: incbin "powamp_hurt_10512_noloop.brr"
endspcblock

dw $0000
