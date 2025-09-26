asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$F2,$B8,$05,$83
  db $07,$FF,$E0,$B8,$00,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $F5,$08,$88
  db $16
  db $92,$60,$0A
  db $91,$80,$0A
  db $91,$30,$0A
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $0F
  db $95,$90,$08
  db $17
  db $B2,$60,$04
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $F5,$08,$AF
  db $16
  db $92,$60,$0A
  db $93,$80,$0A
  db $94,$60,$0A
  db $AF,$80,$01
  db $95,$80,$0A
  db $FF

  Sample16_17: incbin "Sample_bec8586f1a44585618d9a8c5f7a4bbda.brr"
endspcblock

dw $0000
