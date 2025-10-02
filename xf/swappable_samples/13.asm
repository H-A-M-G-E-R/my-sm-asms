asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Zazabi

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, SoundZazabiHurt, !zero, !zero, Sound77, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, SoundZazabiHurt>>8, !zero>>8, !zero>>8, Sound77>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$00,$01,$EA
  db $17,$FF,$E0,$00,$02,$81
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw SampleZazabiOpenMouth,0
  dw SampleZazabiHurt,SampleZazabiHurt+16*9/16
endspcblock

spcblock !p_sampleDataEnd nspc
Sound77:
  db $01 : dw .voice0
.voice0
  db $16
  !c4,120,10-1
  !c5,255,18-1
  !c5,80,18-1
  !c5,40,15
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $F6,$09
  db $14
  db $96,$40,$30
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $00
  db $9B,$A8,$14
  db $FF

SoundZazabiHurt:
  db $12 : dw .voice0, .voice1
.voice1
  db $17
  !c5,0,5-1
.voice0
  db $F5,0 : !b7 ; enable legato
  db $17
  !c5,200,2
  %make_sound_subnote("!c5", 25/64*12, 200, 2)
  %make_sound_subnote("!c5", 35/64*12, 200, 2)
  %make_sound_subnote("!c5", 33/64*12, 200, 2)
  %make_sound_subnote("!c5", 25/64*12, 200, 2)
  %make_sound_subnote("!c5", -15/64*12, 200, 2)
  %make_sound_subnote("!c5", -21/64*12, 200, 2)
  %make_sound_subnote("!c5", -15/64*12, 200, 2)
  %make_sound_subnote("!c5", -7/64*12, 200, 2)
  %make_sound_subnote("!c5", 35/64*12, 200, 2)
  %make_sound_subnote("!c5", 51/64*12, 200, 2)
  db $F9,$FF,$F7
  %make_sound_subnote("!c5", 59/64*12, 200, 13)
  dw $FF

  SampleZazabiOpenMouth: incbin "zazabi_open_mouth_8000_noloop.brr"
  SampleZazabiHurt: incbin "zazabi_hurt_10463.823504_16.brr"
endspcblock

dw $0000
