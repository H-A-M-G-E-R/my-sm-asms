asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, Sound74, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, Sound74>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$83
  db $17,$F7,$E0,$B8,$02,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound74:
  db $11 : dw .voice0
.voice0
  db $17
  db $A1,$90,$08
  db $16
  db $97,$A0,$0C
  db $97,$40,$0C
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $17
  db $96,$60,$08
  db $96,$30,$08
  db $FF

  Sample16_17: incbin "Sample_05fd569a7563195f98a357d13bdf1315.brr"
endspcblock

dw $0000
