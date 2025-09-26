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
  db $17,$FF,$F2,$B8,$04,$00
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
  db $96,$A0,$30
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $00
  db $9A,$E0,$06
  db $F5,$E0,$99
  db $04
  db $90,$F0,$10
  db $99,$50,$14
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $F5,$A0,$A7
  db $1E
  db $86,$90,$12
  db $F5,$A0,$AB
  db $86,$90,$12
  db $FF

  Sample16_17: incbin "Sample_9884bf598cbbdccae9546756bb116c60.brr"
endspcblock

dw $0000
