asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Varia core-X intro

spcblock !p_sounds2Low+$72-1 nspc
  db !zero, !zero, Sound74, Sound75, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db !zero>>8, !zero>>8, Sound74>>8, Sound75>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
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
  db $97,$80,$20
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $F5,$70,$9B
  db $16
  db $97,$60,$20
  db $FF

  Sample16_17: incbin "Sample_e10bf87a9aae39adeab39adcd81da349.brr"
endspcblock

dw $0000
