asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$03,$83
  db $17,$FF,$E0,$B8,$03,$83
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $16
  db $92,$D0,$19
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $16
  db $9F,$D0,$10
  db $97,$A0,$08
  db $97,$80,$04
  db $FF

  Sample16_17: incbin "Sample_b99a7889eb6920531677ab720510cc75.brr"
endspcblock

dw $0000
