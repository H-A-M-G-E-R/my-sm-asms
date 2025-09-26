asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero, Sound7A, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound7A>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$02,$00
  db $17,$FF,$E0,$B8,$02,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound7A:
  db $12 : dw .voice0, .voice1
.voice0
  db $F5,$10,$8C
  db $16
  db $86,$60,$30
  db $FF

.voice1
  db $16
  db $94,$90,$30
  db $FF

  Sample16_17: incbin "Sample_d76a1e2bcbc403bc9360d154294dce53.brr"
endspcblock

dw $0000
