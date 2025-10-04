asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Yakuza

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$83
  db $17,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound74:
  db $11 : dw .voice0
.voice0
  db $16
  db $97,$A0,$30
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $05
  db $C0,$80,$18
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $05
  db $C7,$80,$18
  db $FF

  Sample16_17: incbin "Sample_2bf98c9a5a44f9f8fbce1fe1c68a71b7.brr"
endspcblock

dw $0000
