asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Super missile gadora

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, Sound74, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, Sound74>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $16
  db $96,$A0,$30
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $F5,$F0,$C3
  db $05
  db $AC,$D0,$08
  db $F5,$F0,$C3
  db $AC,$B0,$07
  db $F5,$F0,$8C
  db $C3,$70,$06
  db $FF

endspcblock

dw $0000
