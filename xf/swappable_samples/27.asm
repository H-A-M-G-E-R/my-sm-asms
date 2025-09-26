asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db !zero, !zero, Sound74, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db !zero>>8, !zero>>8, Sound74>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$F2,$B8,$05,$83
  db $16,$FF,$F2,$B8,$05,$83
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound74:
  db $11 : dw .voice0
.voice0
  db $F5,$22,$AF
  db $16
  db $90,$90,$18
  db $96,$60,$08
  db $FF

  Sample16_17: incbin "Sample_c64087243d0bdfc01a74fa29a951c2a5.brr"
endspcblock

dw $0000
