asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$00,$03,$33
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw SampleZebetiteHurt,0
endspcblock

spcblock !p_sampleDataEnd nspc
SongSpecificSounds:
  dw SoundZebetiteHurt1 ; C0
  dw SoundZebetiteHurt2 ; C1

SoundZebetiteHurt1:
  db $11 : dw .voice0
.voice0
  db $16
  !e5,0,4-1
  !e5,200*255/255,10-1
  !e5,104*255/255,10-1
  !e5,40*255/255,10
  db $FF

SoundZebetiteHurt2:
  db $11 : dw .voice0
.voice0
  db $16
  !e5,200*255/255,10-1
  !g5,104*255/255,10-1
  !g5,40*255/255,10
  db $FF

  SampleZebetiteHurt: incbin "zebetite_hurt_13379_noloop.brr"
endspcblock

spcblock !p_extra+3 nspc
  dw SongSpecificSounds
endspcblock

dw $0000
